-- Crear vistas
CREATE VIEW VistaProductosEnStock AS
SELECT p.ProductoID, p.Nombre, p.Precio, c.Nombre AS Categoria, pr.Nombre AS Proveedor
FROM Producto p
JOIN Categoria c ON p.CategoriaID = c.CategoriaID
JOIN Proveedor pr ON p.ProveedorID = pr.ProveedorID
WHERE p.CantidadStock > 0;

-- Funciones
DELIMITER //

CREATE FUNCTION CalcularTotalVentas(fechaInicio DATETIME, fechaFin DATETIME)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(Total) INTO total
    FROM Venta
    WHERE Fecha BETWEEN fechaInicio AND fechaFin;
    RETURN total;
END //

DELIMITER ;

-- Procedimiento almacenado
DELIMITER //

CREATE PROCEDURE RegistrarVenta(IN clienteID INT, IN empleadoID INT, IN total DECIMAL(10, 2))
BEGIN
    INSERT INTO Venta (Fecha, ClienteID, EmpleadoID, Total) VALUES (NOW(), clienteID, empleadoID, total);
END //

DELIMITER ;
