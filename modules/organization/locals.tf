locals {
  child_ou_factory = flatten([
    for ou in var.organizations_structure : [
      for child_ou in ou.child_ou_ids : {
        id     = "${ou.id}-${child_ou}"
        name   = child_ou
        parent = ou.id
      }
    ]
  ])

  tags = {
    ApplicationId  = "FOUNDATIONAL"
    BusinessUnitId = "CORE"
  }
}
