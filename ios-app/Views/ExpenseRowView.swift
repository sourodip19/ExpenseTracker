
import SwiftUI

struct ExpenseRowView: View {
    let expense: Expense

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.title)
                    .font(.headline)

                Text(expense.category)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text("₹\(expense.amount, specifier: "%.0f")")
                .bold()
        }
        .padding(.vertical, 8)
    }
}
#Preview {
    ExpenseRowView(
        expense: Expense(
            id: "1",
            title: "Groceries",
            amount: 1200,
            category: "Food", date: <#String#>
        )
    )
}
