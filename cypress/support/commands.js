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
                "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpZCI6IjRkMjUxNGQ4LTlkNjAtNGFjYS1hMzg5LTA2OThiNTMzYmZjMSIsImlzX2FkbWluIjpmYWxzZSwiZW1haWwiOiJicnVub0BnbWFpbC5jb20iLCJkYXRlQ3JlYXRlZCI6MTY1MzY5OTk3NzEyNCwiaXNzdWVkIjoxNjUzNjk5OTc3MTI0LCJleHBpcmVzIjoxNjUzNzAwODc3MTI0fQ.QnDh8gjjMxPQAlIHBB5EYNkOcgpCIhJ2fwjZhTsgyUt8G0Bj9NODerRgfGJeLFRkWOVmVWuYjp46oht0Z8VCaA",
                "issued": 1642697242447,
                "expires": 1642697242447
            }
        }
    })
);

Cypress.Commands.add('inteceptListaVazia', () =>
    cy.intercept('GET', 'https://lista-compras-api.herokuapp.com/api/v1/list', {
        statusCode: 200,
        body: []
    })
);

Cypress.Commands.add('interceptLista', () =>
    cy.intercept('GET', 'https://lista-compras-api.herokuapp.com/api/v1/list', {
        statusCode: 200,
        body: {
            "description": "Compras da semana",
            "items": [{
                "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                "listId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                "name": "iorgute 1L",
                "amount": 1,
                "createdAt": "2022-05-28T17:27:52.368Z",
                "updatedAt": "2022-05-28T17:27:52.368Z"
            }]
        }
    })
)

Cypress.Commands.add('interceptAddItem', () =>
    cy.intercept('POST', 'https://lista-compras-api.herokuapp.com/api/v1/list/item', {
        statusCode: 201,

    })

)

Cypress.Commands.add('visualizarMensagem', (mensagem) => {
    cy.contains(mensagem).should("be.visible");
});