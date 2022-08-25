module "example" {
  source = "./.."
  vpc_id = "foo bar"

  s3_routing_table_ids = ["A1234"]
}


