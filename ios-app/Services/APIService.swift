
import Foundation

class APIService {
    static let shared = APIService()

    func fetchExpenses(token: String) async throws -> [Expense] {
        guard let url = URL(string: "\(Constants.baseURL)/expenses") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, _) = try await URLSession.shared.data(for: request)

        return try JSONDecoder().decode([Expense].self, from: data)
    }

    func addExpense(token: String, expense: [String: Any]) async throws {
        guard let url = URL(string: "\(Constants.baseURL)/expenses") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.httpBody = try JSONSerialization.data(withJSONObject: expense)

        _ = try await URLSession.shared.data(for: request)
    }
}
