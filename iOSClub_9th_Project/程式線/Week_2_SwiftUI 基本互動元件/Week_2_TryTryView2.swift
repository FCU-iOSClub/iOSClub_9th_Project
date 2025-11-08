//
//  Week_2_TryTryView2.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_2_TryTryView2: View {
    
    @State var textContent: String = "變色龍會變色是因為他是變色龍" // 用變數儲存 textContent 內容
    @State var red: Double = 0.0 // 用變數儲存 red 數值
    @State var green: Double = 0.0 // 用變數儲存 green 數值
    @State var blue: Double = 0.0 // 用變數儲存 blue 數值
    
    var body: some View {
        ZStack { // Z 軸方向堆疊
            Color.brown // 棕色背景
                .opacity(0.5) // 調整透明度
                .ignoresSafeArea() // 讓畫面延伸到螢幕安全區外
            
            VStack { // 垂直方向堆疊
                Text(textContent) // 使用 Text 顯示 textContent 內容
                    .fontWeight(.bold) // 改變字體樣式
                    .font(.system(size: 25)) // 改變字體大小
                    .foregroundStyle(Color(red: red, green: green, blue: blue)) // 透過 RGB 值改變字體顏色
                    
                
                TextField("Type Here", text: $textContent) // 輸入框
                    .textFieldStyle(.roundedBorder) // 輸入框樣式
                    .padding() // 在外圍添加空白區域
                
                HStack { // 水平方向堆疊
                    Text("R") // 顯示文字
                        
                    Slider(value: $red, in: 0 ... 1)  // 製作滑桿並綁定 red 變數
                        
                }
                .padding() // 在外圍添加空白區域
                
                
                HStack { // 水平方向堆疊
                    Text("G") // 顯示文字

                    Slider(value: $green, in: 0 ... 1) // 製作滑桿並綁定 green 變數
                }
                .padding() // 在外圍添加空白區域
                
                HStack { // 水平方向堆疊
                    Text("B") // 顯示文字
                        
                    Slider(value: $blue, in: 0 ... 1) // 製作滑桿並綁定 blue 變數
                }
                .padding() // 在外圍添加空白區域
                
            }
            .padding() // 在外圍添加空白區域
        }
    }
}

#Preview {
    Week_2_TryTryView2()
}
