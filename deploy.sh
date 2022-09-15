# https://cloud.google.com/sdk/gcloud/reference/run/deploy
gcloud config set project landing-zone-demo-341118
export GOOGLE_CLOUD_PROJECT=landing-zone-demo-341118
export ROOKOUT_TOKEN=1a43c7f087d9c43341653af043d498bc800f22a5bc6a70b1e0c0fe232b8b3b3e

# Continer Registry
# gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/euro-to-usd
# gcloud run deploy euro-to-usd --image gcr.io/$GOOGLE_CLOUD_PROJECT/euro-to-usd --platform managed --allow-unauthenticated --region=europe-west4 --set-env-vars=region=europe-west4

# Artifact Registry
gcloud builds submit --tag europe-west4-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/cloud-run-source-deploy/debug-cloud-run:latest

gcloud run deploy debug-cloud-run \
--image europe-west4-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/cloud-run-source-deploy/debug-cloud-run:latest \
--platform managed \
--allow-unauthenticated \
--region=europe-west4 \
--ingress=all \
--min-instances=0 \
--concurrency=20 \
--service-account=landing-zone-demo-341118@appspot.gserviceaccount.com \
--update-env-vars ROOKOUT_TOKEN=${ROOKOUT_TOKEN},ROOKOUT_LABELS="env:prod"
# --set-env-vars=region=europe-west4