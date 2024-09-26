from dotenv import load_dotenv
import requests
import os
import time
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator
from ibm_code_engine_sdk.code_engine_v2 import CodeEngineV2

load_dotenv()

# print(os.environ.get("BX_API_KEY"))

# Initialize the IAM authenticator using an API key
authenticator = IAMAuthenticator(os.environ.get(
    'BX_API_KEY'), url='https://iam.cloud.ibm.com')

service = CodeEngineV2(authenticator=authenticator)
service.set_service_url('https://api.'+os.environ.get('REGION')+'.codeengine.cloud.ibm.com/v2')