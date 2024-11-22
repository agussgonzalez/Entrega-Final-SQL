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

DELIMITER //

CREATE FUNCTION PromedioVentasProducto(productoID INT, fechaInicio DATETIME, fechaFin DATETIME)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10, 2);
    SELECT AVG(PrecioUnitario * Cantidad) INTO promedio
    FROM DetalleVenta dv
    JOIN Venta v ON dv.VentaID = v.VentaID
    WHERE dv.ProductoID = productoID AND v.Fecha BETWEEN fechaInicio AND fechaFin;
    RETURN promedio;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE RegistrarCompra (
    IN proveedorID INT,
    IN detalles JSON
)
BEGIN
    DECLARE compraID INT;
    INSERT INTO Compra (Fecha, ProveedorID, Total) VALUES (NOW(), proveedorID, 0);
    SET compraID = LAST_INSERT_ID();
    
    DECLARE detalle JSON;
    DECLARE productoID INT;
    DECLARE cantidad INT;
    DECLARE precio DECIMAL(10, 2);

    DECLARE cur CURSOR FOR SELECT * FROM JSON_TABLE(detalles, '$[*]' COLUMNS(
        productoID INT PATH '$.ProductoID',
        cantidad INT PATH '$.Cantidad',
        precio DECIMAL(10,2) PATH '$.Precio'
    ));

    OPEN cur;
    FETCH cur INTO productoID, cantidad, precio;
    
    WHILE productID IS NOT NULL DO
        INSERT INTO DetalleCompra (CompraID, ProductoID, Cantidad, PrecioUnitario) VALUES (compraID, productoID, cantidad, precio);
        FETCH cur INTO productoID, cantidad, precio;
    END WHILE;

    CLOSE cur;
END //

DELIMITER ;
