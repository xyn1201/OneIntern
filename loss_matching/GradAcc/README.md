## 使用方法

参考 https://github.com/Oneflow-Inc/libai/pull/316#issuecomment-1198826336

```bash
mkdir loss_matching && cd loss_matching
git clone git@github.com:Oneflow-Inc/libai.git && 在libai/engine/trainer.py里添加显存输出代码
git clone git@github.com:Oneflow-Inc/models.git
cd libai
cd tools && 拷贝 args_libai_bert_init.sh args_libai_bert_loss.sh args_libai_gpt2_init.sh args_libai_gpt2_loss.sh args_libai_t5_init.sh args_libai_t5_loss.sh
cd configs && 拷贝 bert_nl24_nah16_hs1024.py gpt2_nl24_nah16_hs1024.py t5_nl12_nah12_hs768.py
cd .. && 拷贝 init.sh loss.sh draw_loss.py
mkdir loss_txt && mkdir curve
cd models/Vision/classification/image/resnet50 && git checkout dev_test_resnet50_accuracy
cd examples && 拷贝 args_train_ddp_graph_acc.sh
cd .. && 拷贝 resnet50_train.sh

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
- 注意，如果只跑acc分支的测试，不跑master对照组，则需要将`args_libai_bert_loss.sh` L95的done删掉，并在 https://github.com/xyn1201/OneIntern/blob/f3b85a759ec64bb277297114a70673dbb7f2e972/loss_matching/GradAcc/args_libai_bert_loss.sh#L57 加上
    ```python
    done

    TEST_COMMIT=${ACC_COMMIT}
    ```
    `args_libai_gpt2_loss.sh` 和 `args_libai_t5_loss.sh` 做相同修改
- 显存设置为iter=99时输出，注释掉checkpointer
- 把 `libai/data/build.py` 中 `persistent_workers=True if num_workers > 0 else False` 全部注释掉, 必要时把所有的shuffle都设置为False
- 在 `libai/engine/trainer.py` 下加保存loss的语句
    ```python
    total_losses_reduced = sum(metrics_dict.values())
    if dist.is_main_process():
        txt = open("loss_txt/your_loss.txt", "a")
        txt.write(str(total_losses_reduced.item())+"\n")
    ```
- 运行
    ```bash
    bash loss.sh "c4ce8fb" # 替换为测试commit
    bash resnet50_train.sh
    ```
- 在loss_txt路径下保存有loss的数据，curve路径下有对齐的png图像，test_logs_loss路径下有训练日志
- 整理曲线图

把曲线图按模型上传到oss上，再拷贝一份到本地，修改`compose.py`中的 `IMAGES_PATH` `IMAGE_SAVE_PATH` 和 `IMAGE_COLUMN`，并运行 `python3 compose.py`
- 整理显存及吞吐数据

把test_logs_loss路径下的数据上传至oss，修改`extract_libai_libai.py`中的oss路径名，运行 `python extract_libai_libai.py --compare-log ./test_logs_loss/master/ --test-log ./test_logs_loss/c4ce8fb/`
- 注意：每次完整测试之前检查几个文件，libai/engine/trainer.py, libai/engine/default.py, draw_loss.py

### 跑发版测试
- 拷贝 args_libai_bert.sh 和 args_libai_gpt2.sh
- 运行 
    ```bash 
    case.sh "3d5e919"
    case.sh "master"
    case.sh "faban"
    python extract_libai_libai_libai.py --faban-log ./test_logs/faban/ --compare-log ./test_logs/master/ --test-log ./test_logs/3d5e919/ --oneflow-commit "3d5e919"
    ```

## 测试结果

https://github.com/Oneflow-Inc/OneTeam/issues/1670
