//
//  Week_1_FinalProject.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_1_FinalProjectView: View {
    var body: some View {
        ZStack { // Z 軸方向堆疊
            Image("background") // 使用 Image 來顯示圖片
                .resizable() // 使圖片可以調整大小
                .ignoresSafeArea() // 讓畫面延伸到螢幕安全區外
            
            RoundedRectangle(cornerRadius: 16) // 顯示有圓弧角的矩形
                .frame(width: 350, height: 250) // 調整大小為（350*250）
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 16)) // 加上 Liquid Glass 效果
            
            HStack { // 將視圖以水平方向堆疊
                Image("qrcode") // 使用 Image 來顯示圖片
                    .resizable() // 使圖片可以調整大小
                    .frame(width: 200, height: 200) // 調整大小為（200*200）
                    .clipShape(RoundedRectangle(cornerRadius: 8)) // 裁剪成指定形狀
                
                VStack { // 將視圖以垂直方向堆疊
                    Text("逢甲大學") // 使用 Text 來顯示文字
                    
                    Image("head") // 使用 Image 來顯示圖片
                        .resizable() // 使圖片可以調整大小
                        .frame(width: 80, height: 80) // 調整大小為（80*80）
                    
                    Text("我是張田中") // 使用 Text 來顯示文字
                    
                    Text("D1234567") // 使用 Text 來顯示文字
                }
                .font(.system(size: 20)) // 改變字體大小
                .fontWeight(.bold) // 改變字體樣式
            }
        }
    }
}

#Preview {
    Week_1_FinalProjectView()
}
