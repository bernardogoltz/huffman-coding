% tenho um arquivo de texto 'alice.txt' com um livro dentro.
% a lista referencia contem todos os simbolos que existem no texto
% quero contar quantas vezes cada SIMBOLO aparece no texto

% cria lista vazia que armazenará caracteres distintos que aparecerem ao varrer o texto.
referencia = '';

% lendo o input de texto
file_name = 'alice.txt';
texto = fileread(file_name);


for i = 1:length(texto) 
   esta_na_ref = ismember(texto(i) , referencia); 
% se ja esta na referencia, passa, se nao esta armazena. 
   if esta_na_ref % 
       ;
   else
       referencia(end+1) = texto(i);
   end 
    
end

quantidade_de_caracteres = length(referencia);


contagem = [];
% conta qunatas vezes cada arquivo aparece.
for i = 1:length(referencia)
    simbolo = referencia(i);
    contagem(end+1) = sum(texto == simbolo);
end


ref_list = {}; 
for i = 1:length(referencia) 
    % transforma referencia em lista, para poder juntar com a lista de contagem e colocar no dicionario
    ref_list{end+1} = referencia(i);
end 

% cria dicionario de frequencias de cada simbolo.
freq_contagem = dictionary(ref_list , contagem);

% ordenando o dicionario decrescentemente
valores_frequencia = freq_contagem.values;
keys_frequencia = freq_contagem.keys;

% ordenando vlaores pela frequencia
[ord_valores, idx] = sort(valores_frequencia , 'descend');

% ajustando os indices
sortedChaves = keys_frequencia(idx);

%for i = 1:length(sortedChaves)
    %fprintf('%s: %d\n', sortedChaves{i}, ord_valores(i));
%end

% dicionario ordenado
freq_ordem = dictionary(sortedChaves , ord_valores);

%%%%%%%%%%%%%%%
symbols= freq_ordem.keys;
freq = freq_ordem.values;


[huffmanTree, huffmanCode] = createHuffmanTree(symbols, freq);

function [huffmanTree, huffmanCode] = createHuffmanTree(symbols, freq)
    nodes = cell(length(symbols), 1);

    for i = 1:length(symbols)
        nodes{i} = struct('symbol', symbols{i}, 'freq', freq(i), 'left', [], 'right', []);
    end

    while length(nodes) > 1
        % Extrai as frequências em um vetor
        freqs = arrayfun(@(n) n.freq, [nodes{:}]);  

        % Ordena os nós por frequência
        [~, idx] = sort(freqs);
        nodes = nodes(idx);

        % Combina os dois nós de menor frequência
        left = nodes{1};
        right = nodes{2};
        newNode = struct('symbol', [left.symbol, right.symbol], 'freq', left.freq + right.freq, 'left', left, 'right', right);

        nodes(1:2) = [];  % Remove os nós q foram combinados 
        nodes{end+1} = newNode;        % e adiciona o novo nó

    end

    % O último nó restante é a raiz da árvore
    huffmanTree = nodes{1};

    % Gera os códigos de Huffman
    huffmanCode = generateCodes(huffmanTree, []);
end

function codes = generateCodes(node, currentCode)
    codes = containers.Map();
    if isempty(node.left) && isempty(node.right) % É um nó folha
        codes(node.symbol) = currentCode;
    else
        if ~isempty(node.left)
            leftCodes = generateCodes(node.left, [currentCode, 0]);
            keys = leftCodes.keys;
            for i = 1:length(keys)
                codes(keys{i}) = leftCodes(keys{i});
            end
        end

        if ~isempty(node.right)
            rightCodes = generateCodes(node.right, [currentCode, 1]);
            keys = rightCodes.keys;
            for i = 1:length(keys)
                codes(keys{i}) = rightCodes(keys{i});
            end
        end
        
    end
end


