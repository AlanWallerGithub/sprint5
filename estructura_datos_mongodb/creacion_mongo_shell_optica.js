use opticaTest ; db.opticaTest.createCollection("clientes");

// let clientes = [{
//   "_id": {
//     "$oid": "65510ddb55590f4f54c7eb86"
//   },
//   "nombre": "Claudio Salsapeña",
//   "direccion": {
//     "calle": "C/ Parro",
//     "numero_edificio": 5,
//     "piso": 4,
//     "puerta": 7,
//     "ciudad": "Barcelona",
//     "codigo_postal": "08076",
//     "pais": "España"
//   },
//   "telefono": "978654567",
//   "email": "claudio@mail.com",
//   "fecha_registro": "1998-09-09",
//   "cliente_recomendador": null
// },
// {
//   "_id": {
//     "$oid": "65510e9155590f4f54c7eb87"
//   },
//   "nombre": "Brillo Salsapeña",
//   "direccion": {
//     "calle": "C/ Parro",
//     "numero_edificio": 5,
//     "piso": 4,
//     "puerta": 7,
//     "ciudad": "Barcelona",
//     "codigo_postal": "08076",
//     "pais": "España"
//   },
//   "telefono": "978654567",
//   "email": "brillo@mail.com",
//   "fecha_registro": "1998-09-10",
//   "cliente_recomendador": "65510ddb55590f4f54c7eb86"
// }]
db.clientes.insertMany(clientes);


db.createCollection("empleados");

let empleados = [{
  "_id": {
    "$oid": "65510f0355590f4f54c7eb8b"
  },
  "nombre": "Peña Santamar"
}]
db.empleados.insertMany(empleados);

db.createCollection("proveedores");

let proveedores = [{
  "_id": {
    "$oid": "65510c5555590f4f54c7eb83"
  },
  "nombre": "Gafas Sanpere",
  "direccion": {
    "calle": "C/ Calle",
    "numero_edificio": 4,
    "piso": 3,
    "puerta": 3,
    "ciudad": "Barcelona",
    "codigo_postal": "08056",
    "pais": "España"
  },
  "telefono": "875647658",
  "fax": "867543212",
  "nif": "76854367T",
  "marcas_que_ofrecen": [
    {
      "nombre": "Marca Gafas Delux"
    },
    {
      "nombre": "Marca Fantasy"
    },
    {
      "nombre": "Marca Sobremesa"
    }
  ]
},
{
  "_id": {
    "$oid": "65510d5555590f4f54c7eb84"
  },
  "nombre": "Gafas Adrian",
  "direccion": {
    "calle": "C/ Terre",
    "numero_edificio": 4,
    "piso": 3,
    "puerta": 3,
    "ciudad": "Barcelona",
    "codigo_postal": "08056",
    "pais": "España"
  },
  "telefono": "875647658",
  "fax": "867543212",
  "nif": "76854367T",
  "marcas_que_ofrecen": [
    {
      "nombre": "Marca Papagallo"
    },
    {
      "nombre": "Marca Santiago"
    }
  ]
}]
db.proveedores.insertMany(proveedores);

db.createCollection("ventas");

let ventas = [{
  "_id": {
    "$oid": "65510f3f55590f4f54c7eb8d"
  },
  "marca_vendida": {
    "nombre": "Marca Fantasy",
    "proveedor": "65510c5555590f4f54c7eb83"
  },
  "graduacion": "3.0 / 4.0",
  "montura": "Flotante",
  "color_montura": "Rojo",
  "color_cristales": "Transparente",
  "precio": 146,
  "empleado_vendedor": "65510f0355590f4f54c7eb8b",
  "cliente_comprador": "65510ddb55590f4f54c7eb86",
  "fecha_venta": "1998-09-09"
}]
db.ventas.insertMany(ventas);

