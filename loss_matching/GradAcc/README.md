## 使用方法

参考 https://github.com/Oneflow-Inc/libai/pull/316#issuecomment-1198826336

```bash
mkdir loss_matching && cd loss_matching
git clone git@github.com:Oneflow-Inc/libai.git
git clone git@github.com:Oneflow-Inc/models.git
cd libai
cd tools && 拷贝 args_libai_bert_init.sh args_libai_bert_loss.sh args_libai_gpt2_init.sh args_libai_gpt2_loss.sh args_libai_t5_init.sh args_libai_t5_loss.sh
cd configs && 拷贝 bert_nl24_nah16_hs1024.py gpt2_nl24_nah16_hs1024.py t5_nl12_nah12_hs768.py
cd .. && 拷贝 init.sh loss.sh draw_loss.py

conda create -n acc python=3.8 && conda activate acc && python3 -m pip install https://oneflow-staging.oss-cn-beijing.aliyuncs.com/canary/commit/c4ce8fbe451a59f41c88ebe6ec0f1abfb8210a4c/cu112/oneflow-0.8.1%2Bcu112.git.c4ce8fbe4-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
conda create -n master python=3.8 && conda activate master && python3-m pip install https://oneflow-staging.oss-cn-beijing.aliyuncs.com/canary/commit/cd3b12669fa07cb3e66ad76d52fbaad85e56d39f/cu112/oneflow-0.8.1%2Bcu112.git.cd3b1266-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
```

### 生成模型初始化权重
- 显存设置为iter=1时输出，不要注释掉checkpointer
    ```bash
    bash init.sh
    ```
- 在test_logs_init路径下会保存初始化模型

### 跑loss对齐的一键测试
- 显存设置为iter=99时输出，注释掉checkpointer
- 把libai/data/build.py中persistent_workers=True if num_workers > 0 else False,全部注释掉, 必要时把所有的shuffle都设置为False
- 在libai/engine/trainer.py下加保存loss的语句
    ```python
    total_losses_reduced = sum(metrics_dict.values())
    if dist.is_main_process():
        txt = open("your_loss.txt", "a")
        txt.write(str(total_losses_reduced.item())+"\n")
    ```
- 运行
    ```bash
    bash loss.sh
    ```
- 在loss_txt路径下保存有loss的数据，curve路径下有对齐的png图像，test_logs_loss路径下有训练日志
- 整理曲线图
把曲线图按模型上传到oss上，再拷贝一份到本地，修改`compose.py`中的 IMAGES_PATH IMAGE_SAVE_PATH 和 IMAGE_COLUMN，并运行 `python3 compose.py`

- 注意：每次完整测试之前检查几个文件，libai/engine/trainer.py, libai/engine/default.py, draw_loss.py

## 测试结果

https://github.com/Oneflow-Inc/OneTeam/issues/1670