terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-statefile-s3-aws"
    key    = "state/eks-helm-react-app.tfstate"
    region = "us-east-2"
  }
}

data "aws_eks_cluster" "eks" {
  name = var.cluster_name
}

output "endpoint" {
  value = data.aws_eks_cluster.eks.endpoint
}
# output "all" {
#     value =data.aws_eks_cluster.eks
# }
output "kubeconfig-certificate-authority-data" {
  value = data.aws_eks_cluster.eks.certificate_authority[0].data
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}
resource "helm_release" "java-emp1" {
  chart      = "${path.module}/helm-react-app"
  name       = "react-app"
  namespace  = "default"
  atomic =  true 
  cleanup_on_fail = true
  force_update = true

  set {
    name = "image.tag"
    value = var.tag
  }
}
