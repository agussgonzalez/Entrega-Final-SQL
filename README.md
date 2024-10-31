# Entregas-SQL

## Introducción
Este documento detalla el diseño y la implementación de una base de datos para la tienda en línea del Club Deportivo Midland, que se dedica a la venta de indumentarias del equipo. La base de datos permitirá gestionar productos, categorías, proveedores, ventas y clientes de manera eficiente.

## Objetivo
El objetivo es crear una base de datos que permita:

- Rastrear productos y su cantidad en inventario.
- Registrar ventas y compras.
- Gestionar proveedores y categorías de productos.
- Generar informes para el análisis de ventas y niveles de inventario.
- Implementar vistas y funciones para mejorar la gestión de datos.

## Situación Problemática
Actualmente, el sistema de gestión de inventario manual es ineficiente y propenso a errores, llevando a desabastecimientos o exceso de stock. Se necesita un sistema automatizado para mejorar la precisión y la eficiencia en el manejo de inventarios y ventas.

## Modelo de Negocio
La tienda del Club Deportivo Midland vende productos a clientes y realiza compras de estos productos a proveedores. Los productos están categorizados en diferentes grupos. La tienda realiza ventas que deben ser registradas y analizadas para mantener un control adecuado del inventario y las finanzas.

## Actualizaciones de la Segunda Entrega

### Vistas
Se han creado vistas para facilitar la gestión y el análisis de datos:
- **Vista de Productos en Stock**: Muestra todos los productos con stock disponible, incluyendo categoría y proveedor.
- **Vista de Ventas por Cliente**: Listado de ventas realizadas por cada cliente, permitiendo un análisis detallado de su comportamiento de compra.
- **Vista de Compras a Proveedores**: Muestra todas las compras realizadas a proveedores, junto con los detalles de los productos adquiridos.

### Funciones
Se ha implementado una función para simplificar cálculos:
- **CalcularTotalVentas**: Calcula el total de ventas en un período específico, lo que facilita la generación de informes financieros.

### Procedimientos Almacenados
Se han creado procedimientos para automatizar tareas:
- **RegistrarVenta**: Permite registrar una nueva venta y actualizar automáticamente la información en las tablas correspondientes.

### Scripts SQL
Se ha añadido un conjunto de scripts SQL para:
- Inserción de datos iniciales en las tablas.
- Creación de vistas, funciones y procedimientos almacenados.
El proyecto incluye scripts SQL que facilitan la creación y el mantenimiento de la base de datos:

-Script de Creación de Tablas: Define la estructura de cada tabla en la base de datos.
-Scripts de Inserción de Datos: Población inicial de datos para pruebas y demostraciones.
-Scripts de Creación de Vistas, Funciones y Procedimientos: Código para definir las vistas, funciones y procedimientos descritos anteriormente.

## Herramientas y Tecnologias utilizadas
-Base de Datos: SQL Server / MySQL Midland Shopping CDM.
-Modelo de Base de Datos: Diagrama E-R para diseño de relaciones.
-Herramientas de Desarrollo: SQL Server Management Studio (SSMS), MySQL Workbench y Visual Studio Code.
-Sistema Operativo: windows 11.

## Conclusión
La implementación de esta base de datos y las herramientas asociadas mejorará significativamente la eficiencia del manejo de inventarios y la gestión de ventas en la tienda del Club Deportivo Midland, permitiendo una toma de decisiones más informada y precisa.

---