//
//  Week_3_TryTryView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_3_TryTryView: View {
    
    @State var isShow: Bool = false // 用變數儲存 isShow 布林值
    
    var body: some View {
        ZStack { // Z 軸方向堆疊
            Color(isShow ? .yellow : .black) // 使用三元運算子顯示背景顏色
                .opacity(0.5) // 改變透明度
                .ignoresSafeArea() // 讓畫面延伸到螢幕安全區外
            
            VStack {
                Text(isShow ? "🌞" : "🌚") // 使用三元運算子顯示不同 emoji
                    .font(.system(size: 80)) // 改變字體大小
                
                Toggle("", isOn: $isShow) // 顯示開關按鈕
                    .labelsHidden() // 隱藏開關標籤
            }
        }
    }
}

#Preview {
    Week_3_TryTryView()
}
