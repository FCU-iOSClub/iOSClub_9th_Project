//
//  Week_1_FinalProject(2).swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/3/11.
//

import SwiftUI
import SwiftData

// Week_1_FinalProject_2_ 是待辦事項的主畫面，
// 負責提供 Navigation 與上方工具列功能。
struct Week_1_FinalProject_2_: View {
    
    // 取得 SwiftData 資料操作環境。
    @Environment(\.modelContext) var context
    
    // 讀取所有 DataItem 資料。
    @Query var items: [DataItem]
    
    var body: some View {
        // NavigationStack 提供導覽列與導航結構。
        NavigationStack {
            // 主內容為 ToDoListView。
            Week_1_ToDoListView()
                // toolbar 用來加入右上角功能按鈕。
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        // Menu 可展開多個操作選項。
                        Menu {
                            // 刪除全部資料。
                            Button {
                                for item in items {
                                    context.delete(item)
                                }
                            } label: {
                                Text("Delete All")
                            }
                        } label: {
                            Text("Edit")
                        }
                    }
                }
                // 設定導覽列標題。
                .navigationTitle("To Do List")
        }
    }
}

#Preview {
    Week_1_FinalProject_2_()
        .modelContainer(for: DataItem.self)
}
