
import SwiftUI

struct LoginView: View {
    @StateObject var authVM = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Expense Tracker")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Email", text: $authVM.email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $authVM.password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Login") {
                    Task {
                        await authVM.login()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Don't have an account? Sign Up") {
                    SignupView(authVM: authVM)
                }
                
                if authVM.isLoggedIn, let token = authVM.token {
                    NavigationLink(destination: HomeView(token: token)) {
                        Text("Continue")
                    }
                }
            }
            .padding()
        }
    }
}
#Preview {
    LoginView()
}
