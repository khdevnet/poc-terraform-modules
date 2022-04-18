# poc-terraform-modules
Follow this [Microsoft Guide](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure) to install and configure Terraform

This demo is to see how Terraform Modules work. The original sample script from [guide](https://github.com/yufangzhang/terraform-azure-modules) is splited into four modules here.

### .gitignore explained

*.tfvar, .terraform/, terrafrom.state can contain secrets therefore not uploaded. A better secret management could be via [backend](https://www.terraform.io/docs/backends/types/azurerm.html).


### Structure explained

```
.
├── README.md
├── poc-app
|   ── main.tf
|   ── provider.tf
|   ── variables.tf
├── state-storage
|   ── main.tf
|   ── provider.tf
|   ── variables.tf
├── modules
│   └── app_service
│       ├── main.tf
│       ├── outputs.tf
│       └── vars.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf
```

- `modules/` each repo inside modules/ can be instantiated as a Terraform module. 
  - `main.tf` module resources
  - `vars.tf` variables declaration
  - `outputs.tf` define outputs. Module outputs can be used in other resources.
- `poc-app` application instantiation.
- `state-storage/` init azure storage account to store terraform state. 



### To run
`cd state-storage` 
`terraform init`
`terraform apply init state storage`
`cd ..\poc-app ` 
`terraform init`
`terraform apply init poc app`
