
import SwiftUI

struct HomeView: View {
    let token: String

    @StateObject private var expenseVM = ExpenseViewModel()

    var body: some View {
        NavigationStack {
            List(expenseVM.expenses) { expense in
                ExpenseRowView(expense: expense)
            }
            .navigationTitle("My Expenses")
            .task {
                await expenseVM.loadExpenses(token: token)
            }
        }
    }
}
