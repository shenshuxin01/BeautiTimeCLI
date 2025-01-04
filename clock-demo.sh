# 需要安装的命令:
# figlist: figlet 包含的命令，用于列出所有可用的字体
# figlet: 用于生成 ASCII 艺术字
# tput: 用于控制终端属性

# 安装命令的示例（以 Ubuntu 为例）:
# sudo apt-get update
# sudo apt-get install figlet
# sudo apt-get install ncurses-utils  # tput 通常包含在 ncurses-utils 包中

# 安装命令的示例（以 macOS 为例）:
# brew install figlet
# brew install ncurses  # tput 通常包含在 ncurses 包中

# 安装命令的示例（以 CentOS 为例）:
# sudo yum install epel-release
# sudo yum install figlet
# sudo yum install ncurses  # tput 通常包含在 ncurses 包中

# 安装命令的示例（以 Arch Linux 为例）:
# sudo pacman -S figlet
# sudo pacman -S ncurses  # tput 通常包含在 ncurses 包中

# 删除旧的 figlet_fonts.txt 文件
rm -f ~/figlet_fonts.txt

# 遍历所有 figlet 字体
for font in $(figlist | grep -v " "); do
    # 使用当前字体生成当前时间的 figlet 输出
    figlet_output=$(figlet -w 1000 -f "$font" `date "+%H : %M : %S"` 2>/dev/null)
    # 去除 figlet 输出中的所有空白字符
    figlet_output_trimmed=$(echo "$figlet_output" | tr -d '[:space:]')
    
    # 如果 figlet 命令成功且输出不为空，则将字体名称写入文件
    if [ $? -eq 0 ] && [ -n "$figlet_output_trimmed" ]; then
        echo "$font" >> ~/figlet_fonts.txt
    fi
done

echo -e "\033[?25l" # 隐藏光标

# 捕获 Ctrl+C 信号并执行命令
trap 'echo -e "\033[?25h"; exit' SIGINT

# 无限循环显示时间
while true; do
    # 读取 figlet_fonts.txt 文件中的每个字体
    while IFS= read -r font; do
        clear  # 清屏
        tput setaf $((RANDOM % 8))  # 随机设置前景色
        figlet -w 1000 -f "$font" `date "+%H : %M : %S"`  # 使用当前字体显示时间
        tput sgr0  # 重置终端属性
        sleep 1  # 等待 1 秒
    done < ~/figlet_fonts.txt
done


