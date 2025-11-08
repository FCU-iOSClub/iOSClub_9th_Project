//
//  Week_2_FinalProject.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_2_FinalProjectView: View {
    
    @State var textContent: String = "🌞" // 用變數儲存 textContent 內容
    @State var isShow: Bool = false // 用變數儲存 isShow 布林值
    @State var red: Double = 0.5 // 用變數儲存 red 數值
    @State var green: Double = 0.5 // 用變數儲存 green 數值
    @State var blue: Double = 0.5 // 用變數儲存 blue 數值
    
    var body: some View {
        ZStack { // Z 軸方向堆疊
            Color.brown // 棕色背景
                .opacity(0.5) // 調整透明度
                .ignoresSafeArea() // 讓畫面延伸到螢幕安全區外
            
            VStack { // 垂直方向堆疊
                ZStack { // Z 軸方向堆疊
                    Circle() // 顯示圓形
                        .frame(width: 100, height: 100) // 調整大小（100*100）
                        .foregroundStyle(Color(red: red, green: green, blue: blue)) // 透過 RGB 值修改字體顏色
                    
                    Text(textContent) // 透過 Text 來顯示 textContent 內容
                        .font(.system(size: 70)) // 改變字體大小
                        
                }
                
                Toggle("", isOn: $isShow) // 顯示開關按鈕
                    .labelsHidden() // 隱藏按鈕標籤
                
                if isShow { // 若 isShow 成立即顯示以下畫面
                    VStack { // 垂直方向堆疊
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
                        
                        TextField("Type Here", text: $textContent) // 輸入框
                            .textFieldStyle(.roundedBorder) // 輸入框樣式
                            .padding() // 在外圍添加空白區域
                    }
                }
                
            }
        }
    }
}

#Preview {
    Week_2_FinalProjectView()
}
