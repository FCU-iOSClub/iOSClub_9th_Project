//
//  Week_8_TryTryView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/12/4.
//

import SwiftUI

struct First_Semester_Week_8_TryTryView: View {
    var body: some View {
        GeometryReader { geo in // 使用 GeometryReader 取得螢幕寬度，用來動態調整區塊比例
            
            HStack(spacing: 0) { // 水平堆疊（無間距），讓兩塊區域緊密貼在一起
                
                Text("30%") // 左邊文字
                    .font(.largeTitle) // 大字體
                    .frame(width: geo.size.width * 0.3) // 寬度佔螢幕的 30%
                    .background(.yellow) // 背景顏色為黃色
                
                Text("70%") // 右邊文字
                    .font(.largeTitle) // 大字體
                    .frame(width: geo.size.width * 0.7) // 寬度佔螢幕的 70%
                    .background(.orange) // 背景顏色為橘色
            }
        }
        .frame(height: 50) // 整個元件的高度固定為 50px
    }
}

#Preview {
    First_Semester_Week_8_TryTryView()
}
