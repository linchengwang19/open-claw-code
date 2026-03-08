#!/bin/bash

# 简单的音乐播放器脚本
# 支持系统声音和Spotify播放

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 显示帮助信息
show_help() {
    echo -e "${BLUE}🎵 音乐播放器${NC}"
    echo ""
    echo "使用方法:"
    echo "  $0 play-system <sound>    - 播放系统声音"
    echo "  $0 play-spotify <song>    - 播放Spotify歌曲（需要认证）"
    echo "  $0 search-spotify <query>  - 搜索Spotify歌曲"
    echo "  $0 spotify-status         - 检查Spotify状态"
    echo "  $0 list-sounds            - 列出可用系统声音"
    echo "  $0 help                  - 显示此帮助信息"
    echo ""
    echo "系统声音列表:"
    ls /System/Library/Sounds/*.aiff | sed 's|.*/||' | sed 's|\.aiff||' | sed 's/^/  - /'
    echo ""
    echo -e "${YELLOW}⚠️  Spotify使用说明:${NC}"
    echo "1. 需要Spotify Premium账户"
    echo "2. 首次使用需要认证:"
    echo "   spotify_player authenticate"
    echo "3. 或者导入浏览器cookies:"
    echo "   spogo auth import --browser chrome"
}

# 播放系统声音
play_system_sound() {
    local sound_name="$1"
    local sound_file="/System/Library/Sounds/${sound_name}.aiff"
    
    if [[ -z "$sound_name" ]]; then
        echo -e "${RED}❌ 请指定要播放的系统声音名称${NC}"
        list_sounds
        return 1
    fi
    
    if [[ ! -f "$sound_file" ]]; then
        echo -e "${RED}❌ 找不到声音文件: $sound_file${NC}"
        list_sounds
        return 1
    fi
    
    echo -e "${GREEN}🎵 正在播放系统声音: $sound_name${NC}"
    afplay "$sound_file" &
    echo "播放进程已启动 (PID: $!)"
}

# 列出系统声音
list_sounds() {
    echo -e "${BLUE}🔊 可用系统声音:${NC}"
    ls /System/Library/Sounds/*.aiff | sed 's|.*/||' | sed 's|\.aiff||' | while read sound; do
        echo "  - $sound"
    done
}

# 播放Spotify音乐
play_spotify() {
    local song="$1"
    
    if [[ -z "$song" ]]; then
        echo -e "${RED}❌ 请指定要播放的歌曲${NC}"
        echo "使用方法: $0 play-spotify \"歌曲名称\""
        return 1
    fi
    
    echo -e "${YELLOW}🎵 正在搜索Spotify: $song${NC}"
    spotify_player search "$song"
}

# 搜索Spotify
search_spotify() {
    local query="$1"
    
    if [[ -z "$query" ]]; then
        echo -e "${RED}❌ 请指定搜索关键词${NC}"
        echo "使用方法: $0 search-spotify \"关键词\""
        return 1
    fi
    
    echo -e "${YELLOW}🔍 正在搜索Spotify: $query${NC}"
    spotify_player search "$query"
}

# 检查Spotify状态
check_spotify_status() {
    echo -e "${BLUE}📊 Spotify状态检查:${NC}"
    
    # 检查spotify_player是否已安装
    if command -v spotify_player &> /dev/null; then
        echo "✅ spotify_player 已安装"
    else
        echo "❌ spotify_player 未安装"
        return 1
    fi
    
    # 检查Spotify连接状态
    echo "尝试检查Spotify连接..."
    if spotify_player get currently-playing &> /dev/null; then
        echo "✅ Spotify已连接"
        spotify_player get currently-playing
    else
        echo "❌ Spotify未连接或需要认证"
        echo ""
        echo "请尝试以下方法进行认证:"
        echo "1. 运行: spotify_player authenticate"
        echo "2. 或者: spogo auth import --browser chrome"
    fi
}

# 主程序
main() {
    local action="$1"
    local param="$2"
    
    case "$action" in
        "play-system")
            play_system_sound "$param"
            ;;
        "play-spotify")
            play_spotify "$param"
            ;;
        "search-spotify")
            search_spotify "$param"
            ;;
        "spotify-status")
            check_spotify_status
            ;;
        "list-sounds")
            list_sounds
            ;;
        "help"|"-h"|"--help")
            show_help
            ;;
        *)
            echo -e "${RED}❌ 未知命令: $action${NC}"
            echo ""
            show_help
            exit 1
            ;;
    esac
}

# 如果没有提供参数，显示帮助
if [[ $# -eq 0 ]]; then
    show_help
    exit 0
fi

main "$@"