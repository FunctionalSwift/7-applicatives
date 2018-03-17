//: Playground - Applicatives

func createUser(name: String, password: String, premium: Bool, newsletter: Bool) -> Result<User, UserError> {
    return Result.pure(newsletter)
        .apply(Result.pure(premium)
            .apply(Validators.Password(password)
                .apply(Validators.Name(name)
                    .map(curry(User.init)))))
        .flatMap(UserValidator.Newsletter || UserValidator.Premium)
}

let user = createUser(name: "alex", password: "functionalswift", premium: true, newsletter: false)

user.map { print("SUCCESS: User created - \($0)") }
