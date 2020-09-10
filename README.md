# POC - AWS Lambda Terraform provider

Deploy lambda functions using Terraform.

## Setup

Regions are defined by current workspace, and by default, they are configured on variables file.

Has been created a simple Python function for this example.

### Profile

Define the profile access on `~/.aws/credentials`, ex.:

```profile
[lambidas]
aws_access_key_id = <KEY>
aws_secret_access_key = <ACCESS-KEY>
```

### Init

Initialize the working directory. Install project dependencies.

```bash
$ terraform init
```

### Workspace

Workspaces enable apply same configurations in differents cenarios like production, homologation, development.

**View a list of availables workspaces**

```bash
$ terrafor workspace list 
```

**Create a new workspace**

```bash
$ terraform workspace new <workspace-name>
```

Use `terraform.workspace` on code to get current workspace

## Workflow

### Validate

Validates the Terraform files before

```bash
$ terraform validate
```

### Plan

Generate and show an execution plan

```bash
$ terraform plan
```

### Apply

Builds or changes infrastructure. Persist current state changes to local and remote storage

```bash
$ terraform apply -auto-approve
```

### Destroy

Destroy created managed infrastructure

```bash
$ terraform destroy -auto-approve
```
