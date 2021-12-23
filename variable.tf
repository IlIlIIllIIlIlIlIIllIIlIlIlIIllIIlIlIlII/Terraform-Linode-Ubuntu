variable "token"{
    type        = string
    description = "Hold the token for Authentication to Linode"
    sensitive   = true
}

variable "ssh-key"{
    type = string
}

variable "server-name"{
    type = string
}