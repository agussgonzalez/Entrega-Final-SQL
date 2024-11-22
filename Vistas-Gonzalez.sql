-- Crear vistas
CREATE VIEW VistaProductosEnStock AS
SELECT p.ProductoID, p.Nombre, p.Precio, c.Nombre AS Categoria, pr.Nombre AS Proveedor
FROM Producto p
JOIN Categoria c ON p.CategoriaID = c.CategoriaID
JOIN Proveedor pr ON p.ProveedorID = pr.ProveedorID
WHERE p.CantidadStock > 0;


CREATE VIEW VistaVentasDetalle AS
SELECT 
    v.VentaID,
    v.Fecha,
    c.Nombre AS Cliente,
    e.Nombre AS Empleado,
    dv.ProductoID,
    p.Nombre AS Producto,
    dv.Cantidad,
    dv.PrecioUnitario,
    (dv.Cantidad * dv.PrecioUnitario) AS Subtotal
FROM Venta v
JOIN DetalleVenta dv ON v.VentaID = dv.VentaID
JOIN Producto p ON dv.ProductoID = p.ProductoID
JOIN Cliente c ON v.ClienteID = c.ClienteID
JOIN Empleado e ON v.EmpleadoID = e.EmpleadoID;
