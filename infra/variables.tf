variable "project_name" {
  description = "Nombre base del proyecto"
  type        = string
  default     = "pipeline"
}
 
variable "location" {
  description = "Region de Azure"
  type        = string
  default     = "eastus2"
}
 
variable "environments" {
  description = "Lista de ambientes a crear"
  type        = list(string)
  default     = ["dev", "prod"]
}
