
CREATE DATABASE LojaDeStands;


USE LojaDeStands;


CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    imagem_url VARCHAR(255)
);


CREATE TABLE Carrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);


CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL
);


CREATE TABLE ItensPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);


INSERT INTO Produtos (nome, preco, estoque, imagem_url) VALUES
('Symphony Of Destruction', 300.00, 10, 'https://tiermaker.com/images/chart/chart/project-jojo-stands-tier-list-584665/symphony-of-destructionpng.png'),
('White Wedding', 350.00, 10, 'https://trello.com/1/cards/5cf43cbcd202db7955bd468b/attachments/5cf45ed045fde0413a66240d/previews/5cf45ed045fde0413a66240f/download/RobloxPlayerBeta_DCeF0Wrm9A.png'),
('Guest Platinum', 400.00, 10, 'https://trello.com/1/cards/5db58c8812f71d1edd38ff01/attachments/5dbcf08fb2262c1d98f55495/previews/5dbcf08fb2262c1d98f55499/download/image.png'),
('Melvin', 50.00, 1, 'https://preview.redd.it/r3lcc7gf64791.png?width=540&format=png&auto=webp&s=9d32ec46f884486fd59dfd01453bf5d07bf30d75');

