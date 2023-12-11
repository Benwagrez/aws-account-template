# TODO
- [] Configure security services as they are shown here: https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/org-management.html
- [] Create resources required for config conformance pack deployment
- [] Create multiple config conformance pack options (https://docs.aws.amazon.com/config/latest/developerguide/operational-best-practices-for-wa-Security-Pillar.html)
- [] Flesh out Security Tools module (https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/security-tooling.html)
- [] Flesh out logging archive module (https://medium.com/cloudvillains/easy-security-log-analysis-and-visualization-with-amazon-security-lake-a5456de90f4a) (https://docs.aws.amazon.com/security-lake/latest/userguide/what-is-security-lake.html) (https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/log-archive.html)

- [x] Guardduty implementation (https://github.com/aws-samples/amazon-guardduty-for-aws-organizations-with-terraform/blob/main/create-logging-acct-role/create-role.template)
- [x] Set allowed service principals in ORganizations to be built by booleans declaring which modules are being built. (e.g., Guard duty enabled = add guard duty SP to org)
- [] Add random to S3 bucket names
- [] Pass aws provider through to module (figure out how to organize bool deployments when aws provider is dependent on custom role assumptions)
