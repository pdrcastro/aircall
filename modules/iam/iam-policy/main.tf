resource "aws_iam_policy" "policy" {
    name            = var.policy_name
    path            = var.path
    description     = var.policy_description
    policy          = var.policy
}