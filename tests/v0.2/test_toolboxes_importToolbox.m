%% v0.1.0
mt = toolboxes.importToolbox('misctools');
esModuloVacio = isempty(mt) | isempty(fields(mt));
assert(~esModuloVacio)