variable "aws_region" {
  description = "The Region of AWS"
  type        = string
  default     = "ap-southeast-1"

}
variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = ""

}
variable "origin_id" {
  description = "Cloud Origin ID"
  type        = string
  default     = "MyOrigin"

}

variable "route53_zone_id" {
  description = "Route53 Hosted Zone ID"
  type = string
  default = ""
  
}

variable "fqdn" {
  description = "Full Domain Name"
  type = string
  default = ""
  
}

variable "acm_arn" {
  description = "Name of ACM ARN from NV Region"
  type = string
  default = ""
  
}
variable "cloudfront_custom_error_responses" {
  type = list(any)
  default = [
    {
      error_code            = 403
      response_code         = 200
      error_caching_min_ttl = 10
      response_page_path    = "/index.html"
    },
    {
      error_code            = 404
      response_code         = 200
      error_caching_min_ttl = 10
      response_page_path    = "/index.html"
    }
  ]
}
