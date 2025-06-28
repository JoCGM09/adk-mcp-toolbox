# 1. Crea un proyecto de Google Cloud
# 2. Asegurate que la facturación está habilitada en tu cuenta de Google Cloud
# 3. Usa el Cloud Shell para ejecutar los siguientes comandos

# Configura el proyecto de Google Cloud si no lo está
gcloud config list project

gcloud config set project <YOUR_PROJECT_ID>

# Habilita las APIs necesarias
gcloud services enable cloudresourcemanager.googleapis.com \
                       servicenetworking.googleapis.com \
                       run.googleapis.com \
                       cloudbuild.googleapis.com \
                       cloudfunctions.googleapis.com \
                       aiplatform.googleapis.com \
                       sqladmin.googleapis.com \
                       compute.googleapis.com 

# Crea una instancia de Cloud SQL
gcloud sql instances create eventos-gdg-dsc \
--database-version=POSTGRES_15 \
--cpu=2 \
--memory=8GiB \
--region=us-central1 \
--edition=ENTERPRISE \
--root-password=postgres

### Caso de uso: Crear un agente que consulte una base de datos y responda consultas sobre los eventos de GDG y DSC

# Crea una tabla de eventos en la instancia de Cloud SQL

## Tomar como referencia el archivo db.sql del repositorio de GitHub

# Crea una carpeta para instalar el Toolbox de MCP
mkdir mcp-toolbox
cd mcp-toolbox

# Descarga el Toolbox de MCP
export VERSION=0.6.0
curl -O https://storage.googleapis.com/genai-toolbox/v$VERSION/linux/amd64/toolbox
chmod +x toolbox

# Configura las Tools con un archivo Yaml
# Crea un arcihvo llamado tools.yaml con el siguiente contenido

## Tomar como referencia el archivo tools.yaml del repositorio de GitHub

# Ejecuta el Toolbox Server de MCP con el archivo de configuración
./toolbox --tools-file "tools.yaml"

# Nota: Puedes usar otro puerto con el siguiente comando
./toolbox --tools-file "tools.yaml" --port 7000

# En el web preview del GCP Cloud Shell, abre el puerto 5000 o el que hayas configurado para acceder al MCP Toolbox Server.

# En la URL del navegador, agrega: 
/api/toolset

## Ejemplo: https://5000-cs-265820449450-default.cs-us-east1-yeah.cloudshell.dev/api/toolset

# Instala el ADK en en Cloud Shell
mkdir my-agents
cd my-agents

# Creamos un entorno virtual para el MCP Agent e instalamos las dependencias
python -m venv .venv

source .venv/bin/activate

pip install google-adk toolbox-core

# Creamos nuestro agente:

## my-agents
#### gde_agent
##### __init__.py 
##### agent.py
##### .env


# Prueba el agente de manera local
adk web

## Preguntas de ejemplo:

## Revisar el archivo prompts.txt del repositorio de GitHub
