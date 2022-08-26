## vit  关Acc

#  1n4g 模型并行        vit_imagenet_fp16_acfalse_mp8_pp1_mb8_gb8_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 4 1 true false 256 256 

#  1n4g 流水并行        vit_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 4 true true 256 256

#  1n4g 数据并行        vit_imagenet_fp16_acfalse_mp1_pp1_mb4_gb32_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 1 true false 64 256
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 1 true false 64 256 true

#  1n4g 数据+模型并行   vit_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 1 true true 128 256
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 1 true true 128 256 true

#  1n4g 3D并行   vit_imagenet_fp16_actrue_mp2_pp2_mb32_gb512_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 2 true true 256 256
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 2 2 true true 256 256 true

#  1n4g 数据+流水并行   vit_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 2 true true 128 256
bash tools/args_libai_vit.sh configs/vit_imagenet.py 1 4 0 127.0.0.1 1 2 true true 128 256 true


## swin  关Acc

#  1n4g 模型并行        swin_imagenet_fp16_actrue_mp8_pp1_mb8_gb8_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 4 1 true true 256 256

#  1n4g 流水并行        swin_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 4 true true 256 256

#  1n4g 数据并行        swin_imagenet_fp16_actrue_mp1_pp1_mb4_gb32_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 1 true true 64 256
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 1 true true 64 256 true

#  1n4g 数据+模型并行   swin_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 1 true true 128 256
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 1 true true 128 256 true

#  1n4g 3D并行   swin_imagenet_fp16_actrue_mp2_pp2_mb32_gb512_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 2 true true 256 256
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 2 2 true true 256 256 true

#  1n4g 数据+流水并行   swin_imagenet_fp16_actrue_mp2_pp1_mb32_gb128_1n4g
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 2 true true 128 256
bash tools/args_libai_swin.sh configs/swin_imagenet.py 1 4 0 127.0.0.1 1 2 true true 128 256 true
