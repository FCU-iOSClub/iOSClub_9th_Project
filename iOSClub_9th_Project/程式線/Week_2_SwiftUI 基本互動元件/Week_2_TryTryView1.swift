//
//  Week_2_TryTryView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_2_TryTryView1: View {
    
    @State var textSize: Double = 30.0 // 用變數儲存 Slider 數值,以及字體大小
    
    var body: some View {
        ZStack { // Z 軸方向堆疊
            Color.yellow // 黃色背景
                .opacity(0.7) // 調整透明度
                .ignoresSafeArea() // 讓畫面延伸到螢幕安全區外
            
            VStack { // 垂直方向堆疊
                Text("教學長的頭") // 顯示文字
                    .fontWeight(.bold) // 改變字體樣式
                    .font(.system(size: textSize)) // 透過 textSize 改變字體大小
                
                Text("字體大小: \(textSize)") // 使用 Text 來顯示 textSize 內容
                    .fontWeight(.bold) // 調整字體樣式
                    .font(.title) // 使用預設字體大小
                
                Slider(value: $textSize, in: 10 ... 100) // 製作滑桿並綁定 textSize 變數
                    .padding() // 在外圍添加空白區域
            }
        }
    }
}

#Preview {
    Week_2_TryTryView1()
}
