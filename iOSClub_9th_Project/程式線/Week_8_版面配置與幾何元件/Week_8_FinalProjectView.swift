//
//  Week_8_FinalProjectView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/12/4.
//

import SwiftUI

struct Week_8_FinalProjectView: View {
    var body: some View {
        GeometryReader { geometry in // 取得螢幕寬度與高度（用來做自適應排版）
            
            // 如果螢幕寬度大於 500（手機橫放），就使用「水平排列」
            if geometry.size.width > 500 {
                HStack(alignment: .center, spacing: 20) { // 水平堆疊
                    Image("image") // 載入圖片
                        .resizable() // 允許圖片被縮放
                        .scaledToFit() // 依比例縮放以填滿容器
                        .frame(width: geometry.size.width * 0.4) // 寬度佔螢幕的 40%
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 10) { // 垂直堆疊文字，置左對齊
                        Text("水平排列佈局")
                            .font(.system(size: geometry.size.width * 0.09)) // 字體大小依螢幕寬度縮放
                            .fontWeight(.bold) // 修改字體樣式
                        
                        Text("在寬螢幕上，這段文字會和圖片水平排列。我們透過 VStack 的 leading alignment 讓標題和內文都向左對齊。")
                            .font(.body)
                    }
                }
                .padding()
                .position( // 手動設定內容的中心位置
                    x: geometry.size.width / 2, // X 座標為螢幕正中間
                    y: geometry.size.height / 2 // Y 座標為螢幕正中間
                )
                
            } else {
                // 螢幕寬度小於 500 時（手機直放），改用「垂直排列」
                VStack(alignment: .leading, spacing: 20) { // 垂直堆疊，圖片在上文字在下
                    
                    Image("image") // 載入圖片
                        .resizable() // 可縮放
                        .scaledToFit() // 按比例縮放
                        .frame(width: geometry.size.width * 0.9) // 寬度佔螢幕 90%
                        .cornerRadius(10) // 圓角
                    
                    VStack(alignment: .leading, spacing: 10) { // 文字區塊（置左對齊）
                        Text("垂直排列佈局")
                            .font(.system(size: geometry.size.width * 0.09)) // 字體大小按螢幕比例縮放
                            .fontWeight(.bold) // 粗體
                        
                        Text("在窄螢幕上，這段文字會和圖片垂直排列。我們透過最外層 VStack 的 leading alignment 讓圖片和文字區塊整體向左對齊。")
                            .font(.body)
                    }
                    .padding(.horizontal, geometry.size.width * 0.05) // 讓文字左右留 5% 的邊距
                }
                .position( // 擺放在畫面正中央
                    x: geometry.size.width / 2,
                    y: geometry.size.height / 2
                )
            }
        }
    }
}

#Preview {
    Week_8_FinalProjectView()
}
