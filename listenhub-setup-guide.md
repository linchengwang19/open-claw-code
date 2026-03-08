# ListenHub Skills 安装完成！

## 🎉 安装成功
ListenHub技能已成功安装到您的OpenClaw环境中。

## 📋 功能介绍
ListenHub可以将您的内容转换为以下格式：
- **播客** - 1-2人对话，适合深度讨论
- **解说视频** - 单人讲解 + AI配图，适合产品介绍
- **语音朗读** - 纯音频，最快生成，适合文章转音频
- **图像生成** - AI图像创作，适合创意可视化

## 🔧 设置API密钥
在使用之前，需要设置ListenHub API密钥：

```bash
# 设置API密钥
export LISTENHUB_API_KEY='your_api_key_here'

# 添加到shell配置文件（推荐）
echo 'export LISTENHUB_API_KEY="your_api_key_here"' >> ~/.zshrc
source ~/.zshrc
```

获取API密钥的步骤：
1. 访问 https://listenhub.ai/settings/api-keys
2. 复制您的API密钥（以 `lh_sk_` 开头）
3. 按照上面的命令设置

## 🚀 使用方法

### 生成播客
```
# 创建双人播客
./scripts/create-podcast.sh --query "人工智能的未来发展" --language zh --mode deep --speakers cozy-man-english

# 使用文章作为源
./scripts/create-podcast.sh --query "分析这篇文章" --language zh --mode deep --speakers cozy-man-english --source-url "https://example.com/article"
```

### 生成语音朗读
```
# 文本转语音
./scripts/create-tts.sh --type text --content "这是一段需要转换成语音的文本" --language zh --mode smart --speakers cozy-man-english

# 网页内容转语音
./scripts/create-tts.sh --type url --content "https://example.com/article" --language zh --mode smart --speakers cozy-man-english
```

### 生成图像
```
# 生成图像
./scripts/generate-image.sh --prompt "山顶的日落，美丽壮观" --size 2K --ratio 16:9

# 使用参考图像
./scripts/generate-image.sh --prompt "未来城市" --reference-images "https://example.com/ref1.jpg,https://example.com/ref2.png" --size 2K --ratio 16:9
```

### 检查状态
```
# 检查任务状态
./scripts/check-status.sh --episode "episode_id" --type podcast

# 等待任务完成
./scripts/check-status.sh --episode "episode_id" --type podcast --wait
```

### 获取可用音色
```
# 获取中文音色
./scripts/get-speakers.sh --language zh

# 获取英文音色
./scripts/get-speakers.sh --language en
```

## 📝 使用示例

### 示例1：创建AI主题播客
```
→ Got it! Preparing two-person podcast...
  Topic: 人工智能的未来发展

→ Generation submitted, about 2-3 minutes

  You can:
  • Wait and ask "done yet?"
  • Check listenhub.ai/app/podcast
```

### 示例2：文章转语音
```
→ Got it! Parsing article...

→ TTS submitted, about 1-2 minutes

  Wait a moment, or ask "done yet?" to check
```

### 示例3：生成创意图像
```
→ Generating image...

  Prompt: 山顶的日落，美丽壮观
  Resolution: 2K (16:9)

✓ Image generated!
  ~/Downloads/labnana-20260306-143145.jpg
```

## 🎯 模式说明

### 自动模式检测
技能会根据您的输入自动检测模式：
- **播客**: 关键词 "播客"、"聊天"、"讨论"、"辩论"
- **解说视频**: 关键词 "解释"、"介绍"、"视频"、"教程"
- **语音朗读**: 关键词 "朗读"、"转语音"、"TTS"、"语音"
- **图像生成**: 关键词 "生成图像"、"绘制"、"创建图片"、"可视化"

### 支持的输入格式
- 任意主题描述
- YouTube视频链接
- 文章URL
- 纯文本内容
- 图像描述
- 参考图URL

## ⚠️ 注意事项
1. 需要有效的ListenHub API密钥
2. 长文本建议使用URL方式（限制10,000字符）
3. 生成时间：播客2-3分钟，解说视频3-5分钟，语音1-2分钟
4. 图像生成需要订阅服务

## 🔗 相关链接
- ListenHub官网: https://listenhub.ai
- API设置: https://listenhub.ai/settings/api-keys
- 播客管理: https://listenhub.ai/app/podcast
- 解说视频: https://listenhub.ai/app/explainer
- 语音朗读: https://listenhub.ai/app/text-to-speech

## 🆘 故障排除
如果遇到问题：
1. 检查API密钥是否正确设置
2. 确认网络连接正常
3. 查看脚本错误信息
4. 尝试重新生成任务

---

现在您可以开始使用ListenHub技能来创建播客、解说视频、语音朗读和图像了！