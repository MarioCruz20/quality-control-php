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

## Requisitos previos

Antes de ejecutar el proyecto, asegúrate de tener instalado lo siguiente:

- PHP (versión 8.x o superior)
- Composer
- Node.js y npm (para Tailwind/Vite)
- Git

---

## Configuración de PHP en Variables de Entorno (Windows)

1. Descargar PHP desde: https://windows.php.net/download/

2. Extraer el contenido en una carpeta, por ejemplo:
 ```
  C:\php
  ```

3. Agregar PHP al PATH del sistema:
- Buscar "Variables de entorno" en Windows
- Editar la variable **Path**
- Agregar la ruta:
  ```
  C:\php
  ```

4. Verificar instalación:
```
php -v
```

5. Instalación de Composer:
- Descargar desde: https://getcomposer.org/download/
  
- Ejecutar el instalador (Composer-Setup.exe)
  
- Durante la instalación:
  
- Seleccionar la ruta de PHP (ejemplo: C:\php\php.exe)
  
- Verificar instalación:
```
composer -v
```

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
```
composer install
```

## 4. Iniciar el servidor de desarrollo
Ejecutar el comando para iniciar el servidor local de Laravel:
```
php artisan serve
```

## 5. Abrir proyecto en el navegador
Después de ejecutar el comando anterior, la consola mostrará una dirección similar a:

**http://127.0.0.1:8000**

Hacer **Ctrl + clic izquierdo** sobre esa dirección para abir el proyecto o copiar y pegar esa dirección en el navegador para abrirlo

Para moverse entre vistas:

Hacer clic en "Lineas de producción", "Productos", etc en el encabezado para ver las distintas vistas.

### Nota

Si MySQL no permite conectarse desde MySQL Workbench, verifica que el servicio de MySQL esté en ejecución.

En Windows puedes revisarlo en:

Task Manager → Services → buscar **MySQL** → estado **Running**.

