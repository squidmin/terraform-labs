# terraform-labs

Visit the [Terraform website](https://www.terraform.io/).

## Workspaces

| Name      | Description                      |
|-----------|----------------------------------|
| `default` | The default workspace            |
| `dev`     | The `dev` environment workspace  |
| `prod`    | The `prod` environment workspace |

### Switching workspaces

```bash
terraform workspace select workspace_name
```

Example:

```bash
terraform workspace select dev
```

## Build documentation

```bash
sphinx-build -b html . _build
```
