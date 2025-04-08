# ベースイメージを指定
FROM python:3.11-slim

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係をインストールするために必要なファイルをコピー
COPY requirements.txt .

# pip をアップグレードし、requirements.txt に基づいて依存関係をインストール
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Label Studio のコード全体をコピー (もしあれば)
# COPY . .  # ローカルにコードがない場合は不要

# Label Studio が使用するポートを開放
# Render.comはPORT環境変数を自動的に設定します
EXPOSE ${PORT:-8080}

# コンテナ起動時に実行するコマンド
# PORT環境変数を使用してホストを設定します
CMD ["sh", "-c", "label-studio start --host 0.0.0.0 --port ${PORT:-8080}"]