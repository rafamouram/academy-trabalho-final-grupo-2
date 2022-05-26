Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acessar a tela de perfil
        
        * def payloadCadastro = call read("hook.feature@CadastrarUsuario")
        * def userConta = payloadCadastro.response.email
        * def payloadLogar = call read("hook.feature@LoginUsuario")
        * def tokenUser = payloadLogar.response.session.token 
        
        Given url baseUrl
        And path "users"
        
        Scenario: Atualizar email do usuário com sucesso
            * def emailAtualizado = Date.now().toString()+"@gmail.com"
            
            Given header X-JWT-Token = tokenUser 
            And request { name: "#(payloadCadastro.response.name)", email: "#(emailAtualizado)" }
            When method PUT
            Then status 200
            And match response == "#object"

        Scenario: Atualizar nome do usuário com sucesso
           
            
            Given header X-JWT-Token = tokenUser 
            And request { name: "bruno", email: "#(usuario.response.email)" }
            When method PUT
            Then status 200
            And match response == "#object"

            
            
            

            

        

        



    