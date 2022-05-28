// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add('interceptCadastrarUsuario', () =>
    cy.intercept("POST", "https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 201,
        body: {
            "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            "name": "Quebradores de API",
            "email": "quebradores@gmail.com",
            "is_admin": false
        }
    })
);

Cypress.Commands.add('interceptLogin', () =>
    cy.intercept('POST', 'https://lista-compras-api.herokuapp.com/api/v1/auth/login', {
        statusCode: 200,
        body: {
            "auth": true,
            "session": {
                "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpZCI6IjBmOTViMmFiLTgyMjgtNDRlNy1hYjFiLTExNjI5MzI5ZDIxOSIsImlzX2FkbWluIjpmYWxzZSwiZW1haWwiOiJicnVub0BnbWFpbC5jb20iLCJkYXRlQ3JlYXRlZCI6MTY1MzY2MDY0NjEzMywiaXNzdWVkIjoxNjUzNjYwNjQ2MTMzLCJleHBpcmVzIjoxNjUzNjYxNTQ2MTMzfQ.ENVZ4CRfC7lGqnMX6RqT4MGK4ihEvzuDIxBYrgC2p6jkMtvygM3OIKeaZwVSf7UDU7y7LuVLN5yNGb2cduZQGQ",
                "issued": 1642697242447,
                "expires": 1642697242447
            }
        }
    })
);

Cypress.Commands.add('visualizarMensagem', (mensagem) => {
    cy.contains(mensagem).should("be.visible");
});