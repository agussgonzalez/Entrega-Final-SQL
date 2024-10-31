-- Inserción de datos en la tabla Categoria
INSERT INTO Categoria (Nombre) VALUES ('Electrónica'), ('Ropa'), ('Alimentos');

-- Inserción de datos en la tabla Proveedor
INSERT INTO Proveedor (Nombre, Direccion, Telefono) VALUES ('Proveedor A', 'Direccion A', '123456789'), ('Proveedor B', 'Direccion B', '987654321');

-- Inserción de datos en la tabla Producto
INSERT INTO Producto (Nombre, Precio, CantidadStock, CategoriaID, ProveedorID) VALUES ('Televisor', 300.00, 10, 1, 1), ('Camisa', 20.00, 50, 2, 2);

-- Inserción de clientes
INSERT INTO Cliente (Nombre, Correo) VALUES ('Cliente A', 'clientea@example.com'), ('Cliente B', 'clienteb@example.com');

-- Inserción de empleados
INSERT INTO Empleado (Nombre, Puesto) VALUES ('Empleado A', 'Vendedor'), ('Empleado B', 'Gerente');