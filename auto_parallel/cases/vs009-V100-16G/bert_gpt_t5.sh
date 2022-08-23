# https://github.com/Oneflow-Inc/oneflow/commit/afd8a9628c0222f53f5519ee56b5a87f8ecaf59b
# https://github.com/Oneflow-Inc/libai/commit/0605ed0d4a05a4b1392e6ba0b1a660cd1d8ac54a


## bert 开Acc

#  1n8g 模型并行        bert_nl24_nah16_hs1024_fp16_actrue_mp8_pp1_mb128_gb1024_1n8g
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 8 1 true true 128 1024

#  1n8g 流水并行        bert_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb64_gb1024_1n8g
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 8 true true 32 512 false 48

#  1n8g 数据并行        bert_nl24_nah16_hs1024_fp16_actrue_mp1_pp1_mb128_gb8192_1n8g
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 1 true true 32 2048
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 1 true true 32 2048 true

#  1n8g 数据+模型并行   bert_nl24_nah16_hs1024_fp16_actrue_mp2_pp1_mb128_gb4096_1n8g
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 1 true true 64 2048
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 1 true true 8 256 true # OOM

#  1n8g 3D并行   bert_nl24_nah16_hs1024_fp16_actrue_mp2_pp2_mb128_gb2048_1n8g
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 2 true true 64 1024
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 2 true true 32 512 true # OOM

#  1n8g 数据+流水并行   bert_nl24_nah16_hs1024_fp16_actrue_mp1_pp2_mb128_gb2048_1n8g
bash tools/args_libai_bert.sh configs/bert_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 2 true true 32 1024 true


## gpt  关Acc

#  1n8g 模型并行        gpt2_nl24_nah16_hs1024_fp16_acfalse_mp8_pp1_mb8_gb8_1n8g
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 8 1 true false 8 8

#  1n8g 流水并行        gpt2_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n8g
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 8 true true 32 32 false 48

#  1n8g 数据并行        gpt2_nl24_nah16_hs1024_fp16_acfalse_mp1_pp1_mb4_gb32_1n8g
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 1 true false 2 16
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 1 true false 2 16 true

#  1n8g 数据+模型并行   gpt2_nl24_nah16_hs1024_fp16_actrue_mp2_pp1_mb32_gb128_1n8g
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 1 true true 16 64
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 1 true true 16 64 true

#  1n8g 3D并行   gpt2_nl24_nah16_hs1024_fp16_actrue_mp2_pp2_mb32_gb512_1n8g
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 2 true true 32 64
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 2 2 true true 32 64 true

#  1n8g 数据+流水并行   gpt2_nl24_nah16_hs1024_fp16_actrue_mp2_pp1_mb32_gb128_1n8g
bash tools/args_libai_gpt2.sh configs/gpt2_nl24_nah16_hs1024.py 1 8 0 127.0.0.1 1 2 true true 16 64 true




## t5  开Acc

#  1n8g 模型并行        t5_nl24_nah16_hs1024_fp16_actrue_mp8_pp1_mb32_gb256_1n8g
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 8 1 true true 1 8 # error, please see the issue
# bash tools/args_libai_t5_nl24.sh configs/t5_nl24_nah16_hs2304.py 1 8 0 127.0.0.1 8 1 true true 1 8 # correct

#  1n8g 流水并行        t5_nl48_nah16_hs1024_fp16_actrue_mp1_pp8_mb16_gb256_1n8g
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 1 8 true true 32 512 false 48

#  1n8g 数据并行        t5_nl12_nah12_hs768_fp16_actrue_mp1_pp1_mb32_gb2048_1n8g
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 1 1 true true 64 4096
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 1 1 true true 64 4096 true

#  1n8g 数据+模型并行   t5_nl12_nah12_hs768_fp16_actrue_mp2_pp1_mb32_gb1024_1n8g
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 2 1 true true 64 2048
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 2 1 true true 64 2048 true 

#  1n8g 3D并行   t5_nl12_nah12_hs768_fp16_actrue_mp2_pp2_mb32_gb512_1n8g
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 2 2 true true 64 1024
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 2 2 true true 64 1024 true 

#  1n8g 数据+流水并行   t5_nl12_nah12_hs768_fp16_actrue_mp1_pp2_mb32_gb512_1n8g
bash tools/args_libai_t5.sh configs/t5_nl12_nah12_hs768.py 1 8 0 127.0.0.1 1 2 true true 64 2048 true
