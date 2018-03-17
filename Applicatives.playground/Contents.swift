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
}
