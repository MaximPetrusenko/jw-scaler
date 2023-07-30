provider "minio" {
  minio_server   = "localhost:9000"
  minio_region   = "eu-central-1"
  minio_user     = "minioadmin"
  minio_password = "minioadmin"
}

provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kind_cluster_config_path)
  }
}

resource "kubernetes_manifest" "deployment" {
  manifest  = yamldecode(file("minio-deployment.yaml"))

}

resource "kubernetes_manifest" "service" {
  manifest  = yamldecode(file("minio-service.yaml"))

}

resource "minio_iam_service_account" "test_service_account" {
  target_user = "minioadmin"
  depends_on = [kubernetes_manifest.service]
}

output "minio_user" {
  value = minio_iam_service_account.test_service_account.access_key
}

output "minio_password" {
  value     = minio_iam_service_account.test_service_account.secret_key
  sensitive = true
}

resource "minio_s3_bucket" "data-terraform-s3" {
  bucket = "data-terraform"
  acl    = "public"
}


#resource "minio_s3_object" "data-object" {
#  depends_on = [minio_s3_bucket.data-terraform-s3]
#  bucket_name = minio_s3_bucket.data-terraform-s3.bucket
#  object_name = "test.txt"
#
#  source = "./data/data.xml"
#  etag = filemd5("./data/data.xml")
#}

output "minio_id" {
  value = "${minio_s3_bucket.data-terraform-s3.id}"
}

output "minio_url" {
  value = "${minio_s3_bucket.data-terraform-s3.bucket_domain_name}"
}
