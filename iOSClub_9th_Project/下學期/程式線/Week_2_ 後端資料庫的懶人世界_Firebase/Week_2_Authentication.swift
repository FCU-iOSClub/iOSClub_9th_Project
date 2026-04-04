//
//  Week_2_Authentication.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/4/4.
//

import SwiftUI
import FirebaseAuth

// Week_2_Authentication 是一個使用 Firebase Authentication 的登入 / 註冊畫面，
// 提供 Email 與 Password 輸入欄位，並可進行 Firebase 帳號建立與登入驗證。
struct Week_2_Authentication: View {
    
    // @State 用來儲存使用者輸入的 Email，
    // 當內容改變時，畫面中的 TextField 會同步更新。
    @State private var email = ""
    
    // @State 用來儲存使用者輸入的 Password，
    // SecureField 會隱藏密碼內容。
    @State private var password = ""
    
    var body: some View {
        
        // ZStack 用來堆疊背景與前景內容。
        ZStack {
            
            // 黑色背景鋪滿整個畫面。
            Color.black
                .ignoresSafeArea()
            
            // 上方裝飾用漸層圓角矩形背景，
            // 旋轉後形成視覺設計效果。
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(
                    .linearGradient(
                        colors: [.red, .pink],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            // 主內容區塊垂直排列。
            VStack(spacing: 20) {
                
                // 畫面標題文字。
                Text("Welcome")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                // Email 輸入框。
                // prompt 用來設定 placeholder 顯示文字。
                TextField(
                    "",
                    text: $email,
                    prompt: Text("Email").foregroundColor(.white)
                )
                .foregroundStyle(Color.white)
                .textFieldStyle(.plain)
                
                // 下方白線作為輸入框底線。
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.white)
                    .frame(height: 1)
                
                // Password 輸入框，內容會自動隱藏。
                SecureField(
                    "",
                    text: $password,
                    prompt: Text("Password").foregroundColor(.white)
                )
                .foregroundStyle(Color.white)
                .textFieldStyle(.plain)
                
                // 下方白線作為輸入框底線。
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.white)
                    .frame(height: 1)
                
                // HStack 水平排列 Sign up 與 Login 按鈕。
                HStack {
                    
                    // Sign up 按鈕：
                    // 建立 Firebase 新帳號。
                    Button {
                        
                        // 使用 FirebaseAuth 建立帳號。
                        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                            
                            // 如果發生錯誤，印出錯誤內容。
                            guard error == nil else {
                                print(error ?? "")
                                return
                            }
                            
                            // 建立成功。
                            print("SignUp Success")
                        }
                        
                    } label: {
                        Text("Sign up")
                            .bold()
                            .frame(width: 150, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(
                                        .linearGradient(
                                            colors: [.red, .pink],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            )
                    }
                    .padding(.top)
                    .offset(y: 100)
                    
                    // Login 按鈕：
                    // 使用 Firebase 已存在帳號登入。
                    Button {
                        
                        // 使用 FirebaseAuth 登入帳號。
                        Auth.auth().signIn(withEmail: email, password: password) { result, error in
                            
                            // 如果登入失敗，印出錯誤訊息。
                            guard error == nil else {
                                print(error ?? "")
                                return
                            }
                            
                            // 登入成功。
                            print("LogIn Success")
                        }
                        
                    } label: {
                        Text("Login")
                            .bold()
                            .frame(width: 150, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(
                                        .linearGradient(
                                            colors: [.red, .pink],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            )
                    }
                    .padding(.top)
                    .offset(y: 100)
                }
            }
            // 限制主內容寬度。
            .frame(width: 350)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    Week_2_Authentication()
}
