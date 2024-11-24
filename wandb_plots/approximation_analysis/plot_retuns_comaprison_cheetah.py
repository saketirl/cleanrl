import matplotlib.pyplot as plt
import numpy as np
import pickle as pkl

running_avg_final = []
running_std_final = []
window_size = 5
plt.rcParams.update({'font.size': 20})
with open("data/linearised_comparison.pkl", "rb") as f_in:
    data = pkl.load(f_in)
    log_widths = []
    widths_arr = [2 ** i for i in range(8, 18)]
    converged_index_cutoff = -25
    for width in widths_arr:
        global_steps = data[width]["global_steps"]
        #difference_arr = data[width]["difference_arr"]
        linearised_data = data[width]["linearised_data"]
        one_layer_data = data[width]["one_layer_data"]
        linearised_data_mean = np.mean(linearised_data, axis=0)
        one_layer_data_mean = np.mean(one_layer_data, axis=0)
        min_size = min([len(linearised_data), len(one_layer_data)])
        difference_arr = one_layer_data_mean - linearised_data_mean
        diff_std = np.std(difference_arr[-1*converged_index_cutoff:], axis=0)
        print(len(difference_arr))
        running_avg = np.average(difference_arr[-1*converged_index_cutoff:])
        running_avg_final.append(running_avg)
        running_std_final.append(diff_std)
        print(diff_std)
        log_widths.append(np.log2(width))

    running_std_final = np.array(running_std_final)
    running_avg_final = np.array(running_avg_final)
    plt.plot(log_widths, running_avg_final, color="blue", linestyle="--", marker="o")
    plt.xlabel(r'$\log_2$(width)')
    plt.ylabel("Difference")
    plt.fill_between(log_widths, running_avg_final - running_std_final, running_avg_final + running_std_final,
                     alpha=0.2, color="b")
    plt.ylim(-100)
    plt.xticks([i for i in range(8, 18)])
    plt.grid()
    plt.tight_layout()
    plt.savefig("approximation_error/error_cheetah_varying_width.png")
