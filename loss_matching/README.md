### 操作步骤

- 参考 https://github.com/Oneflow-Inc/libai/pull/316#issuecomment-1198826336

- 先改配置为
```python
train.output_dir = "output/bert_output"
# train.output_dir = "output/bert_output_loss_compare"
# train.load_weight = "output/bert_output/model_final/"
train.rdma_enabled = False
model.cfg.hidden_dropout_prob= 0.0 # 关闭所有的dropout
model.cfg.attention_probs_dropout_prob= 0.0
model.cfg.bias_dropout_fusion= False
train.train_iter = 2
train.dist.pipeline_parallel_size=2
train.evaluation.enabled = False
```
跑2个iter，生成固定的模型初始化参数

- 再改配置为
```python
# train.output_dir = "output/bert_output"
train.output_dir = "output/bert_output_loss_compare"
train.load_weight = "output/bert_output/model_final/"
train.rdma_enabled = False
model.cfg.hidden_dropout_prob= 0.0 # 关闭所有的dropout
model.cfg.attention_probs_dropout_prob= 0.0
model.cfg.bias_dropout_fusion= False
train.train_iter = 100
train.dist.pipeline_parallel_size=2
train.evaluation.enabled = False
```
进行100个iter的对齐实验

- 相关测试结果见 https://github.com/Oneflow-Inc/OneTeam/issues/1603