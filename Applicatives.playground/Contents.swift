//: Playground - Applicatives

func createUser(name: String, password: String, premium: Bool, newsletter: Bool) -> Result<User, UserError> {
    // TRATA DE CREAR UN USUARIO, UTILIZANDO:
    // CÓMO name,       EL RESULTADO DE VALIDAR "name"
    // CÓMO password,   EL RESULTADO DE VALIDAR "password"
    // CÓMO premium,    EL RESULTADO DE VALIDAR "premium"
    // CÓMO newsletter, EL RESULTADO DE VALIDAR "newsletter"
    
    // SI LA CREACIÓN DEL USER HA FALLADO, RETORNA EL FALLO ó SINO, RETORNA EL USUARIO
}

let user = createUser(name: "alex", password: "functionalswift", premium: true, newsletter: false)

user.map { print("SUCCESS: User created - \($0)") }
