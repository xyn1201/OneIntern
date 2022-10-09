export CUDA_VISIBLE_DEVICES=0,1,4,5

## vit  开Acc

#  1n1g         vit_imagenet_fp16_acfalse_mp8_pp1_mb8_gb8_1n1g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 1 0 127.0.0.1 1 1 true true 128 1024
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 1 0 127.0.0.1 1 1 true true 128 1024 true

#  1n4g 模型并行        vit_imagenet_fp16_acfalse_mp8_pp1_mb8_gb8_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 4 1 true true 128 1024
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 4 1 true true 128 1024 true

#  1n4g 流水并行        vit_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 4 true true 128 1024
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 4 true true 128 1024 true

#  1n4g 数据并行        vit_imagenet_fp16_acfalse_mp1_pp1_mb4_gb32_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 1 true true 32 1024
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 1 true true 32 1024 true

#  1n4g 数据+模型并行   vit_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 1 true true 64 1024
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 1 true true 64 1024 true

#  1n4g 3D并行   vit_imagenet_fp16_actrue_mp2_pp2_mb32_gb512_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 2 true true 128 1024
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 2 true true 128 1024 true

#  1n4g 数据+流水并行   vit_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 2 true true 64 1024
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 2 true true 64 1024 true


## swin  开Acc

#  1n1g         swin_imagenet_fp16_actrue_mp8_pp1_mb8_gb8_1n1g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 1 0 127.0.0.1 1 1 true true 128 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 1 0 127.0.0.1 1 1 true true 128 1024 true

#  1n4g 模型并行        swin_imagenet_fp16_actrue_mp8_pp1_mb8_gb8_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 4 1 true true 128 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 4 1 true true 128 1024 true

#  1n4g 流水并行        swin_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 4 true true 128 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 4 true true 128 1024 true

#  1n4g 数据并行        swin_imagenet_fp16_actrue_mp1_pp1_mb4_gb32_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 1 true true 32 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 1 true true 32 1024 true

#  1n4g 数据+模型并行   swin_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 1 true true 64 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 1 true true 64 1024 true

#  1n4g 3D并行   swin_imagenet_fp16_actrue_mp2_pp2_mb32_gb512_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 2 true true 128 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 2 true true 128 1024 true

#  1n4g 数据+流水并行   swin_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 2 true true 64 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 2 true true 64 1024 true
