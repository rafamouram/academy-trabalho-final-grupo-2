Feature: Perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acessar a tela de perfil
        Given url baseUrl
        And path "users"  
 
        * def payloadCadastro = call read("hook.feature@cadastro")
        * def userConta = payloadCadastro.response.email
        * def payloadLogar = call read("hook.feature@logar")
        
        Scenario: Atualizar email do usuário
        

        



    