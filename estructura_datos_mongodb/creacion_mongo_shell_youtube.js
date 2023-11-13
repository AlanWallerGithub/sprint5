use youtube;

db.createCollection("canales");

let canales = [{
    "_id": {
      "$oid": "6551068c55590f4f54c7eb66"
    },
    "nombre_canal": "Canal de Barbara",
    "descripcion": "Hola! Es mi canal",
    "fecha_creacion": "2022-09-09",
    "id_propietario": "6551074055590f4f54c7eb68"
  }]
db.canales.insertMany(canales);

db.createCollection("playlists");

let playlists = [{
    "_id": {
      "$oid": "65510b5755590f4f54c7eb7b"
    },
    "id_propietario": "6551074055590f4f54c7eb68",
    "fecha_creacion": "2023-08-08",
    "estado": "Publico",
    "videos": [
      {
        "id_video": "6551091b55590f4f54c7eb75"
      },
      {
        "id_video": "655107c355590f4f54c7eb72"
      }
    ]
  }]
db.playlists.insertMany(playlists);

db.createCollection("usuarios");

let usuarios = [{
    "_id": {
      "$oid": "655105c955590f4f54c7eb64"
    },
    "username": "torrezno42",
    "email": "torr@mail.com",
    "fecha_nacimiento": "1992-08-08",
    "genero": "Masculino",
    "pais": "España",
    "codigo_postal": "08045",
    "subscripciones": {
      "id_canal": "6551068c55590f4f54c7eb66"
    }
  },
  {
    "_id": {
      "$oid": "6551074055590f4f54c7eb68"
    },
    "username": "barbara2",
    "email": "bar@bar.com",
    "fecha_nacimiento": "1993-08-08",
    "genero": "Femenino",
    "pais": "España",
    "codigo_postal": "08065",
    "subscripciones": null
  }]
db.usuarios.insertMany(usuarios);

db.createCollection("videos");

let videos = [{
    "_id": {
      "$oid": "655107c355590f4f54c7eb72"
    },
    "titulo": "Primer video",
    "descripcion": "Mi primer video!",
    "tamaño": "567MB",
    "nombre_archivo": "primer_video.mp4",
    "duracion": "04:03",
    "thumbnail": "./img/thumbnails/thumnbail_1.jpg",
    "reproducciones": 76,
    "numero_likes": 1,
    "numero_dislikes": 1,
    "likes": [
      {
        "usuario_like": "6551074055590f4f54c7eb68",
        "fecha_like": "2022-10-10"
      }
    ],
    "dislikes": [
      {
        "usuario_dislike": "655105c955590f4f54c7eb64",
        "fecha_dislike": "2022-10-11"
      }
    ],
    "comentarios": [
      {
        "usuario_comentario": "655105c955590f4f54c7eb64",
        "texto_comentario": "No me gusta",
        "fecha_comentario": "2022-10-11",
        "likes_comentario": null,
        "dislikes_comentario": [
          {
            "usuario_dislike_comentario": "6551074055590f4f54c7eb68",
            "fecha_dislike_comentario": "2022-10-11"
          }
        ]
      }
    ],
    "estado_video": "Publico",
    "id_propietario": "6551074055590f4f54c7eb68",
    "fecha_lanzamiento": "2022-10-10",
    "etiquetas": [
      "divertido",
      "bailando",
      "merendar"
    ]
  },
  {
    "_id": {
      "$oid": "6551091b55590f4f54c7eb75"
    },
    "titulo": "Segundo video",
    "descripcion": "Mi segundo!",
    "tamaño": "564MB",
    "nombre_archivo": "segundo_video.mp4",
    "duracion": "03:03",
    "thumbnail": "./img/thumbnails/thumnbail_2.jpg",
    "reproducciones": 45,
    "numero_likes": 0,
    "numero_dislikes": 0,
    "comentarios": null,
    "estado_video": "Privado",
    "id_propietario": "6551074055590f4f54c7eb68",
    "fecha_lanzamiento": "2022-10-11",
    "etiquetas": [
      "merendar",
      "bello"
    ]
  }]
db.videos.insertMany(videos);