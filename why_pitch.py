import json

def lambda_handler(event, context):
    pitch = {
        "name": "Kharee Bellamy",
        "role": "Cloud Engineer",
        "skills": ["AWS", "Terraform", "Python", "CI/CD"],
        "certifications": ["AWS Certified Solutions Architect Associate"],
        "why_hire_me": "I build with heart and creativity. Coding gives me freedom, and that freedom comes through in everything I ship, AWS certified, self-taught, built in public."
    }
    return {
        "statusCode": 200,
        "body": json.dumps(pitch)
    }