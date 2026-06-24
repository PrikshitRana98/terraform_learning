# log analytics workspace
resource "azurerm_log_analytics_workspace" "main" {}

# application insights
resource "azurerm_application_insights" "main" {}

# monitor metric alert
resource "azurerm_monitor_metric_alert" "cpu" {}

