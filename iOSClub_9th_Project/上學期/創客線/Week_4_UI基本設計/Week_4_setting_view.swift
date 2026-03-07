// 中試身手 - 會員填寫畫面

import SwiftUI

struct setting_view: View {   // 宣告變數 name，資料型別為 String
    // 用於儲存使用者的姓名
    @State var name: String = ""
    
    // 宣告變數 email，資料型別為 String
    // 用於儲存使用者的電子郵件地址
    @State var email: String = ""
    
    // 宣告變數 age，資料型別為 Double
    // 用於儲存使用者的年齡（以 Slider 操作，顯示為整數）
    @State var age: Double = 0
    
    // 宣告變數 height，資料型別為 Double
    // 用於儲存使用者的身高（公分，Slider 顯示到小數點一位）
    @State var height: Double = 150.0
    
    // 宣告變數 weight，資料型別為 Double
    // 用於儲存使用者的體重（公斤，Slider 顯示到小數點一位）
    @State var weight: Double = 30.0
    
    // 宣告變數 gender，資料型別為 Int
    // 用於儲存使用者的性別（0: 男、1: 女）
    @State var gender: Int = 0
    
    // 宣告變數 place，資料型別為 Int
    // 用於儲存使用者的居住地（以索引表示選擇）
    @State var place: Int = 0
    
    // 宣告變數 agree，資料型別為 Bool
    // 用於儲存使用者是否同意接收電子報
    @State var agree: Bool = false
    
    var body: some View {
        // 主要垂直堆疊：包含標題與各輸入項目
        VStack {
            // 標題
            Text("會員資料填寫")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // 姓名輸入
            HStack {
                Text("姓名")
                
                TextField("", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            // 性別選擇（分段控制）
            HStack {
                Text("性別")
                
                Picker("gender", selection: $gender) {
                    Text("男").tag(0)
                    Text("女").tag(1)
                }
                .pickerStyle(.segmented)
            }
            .padding()
            
            // 年齡 Slider（0~100）
            HStack {
                Text("年齡 \(age, specifier: "%.0f")")
                
                Slider(value: $age, in: 0...100)
            }
            .padding()
            
            // 身高 Slider（150~200 cm）
            HStack {
                Text("身高 \(height, specifier: "%.1f")")
                
                Slider(value: $height, in: 150...200)
            }
            .padding()
            
            // 體重 Slider（30~120 kg）
            HStack {
                Text("體重 \(weight, specifier: "%.1f")")
                
                Slider(value: $weight, in: 30...120)
            }
            .padding()
            
            // 居住地選擇（Picker 預設樣式）
            HStack {
                Text("居住地")
                
                Spacer()
                
                Picker("place", selection: $place) {
                    Text("台北市").tag(0)
                    Text("新北市").tag(1)
                    Text("桃園市").tag(2)
                    Text("台中市").tag(3)
                    Text("台南市").tag(4)
                    Text("高雄市").tag(5)
                }
            }
            .padding()
            
            // Email 輸入
            HStack {
                Text("Email")
                
                TextField("", text: $email)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            // 電子報同意開關
            Toggle("是否同意接收電子報", isOn: $agree)
                .padding()
            
            Spacer()
            
            // 送出按鈕
            Button {
               // 無動作
            } label: {
                Text("確定")
                    .font(.title3)
                    .padding(4)
            }
            .buttonStyle(.glassProminent)
        }
    }
}

#Preview {
    setting_view()
}
