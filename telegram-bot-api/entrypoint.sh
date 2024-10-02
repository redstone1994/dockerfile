#!/bin/sh
#
# 检查必需的环境变量是否设置
if [ -z "$API_ID" ] || [ -z "$API_HASH" ]; then
    echo "Error: API_ID and API_HASH environment variables must be set."
    exit 1
fi

# 执行默认命令
exec /usr/bin/telegram-bot-api --api-id ${API_ID} --api-hash ${API_HASH} --local "$@"
