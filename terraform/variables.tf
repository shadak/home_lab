variable "mgmt_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsYuqAVM2+0i0H6Ai+gsq51TS/9KgC9Z/g1g9X0po+SY95fofr98cI95+5dT20BuyaqXDJrE08gejWyKiLPfLzGcrMJlFV7512iyDIFUEEoCT27Fe3bEsg+WCXzxrF9yguNefPI/w5YAka5drxqlZw+wjICeuiy3VnErL4uKyizT8s67c8V4lmvayBLwN5k9nN8nNQoTVCaIwToUeo8NfxsysqBRHHZlc2ScR/kvi/2iXgcdspsi2E0B6XwV0letCM8ks4SOQE+2FatcNiAySMrlVrkgptqpvVZKpu/onNHp2Fvn3aI7gF5xuKe3dn778vKiGtISlyvKAbqiDmaSRoi531HtrsKVK2xSpsgusa6KPSensT3nQ7rVec1EOnwCXH58mQBm1tZwqfGp56D6DwmY0qbob2GZjFRxaK1mwvxZR35TMdR5ePeFyGBULZpnB8QbZt83tSWOVBJR2dgM8HMwKpfpVBTbTPm1DdMuh3ihszQ7Qr+v83nL3b81vT6a0= shadak@mgmt01"
}

variable admin_username {
  type        = string
  default     = "shadak"
  description = "Admin Username for Service VM's"
}


variable endpoint_keys {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpIKDTrbYZmdHE0ct6tgDxCsQpo0XZS2HVrgu5CTZyvHwG+T7wVtk2mrhAAkbpxSxL7Ey8WMZfeYhq1zu0fwSEWgaMSb4ocNQa4FZKwlXj8p1O3tsQ6JwFl1g6syBJ006mrqRJMYj1KIEaYP2juJ19pEFnvdUhE7fL2mjB6kQrHb05aQVKImNTEyABNHUSkNsoMN00CeIXroQ5RKGtJ51ydPMEmmtjrRqAyVxUOZuPwb4j1J1TzilRuQwjuI0xSAVA6FbucyQciP0OqhLiUPCvjtRtTAtPdv/pfJzeqaR+kr6XsGBAaPMBaJXNZxd0bdNOWvoZoo6L0fEkjnY59uSj32I+22BC3Fd03CRLv2zSzvcVVm49ia5rcADRe1CdlXOCOTUvCAGCBxgW/5ufYBj5CN5CcMm58hGpfTOxOstZa4DGEcEXPP5A2qFcKK8KI+xZXbFF4z1UN2YetTeW94s3M4oNajf2QJgp83zyLwqCKhNKw3fHrjv5kV9xDeHwqO8= azuread\\jackbennett@WS0"
  description = "Public Keys for Remote Access"
}


