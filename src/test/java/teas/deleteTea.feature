@delete
Feature: Delete one tea - using read file

    
    Background: Base URL
    * url baseUrl

    Scenario: Delete one tea
        Given def deleteTea = read('classpath:teas/queries/DeleteTea.graphql')
        And def teaID = { id: '60e569749ef12a00084fb978' }
        And request { query: '#(deleteTea)', variables: '#(teaID)' }
        And method post
        Then status 200