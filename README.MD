# Why Hire Me

A portfolio site that proves its own pitch. Every section — story, projects, the pitch itself — is rendered from a live serverless API built and deployed end-to-end on AWS, not static content.

**Live site:** https://d1zowq1o2h9i94.cloudfront.net

Built by [Kharee Bellamy](https://github.com/Gvld3iii) — self-taught Cloud & Security Engineer, AWS Certified Solutions Architect Associate.

---

## What this is

Most portfolio sites *describe* a developer's skills. This one demonstrates them directly: the site's frontend calls a real backend running on real AWS infrastructure, and that backend is the actual thing being described in the "Stack" section of the page itself.

No bootcamp, no template. Built solo while transitioning from truck driving into cloud engineering, learning Python and AWS fundamentals along the way.

## Architecture

**Frontend**
- Single-page static site (HTML/CSS/JS, no framework)
- Hosted on S3, served via CloudFront for HTTPS
- Pulls all content dynamically from the backend API at load time — zero hardcoded mock data in production

**Backend**
- 4 AWS Lambda functions (Python):
  - `pitch` — core pitch/skills summary
  - `story` — 4-chapter career story
  - `project` — project portfolio data
  - `contact` — validates contact form submissions, sends notification email via Amazon SES
- API Gateway (HTTP API) routing all 4 functions, CORS-enabled
- Least-privilege IAM — a shared read-only role for the 3 GET endpoints, a separate role scoped specifically to `ses:SendEmail` for the contact function
- CloudWatch alarm monitoring for Lambda errors

**Infrastructure as Code**

The entire stack above was first built manually through the AWS Console to learn the underlying services directly, then fully codified in Terraform. See [`terraform/`](./terraform) for the IaC implementation — provider config, S3, IAM, Lambda packaging, and API Gateway, all reproducible from a single `terraform apply`.

## Tech stack

`Python` · `AWS Lambda` · `API Gateway` · `S3` · `CloudFront` · `IAM` · `SES` · `CloudWatch` · `Terraform`

## Repo structure

```
why-hire-me/
  index.html          # frontend
  images/              # story chapter images
  *.py                 # Lambda function source (pitch, story, project, contact)
  terraform/           # infrastructure as code — see terraform/README.md
```

## Connect

- GitHub: [Gvld3iii](https://github.com/Gvld3iii)
- LinkedIn: [Kharee Bellamy](https://linkedin.com/in/kharee-bellamy-b2534b359)

Open to cloud engineering, DevOps, and backend Python roles.