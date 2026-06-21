# Why Hire Me — Terraform Infrastructure

Infrastructure-as-code for the [Why Hire Me](https://d1zowq1o2h9i94.cloudfront.net) project — a self-pitching serverless portfolio site. Everything in this folder provisions a complete, working copy of the backend and frontend hosting on AWS from a single `terraform apply`.

This stack was originally built manually through the AWS Console to learn the underlying services firsthand, then fully codified here in Terraform afterward — same architecture, reproducible from scratch.

## What this provisions

**Frontend hosting**
- S3 bucket configured for static website hosting
- Public read bucket policy
- `index.html` and chapter images uploaded directly via Terraform

**Backend**
- 4 AWS Lambda functions (Python), each packaged and deployed from local source:
  - `pitch` — returns the site's core pitch as JSON
  - `story` — returns a 4-chapter career story as JSON
  - `project` — returns project portfolio data as JSON
  - `contact` — validates and processes contact form submissions, sends a notification email via SES
- HTTP API (API Gateway v2) routing all 4 functions, with CORS enabled
- Least-privilege IAM:
  - A shared read-only execution role for the 3 read-only functions (`pitch`, `story`, `project`)
  - A separate role for `contact`, scoped specifically to `ses:SendEmail` on one verified identity — not a broad managed policy
- Explicit Lambda resource policies (`aws_lambda_permission`) authorizing API Gateway to invoke each function

## Project structure

```
terraform/
  main.tf          # provider configuration
  s3.tf            # bucket, static hosting config, policy, file uploads
  iam.tf           # execution roles and least-privilege policies
  lambda.tf        # Lambda packaging (archive_file) and function resources
  api_gateway.tf   # HTTP API, routes, integrations, Lambda permissions
  outputs.tf       # website URL and API URL, printed after apply
```

## Usage

Requires the [AWS CLI](https://aws.amazon.com/cli/) configured with valid credentials, and [Terraform](https://developer.hashicorp.com/terraform/install) installed locally.

```bash
terraform init
terraform plan
terraform apply
```

On success, Terraform prints both the live site URL and the API base URL as outputs.

To tear everything down:

```bash
terraform destroy
```

## Notes

- Lambda source files are expected at `../why-hire-me/*.py` relative to this folder (the application code lives in a sibling directory, kept separate from infrastructure code).
- `terraform.tfstate`, `.terraform/`, and build `.zip` artifacts are intentionally excluded from version control via `.gitignore`. `.terraform.lock.hcl` is committed, locking exact provider versions for reproducibility.
- SES is configured in sandbox mode — the `contact` function currently sends notification emails to a single verified address rather than acting as a two-way auto-responder.