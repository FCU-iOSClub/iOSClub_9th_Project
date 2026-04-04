//
//  Week_2_DataBase.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/4/4.
//

import SwiftUI
import FirebaseFirestore

// Database 是用來對應 Firestore 文件資料的資料模型。
// 它同時遵守：
// 1. Identifiable：讓 SwiftUI 的 List 可以辨識每筆資料
// 2. Codable：讓 Firestore 可以直接做資料編碼 / 解碼
struct Database: Identifiable, Codable {
    
    // @DocumentID 會自動接收 Firestore 文件本身的 document ID。
    // 這個 id 不是你自己存在欄位中的資料，而是 Firestore 文件的唯一識別碼。
    // 因為新資料在建立前還沒有文件 ID，所以型別通常寫成 Optional。
    @DocumentID var id: String?
    
    // name 對應 Firestore 文件中的 name 欄位。
    // 預設值設為 "No Data"，當資料缺少此欄位時可避免解碼失敗。
    var name: String = "No Data"
    
    // price 對應 Firestore 文件中的 price 欄位。
    // 預設值設為 0，避免欄位不存在時資料無法正常建立。
    var price: Int = 0
}
