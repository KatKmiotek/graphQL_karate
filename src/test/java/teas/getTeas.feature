Feature: Get all teas - using read file

    Scenario: Get all teas
        * url "https://graphql-teas-endpoint.netlify.app/" 
        Given def teasQuery = read('AllTeas.graphql')
        And request { query: '#(teasQuery)' }
        And method post
        Then status 200
        * def teas = $.data.teas
        * print teas.length
        And assert teas.length > 5