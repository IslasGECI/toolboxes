function ruta = libraryPath
warning('La función `libraryPath()` es obsoleta. Usa `toolboxes.getEnvironmentPath()`');
ruta = toolboxes.getEnvironmentPath();
