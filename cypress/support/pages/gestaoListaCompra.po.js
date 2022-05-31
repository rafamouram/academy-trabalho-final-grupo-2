class gestaoListaDeComprasPage {

    inputNameLista = "input[name='description']"
    inputNameItem =  "input[name='name']"
    inputQuantidadeDoItem = "input[name='amount']"
    formularioItens = "form.fLnju"
    buttonHistorico = "[href='/historico']"
    buttonR = ".cvtYsR"
    buttonMenu = ".bgBaRw"
    checkbox = "[type='checkbox']"
    
    visitarPagina() {
        cy.visit('' + 'login'); 
    }

    deslogarDoSite() {
        cy.get('.bgBaRw').click({ force: true });
        cy.contains('Sair').click({ force: true });
    }
    
    preencherNomeDaLista(descricao) {
        cy.get(this.inputNameLista).click().type(descricao);
         
    };
    
    preencherNomeDoItem(nome) {
        cy.get(this.inputNameItem).click().type(nome);
    };

    preencherQuantidadeDoItem(quantidade) {
        cy.get(this.inputQuantidadeDoItem).clear().type(quantidade);
    };

    botaoAdicionarItem() {
        cy.contains("button", "+").should('be.visible');  
    }; 
    
    clicarAdicionarItem() {
        cy.contains("button", "+").click({force: true});    
    };

    clicarBotaoSalvar() {
        cy.contains('button', 'Salvar').click();   
    };

    botaoFinalizarLista() {
        cy.contains('button', 'Finalizar a lista').should('be.visible');
    };

    clicarFinalizarLista() {
        cy.contains('button', 'Finalizar a lista').click();   
    };
    
    modalFinalizarLista() {
        cy.contains('p', 'Deseja realmente finalizar a lista de compras ?').should('be.visible');
        cy.get('.lcjWUB').should('be.visible');
    }
    
    confirmarFinalizarNoFim() {
        cy.contains('button', 'Confirmar').click({force: true});
        cy.wait(3000);
    }
    
    confirmarFinalizarLista() {
        cy.contains('button', 'Confirmar').click({force: true});
    }
    
    clicarMenu() {
        cy.get(this.buttonMenu).click();
    };

    mensagemListaCriadaComSucesso(mensagem) {
        cy.contains(mensagem).should('be.visible');
    }

    riscarItemNaLista() {
        cy.get(this.checkbox).should('be.visible');
    };
    
    marcarItemNaLista() {
        cy.get(this.checkbox).click({multiple: true})
    };
    
    mensagemDeErro(mensagem) {
        cy.contains(mensagem).should('be.visible');   
    }

    quantidadeDoItem() {
        cy.contains('3'+ 'x - '+ 'arroz 5kg').should('be.visible');
    };

}


export var gestaoListaDeCompras = new gestaoListaDeComprasPage();