import json 

def project_handler(event, context):
    projects= [
        {
           "name": "CloudGuard AI",
           "description":"A five-agent AI security platform that reads real Windows system data instead of simulating it. Built with Python, FastAPI, and an Electron dashboard, with Terraform-managed infrastructure and full CI/CD pipelines.",
           "tech_stack" : ["Python", "FastAPI", "Electron", "Terraform", "AWS", "DynamoDB", "Lambda", "SNS", "WAF", "EventBridge", "IAM", "GitHub Actions"],
           "link": None,
        },

        {
           "name": "Aibo Ai",
           "description":"A desktop AI assistant with local LLMs, a custom voice, and real situational awareness of what's happening on your machine. Built with Electron, Ollama, ElevenLabs, and Python Flask.",
           "tech_stack" : ["Electron", "Ollama", "Mistral 7B", "CodeLlama", "ElevenLabs", "Python", "Flask", "Node.js", "PowerShell"],
           "link": None,
        },
        {
           "name": "Predictiveops",
           "description":"An auto-healing cloud infrastructure platform on Azure. Combines Functions, Cosmos DB, and PowerShell runbooks with a live streaming dashboard, built to catch and fix problems before they become outages.",
           "tech_stack" : ["Azure Functions", "Cosmos DB", "PowerShell", "CI/CD", "SSE"],
           "link": None,
        },
        {
           "name": "Why Hire me",
           "description":"A serverless project that pitches itself. Built on Lambda, API Gateway, DynamoDB, S3, and Terraform, this site is literally proof of the skills it's describing.",
           "tech_stack" : ["Python", "AWS Lambda", "API Gateway", "DynamoDB", "Terraform", "GitHub Actions", "S3", "CloudFront"],
           "link": None,
        },
    ]
    return {
    "statusCode": 200,
    "body": json.dumps(projects)
    }
      
