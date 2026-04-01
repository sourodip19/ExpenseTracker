import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var token: String?
    @Published var isLoggedIn = false
    @Published var errorMessage = ""

    func login() async {
        do {
            let user = try await AuthService.shared.login(
                email: email,
                password: password
            )

            token = user.token
            isLoggedIn = true
        } catch {
            errorMessage = "Login failed"
        }
    }

    func signup() async {
        do {
            let user = try await AuthService.shared.signup(
                email: email,
                password: password
            )

            token = user.token
            isLoggedIn = true
        } catch {
            errorMessage = "Signup failed"
        }
    }
}
