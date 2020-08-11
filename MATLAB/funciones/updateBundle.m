function updateBundle(version)
    repos = enumeration('Toolbox');
    repos = repos(repos ~= Toolbox.toolboxes); % Cosas inesperadas pasan
        % cuando actualizamos `toolboxes` a una versión vieja.
    for repo = repos(:)'
         repo.update(version)
    end
end