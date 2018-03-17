//: Playground - Applicatives

import Foundation

enum ParseError {
    case notFound(String)
    case notCastable(String, Any.Type)
}

struct JsonObject {
    let dictionary: [String: Any]?
    
    init(json: String) {
        dictionary = json.data(using: .utf8)
            .flatMap { try? JSONSerialization.jsonObject(with: $0) }
            .flatMap { $0 as? [String: Any] }
    }
    
    func get<A>(_ key: String) -> Result<A, ParseError> {
        guard let value = dictionary?[key] else {
            return .failure(.notFound(key))
        }
        
        return (value as? A).flatMap(Result.success) ??
            .failure(.notCastable(key, A.self))
    }
}

func read(_ json: JsonObject) -> Result<User, ParseError> {
    return curry(User.init)
        <%> json.get("username")
        <*> json.get("password")
        <*> json.get("premium")
        <*> json.get("newsletter")
}

let json: String = """
{
"username": "alex",
"password": "123",
"premium": true,
"newsletter": false
}
"""
let jsonObject = JsonObject(json: json)

read(jsonObject).map {
    print($0)
}
