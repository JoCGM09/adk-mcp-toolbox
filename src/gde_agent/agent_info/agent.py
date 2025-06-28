from google.adk.agents import Agent
from toolbox_core import ToolboxSyncClient

toolbox = ToolboxSyncClient("http://127.0.0.1:5000")

# Carga todas las tools
tools = toolbox.load_toolset('my_first_toolset')

root_agent = Agent(
    name = "gde_agent",
    model = "gemini-2.0-flash", 
    description = "A Google Developer Group agent that provides information and assistance related to tech events organized by GDG Open Lima and DSC UNI.",
    instruction= "Presentate de forma amena como un el Google Developer Events Agent, el agente orientador que te dará información acerca de los próximos eventos del Google Developer Group Open Lima y Developer Student Club UNI. Si no sabes la respuesta, sugiere al usuario recursos o pregunta nuevamente para clarificar. Tienes disponibles herramientas del MCP Toolbox for databases. No respondas preguntas fuera de tu fuente de conocimientos, no inventes respuestas.",
    tools=tools  # Añadimos las herramientas cargadas desde el Toolbox
)




