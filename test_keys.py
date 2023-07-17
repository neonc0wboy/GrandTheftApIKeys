#!/usr/bim/env python
with open("keys", "r") as file:
        keys = file.readlines()
for key in keys:
        key = key.strip()
        command = f' -H "Authorization: Bearer {key}" "https://api.openai.com/v1/chat/completions"'
        curl = 'curl -o /dev/null -s -w "%{http_code}"'+command
        # Process the curl command here                            
        print(curl)
        print(" ")
        print("echo ''")
