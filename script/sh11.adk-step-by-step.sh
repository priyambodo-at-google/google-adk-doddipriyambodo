#/!bin/bash
python3 -m pip install google-adk==0.3.0

export PATH=$PATH:"/home/${USER}/.local/bin"
gcloud storage cp gs://YOUR_GCP_PROJECT_ID-bucket/adk_project.zip ./adk_project.zip
unzip adk_project.zip

#2nd Option, ADK via requirements.txt
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

export GOOGLE_GENAI_USE_VERTEXAI=TRUE
export GOOGLE_CLOUD_PROJECT=work-mylab-machinelearning
export GOOGLE_CLOUD_LOCATION=us-central1
export MODEL=gemini-2.0-flash-001

adk web
python3 app/app_agent/agent.py