## 带分屏的配置

### 配置文件
1. 覆盖 `alacritty.yaml` 文件
```bash
curl -fLo ~/.config/alacritty/alacritty.yml --create-dir \
     https://raw.githubusercontent.com/zhanghuid/dotfiles/main/alacritty/split-panel/alacritty.yaml
```
2. 覆盖 `tumx.conf` 文件
```bash
curl -fLo ~/.tmux.conf \
    https://raw.githubusercontent.com/zhanghuid/dotfiles/main/alacritty/split-panel/tmux.conf
```

### 快捷键
- create a tab: cmd + t
- close a tab: cmd + w
- close a pane: cmd + w
- create vertical pane: cmd + d
- create horizontal pane: cmd + shift + d
- move between panes: cmd + h, cmd + j, cmd + k and cmd + l
- resize panes: cmd + left, cmd + right, cmd + up and cmd + down
- jump to specific tab: cmd + <number>, i.e: cmd + 3

## 引用
https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/


## 多个 tabs 的配置
### 配置文件
1. 覆盖 `alacritty.yaml` 文件
```bash
curl -fLo ~/.config/alacritty/alacritty.yml --create-dir \
     https://raw.githubusercontent.com/zhanghuid/dotfiles/main/alacritty/multi-tabs/alacritty.yaml
```
2. 覆盖 `tumx.conf` 文件
```bash
curl -fLo ~/.tmux.conf \
    https://raw.githubusercontent.com/zhanghuid/dotfiles/main/alacritty/multi-tabs/tmux.conf
```

### 快捷键
- command + t：新开标签页
- command + w: 关闭标签页
- command + 数字：跳转对应标签页
- command + shift + [ ：切换到上一个标签页
- command + shift + ] ：切换到下一个标签页

## 引用
https://tw93.fun/2023-01-25/alacritty.html