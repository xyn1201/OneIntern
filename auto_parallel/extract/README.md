
运行前先修改脚本中oss链接中的日期

```bash
python3 extract_auto_parallel.py --test-log /path/to/bert/
# 修改为本地日志路径
root@training-task-1c216av10-train-master-k6c7b:/workspace/auto_parallel/bert# tree
|-- LibAI_bert_nl24_nah16_hs1024_FP16_actrue_mp1_pp1_mb8_gb256_apfalse_1n4g_20220827_010131379337014
|   |-- config.yaml
|   |-- events.out.tfevents.1661533317.training-task-1c216av8-train-master-m8wb7
|   |-- log.txt
|   |-- log.txt.rank1
|   |-- log.txt.rank2
|   |-- log.txt.rank3
|   |-- metrics.json
|   `-- output.log
```
