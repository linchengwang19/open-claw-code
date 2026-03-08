# 🎵 音乐播放设置指南

## ✅ 已安装组件
- **spotify_player** - 终端Spotify播放器（已安装）
- **系统声音播放器** - macOS内置声音播放

## 🚀 快速开始

### 1. 播放系统声音（立即可用）
```bash
# 列出可用声音
./music-player.sh list-sounds

# 播放声音
./music-player.sh play-system Ping
./music-player.sh play-system Hero
./music-player.sh play-system Funk
```

### 2. Spotify音乐播放（需要认证）

#### 方法一：Spotify Player认证
```bash
# 运行认证流程
spotify_player authenticate

# 按照提示在浏览器中完成Spotify登录
```

#### 方法二：导入浏览器Cookies（推荐）
```bash
# 如果你有spogo（需要先安装）
spogo auth import --browser chrome

# 或者手动设置Spotify Web API凭据
```

### 3. 认证后使用Spotify
```bash
# 搜索音乐
./music-player.sh search-spotify "周杰伦"

# 播放音乐
./music-player.sh play-spotify "稻香"

# 检查状态
./music-player.sh spotify-status
```

## 🎵 使用示例

### 播放系统声音
```bash
# 播放提示音
./music-player.sh play-system Ping

# 播放成功音
./music-player.sh play-system Hero

# 播放有趣的声音
./music-player.sh play-system Frog
```

### Spotify搜索和播放
```bash
# 搜索中文歌曲
./music-player.sh search-spotify "周杰伦"

# 搜索英文歌曲
./music-player.sh search-spotify "Taylor Swift"

# 搜索特定歌曲
./music-player.sh search-spotify "稻香"
```

## ⚙️ 高级功能

### Spotify Player命令
```bash
# 播放控制
spotify_player playback play
spotify_player playback pause
spotify_player playback next
spotify_player playback previous

# 连接设备
spotify_player connect

# 收藏歌曲
spotify_player like

# 获取当前播放
spotify_player get currently-playing
```

### 配置文件
Spotify Player配置文件位置：`~/.config/spotify-player/app.toml`

可以自定义：
- 主题设置
- 音质设置
- 设备偏好
- 快捷键

## 🔧 故障排除

### 常见问题

1. **Spotify认证失败**
   ```bash
   # 重新认证
   spotify_player authenticate
   
   # 检查网络连接
   curl -I https://api.spotify.com
   
   # 清除缓存
   rm -rf ~/.cache/spotify-player
   ```

2. **无法找到歌曲**
   ```bash
   # 检查搜索语法
   ./music-player.sh search-spotify "歌曲名称"
   
   # 尝试英文搜索
   ./music-player.sh search-spotify "Jay Chou"
   ```

3. **音频播放问题**
   ```bash
   # 检查系统声音
   afplay /System/Library/Sounds/Ping.aiff
   
   # 检查音量设置
   osascript -e "set volume output volume 100"
   ```

### 系统要求
- macOS系统
- Spotify Premium账户（用于完整功能）
- 网络连接

## 🎼 音乐推荐

### 系统声音推荐
- **Ping** - 轻柔提示音
- **Hero** - 胜利音效
- **Funk** - 有趣的声音
- **Glass** - 清脆玻璃声

### Spotify播放列表建议
- 流行音乐
- 古典音乐
- 轻音乐
- 白噪音

## 🔄 替代方案

如果Spotify认证有问题，可以考虑：

1. **其他音乐服务**
   - Apple Music
   - 网易云音乐
   - QQ音乐

2. **本地音乐播放**
   - 使用afplay播放本地音频文件
   - 使用系统声音

## 📞 获取帮助

```bash
# 显示帮助
./music-player.sh help

# 检查状态
./music-player.sh spotify-status

# 列出声音
./music-player.sh list-sounds
```

---

现在您可以开始享受音乐了！🎵

**提示**: 先尝试播放系统声音测试功能，然后设置Spotify认证以获得完整体验。