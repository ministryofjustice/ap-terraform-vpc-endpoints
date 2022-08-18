data "aws_region" "current" {} 

data "aws_route_table" "selected" {
    vpc_id = var.vpc_id
}
resource aws_vpc_endpoint "s3_gateway" {
    count                       = var.enable_s3_gateway ? 1 : 0
    vpc_id                      = var.vpc_id
    vpc_endpoint_type           = "Gateway"
    service_name                = "com.amazonaws.${data.aws_region.current.name}.s3"
    route_table_ids             = data.aws_route_table.selected.id
    tags                        = { Name = "s3-gateway-vpc-endpoint" }
}