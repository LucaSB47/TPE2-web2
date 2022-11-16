El endpoint de la API es: http://localhost/web2/tpe2/api/game

CONSIGNAS OBLIGATORIAS:

2 - http://localhost/web2/tpe2/api/game

3 - 
ASCENDENTE: http://localhost/web2/tpe2/api/game?sort=precio&order=ASC

DESCENDENTE: http://localhost/web2/tpe2/api/game?sort=precio&order=DESC

4 - http://localhost/web2/tpe2/api/game/33

SE PUEDE BORRAR, AGREGAR.

- para agregar http://localhost/web2/tpe2/api/game 
{
    "id": 33,
    "nombre": "jack and dexter 3",
    "descripcion": "Jak 3 es un videojuego de plataformas de acción-aventura desarrollado por Naughty Dog y distribuido por Sony Computer Entertainment. El título, precedido por Jak II, es el tercer juego de la serie Jak and Daxter. Fue lanzado en Norteamérica el 9 de noviem",
    "genero_id": 1,
    "calificacion": 1,
    "precio": 0,
    "imagen": "img/game/6347368f5aa2c.jpg"
}

- para borrar http://localhost/web2/tpe2/api/game/[id]

CONSIGNAS OPCIONALES:

SE PAGINA Y ORDENA POR PRECIO
7 - http://localhost/web2/tpe2/api/game?sort=precio&order=asc&begin=0&end=3

SE FILTRA POR EL CAMPO QUE DESEE
8 - http://localhost/web2/tpe2/api/game?select=[nombre de columna]]&value=[valor que desea]

SE PUEDE ORDENAR POR CUALQUIERA DE LOS CAMPOS 
9 - http://localhost/web2/tpe2/api/game?sort=nombre&order=ASC

