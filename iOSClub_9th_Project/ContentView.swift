//
//  ContentView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("歡迎來到逢甲大學 iOS Club")
                    .font(.system(size: 30))
                    .bold()
                
                Image("board")
                    .resizable()
                    .scaledToFit()
                
                Text("這是第九屆社課專案解答以及詳細註解解釋\n如果有問題歡迎與 iOS Club 社群小編聯絡\n我們會有專人為您解答")
                    .multilineTextAlignment(.center)
                            
                
                Text("IG: fcu.iosclub")
                    .font(.title3)
            }
        }
    }
}

#Preview {
    ContentView()
}

// 歡迎來到 iOS Club 專案程式碼解答與註解解釋
// TryTry 為小事身手, Final Project 為今日實作

