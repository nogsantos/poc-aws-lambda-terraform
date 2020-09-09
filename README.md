# POC - AWS Lambda Terraform provider

Deploy lambda functions using Terraform.

## Setup

Default region is `sa-east-1` (São Paulo) defined on `main.tf` file.

### Init

Initialize the working directory. Install project dependencies.

```bash
$ terraform init
```

## Workflow

### Plan

Generate and show an execution plan

```bash
$ terraform apply -auto-approve
```

### Apply

Builds or changes infrastructure. Persist current state changes to local and remote storage

```bash
$ terraform apply -auto-approve
```
