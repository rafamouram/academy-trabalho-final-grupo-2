class PerfilPage {

    inputEmail = 'input[placeholder="E-mail"]';
    inputNome = 'input[placeholder="Nome"]';

    atualizarEmail(email) {
        this.apagarEmail();
        cy.get(this.inputEmail).type(email.email);
    }

    atualizarNome(nome) {
        this.apagarNome();
        cy.get(this.inputNome).clear().type(nome.nome);
    }

    atualizarNomeEspacos() {
        this.apagarNome();
        cy.get(this.inputNome).clear().type("    ");
    }


    apagarEmail() {
        cy.get(this.inputEmail).clear();
    }

    apagarNome() {
        cy.get(this.inputNome).clear();
    }

    confirmarAlteracoes() {
        cy.contains("Confirmar alterações").click();
        cy.get('.iMjKmA').contains("Confirmar").click({ force: true });
    }

    interceptEmailInvalido() {
        cy.intercept('PUT', 'https: //lista-compras-api.herokuapp.com/api/v1/users', {
            statusCode: 404,
            body: {
                "error": "Bad request."
            }
        })
    }

    interceptNomeInvalido() {
        cy.intercept('PUT', baseUrl + '/users', {
            statusCode: 404,
            body: {
                "error": "Bad request."
            }
        })
    }

    deslogarDoSite() {
        cy.get('.bgBaRw').click({ force: true });
        cy.contains('Sair').click({ force: true });
        cy.wait(1000);
    }

    interceptEmailValido() {
        cy.intercept('PUT', 'https://lista-compras-api.herokuapp.com/api/v1/users', {
            statusCode: 200
        })
    }
}

export var perfil_Page = new PerfilPage();