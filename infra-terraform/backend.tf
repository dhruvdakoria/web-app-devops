terraform {  
    backend "s3" {
        bucket         = "dhruv-terratest-sf"
        key            = "terraform-cm-test-devops.tfstate"  
        region         = "us-east-1"
        dynamodb_table = "dhruv-terratest-sf"
    }
}
