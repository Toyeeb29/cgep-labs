# GCP Security Services Baseline

## Services and NIST Control Mapping

| Service | Controls | Status |
|---|---|---|
| Org Policy (uniformBucketLevelAccess) | CM-6 | ⚠️ Requires GCP Organization |
| Org Policy (disableServiceAccountKeyCreation) | AC-2 | ⚠️ Requires GCP Organization |
| Org Policy (requireOsLogin) | AC-3 | ⚠️ Requires GCP Organization |
| Workload Identity Federation | AC-2, IA-5 | ✅ Deployed |
| Data Access Audit Logs (Storage, KMS, IAM) | AU-2, AU-12 | ✅ Deployed |

## Key Lesson: Data Access Logs are OFF by default
GCP Data Access audit logs are disabled by default. This is the single most
common GCP audit finding. `audit_logs.tf` explicitly enables DATA_READ,
DATA_WRITE, and ADMIN_READ for Storage, KMS, and IAM services.

## Note on Org Policy
`org_policy.tf` is written and correct, but the three constraints are not
applied on this project. Creating Org Policy resources requires
`roles/orgpolicy.policyAdmin`. That role is organization-scoped and cannot
be granted on a standalone project with no Organization node.
Project `cgep-501201` is a standalone project, so the constraints are kept
as reference and would apply unchanged in an org-backed project.

## Workload Identity Federation
- Pool: `github-actions` (ACTIVE)
- Provider: GitHub OIDC (`token.actions.githubusercontent.com`)
- Bound to: `Toyeeb29/cgep-labs` only
- Service Account: `cgep-grc-gate-sa@cgep-501201.iam.gserviceaccount.com`
- Role: `roles/viewer` (read-only)

## Evidence
- `evidence/lab-5-4/iam-policy.json` — Data Access audit config captured
