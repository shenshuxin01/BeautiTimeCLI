# BeautiTimeCLI
Command line beautification time display

![Demo GIF](https://raw.githubusercontent.com/shenshuxin01/BeautiTimeCLI/refs/heads/master/termTime.gif)

以下是一个示例`README.md`文件的内容，用于描述你的`clock-demo.sh`脚本：

This script displays the current time in various figlet fonts with random colors in the terminal. It continuously updates the time every second and hides the cursor while running. The script also handles `Ctrl+C` to exit gracefully and restore the cursor.


Make sure you have the following installed on your system:

- `figlet`
- `ncurses-utils` (for `tput` command)
- `lolcat` (optional, for colorful output)

## Installation Commands

#### Ubuntu
```bash
sudo apt-get update
sudo apt-get install figlet
sudo apt-get install ncurses-utils  # tput is usually included in the ncurses-utils package
```

#### macOS
```bash
brew install figlet
brew install ncurses  # tput is usually included in the ncurses package
```

#### CentOS
```bash
sudo yum install epel-release
sudo yum install figlet
sudo yum install ncurses  # tput is usually included in the ncurses package
```

#### Arch Linux
```bash
sudo pacman -S figlet
sudo pacman -S ncurses  # tput is usually included in the ncurses package
```

## Usage

1. Clone the repository or download the
```bash
clock-demo.sh
```
script

2. Make the script executable:
```bash
chmod +x clock-demo.sh
```
3. Run the script:
```bash
./clock-demo.sh
```

## Script Details

The script performs the following steps:

1. Deletes the old `figlet_fonts.txt` file if it exists.
2. Iterates over all available figlet fonts and generates the current time using each font.
3. Filters out fonts that produce empty or whitespace-only output.
4. Writes the valid font names to `figlet_fonts.txt`.
5. Hides the cursor and sets up a trap to restore the cursor on `Ctrl+C`.
6. Enters an infinite loop to display the current time in each font with a random color, updating every second.

