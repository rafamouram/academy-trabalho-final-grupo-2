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
        cy.get('.iMjKmA').contains("Confirmar").click();
    }

    interceptEmailExistente() {
        cy.intercept('PUT', 'https://lista-compras-api.herokuapp.com/api/v1/users', {
            statusCode: 422,
            body: {
                "error": "E-mail already in use."
            }
        })
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

    confirmarAlteracoesMeio1() {
        cy.contains("Confirmar alterações").click();
    }

    confirmarAlteracoesMeio2() {
        cy.get('.iMjKmA').contains("Confirmar").click();
    }

    interceptEmailValido() {
        cy.intercept('PUT', 'https://lista-compras-api.herokuapp.com/api/v1/users', {
            statusCode: 200
        })
    }
}

export var perfil_Page = new PerfilPage();
