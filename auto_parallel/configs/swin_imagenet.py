from libai.config import LazyCall
from .common.models.swin.swin_tiny_patch4_window7_224 import model
from .common.models.graph import graph
from .common.train import train
from .common.optim import optim
from .common.data.imagenet import dataloader

from flowvision.data import Mixup
from flowvision.loss.cross_entropy import SoftTargetCrossEntropy

# Refine data path to imagenet
dataloader.train.dataset[0].root = "/ssd/dataset/ImageNet/extract"
dataloader.test[0].dataset.root = "/ssd/dataset/ImageNet/extract"

# Add Mixup Func
dataloader.train.mixup_func = LazyCall(Mixup)(
    mixup_alpha=0.8,
    cutmix_alpha=1.0,
    prob=1.0,
    switch_prob=0.5,
    mode="batch",
    num_classes=1000,
)

# Refine model cfg for vit training on imagenet
model.cfg.num_classes = 1000
model.cfg.loss_func = SoftTargetCrossEntropy()
# Refine optimizer cfg for vit model
optim.lr = 1e-3
optim.eps = 1e-8
optim.weight_decay = 0.05
optim.params.clip_grad_max_norm = None
optim.params.clip_grad_norm_type = None

# Refine train cfg for vit model
train.train_micro_batch_size = 128
train.test_micro_batch_size = 128
#train.train_epoch = 300
train.warmup_ratio = 20 / 300
train.eval_period = 1000
train.log_period = 1

# Scheduler
train.scheduler.warmup_factor = 0.001
train.scheduler.alpha = 0.01
train.scheduler.warmup_method = "linear"

# Set fp16 ON
train.amp.enabled = True

train.dist.pipeline_num_layers = sum(model.cfg.depths)

train.input_placement_device = "cpu"

train.evaluation.enabled = False
train.evaluation.eval_iter = 30

graph.auto_parallel.mainstem_algo = True
graph.auto_parallel.prune_parallel_cast_ops = True
graph.auto_parallel.sbp_collector = False
