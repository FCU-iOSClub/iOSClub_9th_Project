//  youtube_playing_screen

import SwiftUI

struct youtube_playing_screen: View {
    var body: some View {
        ZStack{
            
            Color.black.opacity(0.9)
            
            VStack (alignment: .leading){
                Text("まるでこの世界で")
                Text("二人だけみたいだねなんて少しだけ夢をみてしまっただけ")
                Text("つま先に月明かり花束の香り 指に触れる指")
                Text("さよならもう行かなきゃ")
                Text("何もかも忘れて")
                Text("硝子の上を裸足のまま歩く")
                Text("痛むごとに血が流れて落ちていく")
                Text("お願い その赤い足跡を辿って")
                Text("会いにきて")
                Text("錆びたプールに放たれていく金魚")
                Text("靴箱の中隠した林檎")
                Text("萎びた君の肌に残る傷跡")
                Text("犬のように泳いだ迷子")
            }
            .font(.largeTitle)
            .fontWeight(.bold)
            .rotationEffect(.degrees(-15))
            .opacity(0.2)
            .foregroundStyle(.white)
            
            VStack{
                
                Image("Jane Doe")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack (alignment: .leading){
                    Text("Jane Doe")
                        .font(.largeTitle)
                    Text("Kenshi Yonezu & Hikaru Utada")
                        .font(.title3)
                }
                .fontWeight(.bold)
                .foregroundStyle(.white)
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    youtube_playing_screen()
}
