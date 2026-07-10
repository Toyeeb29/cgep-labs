# AWS Security Services Baseline

## Services and NIST Control Mapping

| Service | Controls | Status |
|---|---|---|
| CloudTrail | AU-2, AU-12, AU-10 | ✅ Deployed |
| Security Hub (NIST 800-53 + FSBP) | RA-5, SI-4 | ✅ Deployed |
| AWS Config | CM-2, CM-6, CM-8 | ⚠️ Optional, skipped |

## CloudTrail
- Trail name: `cgep-lab-mgmt`
- Multi-region: true
- Log file validation: enabled
- IsLogging: true
- S3 bucket: `cgep-lab-cloudtrail-b217914b`

## Security Hub
- Hub ARN: `arn:aws:securityhub:us-east-1:848928398887:hub/default`
- Standards: NIST 800-53 v5, AWS FSBP, CIS AWS Foundations
- 50 findings captured in `evidence/lab-5-2/security-hub-findings.json`

## AWS Config
Skipped as optional per lab instructions. Security Hub raised findings
about Config not being enabled — documented as expected gap.

## Evidence
- `evidence/lab-5-2/security-hub-findings.json` — 50 findings captured
