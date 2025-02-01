# VideoGamesTK

Technical Test for iOS Developer role on IA interactive

## Arquitectura
Se definio usar la arquitectura MVVM junto con CLEAN, debido a que MVVM es la arquitectura que mejor se adapta a SwiftUI, se aplica la arquitectura CLEAN para agregar robustes al proyecto, siendo una arquitectura que permitara que el proyecto cresca sin mayores complicaciones.


### Estructura
![enter image description here](https://i.ibb.co/qMsyGVTQ/Screenshot-2025-01-31-at-7-09-12-p-m.png)

## Diseño de la aplicacion
Como se pidio en los requerimientos, a grandes rasgos consta de 3 pantallas, siendo la primera la pantalla de carga `LoadGameView` esta vista cuenta con una vista que informa al usuario cuantos juegos han sido descargados, tambien permite al usuario actualizar los registros del servicio para cargarlos de nuevo a la base de datos, se agrego un boton con la misma funcion en la parte superior derecha.
La segunda pantalla es un listado de todos los juegos `GamesListView` , la información que se muestra es: el thumbnail, el titulo, el genero, rate y si es marcado como favorito por el usuario, la vista cuenta tambien con un searchBar que le permite buscar por genero y titulo, conforme el usuario va escribiendo se muestran posibles sugerencias, tanto para genero como para titulo, cuando el usuario selecciona algun juego, se abrira una vista de detalle con la informacion del juego `GameDetailView`, en esta vista el usuario podra ver los mismos datos y aparte una descripcion corta del juego, asi como el rate, que podra cambiar al gusto, agregar algun comentario del juego, o tambien seleccionarlo como favorito 
