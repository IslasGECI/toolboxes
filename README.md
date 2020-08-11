Lubricante para usar Herramientas Compartidas de MATLAB
====

Instalación:
----
1. Clona el repositorio **toolboxes** desde [Bitbucket](https://bitbucket.org/analislas/toolboxes)
1. Ejecuta `installToolboxes.cmd` que se encuentra en el directorio `CMD/` del repositorio **toolboxes** que acabas de clonar
1. Copia el archivo `startup.m` que se encuentra en el directorio `MATLAB/demostraciones/` del repositorio **toolboxes** y pégalo en el directorio `bin/` de MATLAB (e.g. `C:/Program Files/MATLAB/R2017a/bin/`)
1. Verifica que el directorio `C:\evaristools\` se encuentre en el _Path_ de tu sistema operativo

Uso:
----
En MATLAB usa la función `updateToolbox()` para (re)instalar una _toolbox_ y agrégarla al _PATH_ de MATLAB. Por ejemplo, `updateToolbox('\\OSTRERO\islas');` instala la clase **insular**.

Otras funciones relevantes:
----
- `addDataPath` agrega el directorio `\\%computerName%\datos` al _path_ del MATLAB.
- `addNetcdfPath` agrega el directorio `\\%computerName%\datos-netcdf` al _path_ del MATLAB.
- `updateTextData` copia los datos dentro de `\\%computerName%\datos-texto` a la biblioteca de _toolboxes_ de MATLAB y los agrega al _path_.
- `updateToolbox(fuente)` copia los archivos dentro de `fuente` a la biblioteca de _toolboxes_ de MATLAB y los agrega al _path_.

Nota:
----
Este repositorio es para MATLAB. Si el código de una clase, función o programa no requiere saber de la existencia de la carpeta `%UserProfile%\Documents\MATLAB\library`, entonces ese archivo no debería estar consignado en este repositorio

To-do list
----
- Quitar argumento de salida de las funciones `add*Path.m`
- Agregar a todas las funciones del tipo parámetro de entrada `directorioBase` como en la función [`addFunctionsPath`](https://bitbucket.org/analislas/toolboxes/src/default/MATLAB/funciones/addFunctionsPath.m) (hacerlo opcional)
- Documentar cómo `updateToolbox.m` usa `toolbox.json` que se encuentra en la raíz repo `islas`

# Toolboxes en python

## Instalación:

1. Clonar el repositorio `toolboxes` [Bitbucket](https://bitbucket.org/analislas/toolboxes).
1. Desde una terminal moverse adentro de la carpeta toolboxes y ejecuten el comando `python installToolboxes.py install` (puede que requieran abrir la terminal como administrador)
1. En caso de que se ocupe desinstalar el módulo `toolboxes` se debe ejecutar `pip uninstall toolboxes`. Esto se debe hacer cada que se actualice el módulo `toolboxes`.

## Uso:

### Agregar funciones del repositorio de trabajo actual al path de _python_

Para poder utilizar las funciones y clases de _python_ creadas en un repositorio, es necesario agregarlas al _path_ de _python_. Una forma rápida de hacerlo es utilizando la función `addPythonPath` de `toolboxes`

#### Ejemplo

En un script de _python_

```python
import toolboxes

# Antes de llamar a las funciones de tu repositorio actual
toolboxes.addPythonPath()

# Ahora si podemos llamar a las funciones de nuestro repositorio
from datos_netcdf import makeAnualDirs
...
```

### Buscar archivo en las carpetas de datos compartidas

Para acceder a los archivos que se encuentran en las carpetas compartidas de datos (`datos`, `datos-netcdf`, `datos-texto`), se deben utilizar las funciones `findInDataPath` (busca en la carpeta `datos`), `findInNetcdfPath` (busca en la carpeta `datos-netcdf`) y `findInDataTextPath` (busca en la carpeta `datos-texto`), esto permite que cualquier analista pueda correr el programa sin importar la estructura de las carpetas en su computadora.

 Si el archivo no existe en la carpeta la función lanzará un error de tipo `IOError`

#### Ejemplo

En un script de _python_

```python
import pandas as pd
import toolboxes

# Antes de llamar a las funciones de tu repositorio actual
archivoCabras = toolboxes.findInDataPath("erradicacion-cabra-feral-Nov04-May05.xlsx")
datos = pd.read_excel(archivoCabras)
...
```

## Nota:

En python no existe el updateToolboxes ya que es mejor utilizar el modulo `setuptools` para instalar los repositorios.

#### Ejemplo

En la terminal

```powershell
# Se ejecuta este comando dentro del repositorio
python [setupFile] install

# El comando se puede ejecutar en cualquier parte
pip uninstall [nombre_del_modulo]
```

ver [ejemplo](markdown-header-instalacion_1) de como se instaló el módulo `toolboxes` para que quede más claro.