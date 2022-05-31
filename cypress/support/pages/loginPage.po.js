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
}

export var login_Page = new loginPage();