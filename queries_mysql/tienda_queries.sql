SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.06 FROM producto;
SELECT nombre AS 'nom de producto', precio AS 'euros', precio * 1.06 AS 'dòlars' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre , 2)) AS 'primeros_dos_caracteres' FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, FLOOR(precio) FROM producto;
SELECT fabricante.codigo FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.codigo FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY producto.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio from producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio from producto ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_de_fabricante FROM producto JOIN  fabricante ON fabricante.codigo = producto.codigo_fabricante;
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_de_fabricante FROM producto JOIN  fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre AS nombre_de_fabricante FROM producto JOIN  fabricante ON fabricante.codigo = producto.codigo_fabricante;
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;
SELECT fabricante.codigo, producto.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
SELECT fabricante.codigo, producto.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
SELECT fabricante.codigo, producto.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' UNION SELECT fabricante.codigo, producto.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Hewlett-Packard' UNION SELECT fabricante.codigo, producto.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Seagate';
SELECT fabricante.codigo, producto.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT fabricante.codigo, producto.nombre, fabricante.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%e');
SELECT fabricante.codigo, producto.nombre, fabricante.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT fabricante.codigo, fabricante.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.codigo;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo OR  producto.codigo_fabricante = fabricante.codigo IS NULL;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo OR  producto.codigo_fabricante = fabricante.codigo IS NULL WHERE producto.nombre IS NULL;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo OR producto.codigo_fabricante = fabricante.codigo IS NULL WHERE fabricante.nombre = 'Lenovo';
SELECT producto.codigo, producto.nombre, producto.precio, producto.codigo_fabricante FROM (SELECT fabricante.codigo AS codigo_fabricante, producto.precio FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo' AND producto.precio LIMIT 1) AS precio_lenovo_mas_alto LEFT JOIN producto ON producto.precio = precio_lenovo_mas_alto.precio;
SELECT producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo' AND producto.precio LIMIT 1;
SELECT producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.codigo, producto.nombre, producto.precio, producto.codigo_fabricante FROM (SELECT fabricante.codigo AS codigo_fabricante, producto.precio FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo' AND producto.precio LIMIT 1) AS precio_lenovo_mas_alto LEFT JOIN producto ON producto.precio >= precio_lenovo_mas_alto.precio;
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' AND precio > (SELECT AVG(precio) FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus');

