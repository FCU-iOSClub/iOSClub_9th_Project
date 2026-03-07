//
//  Week_9_TryTryView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/12/11.
//

import SwiftUI

struct First_Semester_Week_9_TryTryView: View {
    
    @State var index: Int = 0 // 當前顯示的動畫圖片編號（0～13），用來做逐格動畫
    @State var isWalking: Bool = true // 控制Duck目前在哪個位置（true=起點、false=終點）
    
    let startPosition: CGSize = CGSize(width: -200, height: -200) // Duck 的起始位置（左上）
    let endPosition: CGSize = CGSize(width: 200, height: 200) // Duck 的終點位置（右下）
    let changeSpeed: Double = 0.03 // 每張圖片切換的間隔（秒），數字越小動畫越快
    
    var body: some View {
        VStack {
            
            // MARK: 🦆 動畫圖片顯示區
            Image("image\(index)") // 根據 index 顯示 image0 ~ image13 的逐格動畫
                .resizable() // 允許縮放圖片
                .scaledToFit() // 依比例縮放填滿
                .offset(isWalking ? startPosition : endPosition) // 根據 isWalking 決定位置（動畫用）
                .task { // Task 在 View 出現後執行，用於持續更新圖片
                    while true { // 無限循環，讓 Duck 不斷走路
                        try? await Task.sleep(for: .seconds(changeSpeed)) // 每次切換圖片前先等 0.03 秒
                        
                        index = (index + 1) % 14 // 換下一張圖片（用 % 保持 0~13 循環）
                    }
                }
            
            // Next 按鈕（切換 Duck 的位置）
            Button("Next") {
                withAnimation(.linear(duration: 3)) { // 使用線性動畫讓 Duck 平滑移動 3 秒
                    isWalking.toggle() // 切換位置：左上 → 右下 → 左上...
                }
            }
            .buttonStyle(.borderedProminent) 
        }
    }
}

#Preview {
    First_Semester_Week_9_TryTryView()
}
