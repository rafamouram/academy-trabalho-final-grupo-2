class ListaPage {
    acessarTelaPerfil() {
        cy.contains('Dê um nome para sua lista').click();
        cy.get('.bgBaRw').click({ force: true });
        cy.contains('Perfil').click();
        cy.wait(1000);
    }
}
export var lista_Page = new ListaPage();