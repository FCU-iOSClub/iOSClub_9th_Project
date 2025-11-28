//
//  DrinkDetailView.swift
//  iOS_Drink_Picker
//
//  Created by Yacolate on 2025/11/25.
//

import SwiftUI

// DrinkDetailView 提供了單個飲料的詳細資訊頁面，並允許使用者對飲料進行客製化設定，然後加入購物車。
struct DrinkDetailView: View {
    
    // @Environment 是一個屬性包裝器，它允許我們從 SwiftUI 的「環境」中讀取值，`\.dismiss` 是一個內建的環境鍵，它提供了一個 `DismissAction`。
    // 我們可以呼叫這個 action (即 `dismiss()`) 來關閉（或「解除」）當前呈現的視圖，例如在 NavigationStack 中返回上一頁。
    @Environment(\.dismiss) var dismiss
    
    // 綁定到來自根視圖的共享購物車陣列，以便我們可以在此頁面將客製化後的商品加入其中。
    @Binding var cart: [OrderItem]
    // 從上一個視圖（DrinkCardView）傳入的、要顯示詳細資訊的特定飲料數據。
    var drink: drink

    // 當這些 @State 變數的值改變時，SwiftUI 會自動重新渲染與它們相關的 UI 部分。
    @State var selectSize: Int = 1      // 用於追蹤使用者選擇的尺寸，預設值為 1（對應 "中杯"）。
    @State var selectIce: Int = 1       // 用於追蹤使用者選擇的冰量，預設值為 1（對應 "少冰"）。
    @State var selectSugar: Double = 10.0 // 用於追蹤使用者選擇的甜度，預設為 10.0。
    
    // 用於 Picker 選項顯示的靜態文字陣列。
    let bottleSize: [String] = ["小杯", "中杯", "大杯"]
    let ice: [String] = ["去冰", "少冰", "正常冰", "多冰"]
    
    var body: some View {
        // 使用 ScrollView 確保即使在小螢幕手機上，所有客製化選項也都能被看見和使用。
        ScrollView {
            // 使用主 VStack 將所有頁面元件垂直排列。
            VStack {
                Image(drink.imageName)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Text(drink.name)
                    .font(.largeTitle)
                
                Text("價格: \(drink.price) 元")
                
                // --- 尺寸選擇區塊 ---
                VStack(alignment: .leading) {
                    Text("尺寸")
                        .font(.system(size: 20))
                        .bold()
                    
                    // Picker 是一個讓使用者從多個選項中選擇一個值的控制項。
                    // `selection: $selectSize` 將 Picker 的當前選中項與我們的 `@State` 變數 `selectSize` 進行雙向綁定。
                    Picker("", selection: $selectSize) {
                        // 遍歷 'bottleSize' 陣列的索引（indices），為每個選項創建一個帶有標籤的 Text 視圖。
                        // `id: \.self` 表示使用索引值本身作為每個選項的唯一標識。
                        ForEach(bottleSize.indices, id: \.self) { size in
                            Text(bottleSize[size])
                        }
                    }
                    .pickerStyle(.segmented) // `.segmented` 樣式會將 Picker 顯示為一個水平的分段式控制項。
                }
                .padding()
                
                // --- 冰量選擇區塊（結構與尺寸選擇類似）---
                VStack(alignment: .leading) {
                    Text("冰量")
                        .font(.system(size: 20))
                        .bold()
                    
                    Picker("", selection: $selectIce) {
                        ForEach(ice.indices, id: \.self) { i in
                            Text(ice[i])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                
                // --- 甜度選擇區塊 ---
                VStack {
                    HStack {
                        Text("甜度")
                            .font(.system(size: 20))
                            .bold()
                        
                        Spacer()
                        
                        // 即時顯示當前滑塊選擇的甜度百分比。
                        Text("\(Int(selectSugar))%")
                            .foregroundStyle(.blue)
                    }
                    
                    HStack {
                        Text("0%").foregroundStyle(.gray)
                        // Slider 是一個滑塊控制項，允許使用者在一個連續或分步的範圍內選擇一個值。
                        // `value: $selectSugar` 將滑塊的當前值與 `@State` 變數 `selectSugar` 進行雙向綁定。
                        // `in: 0 ... 100` 設定了滑塊可以選擇的最小值和最大值。
                        Slider(value: $selectSugar, in: 0 ... 100)
                            .padding()
                        Text("100%").foregroundStyle(.gray)
                    }
                }
                .padding()
              
                // --- "加入購物車" 按鈕 ---
                Button {
                    // 按鈕的 action 閉包：當按鈕被點擊時執行的程式碼。
                    addToCart() // 呼叫下方的函式將商品加入購物車。
                    dismiss()   // 呼叫 `dismiss` action 來關閉此詳細頁面，返回到菜單列表。
                } label: {
                    // 按鈕的 label 閉包：定義按鈕的外觀。
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 300, height: 80)
                        Text("加入購物車")
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .padding(.top, 30) // 讓按鈕與上方的甜度選擇器之間有一些垂直間距。
            }
            .padding() // 為整個 VStack 提供一些內邊距，使其內容不會緊貼螢幕邊緣。
        }
        .navigationTitle(drink.name) // 將導覽列的標題設定為當前飲料的名稱。
        .navigationBarTitleDisplayMode(.inline) // 讓標題顯示在導覽列的中央，而不是以大標題的形式。
    }
    
    // 一個自定義的輔助函式，用於處理將商品加入購物車的具體邏輯。
    func addToCart() {
        // 根據飲料的基礎數據以及使用者在此頁面選擇的客製化選項，創建一個新的 `OrderItem` 實例。
        let item = OrderItem(
            name: drink.name,
            price: drink.price, // **注意**: 目前的價格是固定的基礎價格，一個可以改進的地方是根據選擇的尺寸（`selectSize`）來動態調整價格。
            selectSize: selectSize,
            selectIce: selectIce,
            selectSugar: selectSugar
        )
        
        // 將這個新創建的、客製化後的訂單項目 `item` 添加到我們共享的 `cart` 陣列中。
        // 由於 `cart` 是一個綁定，這個修改會自動同步回 `ContentView` 和 `CartPage`。
        cart.append(item)
    }
}

