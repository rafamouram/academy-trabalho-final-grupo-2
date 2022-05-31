class HistoricoListaCompra {

    historicoListas() {
            
        cy.intercept("GET", "https://lista-compras-api.herokuapp.com/api/v1/list/history", {
            statusCode: 200,
            fixture: "lista/historicoLista.json"
            
        });
    }

    historicoItemLista() {
        cy.intercept("GET", "https://lista-compras-api.herokuapp.com/api/v1/list/history/f25ad705-c4df-4854-9a3c-7a8870e9e578", {
            statusCode: 200,
            fixture: "lista/historicoItemLista.json"
        });
    }

}
export var historicoListaCompra = new HistoricoListaCompra();