# Quality Control System

Proyecto desarrollado con **Laravel y MySQL** para la gestión de líneas de producción y productos en un sistema de control de calidad.

## Herramientas utilizadas

- PHP
- Laravel
- MySQL
- MySQL Workbench
- Composer
- Visual Studio Code

El proyecto fue desarrollado utilizando **Visual Studio Code** como editor de código.

---

## Configuración del Proyecto

Sigue los siguientes pasos para configurar y ejecutar el proyecto en tu entorno local.

## 1. Importar la Base de Datos

Para ejecutar el proyecto, primero debes importar la base de datos utilizando el backup **`quality_control_20260410.sql`**.

### Pasos en MySQL Workbench

1. Abrir **MySQL Workbench**.
2. Ir al menú superior:

Server → Data Import

3. En la sección **Import Options**:
   - Seleccionar **Import from Self-Contained File**.
   - Seleccionar el archivo:
   
   `quality_control_20260410.sql`

4. En **Default Target Schema**:
   - Presionar el botón **New**.
   - Crear un nuevo esquema llamado:

   `quality_control`

5. En **Import Progress**:
   - Seleccionar la opción **Dump Structure and Data**.

6. Presionar **Start Import**.

7. Cuando termine la importación, presionar el botón **Refresh** en el panel **Schemas** (panel izquierdo) para actualizar la lista de bases de datos.


## 2. Abrir la consola en la carpeta del proyecto

Ubica la carpeta del proyecto **quality_control** en tu computadora.

Una forma rápida de abrir la consola en esa ubicación es:

1. Abrir la carpeta **quality_control** en el Explorador de archivos.
2. Hacer clic en la barra de dirección donde aparece la ruta de la carpeta.
3. Escribir: **cmd**
4. Presionar **Enter**.

Esto abrirá la consola directamente en la carpeta del proyecto.


## 3. Instalar las dependencias del proyecto

En la consola ejecutar el siguiente comando:
**composer install**

## 4. Iniciar el servidor de desarrollo
Ejecutar el comando para iniciar el servidor local de Laravel:
**php artisan serve**

## 5. Abrir proyecto en el navegador
Después de ejecutar el comando anterior, la consola mostrará una dirección similar a:

**http://127.0.0.1:8000**

Hacer **Ctrl + clic izquierdo** sobre esa dirección para abir el proyecto o copiar y pegar esa dirección en el navegador para abrirlo

Para moverse entre vistas, en la direccion del navegador escribir:

**http://127.0.0.1:8000/home**

Luego hacer clic en "Lineas de producción", "Productos", etc en el encabezado para ver las distintas vistas.

