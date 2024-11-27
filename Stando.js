const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 3000;


const db = mysql.createConnection({
    host: 'localhost',
    user: 'root', 
    password: 'sua_senha', 
    database: 'loja_stands'
});


db.connect(err => {
    if (err) {
        console.log('Erro ao conectar ao banco de dados:', err);
    } else {
        console.log('Conectado ao banco de dados');
    }
});


app.use(bodyParser.json());


app.post('/api/carrinho', (req, res) => {
    const carrinho = req.body;

    carrinho.forEach(item => {
        const { nome, preco, quantidade, total } = item;


        const query = 'INSERT INTO pedidos (nome, preco, quantidade, total) VALUES (?, ?, ?, ?)';
        db.query(query, [nome, preco, quantidade, total], (err, result) => {
            if (err) {
                console.error('Erro ao salvar pedido:', err);
                return res.status(500).send('Erro ao salvar pedido');
            }
        });
    });

    res.status(200).send({ message: 'Carrinho salvo com sucesso!' });
});


app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
});

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/produtos')
        .then(response => response.json())
        .then(data => {
            const listaProdutos = document.getElementById('listaProdutos');
            data.forEach(produto => {
                listaProdutos.innerHTML += `
                    <div class="produto" id="produto${produto.id}">
                        <img src="${produto.imagem_url}" alt="${produto.nome}">
                        <h3>${produto.nome}</h3>
                        <p>Preço: R$ ${produto.preco.toFixed(2)}</p>
                        <label for="quantidade${produto.id}">Quantidade: </label>
                        <input type="number" id="quantidade${produto.id}" name="quantidade" min="1" max="${produto.estoque}">
                        <button class="adicionar" onclick="adicionarCarrinho(${produto.id}, '${produto.nome}', ${produto.preco})">Adicionar ao Carrinho</button>
                    </div>
                `;
            });
        })
        .catch(error => {
            console.error('Erro ao carregar produtos:', error);
        });
});



