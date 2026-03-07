//
//  TryTryView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/20.
//

import SwiftUI

struct First_Semester_Week_6_TryTryView: View {
    var body: some View {
        VStack { // 垂直堆疊
            ForEach(0 ..< 6) { index in // 使用 ForEach 來重複呼叫 TemplateView 並且傳入資料 6 次
                TemplateView(number: index) // 呼叫 TemplarteView 畫面，並且傳入資料 index
            }
        }
    }
}

struct TemplateView: View { // 建立 TemplateView 模板，透過傳入資料來呈現不同內容
    
    var number: Int // 宣告變數 number 用於接收傳入的資料
    
    var body: some View {
        ZStack { // Z 軸方向堆疊
            RoundedRectangle(cornerRadius: 16) // 有圓弧角的矩形
                .frame(width: 200, height: 100) // 調整大小（200 * 100）
                .foregroundStyle(.orange) // 調整顏色
            
            Text("View \(number)") // 使用 Text 來呈現傳入資料內容
                .font(.largeTitle) // 調整字體大小
        }
    }
}

#Preview {
    First_Semester_Week_6_TryTryView()
}
