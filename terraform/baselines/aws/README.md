# AWS Security Services Baseline

## Services and NIST Control Mapping

| Service | Controls | Status |
|---|---|---|
| CloudTrail | AU-2, AU-12, AU-10 | ✅ Deployed |
| Security Hub | RA-5, SI-4 | ⚠️ Blocked by free plan |
| AWS Config | CM-2, CM-6, CM-8 | ⚠️ Optional, skipped |

## CloudTrail
- Multi-region trail: `cgep-lab-mgmt`
- Log file validation enabled
- IsLogging: true

## Security Hub
Could not be enabled due to AWS free plan account limitations.
SubscriptionRequiredException on EnableSecurityHub call.

## AWS Config
Skipped as optional per lab instructions.
