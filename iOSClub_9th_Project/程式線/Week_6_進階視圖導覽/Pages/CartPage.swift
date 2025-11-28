//
//  CartPage.swift
//  iOS_Drink_Picker
//
//  Created by Yacolate on 2025/11/26.
//

import SwiftUI

// CartPage 視圖，專門用來顯示使用者已加入購物車的商品清單。
struct CartPage: View {
    
    // @Binding 建立了一個與父視圖（ContentView）中 'cart' 狀態的「雙向綁定」。
    // 這意味著任何在 CartPage 中對 'cart' 的修改（例如刪除商品），
    // 都會立即反映回 ContentView，反之亦然。這確保了數據在不同視圖間的同步。
    @Binding var cart: [OrderItem]
    
    var body: some View {
        // List 用於以垂直滾動列表的形式展示數據。
        // 它非常適合用來顯示長度不定的清單，例如購物車內容。
        List {
            // Section 用於將列表中的項目分組，並可選擇性地提供一個標題。
            Section("購物車清單") {
                // ForEach 是一個視圖建構器，它會遍歷一個集合（此處為 'cart' 陣列），
                // 並為其中的每一個元素創建一個視圖。
                // 'id: \.id' 告訴 ForEach 如何唯一識別每個訂單項目。由於 OrderItem 遵循 Identifiable 協議，
                // 我們可以使用它的 'id' 屬性作為唯一標識，這有助於 SwiftUI 高效地更新列表。
                ForEach(cart, id: \.id) { item in
                    // HStack 是一個水平佈局容器，它會將其子視圖沿著水平方向排列。
                    HStack {
                        // 顯示訂單項目的名稱。
                        Text(item.name)
                            .font(.system(size: 20))
                        
                        // Spacer 是一個靈活的空白視圖，它會佔用所有可用的額外空間，
                        // 在這個 HStack 中，它會將左邊的商品名稱和右邊的價格推向兩側。
                        Spacer()
                        
                        // 顯示該項目的價格。
                        Text("價格: \(item.price)")
                            .font(.system(size: 20))
                        
                        // 一個用於刪除此項目的按鈕。
                        Button {
                            // 'action' 部分：當按鈕被點擊時執行的閉包。
                            // 'removeAll(where:)' 會從 'cart' 陣列中移除所有滿足指定條件的元素。
                            // '$0' 代表陣列中的一個元素，此處的條件是「元素的 id 等於當前 'item' 的 id」。
                            // 這能精確地刪除使用者點擊的那個項目。
                            cart.removeAll { $0.id == item.id }
                        } label: {
                            // 'label' 部分：定義按鈕的外觀。
                            // 使用 SF Symbols 的 "xmark.circle" 圖示，並將其顏色設為紅色以示警告。
                            Image(systemName: "xmark.circle")
                                .foregroundStyle(.red)
                        }
                        .padding(.leading) // 在按鈕左側添加一些間距，避免與價格文字太近。
                    }
                }
            }
        }
        
        // ZStack 是一個深度佈局容器，它會將其子視圖沿 Z 軸（從後到前）疊加在一起。
        ZStack {
            // 創建一個藍色的圓角矩形作為總金額顯示的背景。
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 300, height: 80)
                .foregroundStyle(.blue)
            // 顯示計算出來的總金額。
            Text("總金額: \(totalPrice)")
                .font(.system(size: 50))
                .bold()
                .foregroundStyle(.white) // 讓白色文字在藍色背景上更清晰
        }
        
        // "結帳" 按鈕
        Button {
            // 當按下按鈕時，模擬結帳動作，將整個購物車清空。
            cart = []
        } label: {
            // 按鈕的外觀設計
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 300, height: 80)
                    .foregroundStyle(.green)
                Text("結帳")
                    .foregroundStyle(.white)
                    .font(.system(size: 50))
                    .bold()
            }
        }
    }
    
    // 'totalPrice' 是一個計算屬性（Computed Property）。
    // 它不會儲存任何值，而是在每次被讀取時，都會執行內部的程式碼並回傳一個計算後的值。
    var totalPrice: Int {
        // 這裡使用了高階函數來計算總價：
        // 1. `cart.map { $0.price }`：遍歷 'cart' 陣列，並創建一個只包含每個訂單項目價格的新陣列（例如：[50, 65, 50]）。
        // 2. `.reduce(0, +)`：對上一步生成的價格陣列進行歸納。它從初始值 0 開始，然後將陣列中的所有數字(+)累加起來。
        // 最終回傳一個代表總金額的整數。
        cart.map { $0.price }.reduce(0, +)
    }
    
}
