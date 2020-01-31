#!/usr/bin/env python
import os
import sys
import requests
from matterhook import Webhook

# env vars
bcdc_url = str(os.getenv('BCDC_URL'))
mat_api_key = str(os.getenv('MATT_API_KEY'))
mat_channel = str(os.getenv('MATT_CHANNEL'))
mat_username = str(os.getenv('MATT_USERNAME'))
mat_url = str(os.getenv('MATT_URL'))
bot_url = str(os.getenv('BOT_URL'))
bot_key = str(os.getenv('BOT_KEY'))
deploy_uid = str(os.getenv('DEPLOY_UID'))


# ---------- Start Process ------------

try:

    # ---------- start pytest ----------
    # run data migration script
    print("Running migration script")

    #TODO: call script here
    #TODO: get output status and send to bot

    # TEST DATA ONLY - for DEMO
    status = "success"
    bcdc_url = "test"
    results = "BCDC Data Migration Test Completed"
    id = deploy_uid

    # ------------Send Output to Hubot ------------------

    print("Sending Output to Hubot")
    botPath = bot_url+'/hubot/postdeploy'
    print(botPath)
    response = requests.post(
        botPath,
        headers={'Content-Type': 'application/json', 'apikey': bot_key},
        json={"status": status, "env": bcdc_url, "results": results, "id": deploy_uid}
    )
    print(response)

    # ------------Send Output to Mattermost-------------

    # get message to send
    mat_message = results
    # mandatory parameters are url and your webhook API key
    mwh = Webhook(mat_url, mat_api_key)
    # personalized bot name
    mwh.username = mat_username

    try:
        # send a message to the specified channel
        mwh.send(mat_message, channel=mat_channel)
        print("Sending output to mattermost")
    except Exception as e:
        print(e)

    print("script completed")
    sys.exit(0)

except Exception as e:
    print(e)
    sys.exit(1)




