# Compliance Policies (OPA/Rego)

This directory contains Open Policy Agent (OPA) Rego policies that enforce NIST 800-53 controls against Terraform plan JSON output.

## Policies

| File | Control | Description |
|---|---|---|
| `sc28_encryption.rego` | SC-28 | Every GCS bucket must have a customer-managed encryption key (CMEK) |
| `ac3_no_public.rego` | AC-3 | No public GCS buckets or management ports open to 0.0.0.0/0 |
| `cm6_required_tags.rego` | CM-6 | Every GCS bucket must have required labels |

## Running Policies

```bash
# Run all tests
opa test -v policies/

# Evaluate against a Terraform plan
opa eval -d policies -i <path-to-plan.json> data.compliance.sc28.deny --format=pretty
opa eval -d policies -i <path-to-plan.json> data.compliance.ac3.deny --format=pretty
opa eval -d policies -i <path-to-plan.json> data.compliance.cm6.deny --format=pretty
```

## Structure

```
policies/
├── sc28_encryption.rego
├── ac3_no_public.rego
├── cm6_required_tags.rego
├── README.md
└── tests/
    ├── sc28_encryption_test.rego
    ├── ac3_no_public_test.rego
    └── cm6_required_tags_test.rego
```