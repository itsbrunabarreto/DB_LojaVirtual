CREATE DATABASE LojaVirtual;

USE LojaVirtual;

CREATE TABLE Pais 
(
    Cod_pais INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (Cod_pais)
);

CREATE TABLE Estado 
(
    Cod_estado INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Cod_pais INT,
    PRIMARY KEY (Cod_estado),
    FOREIGN KEY (Cod_pais) REFERENCES Pais(Cod_pais)
);

CREATE TABLE Cidade 
(
    Cod_cidade INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Cod_estado INT,
    PRIMARY KEY (Cod_cidade),
    FOREIGN KEY (Cod_estado) REFERENCES Estado(Cod_estado)
);

CREATE TABLE Cliente 
(
    Cod_cliente INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Logradouro VARCHAR(100) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cod_cidade INT,
    PRIMARY KEY (Cod_cliente),
    FOREIGN KEY (Cod_cidade) REFERENCES Cidade(Cod_cidade)
);

CREATE TABLE Telefone 
(
    Cod_cliente INT,
    Celular VARCHAR(30) NOT NULL,
    Residencial VARCHAR(30) NOT NULL,
    Comercial VARCHAR(30) NOT NULL,
    Recado VARCHAR(30) NOT NULL,
    PRIMARY KEY (Cod_cliente),
    FOREIGN KEY (Cod_cliente) REFERENCES Cliente(Cod_cliente)
);

CREATE TABLE Tipo_Pgto 
(
    Cod_tipo INT AUTO_INCREMENT NOT NULL,
    Descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (Cod_tipo)
);

CREATE TABLE Forma_Pgto
(
    Cod_forma_pgto INT AUTO_INCREMENT NOT NULL,
    Descricao VARCHAR(50) NOT NULL,
    Cod_tipo INT,
    PRIMARY KEY (Cod_forma_pgto),
    FOREIGN KEY (Cod_tipo) REFERENCES Tipo_Pgto(Cod_tipo)
);

CREATE TABLE Produtos 
(
    Cod_produto INT AUTO_INCREMENT NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    Vlr_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Cod_produto)
);

CREATE TABLE Nota_Fiscal 
(
    Num_nota INT AUTO_INCREMENT NOT NULL, 
    Cod_cliente INT,
    Data_emissao DATETIME NOT NULL,
    Total_nota DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Num_nota),
    FOREIGN KEY (Cod_cliente) REFERENCES Cliente(Cod_cliente)
);

CREATE TABLE Cesta_Compras 
(
    Num_nota INT,
    Cod_produto INT,
    Cod_forma_pgto INT,
	Qtde_vendida INT NOT NULL,
    PRIMARY KEY (Num_nota, Cod_produto),
    FOREIGN KEY (Num_nota) REFERENCES Nota_Fiscal(Num_nota),
    FOREIGN KEY (Cod_produto) REFERENCES Produtos(Cod_produto),
    FOREIGN KEY (Cod_forma_pgto) REFERENCES Forma_Pgto(Cod_forma_pgto)
);

INSERT INTO Pais (Nome) 
VALUES ('Brasil'),
	   ('Argentina'),
	   ('Estados Unidos'),
	   ('Canadá'),
	   ('Chile'),
	   ('Colômbia'),
	   ('Uruguai'),
	   ('Peru'),
	   ('Venezuela'),
	   ('Paraguai');

INSERT INTO Estado (Nome, Cod_pais) 
VALUES ('São Paulo', 1),
	   ('Rio de Janeiro', 1),
	   ('Minas Gerais', 1),
	   ('Bahia', 1),
	   ('Paraná', 1),
	   ('Rio Grande do Sul', 1),
	   ('Santa Catarina', 1),
	   ('Ceará', 1),
	   ('Pernambuco', 1),
	   ('Espírito Santo', 1),
	   ('Mato Grosso', 1),
	   ('Mato Grosso do Sul', 1),
	   ('Goiás', 1),
	   ('Distrito Federal', 1),
	   ('Sergipe', 1),
	   ('Alagoas', 1),
	   ('Amapá', 1),
	   ('Acre', 1),
	   ('Amazonas', 1),
	   ('Pará', 1),
	   ('Tocantins', 1),
	   ('Rondônia', 1),
	   ('Roraima', 1),
	   ('Maranhão', 1),
	   ('Paraíba', 1),
	   ('Piauí', 1),
	   ('São Paulo', 1);

INSERT INTO Cidade (Nome, Cod_estado) 
VALUES ('São Paulo', 1),
	   ('Campinas', 1),
	   ('Sorocaba', 1),
	   ('São Bernardo do Campo', 1),
	   ('São Caetano do Sul', 1),
	   ('Rio de Janeiro', 2),
	   ('Niterói', 2),
	   ('Belford Roxo', 2),
	   ('Duque de Caxias', 2),
	   ('Cabo Frio', 2),
	   ('Belo Horizonte', 3),
	   ('Uberlândia', 3),
	   ('Contagem', 3),
	   ('Juiz de Fora', 3),
	   ('Betim', 3),
	   ('Salvador', 4),
	   ('Feira de Santana', 4),
	   ('Vitória da Conquista', 4),
	   ('Camaçari', 4),
	   ('Lauro de Freitas', 4),
	   ('Curitiba', 5),
	   ('Londrina', 5),
	   ('Maringá', 5),
	   ('Ponta Grossa', 5),
	   ('Porto Alegre', 6),
	   ('Caxias do Sul', 6),
	   ('Santa Maria', 6),
	   ('Florianópolis', 7),
	   ('Joinville', 7),
	   ('Blumenau', 7),
	   ('Fortaleza', 8),
	   ('Caucaia', 8),
	   ('Juazeiro do Norte', 8),
	   ('Recife', 9),
	   ('Olinda', 9),
	   ('Jaboatão dos Guararapes', 9),
	   ('Aracaju', 10),
	   ('Maceió', 11),
	   ('Rio Branco', 17),
	   ('Macapá', 16),
	   ('Manaus', 17),
	   ('Belém', 17),
	   ('Teresina', 13),
	   ('São Luís', 13),
	   ('Natal', 12),
	   ('João Pessoa', 12),
	   ('Campina Grande', 12),
	   ('Vitória', 9);
       
INSERT INTO Cliente (Nome, Logradouro, Numero, Complemento, Bairro, Cod_cidade) 
VALUES ('João da Silva', 'Rua A', '123', 'Apto 1', 'Centro', 1),
	   ('Maria Santos', 'Rua B', '456', 'Apto 2', 'Centro', 1),
	   ('Carlos Oliveira', 'Rua C', '789', 'Casa', 'Bairro 1', 2),
	   ('Ana Pereira', 'Rua D', '135', 'Apto 3', 'Bairro 2', 2),
	   ('Roberto Almeida', 'Rua E', '246', 'Casa', 'Bairro 3', 3),
	   ('Lucia Costa', 'Rua F', '357', 'Apto 4', 'Bairro 4', 3),
	   ('Fernando Lima', 'Rua G', '468', 'Casa', 'Bairro 5', 4),
	   ('Fernanda Rocha', 'Rua H', '579', 'Apto 5', 'Bairro 6', 5),
	   ('Marcos Ferreira', 'Rua I', '680', 'Casa', 'Bairro 7', 6),
	   ('Juliana Martins', 'Rua J', '791', 'Apto 6', 'Bairro 8', 7),
	   ('Lucas Santos', 'Rua K', '234', 'Casa', 'Bairro 9', 7),
	   ('Tatiane Silva', 'Rua L', '567', 'Apto 7', 'Bairro 10', 8),
	   ('Daniel Ferreira', 'Rua M', '890', 'Casa', 'Bairro 11', 9),
	   ('Gabriela Souza', 'Rua N', '123', 'Apto 8', 'Bairro 12', 10),
	   ('Rafael Lima', 'Rua O', '456', 'Casa', 'Bairro 13', 11),
	   ('Priscila Almeida', 'Rua P', '789', 'Apto 9', 'Bairro 14', 15),
	   ('Thiago Ferreira', 'Rua Q', '135', 'Casa', 'Bairro 15', 16),
	   ('Bruna Costa', 'Rua R', '246', 'Apto 10', 'Bairro 16', 17),
	   ('Robson Pereira', 'Rua S', '357', 'Casa', 'Bairro 17', 18),
	   ('Simone Martins', 'Rua T', '468', 'Apto 11', 'Bairro 18', 19),
	   ('Eduardo Oliveira', 'Rua U', '579', 'Casa', 'Bairro 19', 20),
	   ('Juliana Mendes', 'Rua V', '680', 'Apto 12', 'Bairro 20', 21),
	   ('Patrícia Santos', 'Rua W', '791', 'Casa', 'Bairro 21', 22),
	   ('Vinícius Rocha', 'Rua X', '234', 'Apto 13', 'Bairro 22', 23),
	   ('Mariane Costa', 'Rua Y', '567', 'Casa', 'Bairro 23', 24),
	   ('Thiago Almeida', 'Rua Z', '890', 'Apto 14', 'Bairro 24', 25),
	   ('Natália Lima', 'Rua AA', '123', 'Casa', 'Bairro 25', 26),
	   ('Carlos Eduardo', 'Rua AB', '456', 'Apto 15', 'Bairro 26', 27),
	   ('Jéssica Almeida', 'Rua AC', '789', 'Casa', 'Bairro 27', 28),
	   ('Marcelo Oliveira', 'Rua AD', '135', 'Apto 16', 'Bairro 28', 29),
	   ('Fernanda Silva', 'Rua AE', '246', 'Casa', 'Bairro 29', 30),
	   ('Tiago Santos', 'Rua AF', '357', 'Apto 17', 'Bairro 30', 31),
	   ('Diana Ferreira', 'Rua AG', '468', 'Casa', 'Bairro 31', 32),
	   ('Alberto Pereira', 'Rua AH', '579', 'Apto 18', 'Bairro 32', 33),
	   ('Bianca Rocha', 'Rua AI', '680', 'Casa', 'Bairro 33', 34),
	   ('Samuel Lima', 'Rua AJ', '791', 'Apto 19', 'Bairro 34', 35),
	   ('Talita Martins', 'Rua AK', '234', 'Casa', 'Bairro 35', 36),
	   ('Wellington Souza', 'Rua AL', '567', 'Apto 20', 'Bairro 36', 37),
	   ('Renata Costa', 'Rua AM', '890', 'Casa', 'Bairro 37', 38),
	   ('Vinícius Ferreira', 'Rua AN', '123', 'Apto 21', 'Bairro 38', 39),
	   ('Aline Almeida', 'Rua AO', '456', 'Casa', 'Bairro 39', 40);

INSERT INTO Telefone (Cod_cliente, Celular, Residencial, Comercial, Recado) 
VALUES (1, '(11) 91234-5678', '(11) 1234-5678', '(11) 2345-6789', '(11) 3456-7890'),
(2, '(11) 91234-5679', '(11) 1234-5679', '(11) 2345-6790', '(11) 3456-7901'),
(3, '(21) 91234-5680', '(21) 1234-5680', '(21) 2345-6801', '(21) 3456-8012'),
(4, '(31) 91234-5681', '(31) 1234-5681', '(31) 2345-6812', '(31) 3456-8123'),
(5, '(71) 91234-5682', '(71) 1234-5682', '(71) 2345-6823', '(71) 3456-8234'),
(6, '(41) 91234-5683', '(41) 1234-5683', '(41) 2345-6834', '(41) 3456-8345'),
(7, '(48) 91234-5684', '(48) 1234-5684', '(48) 2345-6845', '(48) 3456-8456'),
(8, '(85) 91234-5685', '(85) 1234-5685', '(85) 2345-6856', '(85) 3456-8567'),
(9, '(81) 91234-5686', '(81) 1234-5686', '(81) 2345-6867', '(81) 3456-8678'),
(10, '(11) 91234-5687', '(11) 1234-5687', '(11) 2345-6878', '(11) 3456-8789'),
(11, '(21) 91234-5688', '(21) 1234-5688', '(21) 2345-6889', '(21) 3456-8890'),
(12, '(31) 91234-5689', '(31) 1234-5689', '(31) 2345-6890', '(31) 3456-8901'),
(13, '(41) 91234-5690', '(41) 1234-5690', '(41) 2345-6901', '(41) 3456-9012'),
(14, '(51) 91234-5691', '(51) 1234-5691', '(51) 2345-6912', '(51) 3456-9123'),
(15, '(61) 91234-5692', '(61) 1234-5692', '(61) 2345-6923', '(61) 3456-9234'),
(16, '(71) 91234-5693', '(71) 1234-5693', '(71) 2345-6934', '(71) 3456-9345'),
(17, '(81) 91234-5694', '(81) 1234-5694', '(81) 2345-6945', '(81) 3456-9456'),
(18, '(91) 91234-5695', '(91) 1234-5695', '(91) 2345-6956', '(91) 3456-9567'),
(19, '(11) 91234-5696', '(11) 1234-5696', '(11) 2345-6967', '(11) 3456-9678'),
(20, '(21) 91234-5697', '(21) 1234-5697', '(21) 2345-6978', '(21) 3456-9789'),
(21, '(31) 91234-5698', '(31) 1234-5698', '(31) 2345-6989', '(31) 3456-9890'),
(22, '(41) 91234-5699', '(41) 1234-5699', '(41) 2345-6990', '(41) 3456-9901'),
(23, '(51) 91234-5700', '(51) 1234-5700', '(51) 2345-7001', '(51) 3456-1002'),
(24, '(61) 91234-5701', '(61) 1234-5701', '(61) 2345-7012', '(61) 3456-2013'),
(25, '(71) 91234-5702', '(71) 1234-5702', '(71) 2345-7023', '(71) 3456-3024'),
(26, '(81) 91234-5703', '(81) 1234-5703', '(81) 2345-7034', '(81) 3456-4035'),
(27, '(91) 91234-5704', '(91) 1234-5704', '(91) 2345-7045', '(91) 3456-5046'),
(28, '(11) 91234-5705', '(11) 1234-5705', '(11) 2345-7056', '(11) 3456-6057'),
(29, '(21) 91234-5706', '(21) 1234-5706', '(21) 2345-7067', '(21) 3456-7068'),
(30, '(31) 91234-5707', '(31) 1234-5707', '(31) 2345-7078', '(31) 3456-8079'),
(31, '(41) 91234-5708', '(41) 1234-5708', '(41) 2345-7089', '(41) 3456-9080'),
(32, '(51) 91234-5709', '(51) 1234-5709', '(51) 2345-7090', '(51) 3456-0191'),
(33, '(61) 91234-5710', '(61) 1234-5710', '(61) 2345-7101', '(61) 3456-1292'),
(34, '(71) 91234-5711', '(71) 1234-5711', '(71) 2345-7112', '(71) 3456-2393'),
(35, '(81) 91234-5712', '(81) 1234-5712', '(81) 2345-7123', '(81) 3456-3494'),
(36, '(91) 91234-5713', '(91) 1234-5713', '(91) 2345-7134', '(91) 3456-4595'),
(37, '(11) 91234-5714', '(11) 1234-5714', '(11) 2345-7145', '(11) 3456-5696'),
(38, '(21) 91234-5715', '(21) 1234-5715', '(21) 2345-7156', '(21) 3456-6797'),
(39, '(31) 91234-5716', '(31) 1234-5716', '(31) 2345-7167', '(31) 3456-7898'),
(40, '(41) 91234-5717', '(41) 1234-5717', '(41) 2345-7178', '(41) 3456-8909');

INSERT INTO Tipo_Pgto (Descricao) 
VALUES ('Cartão de Crédito'),
	   ('Cartão de Débito'),
	   ('Dinheiro'),
	   ('Transferência Bancária'),
	   ('Boleto Bancário'),
	   ('PayPal'),
	   ('Pix'),
	   ('Financiamento'),
	   ('Cheque'),
	   ('Vale Presente');

INSERT INTO Forma_Pgto (Descricao, Cod_tipo) 
VALUES ('Visa', 1), 
	   ('Mastercard', 1), 
	   ('American Express', 1), 
	   ('Elo', 1), 
	   ('Hiper', 1), 
	   ('Banrisul', 2), 
	   ('Bradesco', 2), 
	   ('Itaú', 2), 
	   ('Caixa Econômica', 2), 
	   ('Banco do Brasil', 2), 
	   ('Transferência pelo App', 4), 
	   ('Transferência pelo Internet Banking', 4), 
	   ('Boleto à vista', 5), 
	   ('Boleto parcelado', 5), 
	   ('Pagamento pelo site', 6), 
	   ('Pagamento pelo App', 6), 
	   ('Pagamento via Pix', 7);

INSERT INTO Produtos (Descricao, Vlr_unitario) 
VALUES ('Smartphone Samsung Galaxy S21', 3999.99), 
	   ('Smartphone Apple iPhone 13', 6999.99), 
	   ('Notebook Dell Inspiron 15', 4999.99), 
	   ('Notebook Apple MacBook Air', 8999.99), 
	   ('Televisão LG 55" 4K', 2999.99), 
	   ('Cafeteira Nespresso', 699.99), 
	   ('Ferro de Passar a Vapor Philips', 299.99), 
	   ('Geladeira Brastemp Inverse', 3499.99), 
	   ('Micro-ondas Electrolux', 899.99), 
	   ('Liquidificador Philips Walita', 199.99), 
	   ('Ar-condicionado Consul', 2399.99), 
	   ('Aspirador de Pó Electrolux', 499.99), 
	   ('Máquina de Lavar Brastemp', 2399.99), 
	   ('Secadora de Roupas Samsung', 2999.99), 
	   ('Fritadeira Air Fryer Philco', 499.99), 
	   ('Câmera Fotográfica Canon', 2999.99), 
	   ('Drone DJI Mavic Air 2', 3999.99), 
	   ('Smartwatch Apple Watch Series 6', 3999.99), 
	   ('Fone de Ouvido Sony WH-1000XM4', 2499.99), 
	   ('Caixa de Som JBL Flip 5', 699.99), 
	   ('Roteador TP-Link Archer C6', 299.99), 
	   ('Console PlayStation 5', 4999.99), 
	   ('Console Xbox Series X', 4999.99), 
	   ('Game Control Logitech G', 199.99), 
	   ('Teclado Mecânico Redragon', 299.99), 
	   ('Mouse Gamer HyperX', 199.99), 
	   ('Monitor LG UltraWide', 1499.99), 
	   ('SSD Kingston 480GB', 399.99), 
	   ('HD Externo Seagate 1TB', 499.99), 
	   ('Pendrive SanDisk 64GB', 99.99), 
	   ('Bicicleta Caloi 10', 1599.99), 
	   ('Patins Roller', 399.99), 
	   ('Tênis Nike Air Max', 599.99), 
	   ('Bota Timberland', 899.99), 
	   ('Jaqueta Jeans Levi’s', 699.99), 
	   ('Camisa Polo Lacoste', 299.99), 
	   ('Vestido Feminino Forever 21', 199.99), 
	   ('Calça Jeans Diesel', 499.99), 
	   ('Roupa de Cama Santista', 199.99), 
	   ('Toalha de Banho Buddemeyer', 79.99), 
	   ('Jogo de Panelas Tramontina', 399.99), 
	   ('Talheres inox Brinox', 99.99), 
	   ('Prato de Porcelana Oxford', 49.99), 
	   ('Copo de Vidro Nadir Figueiredo', 19.99), 
	   ('Conjunto de Utensílios de Cozinha', 89.99), 
	   ('Ferro de Solda', 149.99);

INSERT INTO Nota_Fiscal (Cod_cliente, Data_emissao, Total_nota) 
VALUES 
(1, '2024-01-01 10:00:00', 14999.97),
(2, '2024-01-02 11:30:00', 26999.97),
(3, '2024-01-03 14:45:00', 999.98),
(4, '2024-02-04 09:15:00', 7899.97),
(5, '2024-02-05 16:30:00', 1099.96),
(6, '2024-02-06 12:00:00', 5299.97),
(7, '2024-03-07 13:20:00', 3499.98),
(8, '2024-03-08 15:40:00', 6999.97),
(9, '2024-04-09 17:00:00', 6499.98),
(10, '2024-04-10 08:50:00', 7199.97),
(11, '2024-04-11 10:30:00', 8999.97),
(12, '2024-05-12 11:00:00', 1199.97),
(13, '2024-05-13 14:15:00', 13999.98),
(14, '2024-05-14 15:05:00', 9499.97),
(15, '2024-06-15 12:30:00', 17499.97),
(16, '2024-06-16 09:45:00', 1999.98),
(17, '2024-06-17 13:10:00', 10499.98),
(18, '2024-07-18 14:20:00', 6499.97),
(19, '2024-07-19 10:15:00', 4499.97),
(20, '2024-07-20 16:50:00', 9999.97),
(21, '2024-08-21 09:00:00', 7699.98),
(22, '2024-08-22 10:20:00', 10499.97),
(23, '2024-09-23 14:35:00', 1249.97),
(24, '2024-09-24 15:00:00', 1499.98),
(25, '2024-09-25 13:30:00', 1899.97),
(26, '2024-09-26 12:10:00', 3299.97),
(27, '2024-09-27 16:00:00', 3799.96),
(28, '2024-09-28 11:15:00', 2149.97),
(29, '2024-09-29 09:50:00', 1899.97),
(30, '2024-10-01 10:05:00', 1999.98),
(31, '2024-10-02 15:25:00', 1899.97),
(32, '2024-10-03 14:55:00', 499.98),
(33, '2024-10-04 11:40:00', 1249.97),
(34, '2024-10-05 13:15:00', 699.98),
(35, '2024-10-06 10:45:00', 2599.97),
(36, '2024-11-01 12:30:00', 2299.98),
(37, '2024-11-01 14:25:00', 1599.97),
(38, '2024-11-02 09:30:00', 949.97),
(39, '2024-11-02 16:35:00', 699.98),
(40, '2024-11-03 11:00:00', 199.98);


INSERT INTO Cesta_Compras (Num_nota, Cod_produto, Cod_forma_pgto, Qtde_vendida) 
VALUES 
(1, 1, 1, 2),
(1, 2, 1, 1),
(1, 3, 1, 1),
(2, 4, 2, 3),
(2, 5, 2, 2),
(3, 6, 3, 1),
(3, 7, 3, 1),
(4, 8, 4, 2),
(4, 9, 4, 1),
(5, 10, 5, 3),
(5, 11, 5, 1),
(6, 12, 6, 1),
(6, 13, 6, 2),
(7, 14, 7, 1),
(7, 15, 7, 1),
(8, 16, 8, 2),
(8, 17, 8, 1),
(9, 18, 9, 1),
(9, 19, 9, 1),
(10, 20, 10, 2),
(10, 21, 10, 1),
(11, 22, 11, 3),
(11, 23, 11, 2),
(12, 24, 12, 1),
(12, 25, 12, 1),
(13, 26, 13, 2),
(13, 27, 13, 1),
(14, 28, 14, 1),
(14, 29, 14, 2),
(15, 30, 15, 3),
(15, 31, 15, 1),
(16, 32, 16, 1),
(16, 33, 16, 1),
(17, 34, 17, 2),
(17, 35, 17, 1),
(18, 36, 17, 1),
(18, 37, 17, 1),
(19, 38, 16, 2),
(19, 39, 15, 1),
(20, 40, 14, 3),
(20, 1, 13, 1),
(21, 2, 12, 1),
(21, 3, 11, 1),
(22, 4, 10, 3),
(22, 5, 9, 2);



SELECT * FROM Pais;
SELECT * FROM Estado;
SELECT * FROM Cidade;
SELECT * FROM Cliente;
SELECT * FROM Telefone;
SELECT * FROM Tipo_Pgto;
SELECT * FROM Forma_Pgto;
SELECT * FROM Produtos;
SELECT * FROM Nota_Fiscal;
SELECT * FROM Cesta_Compras;

-- Listar a última venda com todos os dados da nota fiscal OK

SELECT *
FROM Nota_Fiscal
ORDER BY Data_emissao DESC
LIMIT 1;


-- Mostrar todos os clientes com seus dados de endereço e telefone, agrupados por cidade 
    
    SELECT 
    GROUP_CONCAT(Nome ORDER BY Nome) AS Clientes,
    GROUP_CONCAT(Logradouro ORDER BY Nome) AS Logradouros,
    GROUP_CONCAT(Numero ORDER BY Nome) AS Numeros,
    GROUP_CONCAT(Complemento ORDER BY Nome) AS Complementos,
    GROUP_CONCAT(Bairro ORDER BY Nome) AS Bairros,
    Cod_cidade,
    (SELECT Nome FROM Cidade WHERE Cod_cidade = Cliente.Cod_cidade) AS Nome_cidade
FROM 
    Cliente
GROUP BY 
    Cod_cidade;

-- Listar todas as vendas à vista: Vamos supor que o código ou descrição da forma de pagamento à vista seja 'VISTA'.  OK


SELECT 
    cc.*, 
    (SELECT fp.Descricao 
     FROM Forma_Pgto fp 
     WHERE fp.Cod_forma_pgto = cc.Cod_forma_pgto
    ) AS Descricao_Forma_Pgto
FROM 
    Cesta_Compras cc
WHERE 
    cc.Cod_forma_pgto IN (
        SELECT Cod_forma_pgto
        FROM Forma_Pgto
        WHERE Descricao IN ('Transferência pelo App', 'Boleto à vista', 'Pagamento via Pix')
    );



-- Mostrar o produto mais vendido OK

SELECT 
    Cod_produto,
    Descricao,
    (SELECT SUM(Qtde_vendida) 
     FROM Cesta_Compras 
     WHERE Cesta_Compras.Cod_produto = Produtos.Cod_produto) AS Total_vendido
FROM Produtos
ORDER BY Total_vendido DESC
LIMIT 1;

-- Mostrar o cliente que mais comprou nos últimos seis meses: 
-- Considerando que a data atual seja '2024-10-30', você pode ajustar a data conforme necessário. OK

SELECT 
    (SELECT c.Nome 
     FROM Cliente c 
     WHERE c.Cod_cliente = nf.Cod_cliente
    ) AS Nome_Cliente,
    SUM(nf.Total_nota) AS Total_Compras
FROM 
    Nota_Fiscal nf
WHERE 
    nf.Data_emissao >= CURDATE() - INTERVAL 6 MONTH
GROUP BY 
    nf.Cod_cliente
ORDER BY 
    Total_Compras DESC
LIMIT 1;
