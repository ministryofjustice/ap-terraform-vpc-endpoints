module "example" {
    source = "./.."
    enable_s3_gateway = "true"
    vpc_id = "foo bar"
}