//
//  Week_1_ToDoListView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/3/11.
//

import SwiftUI
import SwiftData

// Week_1_ToDoListView 是待辦事項列表畫面，
// 功能包含顯示資料、新增資料與刪除資料。
struct Week_1_ToDoListView: View {
    
    // @Environment(\.modelContext) 用來取得 SwiftData 的資料操作環境，
    // 可用於 insert、delete 等資料庫操作。
    @Environment(\.modelContext) var context
    // @Query 會自動從 SwiftData 中抓取 DataItem 資料，
    // 並且當資料變動時自動刷新畫面。
    @Query var items: [DataItem]
    // textContent 用來儲存輸入框中的文字內容。
    @State var textContent: String = ""
    
    var body: some View {
        // List 用來顯示所有待辦資料。
        List {
            // ForEach 逐筆顯示資料內容。
            ForEach(items) { item in
                HStack {
                    // 顯示待辦事項名稱。
                    Text(item.name)
                    Spacer()
                    // 顯示建立時間。
                    Text(item.createTime.formatted(date: .omitted, time: .standard))
                }
            }
            // onDelete 提供滑動刪除功能。
            .onDelete { index in
                for item in index {
                    context.delete(items[item])
                }
            }
        }
        // 下方輸入區。
        HStack {
            // 文字輸入框。
            TextField("Type Here...", text: $textContent)
                .textFieldStyle(.roundedBorder)
            // 按下按鈕新增資料。
            Button {
                addItem(name: textContent)
            } label: {
                Image(systemName: "arrow.up.circle")
                    .font(.system(size: 30))
            }
        }
        .padding()
    }
    // addItem 用來建立新的 DataItem 並寫入 SwiftData。
    func addItem(name: String) {
        // 建立新資料物件。
        let item = DataItem(name: name, createTime: .now)
        // 避免空字串被加入。
        if !item.name.isEmpty {
            context.insert(item)
        }
    }
}

#Preview {
    Week_1_ToDoListView()
        .modelContainer(for: DataItem.self)
}
