//
//  demo_2.swift
//  microinteraction
//
//  Created by AS Q on 2026/3/8.
//

import SwiftUI

struct Second_Semester_Week_1_demo2: View {
    @State private var isLiked: Bool = false
    @State private var isCommented: Bool = false
    @State private var isReposted: Bool = false
    @State private var repostRotation: Double = 0
    @State private var isShared: Bool = false

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(width:375, height: 120)
                .overlay(alignment: .topLeading) {
                    HStack(alignment: .top, spacing: 12) {
                        
                        Image("reindeer")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Peter")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text("大家好我是 Peter，喜歡 tuki.")
                                .font(.body)
                                .foregroundStyle(.white)
                            
                            HStack(spacing: 20) {
                                
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .foregroundStyle(isLiked ? .red : .white)
                                    .contentTransition(.symbolEffect(.replace))
                                    .symbolEffect(.bounce, value: isLiked)
                                    .onTapGesture {
                                        withAnimation(.spring) {
                                            isLiked.toggle()
                                        }
                                    }
                                
                                Image(systemName: "bubble")
                                    .symbolEffect(.bounce, value: isCommented)
                                    .onTapGesture {
                                        isCommented.toggle()
                                    }
                                
                                Image(systemName: "arrow.2.squarepath")
                                    .rotationEffect(.degrees(repostRotation))
                                    .symbolEffect(.bounce, value: isReposted)
                                    .onTapGesture {
                                        isReposted.toggle()
                                        withAnimation(.spring) {
                                            
                                            repostRotation += 180
                                        }
                                    }
                                
                                Image(systemName: "paperplane")
                                    .symbolEffect(.bounce, value: isShared)
                                    .onTapGesture {
                                        isShared.toggle()
                                    }
                            }
                            .font(.title3)
                            .foregroundStyle(.white)
                        }
                    }
                    .padding()
                }
            Text("")
        }
    }
}

#Preview {
    Second_Semester_Week_1_demo2()
}
