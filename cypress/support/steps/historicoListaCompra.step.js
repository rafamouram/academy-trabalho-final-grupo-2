import { historicoListaCompra } from "../pages/historicoListaCompra.po";

//Background: Acessar e logar no site
    Given("acessei o site Lembra Compras", ()=>{

    });

    And("loguei no site", ()=>{

    });
    
    And("acessei o histórico", ()=>{
        historicoListaCompra.historicoListas();
        cy.get("[href='/historico']").click();
    });

    And("visualizo o nome e data de criação da lista", (tabela)=>{
        var dadosTabela = tabela.rowsHash();
        cy.contains(dadosTabela.descricao).should("be.visible");
        cy.contains("Criada em:").should("be.visible");
    });

//Scenario: É possível visualizar apenas as 10 listas mais recentes no histórico
    Then("visualizo o histórico com apenas as 10 listas mais recentes", ()=>{
        cy.get(".kUIcKA").should("have.length", 10);
    });

    
    When("clico na lista de compras do histórico", () => {
        historicoListaCompra.historicoItemLista();
        cy.contains("Criada").click();
    });

    
    Then("visualizo o nome da lista e os itens dentro desta", (tabela) => {
        var dadosTabela = tabela.rowsHash();
        cy.contains(dadosTabela.item).should("be.visible");
        cy.contains(dadosTabela.quantidade).should("be.visible");
    });

    

