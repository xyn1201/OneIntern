# https://github.com/Oneflow-Inc/oneflow/commit/9d1105f8e3ff38028dc52e86a8abb08eb8a3f0ec
# https://github.com/Oneflow-Inc/libai/commit/0605ed0d4a05a4b1392e6ba0b1a660cd1d8ac54a


## vit  关Acc

#  1n8g 模型并行        vit_imagenet_fp16_acfalse_mp8_pp1_mb8_gb8_1n8g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 8 1 true false 512 512  # error

#  1n8g 流水并行        vit_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n8g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 1 8 true true 512 512

#  1n8g 数据并行        vit_imagenet_fp16_acfalse_mp1_pp1_mb4_gb32_1n8g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 1 1 true false 64 512
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 1 1 true false 64 512 true

#  1n8g 数据+模型并行   vit_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n8g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 2 1 true true 128 512
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 2 1 true true 128 512 true

#  1n8g 3D并行   vit_imagenet_fp16_actrue_mp2_pp2_mb32_gb512_1n8g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 2 2 true true 256 512
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 2 2 true true 256 512 true

#  1n8g 数据+流水并行   vit_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n8g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 1 2 true true 128 512
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 8 0 127.0.0.1 1 2 true true 128 512 true


## swin  开Acc

#  1n8g 模型并行        swin_imagenet_fp16_actrue_mp8_pp1_mb8_gb8_1n8g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 8 1 true true 128 1024

#  1n8g 流水并行        swin_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n8g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 1 8 true true 128 1024

#  1n8g 数据并行        swin_imagenet_fp16_actrue_mp1_pp1_mb4_gb32_1n8g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 1 1 true true 16 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 1 1 true true 16 1024 true # error

#  1n8g 数据+模型并行   swin_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n8g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 2 1 true true 32 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 2 1 true true 32 1024 true # error

#  1n8g 3D并行   swin_imagenet_fp16_actrue_mp2_pp2_mb32_gb512_1n8g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 2 2 true true 64 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 2 2 true true 64 1024 true # error

#  1n8g 数据+流水并行   swin_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n8g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 1 2 true true 32 1024
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 8 0 127.0.0.1 1 2 true true 32 1024 true # error
