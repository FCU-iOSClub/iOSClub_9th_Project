// 小試身手 - 訂飲料

import SwiftUI

struct buy_drink: View {

    // 宣告變數 textContent，資料型別為 String
    // 用於儲存 TextField 內容
    @State var textContent: String = ""

    // 宣告變數 selectionButtle，資料型別為 Int
    // 用於儲存 Picker 內容
    @State var selectionButtle: Int = 1

    // 宣告變數 selectionSugar，資料型別為 Int
    // 用於儲存 Picker 內容
    @State var selectionSugar: Int = 2

    // 宣告變數 count，資料型別為 Int
    // 用於儲存 Stepper 內容
    @State var count: Int = 1
    
    var body: some View {
        VStack {
            // 飲料名稱標題
            Text("張家檸檬綠茶")
                .font(.system(size: 50)) // 修改字體大小
                .fontWeight(.bold) // 修改字體樣式
                .padding()
            
            // 商品圖片區
            Image("back")
                .resizable() // 讓圖片可縮放調整大小
                .frame(width: 300, height: 300) // 修改圖片大小為 300 * 300
                .clipShape(RoundedRectangle(cornerRadius: 16)) // 圖片加圓角裁切
                
            
            // 杯子大小選擇（Picker）
            Picker("杯子大小", selection: $selectionButtle) {
                Text("中杯").tag(0)
                Text("大杯").tag(1)
                Text("超大杯").tag(2)
            }
            .pickerStyle(.segmented) // 修改 Picker 樣式
            .padding()
            
            // 甜度選擇（Picker）
            Picker("", selection: $selectionSugar) {
                Text("無糖").tag(0)
                Text("少糖").tag(1)
                Text("全唐").tag(2)
            }
            .pickerStyle(.segmented) // 修改 Picker 樣式
            .padding()
            
            Spacer()
            
            // 訂購杯數（Stepper）
            Stepper("\(count) 杯", value: $count)
                .padding()
            
            // 備註輸入欄位（TextField）
            TextField("備註: 是否對綠茶過敏？", text: $textContent)
                .textFieldStyle(.roundedBorder) // 修改 TextField 樣式
                .padding()
            
            // 送出訂單按鈕
            Button {
                // 按下按鈕時會執行的動作
            } label: {
                // 客製化 Button 樣式
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 350, height: 50)
                    Text("送出訂單")
                        .foregroundStyle(.white)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    buy_drink()
}