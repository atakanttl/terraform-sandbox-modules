locals {
  prefix = "${var.prefix}-${random_integer.this.id}"
}
