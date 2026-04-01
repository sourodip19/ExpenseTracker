
import Foundation

class AuthService {
    static let shared = AuthService()

    func login(email: String, password: String) async throws -> User {
        guard let url = URL(string: "\(Constants.baseURL)/auth/login") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = [
            "email": email,
            "password": password
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, _) = try await URLSession.shared.data(for: request)

        return try JSONDecoder().decode(User.self, from: data)
    }

    func signup(email: String, password: String) async throws -> User {
        guard let url = URL(string: "\(Constants.baseURL)/auth/signup") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = [
            "email": email,
            "password": password
                    ]

                    request.httpBody = try JSONSerialization.data(withJSONObject: body)

                    let (data, _) = try await URLSession.shared.data(for: request)

                    return try JSONDecoder().decode(User.self, from: data)
                }
            }
