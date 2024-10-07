# 使用已經存在的 Python 3.8 映像
FROM python:3.8

# 設置工作目錄
WORKDIR /app

# 將當前目錄中的所有文件複製到容器的 /app 目錄中
COPY . .

# 執行 hello.py 腳本
CMD ["python", "hello.py"]
