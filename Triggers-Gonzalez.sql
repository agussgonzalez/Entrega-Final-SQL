USE MidlandShopping;

-- Trigger para actualizar el inventario al registrar una venta
DELIMITER //
CREATE TRIGGER Trigger_ActualizarInventarioVenta
AFTER INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
    DECLARE nuevaCantidad INT;
    SET nuevaCantidad = (SELECT CantidadStock FROM Producto WHERE ProductoID = NEW.ProductoID) - NEW.Cantidad;
    UPDATE Producto SET CantidadStock = nuevaCantidad WHERE ProductoID = NEW.ProductoID;
    INSERT INTO Inventario (ProductoID, Cantidad, Fecha) VALUES (NEW.ProductoID, nuevaCantidad, NOW());
END //
DELIMITER ;

-- Trigger para actualizar el inventario al registrar una devolución
DELIMITER //
CREATE TRIGGER Trigger_ActualizarInventarioDevolucion
AFTER INSERT ON Devolucion
FOR EACH ROW
BEGIN
    DECLARE nuevaCantidad INT;
    SET nuevaCantidad = (SELECT CantidadStock FROM Producto WHERE ProductoID = NEW.ProductoID) + NEW.Cantidad;
    UPDATE Producto SET CantidadStock = nuevaCantidad WHERE ProductoID = NEW.ProductoID;
    INSERT INTO Inventario (ProductoID, Cantidad, Fecha) VALUES (NEW.ProductoID, nuevaCantidad, NOW());
END //
DELIMITER ;

-- Trigger para registrar la última fecha de actualización en el inventario
DELIMITER //
CREATE TRIGGER Trigger_FechaActualizacionStock
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
    IF OLD.CantidadStock != NEW.CantidadStock THEN
        INSERT INTO Inventario (ProductoID, Cantidad, Fecha) VALUES (NEW.ProductoID, NEW.CantidadStock, NOW());
    END IF;
END //
DELIMITER ;


DELIMITER //

CREATE TRIGGER AplicarDescuentoVenta
BEFORE INSERT ON Venta
FOR EACH ROW
BEGIN
    IF NEW.Total > 1000 THEN
        SET NEW.Total = NEW.Total * 0.9; -- 10% de descuento
    END IF;
END //

DELIMITER ;
