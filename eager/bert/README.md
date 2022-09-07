
- 参考 https://github.com/Oneflow-Inc/OneTeam/issues/1552#issuecomment-1211479820
- 注意测FP32
- 注意在配置中加上 `train.rdma_enabled=False` `graph.enabled = False`
- 使用extract前记得改oss路径
    - V100 megatron老数据 https://github.com/Oneflow-Inc/OneTeam/issues/1552#issuecomment-1211479820
    - A100 megatron老数据 https://github.com/Oneflow-Inc/OneTeam/issues/1552#issuecomment-1204744646 

## 在onecloud上复现Megatron
- onecloud上选择镜像pytorch torch-1.9.0-cu11.1-cudnn8
- 安装apex
```bash
git clone https://github.com/NVIDIA/apex
cd apex
pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
```
- `pip install ninja`
- 血的教训：不要在云平台上使用`pkill bash`，否则容器会挂断

## 运行
```
bash case.sh

# 和megatron老数据对比
python3 extract_bert.py --test-log ./test_logs/01b1d32/ --compare-log ./megatron/ --oneflow-commit "323253b" 

# 和新跑的megatron数据对比
python3 extract_bert.py --test-log ./test_logs/01b1d32/ --compare-log ../Megatron-LM/test_logs/e156d2f/ --oneflow-commit "323253b"
```
- 如果要跑nsys，则将iter数改为20，并添加一行 `nsys profile --stats true --output ${LOG_FILENAME} --sample none --cpuctxsw none \`，并且在运行前添加环境变量`export PATH="/workspace/nvidia/nsight-systems/2020.4.1/bin:$PATH"`
