## PR Checklist

- [ ] I have reviewed [AI_ORCHESTRATION.md](../AI_ORCHESTRATION.md) and followed all coding, security, and workflow rules.
- [ ] The PR complies with all sanitization, secret, and dual-repo procedures as defined in SSOT.
- [ ] Public-facing code/docs contain no secrets, no private prompts, and no confidential information.

### Security Checklist (see [CREDENTIAL_SECURITY.md](CREDENTIAL_SECURITY.md))

- [ ] No hardcoded credentials (API keys, passwords, tokens, private keys)
- [ ] No sensitive files committed (.env, *.pem, *.key, *.crt)
- [ ] Environment variables are used for all secrets
- [ ] Documentation uses placeholder format `[REDACTED_TYPE_HASH]` if needed
- [ ] .env.example provided if environment variables are required
- [ ] Secret scanning workflow passes without errors
