from libai.config import LazyCall
from libai.evaluation import PPLEvaluator
from .common.models.bert import pretrain_model as model
from .common.models.graph import graph
from .common.train import train
from .common.optim import optim
from .common.data.bert_dataset import dataloader, tokenization

vocab_file = "/dataset/libai_dataset/bert-base-chinese-vocab.txt"
data_prefix = "/dataset/libai_dataset/loss_compara_content_sentence"

tokenization.tokenizer.vocab_file = vocab_file
dataloader.train.dataset[0].data_prefix = data_prefix
dataloader.train.dataset[0].indexed_dataset.data_prefix = data_prefix

# Bert-large model config
model.cfg.num_attention_heads = 16
model.cfg.hidden_size = 768
model.cfg.hidden_layers = 8

train.input_placement_device = "cpu"

train.dist.pipeline_num_layers = model.cfg.hidden_layers

train.train_micro_batch_size = 16

train.amp.enabled = False

for ds in dataloader.train.dataset:
    ds.max_seq_length = model.cfg.max_position_embeddings

train.evaluation.evaluator = LazyCall(PPLEvaluator)()

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
