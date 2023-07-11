resource "aws_ecr_repository" "ecr-repo" {
  name                 = "ecr-repo-one"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecs_cluster" "ecs-one" {
  name = "ecs-cluster"

}

resource "aws_ecs_task_definition" "ecs-task-def-1" {
  family                   = "task-definition-one"
  execution_role_arn       = aws_iam_role.ecs_task_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048

  container_definitions =  jsonencode([
  
    {
      "name": "mad-container",
      "image": "${aws_ecr_repository.ecr-repo.repository_url}:latest",
      "cpu": 1024,
      "memory": 2048,
      "essential": true
      "portMappings": [
        {
          "containerPort": 80,
          "protocol": "tcp"
        }
      ]
    }
 ])
}


resource "aws_ecs_service" "ecs-service" {
  name                = "ecs-service-one"
  cluster             = aws_ecs_cluster.ecs-one.id
  task_definition     = aws_ecs_task_definition.ecs-task-def-1.arn
  desired_count       = 2
  scheduling_strategy = "REPLICA"
  launch_type = "FARGATE"

    network_configuration {
      subnets = var.subnet-ecs
      security_groups =  var.sg-ecs
      assign_public_ip = false
    }
}


