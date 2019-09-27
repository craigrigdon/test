import os
import pytest
import sys
import json
from matterhook import Webhook

md_report_path = "/tmp/md-report.md"
xml_report_path = "/tmp/xml-report.xml"
json_report_path = "/tmp/json-report.json"
find_str = "[pytest-md]: https://github.com/hackebrot/pytest-md"
bcdc_url = str(os.getenv('BCDC_URL'))
mat_api_key = str(os.getenv('MATT_API_KEY'))
mat_url = 'https://chat-m.pathfinder.gov.bc.ca'
mat_channel = 'build-and-deploy'
mat_username = 'ckantest'


# ----------Start Process -----------
#TODO: try catch here
print("Run pytest")
# run pytest cmd
pytest.main(['-v', '--tb=line', '--pyargs', 'bcdc_apitests', '--md', md_report_path,
             ('--junitxml={0}'.format(xml_report_path)), ('--json={0}'.format(json_report_path))])


# ------------ Check Outputs --------------------

print("Check xml output")
print(open(xml_report_path).read())
print("Check json output")
with open(json_report_path, 'r') as f:
    json_report = json.load(f)
print(json.dumps(json_report, indent=4, sort_keys=True))


# ---------- Update Markdown File ----------------

print("update markdown output")
# cleanup markdown output
with open(md_report_path, "r") as f:
    modified_output = []
    lines = f.readlines()
    lines[0] = "Pass/Fail.\n"
    for line in lines:
        modified_output.append(line.replace(find_str, bcdc_url))

print("write to markdown file")
# re-write file.
with open(md_report_path, "w") as f:
    for line in modified_output:
        f.writelines(line)

print("Get markdown file to send to mattermost")
# read file and store
inFile = open(md_report_path, 'r')
contents = inFile.read()
print(contents)

# ------------Send Output to Mattermost-------------

# get message to send
mat_message = contents

# mandatory parameters are url and your webhook API key
mwh = Webhook(mat_url, mat_api_key)

# personalized bot name
mwh.username = mat_username

#TODO: try catch here
print("Sending output")
# send a message to the specified channel
# mwh.send(mat_message, channel=mat_channel)

print("DONE")

sys.exit(0)


