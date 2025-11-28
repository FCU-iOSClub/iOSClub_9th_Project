//
//  DrinkCardView.swift
//  iOS_Drink_Picker
//
//  Created by Yacolate on 2025/11/25.
//

import SwiftUI

// DrinkCardView 是一個可重用的視圖元件，專門用於在菜單列表中以「卡片」的形式顯示單個飲料的摘要資訊。
struct DrinkCardView: View {

    // 接收來自父視圖的購物車綁定，以便能將它進一步傳遞到下一個頁面（DrinkDetailView）。
    @Binding var cart: [OrderItem]
    // 這張卡片需要顯示的具體飲料數據。這是一個普通的屬性，由父視圖（DrinkPickerPage）傳入。
    var drink: drink
    
    var body: some View {
        // ZStack 將所有子視圖沿著 Z 軸（從後到前）疊加，在這裡，我們用它來將一個可點擊的 NavigationLink 疊加在一個灰色的背景矩形之上。
        ZStack {
            // 創建一個灰色的圓角矩形作為卡片的背景。
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 380, height: 200)
                .foregroundStyle(.gray)
                // .overlay 修飾符會在其所應用的視圖（此處是圓角矩形）的上方再疊加一個新視圖，而且不會超出最底下的圓角矩形。
                .overlay (
                    // NavigationLink 是一個特殊的控制項，它既有按鈕的外觀和行為，又能在被點擊時觸發導航。
                    NavigationLink {
                        // 將導航目的地到對應的 DrinkDetailView，並將購物車綁定和當前的飲料數據繼續傳遞下去。
                        DrinkDetailView(cart: $cart,
                                        drink: drink)

                    } label: { // label 用於定義此標籤頁在標籤列上顯示的內容。
                        // 我們使用 HStack 來水平排列飲料圖片和文字資訊。
                        HStack {
                            // 顯示飲料的圖片。
                            Image(drink.imageName)
                                .resizable() // 讓圖片能夠被縮放以適應框架大小。
                                .frame(width: 150, height: 150) // 設定圖片的顯示框架大小。
                                .clipShape(RoundedRectangle(cornerRadius: 16)) // 將圖片裁剪成圓角矩形，使其外觀更柔和。
                            
                            // Spacer 會佔用所有剩餘的水平空間，將圖片和右側的文字推向兩邊。
                            Spacer()
                            
                            // VStack 垂直排列飲料的名稱和價格。
                            VStack(alignment: .trailing){ // '.trailing' 讓 VStack 內的所有文字都向右對齊。
                                // 顯示飲料名稱。
                                Text(drink.name)
                                    .foregroundStyle(.white)
                                    .bold()
                                    .font(.system(size: 30))
                                    
                                
                                // 顯示飲料的基礎價格。
                                Text("價格: \(drink.price)")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.black)
                            }
                            .padding() // 為文字區塊（VStack）添加一些內邊距，使其不會緊貼邊緣。
                            
                        }
                        .padding() // 為整個 HStack（圖片+文字）也添加內邊距。
                    }
                )
        }
        .padding(.horizontal) // 為整個卡片（ZStack）添加水平方向的外邊距，使其不會緊貼螢幕左右邊緣。
    }
}

#Preview {
    // 為了能獨立預覽 DrinkCardView，我們需要提供它所依賴的所有數據。
    DrinkCardView(
        // 'cart' 屬性需要一個 Binding<[OrderItem]>。
        // 在預覽環境中，我們通常不需要一個真正能變動的狀態，
        // 所以使用 .constant([]) 來創建一個內容為空陣列的「靜態」綁定。
        // 這滿足了編譯器的要求，讓預覽可以順利生成。
        cart: .constant([]),
        
        // 'drink' 屬性需要一個 'drink' 物件。
        // 我們手動創建一個範例飲料數據來填充預覽中的內容。
        drink: drink(name: "巧克力冰沙", imageName: "chocolateIce", price: 60)
    )
}
