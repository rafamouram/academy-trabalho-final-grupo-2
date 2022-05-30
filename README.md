# academy-trabalho-final-grupo-2


<h4 align="center"> 
	🚧  Testes Lembra Compras - Raro Labs  📋  Em desenvolvimento 🚧
</h4>

<p align="center">
 <a href="#-sobre-o-projeto">Sobre</a> •
 <a href="#-funcionalidades">Funcionalidades</a> •
 <a href="#-como-executar-o-projeto">Como executar</a> • 
 <a href="#-tecnologias">Tecnologias</a> • 
 <a href="#-contribuidores">Contribuidores</a> • 
 <a href="#user-content--licença">Licença</a>
</p>


##  Sobre o projeto

O projeto em questão visa testar o site "Lembra Compras"

Para testar o site usaremos de 2 sotwares principais, sendo eles o "Karate" e o "Cypress", além de um "BDD" que ajudará no auxílio dos testes do "Cypress"

Com o projeto, buscamos fazer um teste de ponta a ponta do site "Lembra Compras" em questão, analisando seu funcionamento quanto ao Backend e API

---

##  Documentação
O site "Lembra Compras" pode ser acessado através do [link](https://academy-lembra-compras.herokuapp.com/login)
A especificação do site em questão utilizada para a realização deste processo pode ser encontrada através do [link](https://docs.google.com/document/d/1JCq21JY4ILUt2Rnv86ckkWz5N8xh6n5c1aTG42OeyKg/edit?usp=sharing)
A documentação da api pode ser encontrada no swagger neste [link](https://crud-api-academy.herokuapp.com/api-docs/#/)

---

## Funcionalidades

- [x] O Administrador pode criar, atualizar,deletar um usuário do sistema:
- [x] O Usuário faz login no sistema e se autentica.
- [x] O Usuário pode criar, editar, atualizar e deletar um colaborador no banco de dados:
  - [x] cadastra nome do colaborador;
  - [x] cadastra e-mail (único);
  - [x] cadastra telefone (único);
  - [x] e o endereço que o colaborador deverá receber os equipamentos;
	- [x] a aplicação buscará, via api externa, os dados do CEP informado e retornará o endreço completo do colaborador;

- [x] O Usuário pode criar, atualizar um novo tipo de equipamento, que servirá como um rótulo e controle do equipamento:
  - [x] cadastra o tipo do equipamento;
  - [x] cadastra o seu modelo (único);
  - [x] cadastra os parametros desse tipo:
    - [x] cadastra o tempo medio de envio;
    - [x] cadastra o tempo medio de consumo;
    - [x] cadastra o tempo médio de resposição;
    - [x] cadastra a quantidade critica;
  - [x] um log automático de entrada é gerado na tabela de movimentação
  - [x] a quantidade critica é comparada a quantidade que vem como 0 por default, essa é acrescida a medida que se cria Equipamentos. Um API externa, Sendgrid, é responsavel por enviar um email a todos adminstradores caso a quantidade chegue a ser critica.

- [x] O Usuário pode criar, atualizar e deletar um novo equipamento:
  - [x] cadastra o lote: string;
  - [x] cadastra o descricao: string;
  - [x] cadastra o numero de serie(único);
  - [x] cadastra a data de aquisicao;
  - [x] cadastra o id do tipo de equipamento;
  - [x] um log automático de entrada é gerado na tabela de movimentação para esse equipamento e a quantidade do tipo Equipamento é acrescida em 1;

- [x] O Usuário pode deletar o equipamento
  - [x] um log automático de saida é gerado na tabela de movimentação para esse equipamento e a quantidade do tipo Equipamento é decrescida em 1;

- [x] O Usuário pode atribuir um equipamento a um colaborador
 - [x] cadastra uma movimentacao de envio do usuario para colaborador, a quantidade do tipo Equipamento é decrescida em 1;

- [x] O Usuário pode receber um equipamento do colaborador
 - [x] cadastra uma movimentacao de devolucao do usuario para colaborador, a quantidade do tipo Equipamento é acrescida em 1;

- [x] O Usuário pode criar, atualizar e remover uma movimentação
  - [x] filtra as movimentações por equipamento, por colaborador ou por tipo de movimentação
  - [x] movimentação pode ser atualizada com a data de chegada do Equipamento em caso de envio e devolução


---

## Como executar o projeto

Este projeto está implementado somente no Backend, no momento, rodando na pasta  

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Node.js](https://nodejs.org/en/). 
Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)

#### 🎲 Rodando o Backend.

```bash

# Clone este repositório
$ git clone git@github.com:Joaopdev/Inventario-Raro.git

# Vá para a pasta server
$ cd server

# Instale as dependências
$ npm install

# Execute a aplicação em modo de desenvolvimento
$ npm run dev

# O servidor inciará na porta:3000 - acesse http://localhost:3000 

```

---

## 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:



#### [](https://github.com/Joaopdev/Inventario-Raro)**Server**  ([NodeJS](https://nodejs.org/en/)  +  [TypeScript](https://www.typescriptlang.org/))

-   **[Axios](https://axios-http.com/docs/intro)**
-   **[CORS](https://expressjs.com/en/resources/middleware/cors.html)**
-   **[dotENV](https://github.com/motdotla/dotenv)**
-   **[Express](https://expressjs.com/)**
-   **[Faker](https://github.com/marak/Faker.js/)**
-   **[JWT](https://github.com/auth0/node-jsonwebtoken)**
-   **[MariaDB](https://mariadb.org/)**
-   **[Morgan](https://www.npmjs.com/package/morgan)**
-   **[MySQL](https://www.mysql.com/)**
-   **[Node-Fetch](https://github.com/node-fetch/node-fetch)**
-   **[Reflect-Metadata](https://github.com/rbuckton/reflect-metadata)**
-   **[Sendgrid](https://github.com/sendgrid/sendgrid-nodejs/)**
-   **[Ts-node](https://github.com/TypeStrong/ts-node)**
-   **[TypeDi](https://docs.typestack.community/typedi/v/develop/01-getting-started)**
-   **[TypeOrm](https://typeorm.io/)**

> Veja o arquivo  [package.json](hhttps://github.com/Joaopdev/Inventario-Raro/blob/refinamento_README/package.json)



#### [](https://github.com/Joaopdev/Inventario-Raro)**Utilitários**
-   API:  **[VIA CEP API](viacep.com.br/ws/01001000/json/)**
-   API: **[Sendgrid](https://sendgrid.api-docs.io/v3.0/mail-send/v3-mail-send)**

-   Teste de API:  **[Insomnia](https://insomnia.rest/)**

---

## 🦸 Autores

-   **[Bernardo Cruz](https://github.com/cruzbernardo)**
-   **[Gabriel Correa](https://github.com/GabsVasc)**
-   **[Jackson Luan](https://github.com/JacksonLRD)**
-   **[João Paulo](https://github.com/Joaopdev)**

 

---

## 📝 Licença

Este projeto esta sobe a licença [MIT](./LICENSE).

---
