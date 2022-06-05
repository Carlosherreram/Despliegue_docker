# Despliegue_docker

Carlos Herrera

Diego Morro

Huberto Martín

## Para el despliegue del proyecto que realizamos se nos ha pedido que creemos una imágen de docker que contenga un tomcat con nuestro archico .war desplegado y un servidor sql que conteng nuestra base de datos.

Con tal de poder crear esta imágen hemos creado un archivo Dockerfile que contiene las instrucciones para crear una imágen tomcat y poner dentro de las carpeta Webapps el archivo .war que contiene nuestro proyecto de manera que tomcat lo reconozca y realice el despliegue automáticamente.
La primera línea de este archivo será el "FROM" una etiqueta que especifica la imágen que usaremos de plantilla, en este caso, tomcat en su versión "latest" o sea, la última.
Con la etiqueta "ADD" especificamos dos rutas, primero una que es la carpeta en que se encuentra aquello que queremos meter en la imágen y después la ruta en que queremos que se copie dentro de la imágen.
en nuestro caso hemos puesto un punto que representa la carpeta actual ya que nuestro archivo .war está ahí mismo y despues la ruta /usr/local/tomcat/webapps que dónde queremos ubicar nuestro archivo dentro d ela imágen de tomcat.

![Captura de pantalla -2022-06-05 11-02-03](https://user-images.githubusercontent.com/91744455/172057474-a7605f84-4c75-4247-ba1d-9acad4dd2ffe.png)


Lo siguiente que hemos hecho es valernos de este Dockerfile para montar la imágen, para ello desde el terminal nos ubicamos en la carpeta que contiene el Dockerfile y desde la que la ruta hasta nuestro archivo .war es la especificada en el documento Dockerfile.
Una vez en esta carpeta debemos ejecutar el comando ``sudo docker build -t [Nombre de la imagen] . `` el parámetro -t nos servirá para asignarle un nombre a nuestra imágen y poder trabajar con ella más cómodamente mientras qie el punto al final hacer referencia a la carpeta actual.

![Captura de pantalla -2022-06-05 11-06-54](https://user-images.githubusercontent.com/91744455/172057834-a286b56d-2990-46cd-8e0e-40a9f7811523.png)

Si usamos el comando ``docker ps`` podremos ver que aunque se ha creado nuestra imágen no hay ningún contenedor en marcha con ella así que deberemos utilizar el comando ``docker run -dp 8080:8080 tomcat-casino`` para ponerlo en marcha y que la ip 8080 coincida con la de la máquina host y podamos acceder desde nuestro navegador.

![Captura de pantalla -2022-06-05 11-24-26](https://user-images.githubusercontent.com/91744455/172057990-5754da85-4082-4d1e-a39b-6c20ae587630.png)


Teóricamente ahora desde el puerto 808o de nuestro localhost deberiamos poder visualizar el index.html de nuestra aplicación sin embargo aparece el siguiente mensaje:

![Captura de pantalla -2022-06-05 17-07-30](https://user-images.githubusercontent.com/91744455/172058035-908754a4-2273-4046-aa8f-b0f1efb1a814.png)

## Docker compose

No habiendo conseguido hacer funcionar tomcat utilizando Dockerfile tras muchos intentos decidimos pasar directamente a tratar de desplegar el proyecto con docker compose que nos montaría también la imágen con mysql.

Para ello se debe de crear un archivo llamado docker-compose.yml que contendra los valores de variables de configuración que deseamos para los servidores que se intalarán en nuestras imágenes asi de relacionarlas entre ellas en la misma red.
![Captura de pantalla -2022-06-05 16-37-14](https://user-images.githubusercontent.com/91744455/172058224-b436eb26-9de0-4b97-a964-d1facf44763d.png)

Dentro de este archivo igualmente deberemos de especificar la ruta en la que queremos que se ubique nuestro .war y tambien definiremos las variables de nuestros servidores como pueden ser los usuarios o las contraseñas del usuarios root.

Una vez tenemos el archivo creado y ubicado en la carpeta correcta debemos ejecutar el comando ``docker-compose up -d`` para que contruya nuestra imágen.

![Captura de pantalla -2022-06-05 17-06-29](https://user-images.githubusercontent.com/91744455/172058352-df537082-1437-4cb1-bff7-2530ed36b438.png)


Tras muchos intentos y modificando todo lo posible el documento en busca del fallo no he podido evitar que me apareciera el siguiente error al montar la imágen.





