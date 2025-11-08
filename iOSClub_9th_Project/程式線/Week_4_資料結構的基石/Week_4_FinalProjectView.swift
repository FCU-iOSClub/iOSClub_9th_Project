//
//  Week_4_FinalProjectView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct Week_4_FinalProjectView: View {
    
    @State var toDo: [String] = ["遛狗", "吃晚餐", "抓蝴蝶", "cosplay水果奶奶"] // 儲存變數 toDo 陣列資料
    @State var textContent: String = "" // 儲存變數 textContent 內容
    
    var body: some View {
        VStack { // 垂直方向堆疊
            List { // 列表
                Section("To Do List") { // 列表分類
                    ForEach(toDo, id: \.self) { index in // 依序列印陣列資料
                        HStack { // 垂直方向堆疊
                            Image(systemName: "arrow.forward.circle.fill") // SF Symbol 符號
                            Text(index) // 透過 Text 顯示 index 內容
                        }
                    }
                }
            }
            HStack { // 垂直方向堆疊
                TextField("Type Here", text: $textContent) // 輸入框
                    .textFieldStyle(.roundedBorder) // 輸入框樣式
                    .padding() // 在外圍添加空白區域
                Button { // 按鈕
                    if !(textContent == "") { // 判斷 textContent 不是空字串，才可執行下列動作
                        toDo.append(textContent) // 添加資料近 toDo 陣列
                    }
                } label: { // 客製化按鈕樣式
                    Image(systemName: "arrow.up.circle") // SF Symbol 符號
                        .font(.system(size: 30)) // 改變字體大小
                 
                }
                .padding() // 在外圍添加空白區域
            }
            
        }
    }
}

#Preview {
    Week_4_FinalProjectView()
}
