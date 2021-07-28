@all
Feature: Testing GraphQL endpoint with Karate

Background: Base url
    * url baseUrl

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
    And text deleteTea =
        """
        mutation deleteTea {
        deleteTea(id:"60fd9ea720bd080008340177" )
        }
        """



Scenario: Get all teas and verify response
    # graphql case we will always post to the same url - no extra path needed
    Given path "/"
    # payload
    And request { query: '#(teasQuery)' }
    # method
    When method post
    # expected status code
    Then status 200

    # assertions:
    # check for graphql error - returned data is not null
    Then match response.data.teas != '#null'
    # check for response time - hmm could be better
    * print 'response time', responseTime
    # Then assert responseTime < 1000
    # no errors present
    Then match response.errors == '#notpresent'



Scenario: Get one tea from the endpoint an verifyt response
    # payload
    And request { query: '#(teaQuery)'}
    # method
    When method post

    # assertions:
    # symbol $ represents reponse - using junit
    Then match $ contains {"data":{"teas":[{"price":0.99,"name":"Lemon Balm"}]}}
    # response body is a json so can get path and assert value
    Then match response.data.teas[*].name contains "Lemon Balm"


# Scenario: Add one tea and verify response - MUTATION
#     # paload mutation
#     And request { query: '#(newTea)'}
#     # method
#     When method post
#     # response status code
#     Then status 200


# Scenario: Delete one tea and verify response - MUTATION
#     # payload mutation
#     And request { query: '#(deleteTea)'}
#     # method
#     And method post
#     # response status code
#     Then status 200
#     # validate response as per endpoint docs
#     And match response.data.deleteTea == '#boolean'
# # other data type checks:
#     #null
#     #notnull
#     #boolean
#     #number
#     #string
#     #array
#     #object