use pizzeria;

db.createCollection("categorias_de_pizza");

let categorias_de_pizza = [{
    "_id": {
      "$oid": "655117fc55590f4f54c7ebbd"
    },
    "nombre": "Vegetarianas"
  },
  {
    "_id": {
      "$oid": "6551181655590f4f54c7ebbe"
    },
    "nombre": "Veganas"
  },
  {
    "_id": {
      "$oid": "6551181c55590f4f54c7ebbf"
    },
    "nombre": "Sin gluten"
  },
  {
    "_id": {
      "$oid": "6551182155590f4f54c7ebc0"
    },
    "nombre": "Con carne"
  }]
db.categorias_de_pizza.insertMany(categorias_de_pizza);


db.createCollection("clientes");

let clientes = [{
    "_id": {
      "$oid": "6551114f55590f4f54c7eba7"
    },
    "nombre": "Claudio",
    "apellido": "Santamor",
    "direccion": {
      "calle": "C/ Rodrigo",
      "codigo_postal": "08045",
      "localidad": "Barcelona",
      "provincia": "Barcelona"
    },
    "telefono": "978654567"
  },
  {
    "_id": {
      "$oid": "655111e055590f4f54c7eba8"
    },
    "nombre": "Paradela",
    "apellido": "Santamor",
    "direccion": {
      "calle": "C/ Rodrigo",
      "codigo_postal": "08045",
      "localidad": "Barcelona",
      "provincia": "Barcelona"
    },
    "telefono": "567453456"
  }]
db.clientes.insertMany(clientes);


db.createCollection("empleados");

let empleados = [{
    "_id": {
      "$oid": "6551161555590f4f54c7ebad"
    },
    "nombre": "Santiago",
    "apellido": "Caradura",
    "nif": "87564536H",
    "telefono": "786754345",
    "tipo_empleado": "Cocina"
  },
  {
    "_id": {
      "$oid": "6551167155590f4f54c7ebae"
    },
    "nombre": "Marcela",
    "apellido": "Santiña Perez",
    "nif": "36574567J",
    "telefono": "564576876",
    "tipo_empleado": "Reparto"
  },
  {
    "_id": {
      "$oid": "6551167e55590f4f54c7ebaf"
    },
    "nombre": "Chanso",
    "apellido": "Santiña",
    "nif": "36574567J",
    "telefono": "564576876",
    "tipo_empleado": "Reparto"
  }]
db.empleados.insertMany(empleados);


db.createCollection("productos");

let productos = [{
    "_id": {
      "$oid": "6551174055590f4f54c7ebba"
    },
    "tipo": "Burger",
    "nombre": "Burger con queso",
    "descripcion": "Burger de la casa con queso",
    "imagen": "./img/burgers/burger_queso.jpg",
    "precio": 10
  },
  {
    "_id": {
      "$oid": "655117da55590f4f54c7ebbb"
    },
    "tipo": "Pizza",
    "nombre": "Pizza margarita",
    "descripcion": "Pizza sin carne",
    "id_categoria_pizza": "655117fc55590f4f54c7ebbd",
    "imagen": "./img/pizzas/margarita.jpg",
    "precio": 10
  }]
db.productos.insertMany(productos);


db.createCollection("tiendas");

let tiendas = [{
    "_id": {
      "$oid": "655115aa55590f4f54c7ebaa"
    },
    "direccion": {
      "calle": "C/ Casa",
      "codigo_postal": "08045",
      "localidad": "Barcelona",
      "provincia": "Barcelona"
    },
    "empleados": [
      {
        "id_empleado": "6551167155590f4f54c7ebae"
      },
      {
        "id_empleado": "6551161555590f4f54c7ebad"
      }
    ]
  },
  {
    "_id": {
      "$oid": "6551160c55590f4f54c7ebab"
    },
    "direccion": {
      "calle": "C/ Carrafo",
      "codigo_postal": "08045",
      "localidad": "Barcelona",
      "provincia": "Barcelona"
    },
    "empleados": [
      {
        "id_empleado": "6551167e55590f4f54c7ebaf"
      }
    ]
  }]
db.tiendas.insertMany(tiendas);