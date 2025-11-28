//
//  DrinkPickerPage.swift
//  iOS_Drink_Picker
//
//  Created by Yacolate on 2025/11/25.
//

import SwiftUI

// DrinkPickerPage 視圖是我們應用程式的「菜單」頁面，它會展示所有可供使用者選擇的飲料品項。
struct DrinkPickerPage: View {
    
    // 使用 @Binding 來接收來自父視圖（ContentView）的 'cart' 狀態的綁定，這使得 DrinkPickerPage 以及它的子視圖（例如 DrinkCardView）都能夠存取並修改同一個購物車資料。
    @Binding var cart: [OrderItem]
    
    // drinks 是一個儲存 drink 結構體的常數陣列，它定義了菜單上所有的飲料。
    let drinks: [drink] = [drink(name: "巧克力冰沙", imageName: "chocolateIce", price: 75),
                           drink(name: "水果茶", imageName: "fruitTea", price: 65),
                           drink(name: "蜂蜜奶茶", imageName: "milkTea", price: 80),
                           drink(name: "檸檬茶", imageName: "lemonTea", price: 60)]
    
    var body: some View {
        
        // NavigationStack 用於創建一個具有導航功能的視圖層次結構，它讓我們可以從一個列表頁面（如此頁）推送到一個詳細頁面（例如 DrinkDetailView），並且會自動提供一個返回按鈕，讓使用者可以回到上一頁。
        NavigationStack {
            // ScrollView 是一個可以滾動其內容的容器。
            ScrollView {
                // 我們再次使用 ForEach 來遍歷 drinks 陣列中的每一個 drink 物件。
                ForEach(drinks, id: \.self) { drink in
                    // 對於菜單上的每一款飲料，我們都創建一個 DrinkCardView 來顯示它，DrinkCardView 是一個我們自定義的視圖，專門用來以卡片的形式顯示單個飲料的資訊。我們將購物車的綁定 '$cart' 和當前遍歷到的 'drink' 物件作為參數傳遞給它。
                    DrinkCardView(cart: $cart, drink: drink)
                }
            }
            .navigationTitle("飲料菜單") // 設定導航欄的標題
        }
    }
}

