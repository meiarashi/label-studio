# Label Studio AWS デプロイ手順

## 必要なファイル
このフォルダには以下のファイルが含まれています：
- Dockerfile: Label Studioのコンテナイメージ定義
- docker-compose.yml: Dockerコンテナの設定
- requirements.txt: 必要なPythonパッケージ
- aws-setup-minimal.sh: AWSでの設定スクリプト

## AWSにデプロイする手順

1. AWSコンソールからEC2インスタンスを作成
   - Amazon Linux 2 AMIを選択
   - t3.small以上のインスタンスタイプを選択
   - セキュリティグループで80ポート(HTTP)を開放

2. このフォルダのファイルをEC2インスタンスに転送
   ```
   scp -i your-key.pem -r "C:\Users\bdigd\OneDrive\Desktop\label studio" ec2-user@your-ec2-ip:~/label-studio
   ```

3. EC2インスタンスにSSH接続
   ```
   ssh -i your-key.pem ec2-user@your-ec2-ip
   ```

4. セットアップスクリプトを実行
   ```
   cd ~/label-studio
   chmod +x aws-setup-minimal.sh
   ./aws-setup-minimal.sh
   ```

5. セットアップが完了したら、ブラウザでEC2インスタンスのIPアドレスにアクセス
   ```
   http://your-ec2-ip
   ```

## 注意事項
- データは Docker ボリュームに保存されます
- 本番環境では、環境変数で管理者アカウントを設定することをお勧めします
- セキュリティ強化のため、HTTPS設定やElastic IPの割り当ても検討してください
