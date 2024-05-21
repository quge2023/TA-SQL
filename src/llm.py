from msal import PublicClientApplication, SerializableTokenCache
import json
import os
import atexit
import requests
import time
from tqdm import tqdm
import openai

openai.api_type = "azure"
openai.api_base = "https://gcrendpoint.azurewebsites.net"
openai.api_version = "2023-07-01-preview"
openai.api_key = 'oaip_ZfuRxGUbPLPsalCOEnjTMSbquAvwCQvC'


class LLMClient:
    # _ENDPOINT = 'https://httpqas26-frontend-qasazap-prod-dsm02p.qas.binginternal.com/completions'
    _ENDPOINT = 'https://httpqas26-frontend-qas-sdf-mw1p.qas.binginternal.com/completions'
    _SCOPES = ['api://68df66a4-cad9-4bfd-872b-c6ddde00d6b2/access']
    def __init__(self):
        self._cache = SerializableTokenCache()
        atexit.register(lambda:
                        open('../.llmapi.bin', 'w').write(self._cache.serialize())
                        if self._cache.has_state_changed else None)

        self._app = PublicClientApplication('68df66a4-cad9-4bfd-872b-c6ddde00d6b2',
                                            authority='https://login.microsoftonline.com/72f988bf-86f1-41af-91ab-2d7cd011db47',
                                            token_cache=self._cache)
        if os.path.exists('../.llmapi.bin'):
            self._cache.deserialize(open('../.llmapi.bin', 'r').read())

    def send_request(self, model_name, request):
        # get the token
        attempts = 0
        success = False
        token = self._get_token()
        #print(token)

        # populate the headers
        headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token,
            'X-ModelType': model_name}

        body = str.encode(json.dumps(request))
        while attempts < 5 and not success:
            try:
                response = requests.post(LLMClient._ENDPOINT, data=body, headers=headers)
                success = True
            except Exception as e:
                attempts += 1
                response = 'error:{}'.format(e)
                print(f'Error connect to gpt: {e}')
                time.sleep(5)

        return response

    def send_stream_request(self, model_name, request):
        # get the token
        token = self._get_token()

        # populate the headers
        headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token,
            'X-ModelType': model_name}

        body = str.encode(json.dumps(request))
        response = requests.post(LLMClient._ENDPOINT, data=body, headers=headers, stream=True)
        for line in response.iter_lines():
            text = line.decode('utf-8')
            if text.startswith('data: '):
                text = text[6:]
                if text == '[DONE]':
                    break
                else:
                    yield json.loads(text)

    def _get_token(self):
        accounts = self._app.get_accounts()
        result = None

        if accounts:
            # Assuming the end user chose this one
            chosen = accounts[0]

            # Now let's try to find a token in cache for this account
            result = self._app.acquire_token_silent(LLMClient._SCOPES, account=chosen)

        if not result:
            # So no suitable token exists in cache. Let's get a new one from AAD.
            flow = self._app.initiate_device_flow(scopes=LLMClient._SCOPES)

            if "user_code" not in flow:
                raise ValueError(
                    "Fail to create device flow. Err: %s" % json.dumps(flow, indent=4))

            print(flow["message"])

            result = self._app.acquire_token_by_device_flow(flow)

        return result["access_token"]


def connect_gpt4(message, prompt):
    response = openai.ChatCompletion.create(
                    engine="gpt-4-32k", 
                    messages = [{"role":"system","content":f"{message}"}, #"You are a helpful assisant. Help the user to complete SQL and no explaination is needed."
                                {"role":"user", "content":f"{prompt}"}],
                    temperature=0,
                    max_tokens=800, #800
                    top_p=1,
                    frequency_penalty=0,
                    presence_penalty=0,
                    stop = None)
    return response['choices'][0]['message']['content']


def collect_response(prompt, max_tokens = 800, stop = None):
    while 1:
            flag = 0
            try:
                response = openai.ChatCompletion.create(
                    engine="gpt-4-32k", 
                    messages = [{"role":"system","content":"You are an AI assistant that helps people find information."}, #"You are a helpful assisant. Help the user to complete SQL and no explaination is needed."
                                {"role":"user", "content":f"{prompt}"}],
                    temperature=0,
                    max_tokens=max_tokens, #800
                    top_p=1,
                    frequency_penalty=0,
                    presence_penalty=0,
                    stop = stop)
                response = response['choices'][0]['message']['content']
                flag = 1
                
            except Exception as e:
                print(e)
                time.sleep(1)
            if flag == 1:
                break
    return response

