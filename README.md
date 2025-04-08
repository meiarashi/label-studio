# Label Studio on Render

このリポジトリは[Label Studio](https://labelstud.io/)をRender.comでデプロイするための設定を含んでいます。

## デプロイ方法

1. [Render.com](https://render.com)でアカウントを作成します
2. ダッシュボードから**New Web Service**を選択します
3. このGitHubリポジトリを接続します
4. 以下の設定を行います：
   - **Environment**: Docker
   - **Name**: 任意のサービス名（例: labelstudio）
   - **Region**: 最も近いリージョン
   - **Branch**: main
   - **Root Directory**: ルートディレクトリ
   - **Instance Type**: Free（開発用）または必要に応じて有料プラン
   - **Health Check Path**: `/static/favicon.ico`
5. **Create Web Service**をクリックして、デプロイを開始します

## 環境変数

必要に応じて以下の環境変数を設定できます：

- `LABEL_STUDIO_BASE_DATA_DIR`: データの保存場所
- `LABEL_STUDIO_USERNAME`: 管理者ユーザー名
- `LABEL_STUDIO_PASSWORD`: 管理者パスワード

## 注意事項

- Freeプランでは一定時間の非アクティブ後にサービスがスリープします
- 永続的なデータ保存には、外部ストレージサービスの設定を検討してください 