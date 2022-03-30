USE tienda; SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT precio, precio*1.10 AS precio_USD FROM producto;
SELECT nombre AS nom_de_producto, precio AS euros, precio*1.10 AS USD FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, CONCAT(UPPER(LEFT(nombre, 2)), LOWER(SUBSTRING(nombre, 3))) AS nombre_modificado FROM fabricante;
SELECT nombre, round(precio, 0) AS precio_redondeado FROM producto;
SELECT nombre, truncate(precio,0) AS precio_truncado FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante=2;
SELECT producto.nombre AS producto_nombre, precio, fabricante.nombre AS fabricante_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT producto.nombre AS producto_nombre, precio, fabricante.nombre AS fabricante_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.nombre AS producto_nombre, producto.codigo AS producto_id, fabricante.nombre AS fabricante_nombre, fabricante.codigo AS fabricante_id FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo;
SELECT producto.nombre AS producto_nombre, precio, fabricante.nombre AS fabricante_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY precio ASC LIMIT 1;
SELECT producto.nombre AS producto_nombre, precio, fabricante.nombre AS fabricante_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo ORDER BY precio DESC LIMIT 1;
SELECT producto.nombre AS producto_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre="Lenovo";
SELECT producto.nombre AS producto_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre="Crucial" AND precio>200;
SELECT producto.nombre AS producto_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE (fabricante.nombre="Asus" OR fabricante.nombre="Hewlett-Packard" OR fabricante.nombre="Seagate");
SELECT producto.nombre AS producto_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre IN ("Asus","Hewlett-Packard","Seagate");
SELECT producto.nombre AS producto_nombre, precio FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre AS producto_nombre, precio FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre AS producto_nombre, precio AS precio_producto, fabricante.nombre AS fabricante_nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE precio>=180 ORDER BY precio DESC, producto.nombre ASC;
SELECT DISTINCT producto.codigo_fabricante, fabricante.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante=fabricante.codigo;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante WHERE producto.nombre IS null;
SELECT producto.nombre FROM producto WHERE producto.codigo_fabricante=(SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre='Lenovo');
SELECT * FROM producto WHERE producto.codigo_fabricante IN (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre='Lenovo') ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Lenovo' ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Hewlett-Packard' ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE producto.precio>=(SELECT producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Lenovo' ORDER BY producto.precio DESC LIMIT 1);
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre='Asus' HAVING producto.precio>AVG(ALL precio);