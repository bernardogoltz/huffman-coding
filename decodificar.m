% Exemplo de dicionário de codificação de Huffman
codigo = huffmanCode;
% Exemplo de texto codificado
texto_codificado = encodedMessage;

% Inicializar variáveis para a decodificação
decodedMessage = '';  % Inicializa a mensagem decodificada como uma string vazia
currentCode = [];  % Inicializa o código atual como um vetor vazio

% Percorrer cada bit do texto codificado
for bit = texto_codificado
    currentCode = [currentCode, bit];  % Adiciona o bit atual ao código em construção
    
    % Verificar cada chave no dicionário para encontrar uma correspondência
    for k = codigo.keys
        if isequal(codigo(k{1}), currentCode)
            decodedMessage = [decodedMessage, k{1}];  % Adiciona o símbolo decodificado à mensagem
            currentCode = [];  % Limpa o código atual após encontrar uma correspondência
            break;  % Sai do loop interno uma vez que uma correspondência é encontrada
        end
    end
end

% Exibir a mensagem decodificada
disp('Mensagem decodificada:');
disp(decodedMessage);