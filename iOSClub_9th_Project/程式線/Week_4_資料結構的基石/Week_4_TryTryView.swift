//
//  Week_4_TryTryView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_4_TryTryView: View {
    
    @State var textContent: String = "文字藝術師" // 用變數儲存 textContent 內容
    @State var isBold: Bool = false // 用變數儲存 isBold 布林值
    let colors: [Color] = [.black, .yellow, .blue, .red, .orange] // 使用陣列儲存及管理多種顏色
    
    var body: some View {
        ZStack { // Z 軸方向堆疊
            Color.blue // 顯示藍色
                .opacity(0.5) // 改變透明度
                .ignoresSafeArea() // 讓畫面延伸到螢幕安全區外
            VStack { // 垂直方向堆疊
                ForEach(colors, id: \.self) { index in // 依序列印陣列資料
                    Text(textContent) // 透過 Text 來顯示 textContent 內容
                        .foregroundStyle(index) // 透過 index 改變字體顏色
                        .font(.system(size: 50)) // 改變字體大小
                        .fontWeight(isBold ? .bold : .regular) // 使用三元運算子來改變字體樣式
                }
                
                Toggle("粗體模式", isOn: $isBold) // 顯示開關按鈕
                    .padding() // 在外圍添加空白區域
                
                TextField("Type Here", text: $textContent) // 輸入框
                    .textFieldStyle(.roundedBorder) // 輸入框樣式
                    .padding() // 在外圍添加空白區域
            }
        }
    }
}

#Preview {
    Week_4_TryTryView()
}
