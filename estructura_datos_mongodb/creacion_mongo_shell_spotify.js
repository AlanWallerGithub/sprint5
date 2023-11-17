conn = new Mongo();
db = conn.getDB("spotify");

db.createCollection("artists");

let artists = [{
    "_id": new ObjectId("6550f0b755590f4f54c7eb25"),
    "nombre": "Casablanca",
    "imagen_artista": "./img/artists/casablanca.jpg",
    "albums": [
      {
        "titulo": "Dardo de disco",
        "fecha_lanzamiento": "2003-11-13",
        "imagen_portada": "./img/albums/casablanca/dardo_de_disco.jpg",
        "canciones": [
          {
            "titulo": "Pesadilla",
            "duracion": "03:45",
            "reproducciones": 56
          },
          {
            "titulo": "Pantalla",
            "duracion": "04:45",
            "reproducciones": 57
          },
          {
            "titulo": "Plataforma",
            "duracion": "02:45",
            "reproducciones": 34
          }
        ]
      },
      {
        "titulo": "Test disco",
        "fecha_lanzamiento": "2005-12-13",
        "imagen_portada": "./img/albums/casablanca/test_disco.jpg",
        "canciones": [
          {
            "titulo": "Sabroso",
            "duracion": "03:45",
            "reproducciones": 134
          },
          {
            "titulo": "Cancion Casablanca",
            "duracion": "04:45",
            "reproducciones": 555
          },
          {
            "titulo": "Gran agua",
            "duracion": "02:45",
            "reproducciones": 345
          }
        ]
      },
      {
        "titulo": "Puente",
        "fecha_lanzamiento": "2007-12-13",
        "imagen_portada": "./img/albums/casablanca/puente.jpg",
        "canciones": [
          {
            "titulo": "Al hablar",
            "duracion": "03:45",
            "reproducciones": 567
          },
          {
            "titulo": "Pontiagudo",
            "duracion": "04:45",
            "reproducciones": 57
          },
          {
            "titulo": "Presto",
            "duracion": "02:45",
            "reproducciones": 355
          }
        ]
      }
    ],
    "artistas_relacionados": [
      {
        "id_artista": "6550f0b755590f4f54c7eb26"
      }
    ]
  },
  {
    "_id": new ObjectId("6550f0b755590f4f54c7eb26"),
    "nombre": "Bambolero",
    "imagen_artista": "./img/bambolero.jpg",
    "albums": [
      {
        "titulo": "Disco Señor",
        "fecha_lanzamiento": "2003-11-13",
        "imagen_portada": "./img/albums/bambolero/disco_señor.jpg",
        "canciones": [
          {
            "titulo": "Dos más dos",
            "duracion": "03:45",
            "reproducciones": 56
          }
        ]
      },
      {
        "titulo": "Gran Disco",
        "fecha_lanzamiento": "2005-12-13",
        "imagen_portada": "./img/albums/bambolero/gran_disco.jpg",
        "canciones": [
          {
            "titulo": "Duende",
            "duracion": "03:45",
            "reproducciones": 564
          }
        ]
      },
      {
        "titulo": "Disco 3",
        "fecha_lanzamiento": "2007-12-13",
        "imagen_portada": "./img/albums/bambolero/disco_3.jpg",
        "canciones": [
          {
            "titulo": "Oro",
            "duracion": "03:45",
            "reproducciones": 3421
          }
        ]
      }
    ],
    "artistas_relacionados": [
      {
        "id_artista": "6550f0b755590f4f54c7eb25"
      }
    ]
  }]
db.artists.insertMany(artists);


db.createCollection("cuentas_bancarias");

let cuentas_bancarias = [{
    "_id": new ObjectId("6551016855590f4f54c7eb58"),
    "id_usuario": "654ff0b720f68656b13968df",
    "numero_tarjeta": "756 4567 657 876",
    "fecha_caducidad_tarjeta": "2025-09-09",
    "codigo_seguridad": "786"
  }]
db.cuentas_bancarias.insertMany(cuentas_bancarias);



db.createCollection("cuentas_paypal");

let cuentas_paypal = [{
    "_id": new ObjectId("6551012c55590f4f54c7eb56"),
    "id_usuario": "654ff0b720f68656b13968df",
    "paypal_username": "torro23"
  }]
db.cuentas_paypal.insertMany(cuentas_paypal);



db.createCollection("playlists");

let playlists = [{
    "_id": new ObjectId("6550f81655590f4f54c7eb33"),
    "titulo": "Canciones para dormir bien",
    "numero_canciones": 2,
    "fecha_creacion": "2013-04-12",
    "id_usuario_propietario": "654ff0b720f68656b13968df",
    "canciones_propietario": [
      {
        "titulo_cancion": "Pontiagudo",
        "id_artista": "6550f0b755590f4f54c7eb25"
      }
    ],
    "canciones_compartidas": [
      {
        "id_usuario_comparte": "6550ee9855590f4f54c7eb22",
        "titulo_cancion": "Al hablar",
        "id_artista": "6550f0b755590f4f54c7eb25"
      }
    ],
    "status_playlist": {
      "eliminada": false,
      "fecha_eliminacion": null
    }
  },
  {
    "_id": new ObjectId("6550f81655590f4f54c7eb34"),
    "titulo": "Mis canciones preferidas",
    "numero_canciones": 1,
    "fecha_creacion": "2012-04-12",
    "id_usuario_propietario": "6550ee9855590f4f54c7eb22",
    "canciones_propietario": [
      {
        "titulo_cancion": "Dos más dos",
        "id_artista": "6550f0b755590f4f54c7eb26"
      }
    ],
    "status_playlist": {
      "eliminada": true,
      "fecha_eliminacion": "2015-03-04"
    }
  }]
db.playlists.insertMany(playlists);




db.createCollection("subscripciones_premium");

let subscripciones_premium = [{
    "_id": new ObjectId("6550fe5655590f4f54c7eb50"),
    "id_usuario": "654ff0b720f68656b13968df",
    "fecha_inicio_subscripcion": "2022-04-04",
    "fecha_siguiente_renovacion": "2024-04-04",
    "id_cuenta_para_pagos": "6551016855590f4f54c7eb58",
    "pagos_hasta_ahora": [
      {
        "numero_orden": "15547567",
        "fecha_pago": "2022-04-04",
        "precio_total": 45
      },
      {
        "numero_orden": "546758",
        "fecha_pago": "2023-04-04",
        "precio_total": 45
      }
    ]
  }]
db.subscripciones_premium.insertMany(subscripciones_premium);




db.createCollection("users");

let users = [{
  "_id": new ObjectId("654ff0b720f68656b13968df"),
  "email": "alberto.sanchez@gmail.com",
  "password": "123456",
  "username": "alberto_sanchez92",
  "fecha_nacimiento": "1999-11-21",
  "genero": "Masculino",
  "pais": "España",
  "codigo_postal": "08005",
  "artistas_seguidos": [
    {
      "id_artista": "6550f0b755590f4f54c7eb25"
    },
    {
      "id_artista": "6550f0b755590f4f54c7eb26"
    }
  ],
  "discos_preferidos": [
    {
      "nombre_disco": "Dardo de disco",
      "id_artista": "6550f0b755590f4f54c7eb25"
    }
  ],
  "canciones_preferidas": [
    {
      "nombre_cancion": "Pantalla",
      "id_artista": "6550f0b755590f4f54c7eb25"
    }
  ]
},
{
  "_id": new ObjectId("6550ee9855590f4f54c7eb22"),
  "email": "maria.rodriguez@gmail.com",
  "password": "123456",
  "username": "maria123",
  "fecha_nacimiento": "1996-11-21",
  "genero": "Femenino",
  "pais": "España",
  "codigo_postal": "08006",
  "tipo_usuario": "Free",
  "artistas_seguidos": [
    {
      "id_artista": "6550f0b755590f4f54c7eb26"
    }
  ],
  "discos_preferidos": null,
  "canciones_preferidas": null
}]
db.users.insertMany(users);