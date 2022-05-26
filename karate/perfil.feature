Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acessar a tela de perfil
        
        * def usuario = call read("hook.feature@CadastrarUsuario")
        * def userConta = usuario.response.email
        * def payloadLogar = call read("hook.feature@LoginUsuario")
        * def tokenUser = payloadLogar.response.session.token 
        
        Given url baseUrl
        And path "users"
        #@ignore 
        Scenario: Atualizar email do usuário com sucesso
            * def emailAtualizado = Date.now().toString()+"@gmail.com"
            
            Given header X-JWT-Token = tokenUser 
            And request { name: "#(usuario.response.name)", email: "#(emailAtualizado)" }
            When method PUT
            Then status 200
            And match response == "#object" 
            And match response contains {id: #string, name: "#(usuario.response.name)", email: "#(emailAtualizado)", is_admin: #boolean, createdAt: #string, updatedAt: #string }
        #@ignore
        Scenario: Atualizar nome do usuário com sucesso
            * def nomeAtualizado = "bruno"
            
            Given header X-JWT-Token = tokenUser 
            And request { name: "#(nomeAtualizado)", email: "#(userConta)" }
            When method PUT
            Then status 200
            And match response == "#object"
            And match response contains {id: #string, name: "#(nomeAtualizado)", email: "#(userConta)", is_admin: #boolean, createdAt: #string, updatedAt: #string }
        #@ignore
        Scenario: Não é possível atualizar o email para um email existente   
            * def usuario2 = call read("hook.feature@CadastrarUsuario")

            Given header X-JWT-Token = tokenUser 
            And request { name: "#(usuario.response.name)", email: "#(usuario2.response.email)" }
            When method PUT
            Then status 422
            And match response == "#object" 
            And match response contains { error: E-mail already in use. }
        #@ignore # Erro da API - status code esperado = 400, status code obtido = 200
        Scenario: Não deve ser possível atualizar o nome para que tenha mais de 100 caracteres.    
            Given header X-JWT-Token = tokenUser 
            And request { name: brunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobruno, email: "#(userConta)" }
            When method PUT
            Then status 400
            And match response == "#object" 
            And match response contains { error: Bad request. }
        #@ignore
        Scenario: Não deve ser possível atualizar o email para que tenha mais de 60 caracteres.   
            Given header X-JWT-Token = tokenUser 
            And request { name: "#(usuario.response.name)", email: "brunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobruno@gmail.com" }  
            When method PUT
            Then status 400
            And match response == "#object" 
            And match response contains { error: Bad request. }
        #@ignore
        Scenario Outline: Não deve ser possível atualizar o email utilizando formatos inválidos.     
            Given header X-JWT-Token = tokenUser
            And request { name: "#(usuario.response.name)", email: <emailInvalido> }  
            When method PUT
            Then status 400
            And match response == "#object" 
            And match response contains { error: Bad request. }
            Examples:
                | emailInvalido       |
                | bruno@@.com         |
                | bruno@gmailcombr    |
                | bruno.com           |
                | ###@gmail.com/raro  | 
        #@ignore
        Scenario: Tentar atualizar sem preencher os campos de nome e email
            Given header X-JWT-Token = tokenUser 
            And request { name: "", email: "" }
            When method PUT
            Then status 400
            And match response == "#object" 
            And match response contains { error: Bad request.}    
        #@ignore
        Scenario: Usuário deve estar logado para atualizar suas informações
            * def usuarioId = usuario.response.id
            * def payloadId = { id: "#(usuarioId)", name: "#(usuario.response.name)", email: "#(userConta)", is_admin: "#boolean", createdAt: "#string", updatedAt: "#string" }
            
            Given path usuarioId
            And header X-JWT-Token = tokenUser
            When method GET
            Then status 200
            And match response == "#object" 
            And match response contains payloadId
        #@ignore 
        Scenario: Usuário com token inválido de acesso
            * def usuarioId = usuario.response.id  
            
            Given path usuarioId
            And header X-JWT-Token = tokenUser + "12"
            When method GET
            Then status 401
            And match response == "#object" 
        
        




            


            






            

            

        

        



    