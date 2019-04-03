# This example contains a demo of [Consul](https://www.consul.io/) cluster Multi DC in AWS over HTTP.
## Joining of the consul agent could be done with:
- Cloud Auto-joining more info [HERE](https://www.consul.io/docs/agent/cloud-auto-join.html) and examples [HERE](https://github.com/hashicorp-modules/consul-auto-join-instance-role-aws)
  - | [iam_instance_profile](https://www.terraform.io/docs/providers/aws/r/instance.html#iam_instance_profile)
- [-retry-join](https://www.consul.io/docs/agent/options.html#_retry_join)
## Prerequisites
- Please install the following component:
  - | [Terraform](https://www.terraform.io/)
- You must also have an AWS account. 
- Clone the repo:
```
git clone git@github.com:chavo1/terraform-aws-consul-multi-dc.git
cd terraform-aws-consul-multi-dc
```
- Create terraform.tfvars file with needed credential and variables:
```
access_key = "< Your AWS Access_key >"
secret_key = "< Your AWS Secret_key >"
key_name = ""
region = "us-east-1"
instance_type = ""
subnet = "< VPC subnet ID >"
client_count = 1
server_count = 1
dcname = {
    dc1 = "< dc name >"
    dc2 = "< dc name >"
  }
subnet = [
    "< Your AWS subnet >",
    "< Your AWS subnet >"
]
```
### We can start with deploying process
```
terraform init
terraform plan
terraform apply
```
### Do not forget to destroy the environment after the test
```
terraform destroy
```

### To test you will need Kitchen:

Kitchen is a RubyGem so please find how to install and setup Test Kitchen, check out the [Getting Started Guide](http://kitchen.ci/docs/getting-started/).
For more information about kitchen tests please check the next link:

https://kitchen.ci/docs/getting-started/running-test/

Than simply execute a following commands:
```
kitchen converge
kitchen verify
kitchen destroy
```
- Kitchen-Terraform tests are for 2 Consul servers and 2 Consul clients and should be as follow:
```
Command: `terraform state list`
     ✔  stdout should include "module.consul_sofia.aws_instance.client"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_sofia.aws_instance.server"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_varna.aws_instance.client"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
  Command: `terraform state list`
     ✔  stdout should include "module.consul_varna.aws_instance.server"
     ✔  stderr should include ""
     ✔  exit_status should eq 0
```
