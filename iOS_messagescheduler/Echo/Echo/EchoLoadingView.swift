//
//  EchoLoadingView.swift
//  Echo
//
//  Created by Ethan Gale on 11/24/24.
//

import SwiftUI
import SwiftData

struct EchoLoadingView: View {
    var body: some View {
        Image("logo").padding()
    }
}


struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemGreen))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear(duration: 2), value: self.value)
            }.cornerRadius(45.0)
        }
    }
}


struct ProgressBarLoader: View {
        @State var progressValue: Float = 0.0
        
        var body: some View {
            VStack {
                Spacer()
                EchoLoadingView().padding()
                ProgressBar(value: $progressValue).frame(width:250, height: 10)
                
                Spacer()
            }.padding()
        }
}


#Preview {
    ProgressBarLoader()
}
