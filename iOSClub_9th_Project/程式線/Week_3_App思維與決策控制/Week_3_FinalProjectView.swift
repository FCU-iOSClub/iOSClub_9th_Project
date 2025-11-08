//
//  Week_3_FinalProjectView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_3_FinalProjectView: View {
    
    @State var resultContent: String = "請輸入數字" // 用變數儲存 resultContent 內容
    @State var textContent: String = "" // 用變數儲存 textContent 內容
    let target: Int = Int.random(in: 1 ... 10) // 1~10 隨機選擇一個數字
    
    var body: some View {
        ZStack { // Z軸方向堆疊
            Image("background") // 顯示圖片
                .resizable() // 使圖片可改變大小
                .ignoresSafeArea() // 讓畫面延伸到螢幕安全區外
            VStack { // 垂直方向堆疊
                Text("猜猜數字") // 顯示文字
                    .font(.system(size: 80)) // 改變字體大小
                    .fontWeight(.bold) // 改變字體樣式
                
                Text(resultContent) // 透過 Text 顯示 resultContent 內容
                    .font(.system(size: 50)) // 改變字體大小
                    .fontWeight(.bold) // 改變字體樣式
            
                TextField("Type Here", text: $textContent) // 輸入框
                    .textFieldStyle(.roundedBorder) // 輸入框樣式
                    .padding() // 在外圍添加空白區域
                
                Button { // 按鈕
                    checkResult() // 觸發按鈕將執行的動作
                } label: { // 客製化按鈕樣式
                    Text("Check") // 顯示內容
                }
                .buttonStyle(.glass) // 預設 Button 樣式
                
            }
        }
    }
    
    func checkResult() { // 使用 func 方法來包裝動作
        if let guess = Int(textContent) { // 測試是否可以將 textContent 轉型成 Int
            if guess == target { // 如果 textConent 等於答案
                resultContent = "✅ 猜對了 ✅"
            } else if guess > target { // 如果 textConent 大於答案
                resultContent = "⬇️ 太大了 ⬇️"
            } else { // textContent 不等於也不大於答案
                resultContent = "🔼 太小了 🔼"
            }
        } else { // 輸入內容無法轉型成 Int
            resultContent = "🚫 請輸入正確數字"
        }
    }
}

#Preview {
    Week_3_FinalProjectView()
}
