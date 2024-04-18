% armazenará cada caractere unico no texto...
referencia = '';

file_name = 'alice.txt';
texto = fileread(file_name);


for i = 1:length(texto)
   esta_na_ref = ismember(texto(i) , referencia);

   if esta_na_ref
       ;
   else
       referencia(end+1) = texto(i);
   end 
    
end

quantidade_de_caracteres = length(referencia);

% tenho um arquivo de texto 'alice.txt' com um livro dentro.
% a lista referencia contem todos os simbolos que existem no texto
% quero contar quantas vezes cada SIMBOLO aparece no texto
contagem = [];

for i = 1:length(referencia)
    simbolo = referencia(i);
    contagem(end+1) = sum(texto == simbolo);
end



ref_list = {};
for i = 1:length(referencia)
    ref_list{end+1} = referencia(i);
end 

freq = dictionary(ref_list , contagem);