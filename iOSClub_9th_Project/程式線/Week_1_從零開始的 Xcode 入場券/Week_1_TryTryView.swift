//
//  Week_1_TryTryView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_1_TryTryView: View {
    var body: some View {
        VStack { // 垂直方向堆疊
            HStack { // 水平方向堆疊
                Rectangle() // 顯示矩形
                    .frame(width: 150, height: 150) // 調整大小為（150*150）
                    .foregroundStyle(.yellow) // 調整顏色為黃色
                
                Circle() // 顯示圓形
                    .frame(width: 150, height: 150) // 調整大小為（150*150）
                    .foregroundStyle(.red) // 調整顏色為紅色
                
            }
            RoundedRectangle(cornerRadius: 16) // 顯示有圓弧角的矩形
                .frame(width: 150, height: 150) // 調整大小為（150*150）
                .foregroundStyle(.blue) // 調整顏色為藍色
        }
    }
}

#Preview {
    Week_1_TryTryView()
}
