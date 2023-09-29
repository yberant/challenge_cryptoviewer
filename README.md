# cryptoviewer

Este proyecto es parte de una prueba técnica para optar al puesto de desarrollador movil para la empresa finmarkets. Se trata de una aplicación hecha en flutter para desplegar información de criptomonedas.

## Instalación

* Esta aplicación utiliza la API coinAPI. Para lograr la comunicación efectivamente es necesario incluír una API key. La API key utilizada durante el desarrollo no está presente en el repositorio por razones de seguridad pues el archivo que contenía a esta se incluyó en el archivo .gitignore. Para hacer correcto uso de la aplicación es necesario realizar los siguientes pasos:

1. Conseguir una API key de coinAPI. Es posible conseguir una gratis desde el siguiente enlace: https://docs.coinapi.io/. Simplemente hay que hacer click en la opción "GET A FREE API KEY" en la parte superior de la pantalla.

2. Crear en el directorio raíz de este proyecto un archivo llamado ".env"

3. En el archivo colocar la API key, escribiendo:
 X_CoinAPI_key=<TU_API_KEY>

 Para compilar y ejecutar la aplicación en modo de desarrollo se debe ejecutar desde el directorio raíz los siguientes comandos:

 * Para instalar las dependencias que la app usa: flutter pub get
 * Para compilar y correr la aplicación: flutter run app



 ## Consideraciones

  * Para cada criptomoneda se puede desplegar información de acuerdo a precios históricos de un mes, entre otros detalles. 

 * Para mejorar el desempeño de la aplicación en cuanto a tiempos de carga, esta aplicación solo entrega información de 1000 de las más de 18000 criptomonedas disponibles desde la API.

