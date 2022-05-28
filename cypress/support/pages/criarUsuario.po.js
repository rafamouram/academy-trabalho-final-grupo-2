class CriarUsuario {
    formName = "[name='name']"
    formEmail = "[name='email']"
    formPassword = "[name='password']"
    formConfirmPassword = "[name='confirmPassword']"

    acesso(){
        cy.visit("https://academy-lembra-compras.herokuapp.com/login");
    }

    validarPagLogin(){
        cy.get(this.formEmail).should('exist')
        cy.get(this.formPassword).should('exist')
        cy.contains("Entrar").should('exist')
        cy.contains("Registre-se").should('exist')
    }

    preencherCampos(name,email,password,confirmPassword){
        cy.get(this.formName).type(name)
        cy.get(this.formEmail).type(email)
        cy.get(this.formPassword).type(password)
        cy.get(this.formConfirmPassword).type(confirmPassword)
    }

    usuarioCadastrado(){
        cy.intercept("POST","https://lista-compras-api.herokuapp.com/api/v1/users",{
            statusCode: 201,
            body: [{
                id:"22c01f9c-debb-411d-81f5-d7ab12e78a7d",
                name:"Quebradores de API",
                email:"grupo2@raro.lab",
                is_admin:false
            }]
        });
    }

    usuarioExistente(){
        cy.intercept("POST","https://lista-compras-api.herokuapp.com/api/v1/users",{
            statusCode: 422,
            body: [{
                error:"User already exists."
            }]
        });
    }

}

export var criarUsuario = new CriarUsuario();