class ListaPage {
    acessarTelaPerfil() {
        cy.contains('Lembra Compras').click();
        cy.get('.bgBaRw').click({ force: true });
        cy.contains('Perfil').click();
        cy.wait(1000);
    }
}
export var lista_Page = new ListaPage();