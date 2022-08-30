# https://cloud.google.com/sdk/gcloud/reference/run/deploy
gcloud config set project landing-zone-demo-341118
export GOOGLE_CLOUD_PROJECT=landing-zone-demo-341118

# Continer Registry
# gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/euro-to-usd
# gcloud run deploy euro-to-usd --image gcr.io/$GOOGLE_CLOUD_PROJECT/euro-to-usd --platform managed --allow-unauthenticated --region=europe-west4 --set-env-vars=region=europe-west4

# Artifact Registry
gcloud builds submit --tag europe-west4-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/cloud-run-source-deploy/hello-world-1:latest

gcloud run deploy hello-world-1 \
--image europe-west4-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/cloud-run-source-deploy/hello-world-1:latest \
--platform managed \
--allow-unauthenticated \
--region=europe-west4 \
--ingress=all \
--min-instances=0 \
--concurrency=20 \
--service-account=landing-zone-demo-341118@appspot.gserviceaccount.com
# --set-env-vars=region=europe-west4