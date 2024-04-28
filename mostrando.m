keys = huffmanCode.keys;
valores = huffmanCode.values;

for i = 1:length(keys)
    k = keys(i);
    v = valores(i);
    
    texto = ['   ' num2str(k{1}) '  ==>   ' num2str(v{1})];
    disp(texto)
end 
