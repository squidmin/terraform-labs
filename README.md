# terraform-labs

Visit the [Terraform website](https://www.terraform.io/).

## Workspaces

| Name      | Description                      |
|-----------|----------------------------------|
| `default` | The default workspace            |

### Switching workspaces

```bash
terraform workspace select workspace_name
```

Example:

```bash
terraform workspace select default
```

## Build documentation

```bash
sphinx-build -b html . _build
```
