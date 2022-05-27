class PerfilPage {

    inputEmail = 'input[placeholder="Nome"]';
    inputNome = 'input[placeholder="E-mail"]';

    atualizarEmail(email) {
        this.apagarEmail();
        cy.get(this.inputEmail).type(email);
    }

    atualizarNome(nome) {
        this.apagarNome();
        cy.get(this.inputNome).clear().type(nome);
    }

    apagarEmail() {
        cy.get(this.inputEmail).clear();
    }

    apagarNome() {
        cy.get(this.inputNome).clear();
    }

    confirmarAlteracoes() {
        cy.contains("Confirmar alterações").click();
        cy.contains("Confirmar").click();
    }

    interceptEmailExistente() {
        cy.intercept('PUT', baseUrl + '/users', {
            statusCode: 422,
            body: {
                "error": "User already exists."
            }
        })
    }

    interceptEmailInvalido() {
        cy.intercept('PUT', baseUrl + '/users', {
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
}

export var perfil_Page = new PerfilPage();