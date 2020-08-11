classdef Toolbox
    properties
        bitbucket
    end
    methods
        function Obj = Toolbox(bitbucket)
            Obj.bitbucket = bitbucket;
        end
        function install(Obj)
            url = ['https://bitbucket.org/IslasGECI/' Obj.bitbucket.char()];
            toolboxes.installToolbox(url)
        end
        function update(Obj, version)
            ruta = [toolboxes.getPrivateToolboxesPath filesep Obj.char()];
            toolboxes.updateToolbox(ruta, version)
        end
    end
    enumeration
        datatools ("datatools")
        distdens ("dist-dens")
        geoambiental ("geoambiental")
        islas ("islas")
        mapeo ("mapeo")
        toolboxes ("toolboxes")
        ver ("ver")
    end
end