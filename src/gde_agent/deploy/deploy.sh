# Implementación del MCP Server y Agente en Google Cloud Run

# En la carpeta de mcp-toolbox, ejecuta el siguiente código
export PROJECT_ID="YOUR_GOOGLE_CLOUD_PROJECT_ID" 

gcloud services enable run.googleapis.com \
                       cloudbuild.googleapis.com \
                       artifactregistry.googleapis.com \
                       iam.googleapis.com \
                       secretmanager.googleapis.com

## Crear una cuenta de servicio del Toolbox Server que tenga los roles para acceder a Secret Manager y comunicarse con Cloud SQL.

gcloud iam service-accounts create toolbox-identity

gcloud projects add-iam-policy-binding $PROJECT_ID \
   --member serviceAccount:toolbox-identity@$PROJECT_ID.iam.gserviceaccount.com \
   --role roles/secretmanager.secretAccessor

gcloud projects add-iam-policy-binding $PROJECT_ID \
   --member serviceAccount:toolbox-identity@$PROJECT_ID.iam.gserviceaccount.com \
   --role roles/cloudsql.client

## Subimos el archivo tools.yaml a Secret Manager como un secreto

gcloud secrets create tools --data-file=tools.yaml
export IMAGE=us-central1-docker.pkg.dev/database-toolbox/toolbox/toolbox:latest

## Despliega el Cloud Run Service del MCP Toolbox Server
gcloud run deploy toolbox \
--image $IMAGE \
--service-account toolbox-identity \
--region us-central1 \
--set-secrets "/app/tools.yaml=tools:latest" \
--args="--tools_file=/app/tools.yaml","--address=0.0.0.0","--port=8080" \
--allow-unauthenticated

## Ahora puedes visitar la dirección Service URL: https://toolbox-<SOME_ID>.us-central1.run.app

## Modificar el archivo del agente para consultar la nueva dirección del Toolbox Server


# En el archivo agent.py:

## toolbox = ToolboxTool("CLOUD_RUN_SERVICE_URL")

## Crea un archivo requirements.txt con las dependencias necesarias
google-adk
toolbox-core

## Modifica las variables de entorno con el archivo .deploy.env

## Implementa el agente con el comando adk deploy, este proceso podrá tomar varios minutos:
adk deploy cloud_run \
--project=$GOOGLE_CLOUD_PROJECT \
--region=$GOOGLE_CLOUD_LOCATION \
--service_name=$SERVICE_NAME  \
--app_name=$APP_NAME \
--with_ui \
$AGENT_PATH


