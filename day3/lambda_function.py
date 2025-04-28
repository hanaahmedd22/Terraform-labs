import boto3
import os
import datetime

ses_client = boto3.client('ses')

def lambda_handler(event, context):
    current_time = datetime.datetime.utcnow().isoformat()
    source_email = os.environ['SOURCE_EMAIL']
    destination_email = os.environ['DESTINATION_EMAIL']
    enviroment = os.environ.get('ENVIRONMENT', 'default')

    response = ses_client.send_email(
        Source=source_email,
        Destination={
            'ToAddresses': [
                destination_email,
            ],
        },
        Message={
            'Subject': {
                'Data': f'Hello from {enviroment} environment',
                'Charset': 'UTF-8'
            },
            'Body': {
                'Text': {
                    'Data': f'This is a test email sent at {current_time} from the {enviroment} environment.',
                    'Charset': 'UTF-8'
                }
            }
        }
    )
    print(f"Email sent! Message ID: {response['MessageId']}")
    return {
        'statusCode': 200,
        'body': f"Email sent to {destination_email} from {source_email} at {current_time} in the {enviroment} environment."
    }