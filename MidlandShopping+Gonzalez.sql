-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS MidlandShopping;
USE MidlandShopping;

-- Crear la tabla Categoria
CREATE TABLE Categoria (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

-- Crear la tabla Producto
CREATE TABLE Producto (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    CantidadStock INT NOT NULL,
    CategoriaID INT,
    ProveedorID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedor(ProveedorID)
);

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) NOT NULL
);

-- Crear la tabla Empleado
CREATE TABLE Empleado (
    EmpleadoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Puesto VARCHAR(50) NOT NULL
);

-- Crear la tabla Venta
CREATE TABLE Venta (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME NOT NULL,
    ClienteID INT,
    EmpleadoID INT,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID)
);

-- Crear la tabla DetalleVenta
CREATE TABLE DetalleVenta (
    DetalleVentaID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Venta(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Crear la tabla Compra
CREATE TABLE Compra (
    CompraID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME NOT NULL,
    ProveedorID INT,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedor(ProveedorID)
);

-- Crear la tabla DetalleCompra
CREATE TABLE DetalleCompra (
    DetalleCompraID INT AUTO_INCREMENT PRIMARY KEY,
    CompraID INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CompraID) REFERENCES Compra(CompraID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Crear la tabla Pago
CREATE TABLE Pago (
    PagoID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    Monto DECIMAL(10, 2) NOT NULL,
    Fecha DATETIME NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Venta(VentaID)
);

-- Crear la tabla Devolucion
CREATE TABLE Devolucion (
    DevolucionID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    Fecha DATETIME NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Venta(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Crear la tabla Inventario
CREATE TABLE Inventario (
    InventarioID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT,
    Cantidad INT NOT NULL,
    Fecha DATETIME NOT NULL,
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Crear la tabla Ubicacion
CREATE TABLE Ubicacion (
    UbicacionID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255)
);

-- Crear la tabla Descuento
CREATE TABLE Descuento (
    DescuentoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Porcentaje DECIMAL(5, 2) NOT NULL
);

-- Crear la tabla Promocion
CREATE TABLE Promocion (
    PromocionID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    FechaInicio DATETIME NOT NULL,
    FechaFin DATETIME NOT NULL
);

-- Informe de Ventas por Mes:
SELECT MONTH(Fecha) AS Mes, SUM(Total) AS TotalVentas
FROM Venta
GROUP BY MONTH(Fecha);

-- Informe de Productos en Bajo Stock:
SELECT Nombre, CantidadStock
FROM Producto
WHERE CantidadStock < 10;

-- Historial de Compras por Proveedor:
SELECT Proveedor.Nombre, Compra.Fecha, DetalleCompra.Cantidad, DetalleCompra.PrecioUnitario
FROM Compra
JOIN DetalleCompra ON Compra.CompraID = DetalleCompra.CompraID
JOIN Proveedor ON Compra.ProveedorID = Proveedor.ProveedorID;