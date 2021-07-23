Feature: Testing GraphQL endpoint with Karate

    Background: Base url
        * url "https://graphql-teas-endpoint.netlify.app/"

    Scenario: Get all teas and verify response
        Given text teasQuery =
            """
            { teas{
            name
            id
            }
            }
            """

        Given path "/"
        And request { query: '#(teasQuery)' }
        When method post
        Then status 200

        * print response

