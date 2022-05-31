class loginPage {
    inputEmail = "[name='email']";
    inputSenha = "[name='password']";

    preenchoDadosLogin(email, senha) {
        cy.get(this.inputEmail).type(email);
        cy.get(this.inputSenha).type(senha);
    }

    clicarBotaoEntrar() {
        cy.contains("Entrar").click();
    }

    acessarTelaCadastrar() {
        cy.contains("Registre-se").click();
    }

    acesso() {
        cy.visit("https://academy-lembra-compras.herokuapp.com/login");
    }
}

export var login_Page = new loginPage();