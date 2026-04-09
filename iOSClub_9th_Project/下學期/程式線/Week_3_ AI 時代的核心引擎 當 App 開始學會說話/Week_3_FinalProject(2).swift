//
//  Week_3_FinalProject(2).swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/4/4.
//

import SwiftUI
import FoundationModels

struct Week_3_FinalProject_2_: View {
    
    @State var input = "What the different between Dos and DDos"
    @State var output = ""
    
    var body: some View {
        VStack {
            Text("Ask me Anthying...")
                .font(.largeTitle)
                .padding()
            
            TextField("Type here...", text: $input)
                .textFieldStyle(.roundedBorder)
            
            
            Button {
                Task {
                    await generate()
                }
            } label: {
                Text("Get Answer")
                    .font(.system(size: 20))
                    .frame(width: 300, height: 30)
            }
            .buttonStyle(.borderedProminent)
            .padding()
            

            ScrollView {
                Text(output)
            }
        }
        .padding()
    }
    
    func generate() async {
        do {
            let session = LanguageModelSession()
            let response = session.streamResponse(to: input)
            for try await StreamData in response {
                output = StreamData.content
            }
        } catch {
            output = "Failed To Generate"
        }
    }
    
}

#Preview {
    Week_3_FinalProject_2_()
}
