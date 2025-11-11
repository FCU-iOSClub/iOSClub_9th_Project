// 大試身手 - ig 聊天室模擬

import SwiftUI

// IG 聊天室模擬畫面
struct ContentView: View {

    // 宣告變數 textContent，資料型別為 String
    // 用於下方輸入框的文字綁定
    @State var name: String = ""
    
    var body: some View {
        ZStack {
            // 背景顏色：黑色，不透明度 0.8，忽略安全區
            Color.black.opacity(0.8).ignoresSafeArea()
            
            // 整個畫面：上方資訊列、中間置中文字、下方輸入框
            VStack {
                // 上方資訊列：返回箭頭、頭像、帳號資訊、通話/視訊按鈕
                HStack {
                    // 返回箭頭（SF Symbols）
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.white)
                    
                    // 頭像：圓形、尺寸 44x44，圖片可自選
                    Image("polarbear")
                        .resizable()
                        .clipShape(.circle)
                        .frame(width: 44, height: 44)
                    
                    VStack {
                        // 將頭像右側的帳號資訊與通話按鈕群組
                        HStack {
                            // 帳號與名稱
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Peter")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        Image(systemName: "chevron.forward")
                                            .foregroundStyle(.white)
                                            .opacity(0.7)
                                    }
                                    Text("username")
                                        .font(.title2)
                                        .foregroundStyle(.white)
                                        .opacity(0.7)
                                }
                            }
                            Spacer()
                            
                            // 右側通話/視訊通話按鈕（示意，尚未實作動作）
                            HStack {
                                Button {
                                   // 無動作
                                } label: {
                                    Image(systemName: "phone")
                                }
                                Button {
                                    // 無動作
                                } label: {
                                    Image(systemName: "video")
                                }
                            }
                            .font(.title)
                            .foregroundStyle(.white)
                        }
                    }
                }
                
                // 中間置中顯示文字
                Spacer()
                Text("沒電話")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()
                
                // 畫面最下方的膠囊形狀輸入框，尺寸 360x50
                TextField("Message...", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .clipShape(.capsule)
                    .frame(width: 360, height: 50)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
