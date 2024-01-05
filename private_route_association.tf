# creating a public route association
resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.subnet_private.id
  route_table_id = aws_route_table.jenkins_private.id
}