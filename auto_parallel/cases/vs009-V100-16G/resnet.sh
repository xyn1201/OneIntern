

bash examples/args_train_ddp_graph.sh 1 8 0 127.0.0.1 /dataset/imagenet/ofrecord 192 50 true python3 "graph" gpu 100 false "" "afd8a962"
# bash examples/args_train_ddp_graph.sh 1 8 0 127.0.0.1 /dataset/imagenet/ofrecord 192 50 false python3 "ddp" cpu 100 false "" "afd8a962"
