function installBundle()
    repos = enumeration('Toolbox');
    repos = repos(repos ~= Toolbox.toolboxes); % Cosas inesperadas pasan
        % cuando actualizamos `toolboxes`.
    for repo = repos(:)'
        repo.install()
    end
end