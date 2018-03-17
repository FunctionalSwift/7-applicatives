//: Playground - Applicatives

func createUser(name: String, password: String, premium: Bool, newsletter: Bool) -> Result<User, UserError> {
    // let result = TRATA DE CREAR UN USUARIO, UTILIZANDO:
    // CÓMO name,       EL RESULTADO DE VALIDAR "name"
    // CÓMO password,   EL RESULTADO DE VALIDAR "password"
    // CÓMO premium,    Result.pure(premium)
    // CÓMO newsletter, Result.pure(newsletter)
    
    //return VALIDA EL RESULTADO DE result CON LOS VALIDADORES ESPECÍFICOS DE USUARIO (SÓLO SI NO HA FALLADO YA)
}

let user = createUser(name: "alex", password: "functionalswift", premium: true, newsletter: false)

user.map { print("SUCCESS: User created - \($0)") }
