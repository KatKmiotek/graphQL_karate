Feature: Get one tea from GraphQL endpoint using dynamic values


    Background: Base URL
    * url "https://graphql-teas-endpoint.netlify.app/" 

    Scenario: Get one tea by name
        Given def teaQuery = read('TeaByName.graphql')
        And def teaName = { name: 'Lemon Balm' }
        And request { query: '#(teaQuery)', variables: '#(teaName)' }
        And method post
        Then status 200
        * def actualPrice = $.data.teas[0].price
        And match actualPrice == 0.99
