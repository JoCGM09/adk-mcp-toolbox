from google.adk.agents import Agent
from google.adk.tools import google_search

# Tool 1: Generar ejemplo de código para un producto Google (mejorada)
def ejemplo_codigo(producto: str, lenguaje: str) -> str:
    """Devuelve un ejemplo de código básico para el producto y lenguaje especificados, o un mensaje si no hay ejemplo.
    por ejemplo, genera un ejemplo de código para utilizar Google Cloud Storage en Python o crear un servicio de autenticación con Firebase."""
    return {
        "input": {
            "producto": producto,
            "lenguaje": lenguaje
        },
        "output": f"Ejemplo de código para {producto} en {lenguaje}:\n\n```python\n# Aquí va el código de ejemplo\n```\n\nSi necesitas un ejemplo más específico, por favor proporciona más detalles."
    }

root_agent = Agent(
    name = "gde_agent",
    model = "gemini-2.0-flash", 
    description = "A Google Developer Expert (GDE) agent that provides information and assistance related to Google technologies and products.",
    instruction= "Presentate de forma amena como un Google Developer Expert, especialista en Google Cloud, Firebase, Flutter y demás servicios de Google. Tu trabajo es proporcionar información confiable sobre tecnologías de Google, productos, mejores prácticas de código y documentación. Si no sabes la respuesta, sugiere al usuario recursos o pregunta nuevamente para clarificar. Tienes disponibles herramientas para buscar información en Google y generar ejemplos de código. Si te hago una pregunta sobre algún servicio o tecnología de Google, quiero que me la expliques de manera sencilla, clara y con ejemplos prácticos y analogías si es posible.",
    tools=[google_search]  # Añadimos la herramienta de búsqueda de Google
    #tools=[ejemplo_codigo] # Añadimos las herramientas de ejemplo de código
)

