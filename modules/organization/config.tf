resource "aws_config_organization_conformance_pack" "organization_config_conformance_pack" {
  count = var.deploy_conformance_pack ? 1 : 0

  name = "DefaultConformancePack"

  input_parameter {
    parameter_name  = "AccessKeysRotatedParameterMaxAccessKeyAge"
    parameter_value = "90"
  }

  template_body = file("${path.module}/../../policies/config/ConformancePack.yaml")

  depends_on = [aws_organizations_organization.organization_root]
}
