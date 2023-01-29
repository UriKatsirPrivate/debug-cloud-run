# https://cloud.google.com/sdk/gcloud/reference/run/deploy
gcloud config set project landing-zone-demo-341118
export GOOGLE_CLOUD_PROJECT=landing-zone-demo-341118
export SERVICE_NAME=debug-cloud-run
export ARTIFACT_REGISTRY_NAME=cloud-run-source-deploy
export REGION=europe-west4
export SERVICE_ACCOUNT_EMAIL=landing-zone-demo-341118@appspot.gserviceaccount.com

# Continer Registry
# gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/euro-to-usd
# gcloud run deploy euro-to-usd --image gcr.io/$GOOGLE_CLOUD_PROJECT/euro-to-usd --platform managed --allow-unauthenticated --region=europe-west4 --set-env-vars=region=europe-west4

# Artifact Registry
gcloud builds submit --tag $REGION-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/$ARTIFACT_REGISTRY_NAME/$SERVICE_NAME:latest

gcloud run deploy $SERVICE_NAME \
--image $REGION-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/$ARTIFACT_REGISTRY_NAME/$SERVICE_NAME:latest \
--platform managed \
--allow-unauthenticated \
--region=$REGION \
--ingress=all \
--min-instances=0 \
--concurrency=20 \
--service-account=$SERVICE_ACCOUNT_EMAIL \
--set-secrets=ROOKOUT_TOKEN=ROOKOUT_TOKEN:1 \
--update-env-vars ROOKOUT_LABELS="env:prod" \
--execution-environment=gen2    \
--revision-suffix=v1.1    \
# --set-env-vars=region=$REGION