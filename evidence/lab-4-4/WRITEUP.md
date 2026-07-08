# Lab 4.4: Evidence Chain of Custody — Write-up

## Chain of Custody Properties

### 1. Integrity
**Property:** The evidence has not been altered since it was collected.
**Artifact:** `evidence-<run_id>-<sha>.tar.gz.sha256`
SHA-256 hash computed at CI time and stored as a sidecar in the vault.
`verify-evidence.sh` recomputes the hash and compares — any single byte
change produces a different hash and fails instantly.

### 2. Authenticity
**Property:** The evidence was produced by this specific CI pipeline, not a
third party.
**Artifact:** `evidence-<run_id>-<sha>.tar.gz.sig.bundle`
Cosign keyless signing uses GitHub Actions OIDC identity. The bundle contains
the Fulcio certificate (proving the signer was `token.actions.githubusercontent.com`),
the signature, and the Rekor log entry. `cosign verify-blob` checks all three.

### 3. Timestamp
**Property:** The evidence existed at a specific point in time.
**Artifact:** Rekor transparency log entry inside `*.sig.bundle`
Rekor is an append-only public log. The entry proves the bundle was signed
at a specific time, independently of Anthropic, AWS, or GitHub.

### 4. Preservation
**Property:** The evidence cannot be deleted or overwritten.
**Artifact:** S3 Object Lock (GOVERNANCE mode, 1-day retention minimum)
`verify-evidence.sh` checks `get-object-retention` and confirms the
`RetainUntilDate` is in the future. Attempts to overwrite the object
are rejected by AWS — the tampered copy can only exist on the attacker's
laptop, never in the vault.

## Tamper Test Result
Downloaded bundle, appended `junk` bytes, recomputed hash:
- Original: `4a233328ca07d6a5500492485fd9ef4f79c690cfc082e2f14f66000ec178601e`
- Tampered: `7d05cf62b730179ca60ad41b1cdded8142f712afcaa5db6c62bf3b09ec1cb81b`

Hashes differ. Cosign verification fails. Object Lock prevents vault overwrite.
Chain of custody is mathematical, not a matter of anyone's good word.

## Run Evidence
- Run ID: `28972218441`
- Vault: `cgep-lab-grc-evidence-vault-37bf1d7e`
- Bundle key: `runs/28972218441/evidence-28972218441-41578ccfd9c55018811067ac25385ed506e9b1dd.tar.gz`
- Verify command: `EVIDENCE_VAULT="$VAULT" bash scripts/verify-evidence.sh 28972218441`
- Result: `CHAIN INTACT for run 28972218441`