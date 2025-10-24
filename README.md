# 闲鱼商家系统本地部署指南

<div align="center">
  <img src="https://img.shields.io/badge/Python-3.11-blue?logo=python&logoColor=white" alt="Python 3.11">
  <img src="https://img.shields.io/badge/Windows-10%2F11-green?logo=windows&logoColor=white" alt="Windows 10/11">
  <img src="https://img.shields.io/badge/Playwright-Chromium-orange?logo=google-chrome&logoColor=white" alt="Playwright Chromium">
</div>

## 📑 目录
- [环境要求](#-环境要求)
- [准备工作](#-准备工作)
- [部署步骤](#-部署步骤)
- [启动与访问](#-启动与访问)
- [常见问题解决](#-常见问题解决)
- [系统维护](#-系统维护)

## 📋 环境要求

| 项目 | 具体要求 | 备注 |
|------|----------|------|
| **操作系统** | Windows 10/11（64位） | 不支持Windows 7 |
| **Python版本** | Python 3.11.x | **必须为3.11版本** |
| **网络环境** | 需联网 | 用于下载依赖和浏览器组件 |
| **硬件要求** | 至少2GB内存，500MB空闲磁盘空间 | 推荐4GB以上内存 |

## 🛠️ 准备工作

### 2.1 下载项目源码
- 从GitHub仓库克隆或下载：  
  [https://github.com/zhinianboke/xianyu-auto-reply](https://github.com/zhinianboke/xianyu-auto-reply)
- 解压到本地目录（**路径建议不含中文和空格**），示例路径：  
  `C:\xianyu-auto-reply`

### 2.2 确认文件完整性
解压后检查目录中是否包含以下核心文件：
- `Start.py`（系统启动入口）
- `requirements.txt`（依赖包清单）
- 其他项目相关代码文件

## 🚀 部署步骤

### 3.1 安装Python 3.11
1. 下载安装包：  
   访问[Python 3.11官方下载页](https://www.python.org/downloads/release/python-3110/)，下滑至"Files"区域：
   - 64位系统选择：`python-3.11.0-amd64.exe`
   - 32位系统选择：`python-3.11.0.exe`（极少情况）

2. 运行安装程序：
   - **关键步骤**：勾选底部的`Add Python 3.11 to PATH`（添加到环境变量）
   - 点击`Install Now`进行默认安装（或自定义路径）

3. 验证安装：
   打开命令提示符（`Win + R` → 输入`cmd`），执行：
   ```bash
   python --version
   ```
   若显示`Python 3.11.0`则安装成功。

### 3.2 打开PowerShell并进入项目目录
1. 打开PowerShell：`Win + R` → 输入`powershell` → 回车
2. 切换到项目目录（替换为实际路径）：
   ```powershell
   cd C:\xianyu-auto-reply
   ```
   - 路径含空格时需用引号包裹：  
     `cd "C:\My Projects\xianyu-auto-reply"`

### 3.3 创建并激活虚拟环境

#### 3.3.1 创建虚拟环境
```powershell
python -m venv venv
```
执行后，项目目录会生成`venv`文件夹（独立的Python环境）。

#### 3.3.2 激活虚拟环境
```powershell
.\venv\Scripts\activate
```
- 成功激活后，命令行前缀会显示`(venv)`
- **若激活失败**（提示权限错误）：
  ```powershell
  # 允许当前用户执行脚本（仅首次需要）
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  # 按提示输入Y，然后重新执行激活命令
  ```

### 3.4 安装项目依赖

#### 3.4.1 升级pip
```powershell
pip install --upgrade pip
```

#### 3.4.2 安装依赖包
```powershell
pip install -r requirements.txt
```

#### 3.4.3 国内网络加速（推荐）
若下载缓慢，使用国内镜像源：

```powershell
# 清华镜像（推荐）
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 其他可选镜像
# 阿里云：https://mirrors.aliyun.com/pypi/simple/
# 腾讯云：https://mirrors.cloud.tencent.com/pypi/simple/
```

### 3.5 安装Playwright浏览器
项目依赖Chromium浏览器进行自动化操作：
```powershell
playwright install chromium
```
- 若下载缓慢，使用国内加速地址：
  ```powershell
  playwright install chromium --download-host=https://playwright-assets.vercel.app
  ```

### 3.6 创建数据存储目录
需创建`data`（数据存储）和`logs`（日志存储）目录：
```powershell
# 方式1：分开创建
mkdir data
mkdir logs

# 方式2：一次性创建（PowerShell专用）
mkdir data,logs
```

## 🌐 启动与访问

### 4.1 启动系统
在虚拟环境中执行：
```powershell
python Start.py
```

### 4.2 验证启动成功
命令行显示类似以下内容即表示启动成功：
```
Running on http://127.0.0.1:8088 (Press CTRL+C to quit)
```

### 4.3 访问系统
1. 打开浏览器（推荐Chrome/Edge）
2. 访问地址：[http://localhost:8088](http://localhost:8088)
3. 登录信息：
   - 用户名：`admin`
   - 密码：`admin123`
   
   :warning: **重要提示：首次登录后请立即修改密码！**

## 🔧 常见问题解决

### 5.1 Python命令无法识别
- **症状**：`python --version`提示"不是内部或外部命令"
- **解决**：重新安装Python并勾选`Add Python to PATH`，或手动将Python安装目录添加到系统环境变量。

### 5.2 虚拟环境激活失败
- **症状**：`\venv\Scripts\activate`提示"无法加载文件..."
- **解决**：执行`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`并输入`Y`，重新激活。

### 5.3 依赖安装失败（如pycairo、pillow）
- **症状**：提示"Microsoft Visual C++ 14.0 or greater is required"
- **解决**：
  1. 下载[Microsoft Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)
  2. 安装时勾选"Desktop development with C++"
  3. 重启电脑后重新安装依赖

### 5.4 Playwright安装失败
- **症状**：`playwright install chromium`提示网络错误
- **解决**：使用国内加速地址：
  ```powershell
  playwright install chromium --download-host=https://playwright-assets.vercel.app
  ```

### 5.5 端口被占用
- **症状**：启动时提示"Address already in use"
- **解决**：
  1. 关闭占用8088端口的程序（通过任务管理器）
  2. 或修改项目配置文件（`Start.py`或`config.py`）中的端口号

## 🛡️ 系统维护

### 6.1 停止系统
在启动窗口中按`Ctrl + C`即可停止服务。

### 6.2 重启系统
```powershell
# 进入项目目录
cd C:\xianyu-auto-reply
# 激活虚拟环境
.\venv\Scripts\activate
# 启动系统
python Start.py
```

### 6.3 数据备份
项目数据存储在`data`目录，定期复制该目录到其他位置即可备份。

### 6.4 更新源码
1. 下载最新源码覆盖原有文件（保留`data`目录）
2. 重新安装依赖：
   ```powershell
   .\venv\Scripts\activate
   pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
   ```

---

<div align="center">
  <p>🎉 <strong>部署完成！</strong></p>
  <p>如有其他问题，请查看命令行输出的错误信息，或参考项目GitHub仓库的Issues页面。</p>
</div>

