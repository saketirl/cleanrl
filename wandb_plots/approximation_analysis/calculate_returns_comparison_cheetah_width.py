from wandb import Api
import wandb
import numpy as np
from scipy.interpolate import interp1d
import matplotlib.pyplot as plt
import pickle as pkl


wandb_api_key = "9fb4ba17a708de72496774b2e25d219f07de038d"
wandb.login(key=wandb_api_key)

# Initialize the API
api = Api()

wandb_project_name = "crate"
wandb_entity = "saketirl"




filter_fields = {}


def fields_match(run, run_filter_fields):
    all_fields_match = True
    for field_name, field_val in run_filter_fields.items():
        if field_name not in run.config:
            #print(run.name, run.config, field_name, field_val)
            return False
        elif run.config[field_name] != field_val:
            return False
    return all_fields_match


def get_data_interpolated(all_runs, run_data_key="charts/episodic_return", max_step=int(1e6 - 2e4), min_step=5000, num_points=500):
    filtered_metrics = []
    # Print run details
    steps_to_interpolate = np.linspace(min_step, max_step, num_points)
    for run in all_runs:
        if "actor_learning_rate" in run.config:
            is_valid = run.config["actor_learning_rate"] != 0.02 and run.config["actor_learning_rate"] == 3e-4
        else:
            is_valid = run.config["learning_rate"] == 3e-4

        if is_valid:
            run_data = []
            global_steps = []
            for row in run.scan_history():
                #print(row.keys())
                if row["charts/episodic_return"] is not None:
                    run_data.append(row[run_data_key])
                    global_steps.append(row["global_step"])
            interpolator = interp1d(global_steps, run_data)
            max_global_steps = np.max(global_steps)
            if max_global_steps > max_step:
                interpolated_metric = interpolator(steps_to_interpolate)
                filtered_metrics.append(interpolated_metric)

    return steps_to_interpolate, np.array(filtered_metrics)

widths_arr = [2**i for i in range(8, 18)]

plt.figure(figsize=(8, 5))

data_dict = {}

#env_name = "HalfCheetah-v4"
env_name = "Walker2d-v4"
for width in widths_arr:
    one_layer_run_name_prefix = env_name + "__ddpg_one_layer"
    fields_to_filter = {"config.actor_width": width, "state": "finished",
                        "display_name": {"$regex": f"^{one_layer_run_name_prefix}.*"}}
    runs = api.runs(f"{wandb_entity}/{wandb_project_name}", filters=fields_to_filter)
    global_steps, metric_for_one_layer = get_data_interpolated(runs)
    mean_one_layer = np.mean(metric_for_one_layer, axis=0)


    linearised_run_name_prefix = env_name + "_ddpg_linearis"
    fields_to_filter = {"config.actor_width": width, "state": "finished",
                        "display_name": {"$regex": f"^{linearised_run_name_prefix}.*"}}
    runs = api.runs(f"{wandb_entity}/{wandb_project_name}", filters=fields_to_filter)
    global_steps, metric_for_linearised = get_data_interpolated(runs)
    mean_linearised = np.mean(metric_for_linearised, axis=0)

    difference_rets = (mean_one_layer - mean_linearised)/mean_one_layer
    data_dict[width] = {"difference_arr": difference_rets, "linearised_data": metric_for_linearised,
                        "global_steps": global_steps, "one_layer_data": metric_for_one_layer}
    print("Done " + str(width))
    print(metric_for_linearised.shape, metric_for_one_layer.shape)

with open("data/" + env_name + "_linearised_comparison.pkl", "wb") as f_out:
    pkl.dump(data_dict, f_out)


