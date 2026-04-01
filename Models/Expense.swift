import Foundation

struct Expense: Codable, Identifiable {
    let id: String
    let title: String
    let amount: Double
    let category: String
    let date: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case amount
        case category
        case date
    }
}
