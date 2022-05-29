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
// cy.intercept('POST', 'https://lista-compras-api.herokuapp.com/api/v1/auth/login', {
//         statusCode: 200,
//         body: { "auth": true,
//                 "session": {
//                 "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpZCI6IjRkMjUxNGQ4LTlkNjAtNGFjYS1hMzg5LTA2OThiNTMzYmZjMSIsImlzX2FkbWluIjpmYWxzZSwiZW1haWwiOiJicnVub0BnbWFpbC5jb20iLCJkYXRlQ3JlYXRlZCI6MTY1MzY5OTk3NzEyNCwiaXNzdWVkIjoxNjUzNjk5OTc3MTI0LCJleHBpcmVzIjoxNjUzNzAwODc3MTI0fQ.QnDh8gjjMxPQAlIHBB5EYNkOcgpCIhJ2fwjZhTsgyUt8G0Bj9NODerRgfGJeLFRkWOVmVWuYjp46oht0Z8VCaA",
//                 "issued": 1642697242447,
//                 "expires": 1642697242447 }}
//     })       
