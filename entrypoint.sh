#!/bin/bash

# 啟動 cron
cron

# 運行 Python 腳本（如果需要）
# 這一行可以根據需要添加
# python /app/test.py

# 持續運行
tail -f /var/log/cron.log
