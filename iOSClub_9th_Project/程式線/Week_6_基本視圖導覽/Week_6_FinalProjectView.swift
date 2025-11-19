//
//  Week_6_FinalProjectView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/20.
//

import SwiftUI

struct Week_6_FinalProjectView: View {
    
    let movies: [String] = ["3_Body_Problem",
                            "BoJack_Horseman",
                            "Breaking_Bad",
                            "Suits",
                            "The_Bear"] // 宣告常數 movies 用來儲存待看清單
    
    let suggestMovies: [String] = ["Zootopia2",
                                   "Demon_Hunter",
                                   "My_Hero_Academic",
                                   "Solo_Leveling",
                                   "Toy_Story_5"] // 宣告常數 suggestMovies 用來儲存推薦電影清單
    
    var body: some View {
        NavigationStack { // NavigationStack 必須和 NavigationLink 一起使用，否則會沒有切換畫面的效果
            List {
                Section("待看清單") {
                    ScrollView(.horizontal) { // 使畫面可以進行水平滑動
                        HStack { // 水平排列
                            ForEach(movies, id: \.self) { movie in // 使用 ForEach 來呼叫陣列內的所有電影
                                NavigationLink {
                                    MovieTemplateView(content: movie) // 使用 NavigationLink 來呼叫模板並且傳入電影名稱
                                } label: {
                                    Image(movie) // 使用 Image 顯示對應 movie 圖片
                                        .resizable() // 讓圖片可以調整大小
                                        .frame(width: 200, height: 300) // 調整大小（200 * 300）
                                        .clipShape(RoundedRectangle(cornerRadius: 16)) // 裁切直角
                                }
                            }
                        }
                    }
                }
                Section("推薦清單") {
                    ScrollView(.horizontal) { // 使畫面可以進行水平滑動
                        HStack { // 水平排列
                            ForEach(suggestMovies, id: \.self) { movie in // 使用 ForEach 來呼叫陣列內的所有電影
                                NavigationLink {
                                    MovieTemplateView(content: movie) // 使用 NavigationLink 來呼叫模板並且傳入電影名稱
                                } label: {
                                    Image(movie) // 使用 Image 顯示對應 movie 圖片
                                        .resizable() // 讓圖片可以調整大小
                                        .frame(width: 200, height: 300) // 調整大小（200 * 300）
                                        .clipShape(RoundedRectangle(cornerRadius: 16)) // 裁切直角
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("iOS Movie Theater") // 標題
        }
    }
}

struct MovieTemplateView: View {
    
    var content: String // 宣告變數 content 用於接收傳入的資料
    
    var body: some View {
        VStack {
            Image(content) // 使用 Image 顯示對應 movie 圖片
                .resizable() // 讓圖片可以調整大小
                .frame(width: 300, height: 500) // 調整大小（300 * 500）
            
            Text(content) // 使用 Text 顯示對應 movie 名稱
                .font(.largeTitle) // 調整字體大小
                .bold() // 調整字體樣式
        }
    }
}

#Preview {
    Week_6_FinalProjectView()
}
