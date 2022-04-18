variable "sku" {
  type = object({
    capacity = number
    size = string
    tier = string
  })
  default = {
    capacity = 1
    size     = "S1"
    tier     = "Standard"
  }

  description = "Sku of the app service plan"
}

variable "rgname" {
  type = string
}

variable "location" {
  default = "westeurope"
}

variable "prefix" {
  default = "poc"
}

variable "env" {
  default = "poc"
}
