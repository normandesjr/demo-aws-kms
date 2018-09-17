data "aws_iam_policy_document" "kms_policy_document" {

  statement {
    sid = "Enable IAM User Permissions"

    actions = [
      "kms:*",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::746213696263:root"]
    }

    resources = ["*"]
  }

  statement {
    sid = "Allow access for Key Administrators"

    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion",
    ]

    principals {
      type = "AWS"
      identifiers = ["arn:aws:iam::746213696263:user/terraform"]
    }

    resources = ["*"]
  }

  statement {
    sid = "Allow use of the key"

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::746213696263:user/app"]
    }

    resources = ["*"]
  }
}

resource "aws_kms_key" "demo_kms_key" {
  description = "hibicode-demo-key"
  policy      = "${data.aws_iam_policy_document.kms_policy_document.json}"
}

resource "aws_kms_alias" "demo_kms_key_alias" {
  name          = "alias/hibicode-demo-key"
  target_key_id = "${aws_kms_key.demo_kms_key.key_id}"
}