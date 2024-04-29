% Dicionário de codificação de Huffman para os caracteres
huffmanCodes = huffmanCode;

% Texto que você deseja codificar
file_name = 'alice.txt';
texto = fileread(file_name);

% Array para armazenar a mensagem codificada
encodedMessage = [];

% Itera sobre cada caractere do texto
for i = 1:length(texto)
    char = texto(i);
    if isKey(huffmanCodes, char)
        % Concatena o código do caractere atual ao array da mensagem codificada
        encodedMessage = [encodedMessage huffmanCodes(char)];
    else
        error('Símbolo não encontrado no dicionário de Huffman!');
    end
end

% Exibindo a mensagem codificada
disp('Mensagem codificada:');
disp(encodedMessage);

