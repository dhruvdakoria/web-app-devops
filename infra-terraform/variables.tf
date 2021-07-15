# Generic vars
variable "aws_account_id" {
  default = "444716747145"
  description = "AWS ACCOUNT ID"
}

variable "region" {
  default = "us-east-1"
}

#CI/CD pipeline variables
variable "github_token" {
  default = "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"
  description = "Github token which will be used for build"
}

variable "github_owner" {
  default = "dhruvdakoria"
  description = "Github owner accout where repos are"
}

variable "github_branch" {
  default = "master"
}

variable "github_repo" {
  default = "creative-market-web-app-devops"
}

