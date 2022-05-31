# Raro Academy - Trabalho Final - Grupo 2 - Quebradores de API


<h4 align="center"> 
	🚧  Testes Lembra Compras - Raro Labs 🚧
</h4>

<p align="center">
 <a href="#-sobre-o-projeto">Sobre</a> •
 <a href="#-documentação">Documentação</a> •
 <a href="#-como-executar-o-projeto">Como executar</a> • 
 <a href="#-contribuidores">Contribuidores</a> • 
  <a href="#-bibliografias">Bibliografia</a> • 
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

## Como executar o projeto

Este projeto é planejado para rodar em dois softwares de testes automáticos:

	- Cypress-Cucumber-Preprocessor
	
	- Karate

### Pré-requisitos

Antes de começar, será necessário ter instalado na sua máquina as seguintes ferramentas:

	[Git](https://git-scm.com);
	
	[Java](https://www.oracle.com/br/java/technologies/javase/javase8-archive-downloads.html);
	
	[Karate](https://github.com/karatelabs/karate/releases);
	
	[Node.js](https://nodejs.org/en/). 
	
Além disto é bom ter um editor para trabalhar com o código. Exemplo: [VSCode](https://code.visualstudio.com/)

#### 🎲 Rodando o Cypress-Cucumber-Preprocessor

```bash

# Clone este repositório
$ git clone git@github.com:Joaopdev/Inventario-Raro.git

# Vá para a pasta server
$ cd "pasta do projeto"

# Instale as dependências
$ npm init
$ npm install cypress
$ npm install cypress-cucumber-preprocessor

# Execute a aplicação
$ npx cypress open

```

#### 🎲 Rodando o Karate

```bash

# Clone este repositório
$ git clone git@github.com:Joaopdev/Inventario-Raro.git

# Vá para a pasta server
$ cd karate

# Utilizar as dependências
$ colocar o arquivo karate.jar na pasta em questão

# Execute todas as features
$ java -jar karate.jar *.feature


```

---

## 🦸 Autores

-   
-   **[Anna Clara](https://github.com/Noimesa)**
-   **[Breno Gonçalves](https://github.com/brenodgoncalves)**
-   **[Bruno Mateus](https://github.com/MateusLandim96)**
-   **[Francisco Santos](https://github.com/fcosants)**
-   **[Rafael Moura](https://github.com/rafamouram)**

 
 
---

## Bibliografia


- Documentação do cypress-cucumber-pre-processor: [cypress-cucumber-pre-processor](https://www.npmjs.com/package/cypress-cucumber-preprocessor#before-and-after-hooks);

- Documentação do karate: [karate](https://github.com/karatelabs/karate)

- Documentação do cypress: [cypress](https://docs.cypress.io/guides/overview/why-cypress)

- Github do professor Iury Oliveira com relação ao Cypress: [link](https://github.com/iuryoliveira/teste-cypress-academy)

- Github do professor Bernardo Cruz: [link](https://github.com/cruzbernardo/Inventario-Raro-)

---
