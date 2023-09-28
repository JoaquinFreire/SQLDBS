/*Agrupado y ordenado por orden alfabético mostrar por Almacén, deposito, zona, SubZona, Ubicación, 
los Productos con sus respectivas cantidades (tabla etiqueta, campo eti_canitdad)
 en cada ubicación para aquellos productos que sean del tipo (tabla producto campo TIA_ID)  1, 2 o 3 */
 SELECT a.ALMA_NOMBRE, d.DEP_NOMBRE , z.ZDE_NOMBRE, s.SZD_NOMBRE, u.UBI_NOMBRE, p.PROD_NOMBRE, SUM(e.eti_cantidad) AS Cantidad
 FROM t_etiqueta e
 INNER JOIN t_producto p ON e.PROD_ID = p.PROD_ID
 INNER JOIN t_ubicacion u ON p.UBI_ID = u.UBI_ID
 INNER JOIN t_subzonadeposito s ON u.SZD_ID = s.SZD_ID
 INNER JOIN t_zonadeposito z ON s.ZDE_ID = z.ZDE_ID
 INNER JOIN t_deposito d ON z.DEP_ID = d.DEP_ID
 INNER JOIN t_almacen a ON d.ALMA_ID = a.ALMA_ID
 GROUP BY ALMA_NOMBRE, d.DEP_NOMBRE , z.ZDE_NOMBRE, s.SZD_NOMBRE, u.UBI_NOMBRE, p.PROD_NOMBRE
 ORDER BY ALMA_NOMBRE, d.DEP_NOMBRE , z.ZDE_NOMBRE, s.SZD_NOMBRE, u.UBI_NOMBRE