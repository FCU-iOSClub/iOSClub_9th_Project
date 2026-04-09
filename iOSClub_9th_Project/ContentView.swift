//
//  ContentView.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2025/11/7.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab){
            // 程式線分頁
            NavigationStack {
                List {
                    Section(header: Text("上學期")) {
                        Group {
                            NavigationLink("Week 1 - 三元素排版（小試身手）") { First_Semester_Week_1_TryTryView() }
                            NavigationLink("Week 1 - Liquid Glass 卡面（今日實作）") { First_Semester_Week_1_FinalProjectView() }
                            NavigationLink("Week 2 - 變數綁定（小試身手 1）") { First_Semester_Week_2_TryTryView1() }
                            NavigationLink("Week 2 - 變色龍會變色（小試身手 2）") { First_Semester_Week_2_TryTryView2() }
                            NavigationLink("Week 2 - 今日實作") { First_Semester_Week_2_FinalProjectView() }
                            NavigationLink("Week 3 - 小試身手") { First_Semester_Week_3_TryTryView() }
                            NavigationLink("Week 3 - 今日實作") { First_Semester_Week_3_FinalProjectView() }
                            NavigationLink("Week 4 - 小試身手") { First_Semester_Week_4_TryTryView() }
                            NavigationLink("Week 4 - 今日實作") { First_Semester_Week_4_FinalProjectView() }
                        }
                        Group {
                            NavigationLink("Week 6 - 小試身手") { First_Semester_Week_6_TryTryView() }
                            NavigationLink("Week 6 - 今日實作") { First_Semester_Week_6_FinalProjectView() }
                            NavigationLink("Week 7 - 飲料點餐app（今日實作）") { First_Semester_Week_7_FinalProjectView() }
                            NavigationLink("Week 8 - GeometryReader（小試身手）") { First_Semester_Week_8_TryTryView() }
                            NavigationLink("Week 8 - GeometryReader（今日實作）") { First_Semester_Week_8_FinalProjectView() }
                            NavigationLink("Week 9 - 鴨子走路(小試身手)") { First_Semester_Week_9_TryTryView() }
                        }
                    }
                    Section(header: Text("下學期")) {
                        NavigationLink("Week 1 - 複習（小試身手）") { Second_Semester_Week_1_TryTryView() }
                        NavigationLink("Week 1 - SwiftData Todolist（今日實作）") { Week_1_FinalProject_2_() }
                        NavigationLink("Week 2 - Firebase") { Week_2_TryTryView_2_() }
                        NavigationLink("Week 2 - 帳號認證") { Week_2_Authentication() }
                        NavigationLink("Week 2 - Google 登入") { Week_2_GoogleLogIn() }
                        NavigationLink("Week 3 - Foundation Models") { Week_3_FinalProject_2_() }
                    }
                }
                .navigationTitle("iOS Club 社課專案")
                .navigationSubtitle("內含小試身手與今日實作")
            }
            .tabItem {
                Label("程式線", systemImage: "curlybraces.square")
            }
            .tag(0)
            
            NavigationStack {
                WelcomeView()
            }
            .tabItem {
                Label("專案介紹", systemImage: "apple.image.playground")
            }
            .tag(1)
            
            // 創客線分頁
            NavigationStack {
                List {
                    Section(header: Text("上學期 - 創客線")) {
                        NavigationLink("Week 3 - YouTube 播放") { youtube_playing_screen() }
                        NavigationLink("Week 4 - IG 個人首頁") { ig_view() }
                        NavigationLink("Week 4 - 買飲料畫面") { buy_drink() }
                        NavigationLink("Week 4 - 設定畫面") { setting_view() }
                    }
                    Section(header: Text("下學期 - 創客線")) {
                        NavigationLink("Week 1 - 小試身手") { Second_Semester_Week_1_demo1() }
                        NavigationLink("Week 1 - 大試身手") { Second_Semester_Week_1_demo2() }
                    }
                }
                .navigationTitle("iOS Club 社課專案")
                .navigationSubtitle("內含小試身手與今日實作")
            }
            .tabItem {
                Label("創客線", systemImage: "wrench.and.screwdriver")
            }
            .tag(2)
            
        }
    }
}

struct WelcomeView: View {
    
    let threadsURL = "https://www.threads.com/@fcu.iosclub"
    let instagramURL = "https://www.instagram.com/fcu.iosclub/"
    
    var body: some View {
        VStack {
            Image("board")
                .resizable()
                .scaledToFit()
                .padding()
            
            Text("本專案包含第九屆社課內容之參考解答與詳細註解，供學習與延伸開發使用。\n\n如有任何問題，歡迎透過 iOS Club 社群聯絡小編，我們將協助回覆。若發現 bug 或希望改善程式內容，歡迎提交 Pull Request 一同完善此專案。")
                .multilineTextAlignment(.leading)
                .font(.system(size: 25))
                .padding()
            
            Spacer()
            
            HStack {
                Link(destination: URL(string: threadsURL)!) {
                    HStack {
                        Image("Threads_logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
                
                Link(destination: URL(string: instagramURL)!) {
                    HStack {
                        Image("Instagram_logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
            }
            .padding()
        }
    }
}

// 用於 Week 7 獨立頁面預覽的包裝視圖
enum Week7PageType {
    case picker, cart
}

struct Week7PreviewWrapper: View {
    let pageType: Week7PageType
    @State private var cart: [OrderItem] = []
    
    var body: some View {
        Group {
            if pageType == .picker {
                DrinkPickerPage(cart: $cart)
            } else {
                CartPage(cart: $cart)
            }
        }
    }
}

#Preview {
    ContentView()
}

