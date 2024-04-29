codigo = huffmanCode;
texto_codificado = encodedMessage;

decodedMessage = '';  
currentCode = [];  

for bit = texto_codificado
    currentCode = [currentCode, bit]; 
    for k = codigo.keys
        if isequal(codigo(k{1}), currentCode)
            decodedMessage = [decodedMessage, k{1}];  
            currentCode = []; 
            break;  
        end
    end
end

disp('Mensagem decodificada:');
disp(decodedMessage);