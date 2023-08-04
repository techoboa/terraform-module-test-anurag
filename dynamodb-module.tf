variable "table_name" {
  description = "Dynamodb table name (space is not allowed)"
  default = "dt2"
}

variable "table_billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  default = "PAY_PER_REQUEST"
}


variable "environment" {
  description = "Name of environment"
  default = "test"
}


resource "aws_dynamodb_table" "my_first_table" {
  name        = "${var.table_name}"
  billing_mode = "${var.table_billing_mode}"
  hash_key = "id"
  range_key = "grade"
  attribute {
    name = "id"
    type = "N"
  }
  attribute {
    name = "grade"
    type = "S"
  }
 tags = {
   environment = "${var.environment}"
  }
}
