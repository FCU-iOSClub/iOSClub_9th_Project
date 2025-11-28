//
//  StructPage.swift
//  iOS_Drink_Picker
//
//  Created by Yacolate on 2025/11/25.
//

import SwiftUI

// 'drink' 結構（Struct）用於定義一杯飲料的數據模型。
// 我們使用結構來組織和封裝相關的屬性。
// 遵循 'Hashable' 協議，意味著 'drink' 的實例可以被「雜湊」，
// 這讓它們可以被用在 Set 或作為 Dictionary 的鍵（Key），這在 SwiftUI 中進行數據比較和識別時很有用。
struct drink: Hashable {
    var name: String        // 飲料的名稱，例如 "珍珠奶茶"。
    var imageName: String   // 對應在 Assets.xcassets 中的圖片名稱，用於顯示飲料圖片。
    var price: Int          // 飲料的基礎價格。
}

// 'OrderItem' 結構代表購物車中的一個訂單項目，包含了使用者客製化的選項。
// 遵循 'Identifiable' 協議，要求結構必須有一個名為 'id' 的唯一標識符。
// 這對於在 SwiftUI 的 List 或 ForEach 中高效地更新和識別列表項目至關重要。
// 遵循 'Hashable' 協議，理由同上。
struct OrderItem: Identifiable, Hashable{
    let id = UUID()         // 使用 UUID() 自動生成一個全域唯一的 ID，確保每個訂單項目都是獨一無二的。
    var name: String        // 訂購的飲料名稱。
    var price: Int          // 該訂單項目的最終價格（可能因尺寸或其他選項而調整）。
    var selectSize: Int     // 使用者選擇的尺寸，例如可以用 0 代表中杯，1 代表大杯。
    var selectIce: Int      // 使用者選擇的冰塊量，例如 0:正常, 1:少冰, 2:去冰。
    var selectSugar: Double // 使用者選擇的甜度，例如 1.0:全糖, 0.7:七分糖, 0.5:半糖, 0.3:三分糖, 0.0:無糖。
}
