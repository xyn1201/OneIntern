import os
import glob
import yaml
from extract_config_only_libai import get_args


def extract_info_from_file(log_file):
    result_dict = {}
    result_dict["samples"] = 0
    result_dict["memory"] = 0
    with open(log_file, "r") as f:
        for line in f.readlines():
            if "iteration:" in line and "time:" in line:
                ss = line.split(" ")
                iteration_index = ss.index("iteration:")
                iteration_number = int(ss[iteration_index + 1].strip().split("/")[0])
                time_index = ss.index("time:")
                samples = float(ss[time_index + 8])
                if iteration_number == 219:
                    result_dict["samples"] = samples
            elif "MiB," in line and "utilization" not in line:
                ss = line.split(" ")
                if ss[-1] == 'MiB\n':
                    memory_userd = int(ss[-2])
                    if (
                        "memory" not in result_dict.keys()
                        or result_dict["memory"] < memory_userd
                    ):
                        result_dict["memory"] = memory_userd
    return result_dict


def get_config(yaml_file):
    with open("{}/config.yaml".format(yaml_file), "r") as f:
        config_data = yaml.full_load(f)

    return config_data



def extract_result(args, extract_func):

    logs_list = glob.glob(os.path.join(args.test_log, "*/output.log"))
    logs_list = sorted(logs_list)
    throughput_final_result_dict = {}
    markdown_table_header = """

|      | [{}](https://github.com/Oneflow-Inc/oneflow/tree/{})|
| ---- | ------------------------------------------------------------ |"""
    markdown_table_body = """
| {case_name}   | [{libai_memory}]({libai_yaml}) MiB/[{libai_samples}]({libai_log}) samples/s                                |"""
    tmp_markdown_table_header = markdown_table_header.format(
        logs_list[0].split("/")[-3], logs_list[0].split("/")[-3],
    )

    for l in logs_list:
        libai_result_dict = extract_func(l)
        tmp_file_name = l.split("/")
        case_header = "_".join(tmp_file_name[-2].split("_")[1:-2]).lower()

        if case_header not in throughput_final_result_dict.keys():
            throughput_final_result_dict[case_header] = {}
        throughput_final_result_dict[case_header]["case_name"] = case_header
        throughput_final_result_dict[case_header]["libai_memory"] = libai_result_dict[
            "memory"
        ]
        throughput_final_result_dict[case_header][
            "libai_yaml"
        ] = "https://oneflow-test.oss-cn-beijing.aliyuncs.com/AutoParallel/0824/{}/config.yaml".format(
            "/".join(tmp_file_name[-3:-1])
        )
        throughput_final_result_dict[case_header]["libai_samples"] = libai_result_dict[
            "samples"
        ]
        throughput_final_result_dict[case_header][
            "libai_log"
        ] = "https://oneflow-test.oss-cn-beijing.aliyuncs.com/AutoParallel/0824/{}".format(
            "/".join(tmp_file_name[-3:])
        )

        tmp_markdown_table_header += markdown_table_body.format(
            **throughput_final_result_dict[case_header]
        )

    with open("{}/dlperf_result.md".format(args.test_log), "w",) as f:
        f.write(tmp_markdown_table_header)


if __name__ == "__main__":
    args = get_args()
    extract_result(args, extract_info_from_file)

