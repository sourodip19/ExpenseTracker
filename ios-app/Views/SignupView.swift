
import SwiftUI

struct SignupView: View {
    @ObservedObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $authVM.email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $authVM.password)
                .textFieldStyle(.roundedBorder)

            Button("Sign Up") {
                Task {
                    await authVM.signup()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
#Preview {
    SignupView(authVM: AuthViewModel())
}
