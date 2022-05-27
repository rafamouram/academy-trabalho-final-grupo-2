class gestaoListaDeComprasPage {

    inputNameLista = "input[name='description']"
    inputNameItem =  "input[name='name']"
    inputQuantidadeDoItem = "input[name='amount']"
    formularioItens = "form.fLnju"
    buttonHistorico = "[href='/historico']"
    buttonR = ".cvtYsR"
    buttonMenu = ".bgBaRw"
    
    visitarPagina() {
        cy.visit('');
    }
    preencherNomeDaLista(descricao) {
        cy.get(this.inputNameItem).should('be.visible');
        cy.get(this.inputNameLista).type(descricao);
    };

    formulario() {
        cy.get(this.formularioItens).should('be.visible');
    };
    
    preencherNomeDoItem(nome) {
        cy.get(this.inputNameItem).should('be.visible');
        cy.get(this.inputNameItem).type(nome);
    };

    preencherQuantidadeDoItem(quantidade) {
        cy.get(this.inputQuantidadeDoItem).should('be.visible')
        cy.get(this.inputQuantidadeDoItem).type(quantidade);
    };

    AdicionarItemNaLista() {
        cy.contains("button", "+").should('be.visible');
        cy.contains("button", "+").click();    
    };

    clicarBotaoSalvar() {
        cy.contains('button', 'Salvar').click();
    };

    BotaoFinalizarLista() {
        cy.contains('button', 'Finalizar a lista').should('be.visible');
        cy.contains('button', 'Finalizar a lista').click();
    };

    clicarMenu() {
        cy.get(this.buttonMenu).click();
    };

}

export var gestaoListaDeCompras = new gestaoListaDeComprasPage();