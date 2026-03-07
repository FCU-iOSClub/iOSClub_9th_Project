//
//  ContentView.swift
//  iOS_Drink_Picker
//
//  Created by Yacolate on 2025/11/25.
//

import SwiftUI

// ContentView 是應用程式的主要視圖 (View)，也是整個 App 的進入點。
struct First_Semester_Week_7_FinalProjectView: View {
    
    // @State 是一個屬性包裝器，用於在 SwiftUI 視圖中管理狀態，當被 @State 包裝的屬性值改變時，SwiftUI 會自動重新渲染視圖，以反映最新的狀態。
    // 'cart' 是一個儲存訂單項目的陣列，型別為 [OrderItem]，代表我們在這裡初始化一個空的購物車。
    @State var cart: [OrderItem] = []
    
    var body: some View {
        // TabView 是一個容器視圖，可以在多個子視圖之間輕鬆切換，
        TabView {
            // 第一個標籤頁：菜單頁面
            Tab {
                // DrinkPickerPage 是我們自定義的視圖，用於顯示可選擇的飲料菜單，這裡我們將 'cart' 狀態以綁定（Binding）的方式傳遞給子視圖。
                // '$cart' 語法表示這是一個綁定，允許 DrinkPickerPage 讀取和修改 ContentView 中的 'cart' 狀態。
                DrinkPickerPage(cart: $cart)
            } label: { // label 用於定義此標籤頁在標籤列上顯示的內容。
                Text("menu") // 標籤的文字
                Image(systemName: "menucard") // 標籤的圖示，使用 SF Symbols 內建的 "menucard" 圖示。
            }
            
            // 第二個標籤頁：購物車頁面
            Tab {
                // CartPage 是我們自定義的視圖，用於顯示使用者已加入購物車的項目，同樣地，我們使用綁定 '$cart' 來傳遞購物車數據，讓 CartPage 能顯示並可能修改購物車內容。
                CartPage(cart: $cart)
            } label: { // 設定購物車標籤頁的顯示內容。
                Text("cart") // 標籤的文字
                Image(systemName: "cart") // 標籤的圖示，使用 SF Symbols 內建的 "cart" 圖示。
            }
        }
    }
}

#Preview {
    First_Semester_Week_7_FinalProjectView()
}

