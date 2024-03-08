# c16-30-n-node-react
<p align="center">
  <img src="https://github.com/Loreaylen/HuertaFacil_Back/assets/96092293/23f2beca-c5af-4784-9740-4ab32aed0d9d" />
</p>

![Static Badge](https://img.shields.io/badge/React-blue?style=for-the-badge&logo=react&logoColor=white)
![Static Badge](https://img.shields.io/badge/Express-green?style=for-the-badge&logo=express&logoColor=white)
![Static Badge](https://img.shields.io/badge/Javascript-yellow?style=for-the-badge&logo=javascript&logoColor=white)
![Static Badge](https://img.shields.io/badge/Github-darkgrey?style=for-the-badge&logo=github&logoColor=white)
![Static Badge](https://img.shields.io/badge/Jira-darkblue?style=for-the-badge&logo=jira&logoColor=white)
![Static Badge](https://img.shields.io/badge/PostgreSQL-lightblue?style=for-the-badge&logo=postgresql&logoColor=black)
![Static Badge](https://img.shields.io/badge/Hosting-red?style=for-the-badge&logo=fl0&logoColor=black&label=fl0)
![Static Badge](https://img.shields.io/badge/Trello-lightseagreen?style=for-the-badge&logo=trello&logoColor=black)


## Descripcion del proyecto
Proyecto colaborativo para No Country - Sistema de Gestión y Asesoramiento Hortícola Doméstico <br><br>
Es una aplicación web destinada a ayudar y animar a cualquier persona a poblar su domicilio de la hermosa compañia de naturaleza viva, en donde el usuario va a poder encontrar guias, recomendaciones, detalles y mas de cada una de las plantas que desee poblar su entorno.

## Indice
1. [Funcionalidades](#funcionalidades)
2. [Tecnologías](#tecnologías)
3. [Herramientas](#herramientas)
4. [Metodología](#metodología)
5. [Instalación](#instalación)
6. [Equipo](#equipo)


## Funcionalidades
> + Creacion, Logueo, Modificacion y Borrado de usuarios con un sistema de encriptamiento de informacion sensitiva <br>
> + Sesionado mediante validaciones JWT <br>
> + Guardado de plantas favoritas y una seleccion por defecto de las plantas que un usuario puede plantar con mas exito segun su lugar de vivienda <br>
> + Sistema de filtros multiples por provincia, clima y tipo de planta <br>
> + Sistema de paginación dinamico <br>
> + Buscador de plantas dinamico <br>

## Tecnologías

El proyecto esta desarrollado en ```React``` donde tiene implementado un diseño responsive con breakpoints determinados para mobile, tablet y pc, sin depender de ninguna libreria, apegandose a las prácticas de ```CSS``` puro. <br><br>
En tanto su funcionalidad, el servicio web consume una ```API RESTful ``` confeccionada en ```node.js``` junto con ```express.js```, que asimismo conecta una base de datos generada en ```PostgreSQL```, utilizando la dependencia ```postgres``` como conector.

## Herramientas
Se emplea el versionamiento de proyecto mediante ```GitHub``` con credenciales de administración, restricción de ramas y pull requests con revisión mandatoria. <br><br>
Asimismo, la metodología de trabajo de equipo se basa en los conceptos de metodologías ágiles, utilizando ```Jira``` y ```Trello``` como plataformas de generación de tickets, asignación de tareas y seguimiento diario de proyectos, teniendo reuniones y comunicación constante mediante la plataforma ```Discord```<br><br>
Con respecto al diseño visual de la aplicación web, se optó por utilizar la plataforma ```Figma```.

> * Link a repo Jira <br>
> * Link a tablero de Trello <br>
> * Link a Figma <br>
> * Ling a repo GitHub <br>

## Metodología
El formato de organización se encuadra dentro de las metodologías ágiles, precisamente ```SCRUM``` en donde cada uno de los integrantes del equipo asume roles y responsabilidades diferenciadas, en donde se establece contacto continuo y liderazgo por turnos, en donde cada parte aporta soluciones y problemáticas a tratar. En cada ```Sprint``` se realizan nuevos puntos en comun y objetivos para la semana, tomando como limite temporal la duracion de 4 días de desarrollo del proyecto.

## Instalación
> ### Clonado de repositorio
> Antes de iniciar la instalación, se debe realizar un clonado del repositorio <br>
> ```
> gh repo clone Loreaylen/HuertaFacil_Back <br>
> ```
> ### Instalación de dependencias
> Luego se debe realizar la instalación de dependencias
> ```
> git i
> git i nodemon
> ```
> ### Variables de entorno
> Se debe realizar un seteo de variables de entorno que representan los datos necesarios para poder realizar la conexion con la base de datos <br><br>
> Para ello se debe crear un archivo ```.env``` y definir las siguientes variables
> ```
> DB_USER= ''       =>    Se indica el usuario de la BDD
> DB_PASSWORD = ''  =>    Se indica la password de la BDD
> DB_HOST = ''      =>    Se indica el host de la BDD
> DB_PORT =         =>    Se indica el puerto donde se conectará la BDD (Por default -> PostgreSQL = 5432 y MySql o SQLServer = 8080)
> DB_NAME = ''      =>    Nombre de identificación la BDD
> DB_URL = ''       =>    Dirección completa otorgada por el hosting
> SECRET =          =>    Clave secreta de <em>salt</em> para hasheado de datos sensibles (Mediante Bcrypt)
> HOST_URL = ''     =>    Url de conexion con la BDD
> ```
>### Inicializar servidor de manera local
> Para realizarlo, con el puerto seteado por default <em>3030</em>
> ```
> npm start
> ```

## Equipo
* Daniel Vallejos - Desarollador Backend
* Laura Tamborini - Tester QA
* Milton Oscar Flores - Desarrollador Frontend
* Eduardo Sebastian Tejeda - Diseñador
* Sandra Scordamaglia - Tester QA
* Lorena Aylen Gil - Desarrolladora Fullstack




