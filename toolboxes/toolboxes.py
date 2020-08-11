"""
Este módulo contiene las funciones para buscar archivos en las carpetas de datos
compartidas.
"""
import sys
import os

def addPythonPath(direccionBase="./"):
    """
    Agrega la carpeta de funciones y clases del repositorio actual al path de
    python.
    Esta función solo servirá si se corre desde el directorio raíz de un
    repositorio o desde dentro del directorio de python.
    Esta función es similar a la función aadMatlabPath.
    """
    if not (direccionBase[-1] == "\\" or direccionBase[-1] == "/"):
        direccionBase += "/"
    if os.path.exists(direccionBase + "python"): 
        sys.path.append(direccionBase +"python")
        # Se llama a ella misma para agregar las carpetas funciones y clases     
        addPythonPath(direccionBase + "python/")
    elif os.path.exists(direccionBase + "funciones"):
        sys.path.append(direccionBase +"funciones")
    elif os.path.exists(direccionBase + "clases"):
        sys.path.append(direccionBase +"clases")
    else:
        raise FileNotFoundError("No se pueden encontrar las carpetas python, funciones o clases")

def findInDataPath(nombreArchivo):   
    """
    Regresa la dirección a un archivo de la carpeta compartida de datos. Si no
    existe lanza un error y evita que el programa continue.
    """
    nombreComputadora = os.environ["COMPUTERNAME"]
    directorio =  r"\\{}\datos".format(nombreComputadora)
    archivo = os.path.join(directorio, nombreArchivo)
    if os.path.exists(archivo):
            return archivo
    else:
        raise IOError("No existe el archivo {} en la carpeta compartida de datos".format(nombreArchivo))

def findInNetcdfPath(nombreArchivo):
    """
    Regresa la dirección a un archivo de la carpeta compartida de datos-netcdf.
    Si no existe lanza un error y evita que el programa continue.
    """
    nombreComputadora = os.environ["COMPUTERNAME"]
    directorio =  r"\\{}\datos-netcdf".format(nombreComputadora)
    archivo = os.path.join(directorio, nombreArchivo)
    if os.path.exists(archivo):
            return archivo
    else:
        raise IOError("No existe el archivo {} en la carpeta compartida de datos-netcdf".format(nombreArchivo))

def findInDataTextPath(nombreArchivo):
    """
    Regresa la dirección a un archivo de la carpeta compartida de datos-texto.
    Si no existe lanza un error y evita que el programa continue.
    """
    nombreComputadora = os.environ["COMPUTERNAME"]
    directorio =  r"\\{}\datos-texto".format(nombreComputadora)
    archivo = os.path.join(directorio, nombreArchivo)
    if os.path.exists(archivo):
            return archivo
    else:
        raise IOError("No existe el archivo {} en la carpeta compartida de datos-netcdf".format(nombreArchivo))