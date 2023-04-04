Creates VPS-endpoints for access to S3

Add the following code to call the module
module "vpc_endpoints" {
    source                  = "git@github.com:ministryofjustice/ap-terraform-vpc-endpoints?ref=v1.0.0"
    vpc_id    = module.vpc.vpc_id
    s3_routing_table_ids    = module.vpc.private_route_table_ids
  
}

The calling module passes the vpc_id and the ids of the private route tables to enable the creation of the gateway endpoint.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc_endpoint.s3_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_iam_policy_document.manage_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_s3_routing_table_ids"></a> [s3\_routing\_table\_ids](#input\_s3\_routing\_table\_ids) | id of the routing table to use | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to endpoint resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | id of the vpc | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->