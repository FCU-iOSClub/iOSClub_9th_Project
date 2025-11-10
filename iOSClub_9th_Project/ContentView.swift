//
//  ContentView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack {
                Text("歡迎來到逢甲大學 iOS Club")
                    .font(.system(size: 30))
                    .bold()
                
                Image("board")
                    .resizable()
                    .scaledToFit()
                
                Text("這是第九屆社課專案解答以及詳細註解解釋，如果有問題歡迎與 iOS Club 社群小編聯絡，我們會有專人為您解答，若有發現bug也歡迎使用pull request來改善此專案")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .padding()
                            
                
//                HStack {
//                    Image("IG")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .clipShape(.rect(cornerRadius: 8))
//
//                    Text("IG: fcu.iosclub")
//                        .font(.title3)
//                }
//                Image("IG")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .opacity(0.8)
//                    .clipShape(.rect(cornerRadius: 8))
                Spacer()
            Text("fcu.iosclub")
                    .font(.largeTitle)
                    
            }
        }
    
}

#Preview {
    ContentView()
}

// 歡迎來到 iOS Club 專案程式碼解答與註解解釋
// TryTry 為小事身手, Final Project 為今日實作

