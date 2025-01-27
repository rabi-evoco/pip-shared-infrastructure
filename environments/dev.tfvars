address_space           = ["10.101.4.64/26"]
subnet_address_prefixes = ["10.101.4.64/27", "10.101.4.96/27"]
route_table = [
  {
    name                   = "ss_dev_aks"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.11.72.36"
  },
  {
    name                   = "azure_control_plane"
    address_prefix         = "51.145.56.125/32"
    next_hop_type          = "Internet"
    next_hop_in_ip_address = null
  }
]
tags = {
  "businessarea" : "cross-cutting",
  "application" : "hearing-management-interface",
  "environment" : "development"
}
log_analytics_workspace_name = "hmcts-nonprod"
log_analytics_workspace_rg   = "oms-automation"
ping_tests = [
  {
    pingTestName = "apim-service"
    pingTestURL  = "https://pip-apim.dev.platform.hmcts.net/health/liveness"
    pingText     = "&#x22;status&#x22;&#x3A;&#x20;&#x22;Up&#x22;" # xml encoding
  },
  {
    pingTestName = "pip-casehqemulator"
    pingTestURL  = "https://pip-apim.dev.platform.hmcts.net/pip/emulator-health"
    pingText     = ""
  },
  {
    pingTestName = "pip-pact"
    pingTestURL  = "https://pip-apim.dev.platform.hmcts.net/pip/pact-health"
    pingText     = ""
  }
]
