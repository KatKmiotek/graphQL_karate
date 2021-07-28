@add
Feature: Add tea using reda file and faker

#     Scenario: Add tea
#         * url baseUrl
#         Given def teasQuery = read('classpath:teas/queries/AddTea.graphql')
#         And def myFaker = new faker()
#         And def variables = { name: '#(myFaker.hipster().word())', price: '#(myFaker.number().randomDouble(2, 1, 3))', description: '#(myFaker.lorem().sentence(1))'} 
#         * print 'tea name', variables
#         And request { query: '#(teasQuery)', variables: '#(variables)' }
#         And method post
#         Then status 200