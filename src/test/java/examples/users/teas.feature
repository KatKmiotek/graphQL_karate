Feature: Testing GraphQL endpoint with Karate

    Background: Base url
        * url "https://graphql-teas-endpoint.netlify.app/"
        And text teasQuery =
            """
            { teas{
            name
            id
            }
            }
            """
        And text teaQuery =
            """
            {   teas(name: "Lemon Balm"){
            name
            price
            }
            }
            """

    Scenario: Get all teas and verify response
        Given path "/"
        And request { query: '#(teasQuery)' }
        When method post
        Then status 200



    Scenario: Get one tea from the endpoint an verifyt response
        And request { query: '#(teaQuery)'}
        When method post
        Then match $ contains {"data":{"teas":[{"price":0.99,"name":"Lemon Balm"}]}}