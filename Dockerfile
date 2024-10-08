# 使用 Python 3.8 作為基礎映像
FROM python:3.8-slim

# 設置工作目錄
WORKDIR /app

# 安裝 cron
RUN apt-get update && apt-get install -y cron

# 添加 cron 作業到 crontab
RUN echo "0 9 * * * python /app/test.py >> /var/log/cron.log 2>&1" >> /etc/crontab


# 安裝 Python 依賴項
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 拷貝應用程式代碼到容器內
COPY . .

# 拷貝啟動腳本
COPY entrypoint.sh /app/entrypoint.sh


# 設置啟動腳本為可執行
RUN chmod +x entrypoint.sh

# 設置容器啟動時運行啟動腳本
CMD ["./entrypoint.sh"]
