function nombre = makeId(fuente)
%MAKEID Devuelve cadena posterior a última diagonal sin acentos ni espacios
%
%   See also isstrprop, isletter, matlab.lang.makeValidName.
esFuenteString = isstring(fuente);
if esFuenteString
    fuente = cellstr(fuente);
end
if ischar(fuente)
    esFinValido = isstrprop(fuente(end), 'alphanum');
    while ~esFinValido
        fuente = fuente(1:end-1);
        esFinValido = isstrprop(fuente(end), 'alphanum');
    end
    esDiagonal = fuente == '/' | fuente == '\';
    if any(esDiagonal)
        inicio = find(esDiagonal,1,'last')+1;
    else
        inicio = 1;
    end
    nombre = fuente(inicio:end);
    esInicioValido = isletter(nombre(1));
    while ~esInicioValido
        nombre = nombre(2:end);
        esInicioValido = isletter(nombre(1));
    end
    esAlfanumerico = isstrprop(nombre, 'alphanum');
    nombre = nombre(esAlfanumerico);
    nombre = lower(nombre);
    nombre(nombre=='á')='a';
    nombre(nombre=='é')='e';
    nombre(nombre=='í')='i';
    nombre(nombre=='ó')='o';
    nombre(nombre=='ú')='u';
    nombre(nombre=='ñ')='n';
    nombre = matlab.lang.makeValidName(nombre,'ReplacementStyle', 'delete');
elseif iscellstr(fuente)
    nombre = cellfun(@(x) toolboxes.makeId(x),fuente,'UniformOutput',false);
    if esFuenteString
        nombre = string(nombre);
    end
else
    error('ERROR: El argumento de entrada debe ser clase `char`, `string` o `cell`')
end
