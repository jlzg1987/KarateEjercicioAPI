Feature:user Login
  The following website will be used as evidence https://www.demoblaze.com

  Background:
    * url  urlBaseR= 'https://api.demoblaze.com/signup'
    * url  urlBaseL= 'https://api.demoblaze.com/login'

  Scenario: Crear un nuevo usuario en signup
    Given url urlBaseR
    And request { username: 'jlzg', password: '12345678' }
    When method post
    Then status 200

  Scenario: Intentar crear un usuario ya existente
    Given url urlBaseR
    And request { username: 'jlzg', password: '12345678' }
    When method post
    Then status 400

  Scenario: Usuario y contraseña correctos en login
    Given url urlBaseL
    And request { username: 'jlzg', password: '12345678' }
    When method post
    Then status 200

  Scenario: Usuario y contraseña incorrectos en login
    Given url urlBaseL
    And request { username: 'jlzg', password: '1234567' }
    When method post
    Then status 401