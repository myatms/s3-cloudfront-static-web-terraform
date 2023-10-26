# Route 53 record for domain
resource "aws_route53_record" "web" {
    zone_id = var.route53_zone_id
    name    = var.fqdn
    type    = "A"
    allow_overwrite = true

    alias {
        name = aws_cloudfront_distribution.web.domain_name
        zone_id = aws_cloudfront_distribution.web.hosted_zone_id
        evaluate_target_health = false
    }
    depends_on = [ aws_cloudfront_distribution.web ]
}
