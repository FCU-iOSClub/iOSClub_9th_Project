//
//  demo_1.swift
//  microinteraction
//
//

import SwiftUI

struct Second_Semester_Week_1_demo1: View {
    @State private var Like: Bool = false
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.gray)
            .frame(width: 350, height: 250)
            .opacity(0.3)
            .overlay{
                VStack{
                    Image("reindeer")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(.circle)

                    HStack(spacing: 20) {
                        Button {
                            Like = !Like
                        } label: {
                            Image(systemName: Like ? "heart" : "heart.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.red)
                        }
                        Image(systemName: "bubble")
                            .font(.largeTitle)
                        
                        Image(systemName: "arrow.2.circlepath")
                            .font(.largeTitle)
                        
                        Image(systemName: "paperplane")
                            .font(.largeTitle)
                    }
                    .padding()
                }
            }
    }
}


#Preview {
    Second_Semester_Week_1_demo1()
}
