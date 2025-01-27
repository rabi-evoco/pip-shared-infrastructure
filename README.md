# pip-apim-infrastructure
Repository for deploying support infrastructure for PIP APIM


### Monitoring and Alerting:
If you need to update web test endpoint, add or modify `var.ping_tests` in /environments/*env*.tfvars:

```
ping_tests = [
  {
    pingTestName = "webcheck-name"
    pingTestURL  = "https://webcheck-url"
    pingText     = "Status: UP" # optional
  }
]
```

To change action group email, modify `var.support_email` in `/environments/shared.tfvars`

### Changing password on pact-broker database:
If you need to change pact-broker database password:
- navigate to Azure Database for PostgreSQL server `pip-pact-broker-*env*` and click "Reset password"
- update the secret `pact-db-password` in Key Vault `pip-sharedinfra-kv-*env*`

IMPORTANT! - if you don't update the keyvault secret, AKS cluster won't be able to read it and will fail to start Pact on the pod.
