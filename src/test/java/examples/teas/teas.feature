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
        And text newTea =
            """
            mutation addTea{
            addTea(teaInput: {
            name: "Lavender Tea",
            description: "Intensive falvour",
            price: 0.99
            producerId: "60b8bc31956abb0009efb4d0"
            }){
            id
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
        Then match response.data.teas != '#null'
        * print 'response time', responseTime
        Then assert responseTime < 1000
        Then match response.errors == '#notpresent'



    Scenario: Get one tea from the endpoint an verifyt response
        And request { query: '#(teaQuery)'}
        When method post
        Then match $ contains {"data":{"teas":[{"price":0.99,"name":"Lemon Balm"}]}}


    Scenario: Add one tea and verify response - MUTATION
        And request { query: '#(newTea)'}
        When method post
        Then status 200