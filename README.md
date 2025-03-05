AWS ALB Multi-AZ EC2 and RDS Terraform Configuration
このリポジトリは、AWSで以下のインフラストラクチャをTerraformで構築するためのコードを提供します：

Application Load Balancer (ALB)
複数のアベイラビリティゾーン(AZ)にまたがるEC2インスタンス
複数AZに対応したRDSインスタンス


前提条件

Terraform 1.0.0以上
AWS CLIがインストールされ、適切に設定されていること
S3バケットが作成済みであること（tfstateファイルの保存用）
必要に応じてDynamoDBテーブル（状態ロック用）

使用方法
初期化
terraform init
実行計画の確認
terraform plan
リソースのデプロイ
terraform apply
リソースの削除
terraform destroy
構成
このリポジトリは以下の構造になっています：
```
├── README.md
├── main.tf              # メインの構成
├── variables.tf         # 変数定義
├── outputs.tf           # 出力定義
├── providers.tf         # プロバイダー設定
├── backend.tf           # バックエンド（S3）設定
├── versions.tf          # Terraformとプロバイダーのバージョン制約
├── modules/             # モジュールディレクトリ
│   ├── alb/             # ALBモジュール
│   ├── ec2/             # EC2モジュール
│   ├── rds/             # RDSモジュール
│   ├── vpc/             # VPCモジュール
│   └── security/        # セキュリティグループモジュール
└── environments/        # 環境固有の設定
    ├── dev/             # 開発環境
    └── prod/            # 本番環境
```
変数
主な変数は以下の通りです：

aws_region: AWSリージョン（デフォルト: ap-northeast-1）
environment: 環境名（dev, prod等）
project_name: プロジェクト名
vpc_cidr: VPCのCIDRブロック
availability_zones: 使用するアベイラビリティゾーン
public_subnets: パブリックサブネットのCIDRブロック
private_subnets: プライベートサブネットのCIDRブロック
database_subnets: データベースサブネットのCIDRブロック
ec2_instance_type: EC2インスタンスタイプ
rds_instance_class: RDSインスタンスクラス
rds_engine: RDSデータベースエンジン
rds_engine_version: RDSデータベースエンジンバージョン

詳細はvariables.tfファイルを参照してください。
ライセンス
LICENSEファイルを参照してください。