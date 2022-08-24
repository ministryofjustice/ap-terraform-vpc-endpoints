data "aws_region" "current" {}

resource "aws_vpc_endpoint" "s3_gateway" {
  count             = length(var.s3_routing_table_ids) > 0 ? 1 : 0
  vpc_id            = var.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  route_table_ids   = var.s3_routing_table_ids
  tags = merge(
    var.tags,
    {
      Name = "s3-gateway-vpc-endpoint"
    },
  )
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowAll",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
        },
        "Action" : [
          "s3:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}