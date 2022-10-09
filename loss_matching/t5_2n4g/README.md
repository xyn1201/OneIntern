
- 参照 https://github.com/Oneflow-Inc/libai/pull/316#issuecomment-1198826336
- 初始化模型参数保存在`output/t5_output/model_final`路径下
- 对照组 `export ONEFLOW_LAZY_COMPILE_MODE=naive`
实验组 `export ONEFLOW_LAZY_COMPILE_MODE=rank_per_iter`
- 用例：3D并行
```bash
## oneflow-25 & oneflow-28
# init
bash tools/args_libai_t5_init.sh configs/t5_nl12_nah12_hs768.py 2 4 0 192.168.1.25 2 2 true true 8 128
bash tools/args_libai_t5_init.sh configs/t5_nl12_nah12_hs768.py 2 4 1 192.168.1.25 2 2 true true 8 128

# loss
# OneAutoTest/libai/args_libai_t5.sh
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 2 4 0 192.168.1.25 2 2 true true 8 128
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 2 4 1 192.168.1.25 2 2 true true 8 128
```
