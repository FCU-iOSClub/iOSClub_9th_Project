//
//  Week_2_TryTryView(2).swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/4/4.
//

import SwiftUI
import FirebaseFirestore

// Week_2_TryTryView_2_ 是一個 Firestore 練習畫面，
// 功能包含：
// 1. 輸入名稱與價格後新增資料到 Firestore
// 2. 一鍵新增隨機資料
// 3. 即時讀取 Firestore 的 "database" 集合內容並顯示在 List 中
struct Week_2_TryTryView_2_: View {
    
    // @FirestoreQuery 會監聽 Firestore 指定 collection 的資料變化，
    // 這裡對應的是 "database" 這個 collection。
    // 當 Firestore 中的資料有新增、修改、刪除時，
    // datas 會自動更新，畫面也會跟著重新整理。
    @FirestoreQuery(collectionPath: "database") var datas: [Database]
    
    // 建立 Firestore 資料庫操作實體，
    // 之後新增資料時會透過 db 來呼叫 collection 與 addDocument。
    let db = Firestore.firestore()

    // @State 用來暫存使用者輸入的名稱。
    // 當 TextField 內容改變時，name 也會同步更新。
    @State var name: String = ""
    
    // @State 用來暫存使用者輸入的價格。
    // 因為 TextField 輸入內容本質上是字串，所以這裡先用 String 儲存。
    // 之後新增資料時，再轉換成 Int。
    @State var price: String = ""
    
    var body: some View {
        VStack {
            
            // 名稱輸入框，讓使用者輸入商品名稱或資料名稱。
            TextField("輸入名稱", text: $name)
                .padding()
            
            // 價格輸入框，讓使用者輸入價格。
            // 因目前綁定的是 String，所以可以先自由輸入文字，
            // 後續再透過 Int(price) 轉型。
            TextField("輸入價格", text: $price)
                .padding()
            
            HStack {
                
                // Add Data 按鈕：
                // 將使用者輸入的 name 與 price 新增到 Firestore。
                Button("Add Data") {
                    
                    // 將輸入的價格字串轉成 Int。
                    // 如果轉換失敗（例如輸入 abc），則回傳 nil。
                    let StringPrice = Int(price)
                    
                    // 呼叫自訂函式 addData，
                    // 若價格轉換失敗則使用 0 當作預設值。
                    addData(name: name, price: StringPrice ?? 0)
                    
                    // 新增完成後清空輸入框。
                    name = ""
                    price = ""
                }
                
                // Add Random Data 按鈕：
                // 新增一筆隨機結構的資料到 Firestore。
                // 這個按鈕主要是拿來展示 Firestore 可以接受動態欄位資料。
                Button("Add Random Data") {
                    addRandomData()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        // 設定 VStack 內按鈕的預設樣式。
        .buttonStyle(.borderedProminent)
        
        // 設定文字輸入框樣式為圓角邊框。
        .textFieldStyle(.roundedBorder)
        
        // List 用來顯示從 Firestore 讀回來的 datas 資料。
        // 因為 Database 遵守 Identifiable，所以可以直接被 List 使用。
        List(datas) { item in
            HStack {
                
                // 顯示資料名稱。
                Text(item.name)
                
                Spacer()
                
                // 顯示價格，並加上 NTD 單位。
                Text("\(item.price) NTD")
            }
        }
    }
    
    // addData 負責將指定的 name 與 price 封裝成 Database 物件，
    // 再寫入 Firestore 的 "database" collection。
    func addData(name: String, price: Int) {
        
        // 建立一筆新的 Database 資料模型。
        let newData = Database(name: name, price: price)
        
        do {
            // 使用 FirestoreSwift 的 Codable 支援，
            // 直接將 Swift struct 轉成文件後新增到 Firestore。
            try db.collection("database").addDocument(from: newData)
        } catch {
            // 如果編碼或寫入過程發生錯誤，印出錯誤提示。
            print("Error")
        }
    }
    
    // addRandomData 直接用 Dictionary 形式新增資料。
    // 這種寫法不需要先建立 Database struct，
    // 可以臨時加入各種欄位，適合做測試或快速寫入。
    func addRandomData() {
        
        // 這是一筆隨機資料，包含：
        // 1. name：字串
        // 2. price：整數
        // 3. is_cold：布林值
        // 4. hobbies：陣列
        // 5. unexpected_field：額外新增欄位
        let randomData: [String: Any] = [
            "name": "程式碼不用手打好爽",
            "price": 25,
            "is_cold": true,
            "hobbies": ["Coding", "趁大卡車開過來的時候跳出去嚇他一下"],
            "unexpected_field": "這是臨時想加的資料"
        ]
        
        // 將字典資料直接寫入 Firestore。
        // Firestore 是 NoSQL 資料庫，因此不同文件之間可以有不同欄位。
        db.collection("database").addDocument(data: randomData)
    }
}

#Preview {
    Week_2_TryTryView_2_()
}
