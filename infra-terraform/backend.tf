terraform {  
    backend "s3" {
        bucket         = "cm-terrastate"
        key            = "terraform-test.tfstate"  
        region         = "us-east-1"
        dynamodb_table = "cm-terrastate-db"
    }
}
