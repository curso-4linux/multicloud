variable "credentials" {
  description = "Define as credenciais do projeto na GCP"
  default = "/home/suporte-gcp/.config/gcloud/application_default_credentials.json"
}

variable "project" {
  description = "Define em qual projeto a instancia sera executada"
  default = "wordpress-319214"
}
variable "region" {
  description = "Define em qual zona a instancia sera executada"
  default = "southamerica-east1"
}

variable "name" {
  description = "Define o nome da instância Web"
  default = "webserver-wordpress-terraform"
}

variable "image" {
  description = "Define o nome da imagem modelo para o servidor Web do Wordpress"
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "machine_type" {
  description = "Define o tipo de Instancia na GCP"
  default = "e2-small"
}

variable "zone" {
  description = "Define a zona da Instancia na GCP"
  default = "southamerica-east1-b"
}

variable "network" {
  description = "Define o nomeda da rede VPC"
  default = "wordpress"
}
