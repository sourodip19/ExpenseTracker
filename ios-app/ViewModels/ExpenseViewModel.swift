
import Foundation
import Combine
@MainActor
class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    func loadExpenses(token: String) async {
        do {
            expenses = try await APIService.shared.fetchExpenses(token: token)
        } catch {
            print("Failed to load expenses")
        }
    }
}
