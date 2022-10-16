variable "cluster_name" {
    type = string
    default = "cluster_local"
}

variable "kubernetes_version" {
    type = string
    default = "latest"
}

variable "github_owner" {
  type        = string
  description = "github owner"
}

variable "github_token" {
  type        = string
  description = "github token"
}

variable "repository_name" {
  type        = string
  default     = "cluster_local"
  description = "github repository name"
}

variable "repository_visibility" {
  type        = string
  default     = "public"
  description = "How visible is the github repo"
}

variable "branch" {
  type        = string
  default     = "master"
  description = "branch name"
}

variable "target_path" {
  type        = string
  default     = "flux"
  description = "flux sync target path"
}

variable "private_repository" {
  type = bool
  default = false
  description = "repository is private"
}