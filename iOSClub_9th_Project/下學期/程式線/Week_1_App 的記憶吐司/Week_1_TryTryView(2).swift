//
//  TEST.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/3/7.
//

import SwiftUI

// Second_Semester_Week_1_TryTryView 是一個簡單的 SwiftUI 畫面，
// 功能是讓使用者輸入文字後，按下按鈕更新畫面中的名稱顯示。
struct Second_Semester_Week_1_TryTryView: View {
    
    // @State 用來儲存使用者輸入框中的內容，
    // 當 textContent 改變時，畫面會自動更新。
    @State var textContent: String = ""
    // name 用來顯示目前畫面上的名稱文字，
    // 初始值設定為提示訊息。
    @State var name: String = "等待使用者輸入..."
    
    var body: some View {
        VStack {
            // ZStack 用來讓背景與內容疊加在同一層。
            ZStack {
                // RoundedRectangle 作為背景卡片。
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 350, height: 350)
                    .foregroundStyle(.gray)
                VStack {
                    // 顯示圖片資源。
                    Image("image")
                        .resizable()
                        .frame(width: 200, height: 200)
                    // 顯示目前 name 的內容。
                    Text(name)
                        .font(.system(size: 30))
                        .bold()
                }
            }
        }
        // HStack 放置輸入框與按鈕。
        HStack {
            // TextField 提供文字輸入。
            TextField("Type Here...", text: $textContent)
                .textFieldStyle(.roundedBorder)
            // Button 按下後將輸入內容指定給 name。
            Button {
                name = textContent
            } label: {
                Image(systemName: "arrow.up.circle")
                    .font(.system(size: 30))
            }
        }
        .padding()
    }
}

#Preview {
    Second_Semester_Week_1_TryTryView()
}
