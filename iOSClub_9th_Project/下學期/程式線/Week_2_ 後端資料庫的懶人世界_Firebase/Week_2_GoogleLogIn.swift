//
//  ContentView.swift
//  Google_SignIn
//
//  Created by Yacolate on 2026/3/18.
//

import SwiftUI
import FirebaseAuth   // 專門導入 Auth 功能
import FirebaseCore   // 專門導入 Firebase 核心功能
import GoogleSignIn   // 必須導入 Google 登入 SDK

struct Week_2_GoogleLogIn: View {
    var body: some View {
        Button {
            startGoogleSignIn()
        } label: {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 350, height: 150)
                .foregroundStyle(.gray)
                .overlay {
                    HStack {
                        Image("googleIcon")
                            .resizable()
                            .frame(width: 130, height: 100)
                        
                        Text("Sign In with Google")
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                            .bold()
                            .padding()
                    }
                }
        }
    }
    func startGoogleSignIn() {
        // 1. 取得 Client ID
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // 2. 開始 Google 登入流程
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            guard error == nil else { return }
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else { return }

            // 3. 建立 Firebase 憑證 (Credential)
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            // 4. 使用憑證登入 Firebase
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase 登入失敗: \(error.localizedDescription)")
                    return
                }
                print("使用者已成功登入 Firebase!")
            }
        }
    }

}

#Preview {
    Week_2_GoogleLogIn()
}
