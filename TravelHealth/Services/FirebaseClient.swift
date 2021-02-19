import FirebaseAuth

struct FirebaseClient {
    var createUser: (String, String, @escaping (Result<AuthDataResult, Error>) -> Void) -> Void
    var currentUser: () -> User?
    var signIn: (String, String, @escaping (Result<AuthDataResult, Error>) -> Void) -> Void
    var signOut: () throws -> Void

    struct User {
        var displayName: String?
    }
}

extension FirebaseClient.User {
    init(rawValue: FirebaseAuth.User) {
        self.displayName = rawValue.displayName
    }
}

extension FirebaseClient {
    static let live = Self(
        createUser: { email, password, callback in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    callback(.failure(error))
                } else if let result = result {
                    callback(.success(result))
                }
            }
        },
        currentUser: {
            if let user = Auth.auth().currentUser {
                return User(rawValue: user)
            } else {
                return nil
            }
//            Auth.auth().currentUser.map { User(rawValue: $0) }
        },
        signIn: { email, password, callback in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    callback(.failure(error))
                } else if let result = result {
                    callback(.success(result))
                }
            }
        },
        signOut: { try Auth.auth().signOut() }
    )
}

extension FirebaseClient {
    static let loggedIn = Self(
        createUser: { _, _, _ in },
        currentUser: { User(displayName: "Blob") },
        signIn: { _, _, _ in },
        signOut: { }
    )
}
