import json

def contact_handler(event, context):
    body = json.loads(event["body"])
    name = body.get("name")
    email = body.get ("email")
    message= body.get ("message")   
          
    if not name or not email or not message:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "Missing required fields"})
        }   
      
    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Thanks for reaching out!"})
    } 


