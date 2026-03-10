//
//  demo_2_template.swift
//  microinteraction
//

import SwiftUI

struct Second_Semester_Week_1_demo2: View {
    @State private var isLiked: Bool = false
    @State private var isCommented: Bool = false
    @State private var isReposted: Bool = false
    @State private var repostRotation: Double = 0
    @State private var isShared: Bool = false
    var body: some View {
        TabView{
            ZStack{
                Color.gray.opacity(0.5).ignoresSafeArea()
                ScrollView{
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray)
                            .frame(width: 375, height: 120)
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
                                    if isCommented {
                                        Text("已留言")
                                            .font(.caption)
                                            .foregroundStyle(.black)
                                    }
                                    
                                    if isShared {
                                        Text("已傳送")
                                            .font(.caption)
                                            .foregroundStyle(.yellow)
                                    }
                                }
                                .padding()
                            }
                    }
                }
            }
            .tabItem {
                Label("首頁", systemImage: "house.fill")
            }
            
            Text("個人介面")
                .tabItem {
                    Label("個人", systemImage: "person")
                }
        }
    }
}


#Preview {
    Second_Semester_Week_1_demo2()
}
