provider "aws" {
    region = var.aws_west_region
}

module "ebs-west" {
    source = "./ebs"
    aws_region = var.aws_west_region
    execution_role_arn = aws_iam_role.dlm_lifecycle_role.arn
}

module "ebs-east" {
    source = "./ebs"
    aws_region = "us-gov-east-1"
    execution_role_arn = aws_iam_role.dlm_lifecycle_role.arn
}