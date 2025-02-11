//
//  UploadEchoView.swift
//  Echo
//
//  Created by Ethan Gale on 11/22/24.
import SwiftUI
import SwiftData


struct UploadEchoView: View {
    var onNext: () -> Void
    var onBack: () -> Void

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack {
            EchoHeaderView(onBack: onBack)
            UploadImageView()
            EchoTextView()
            Spacer()
            HStack {
                Spacer()
                Button("Upload") {
                    onNext() // Add the upload functionality here!!
                }.font(.title2)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
                Button("Finish") {
                    onNext() // Call onNext to return to Main Menu
                }.font(.title2)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct EchoHeaderView: View {
    var onBack: () -> Void

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack {
            Button(action: onBack) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 40)
            Spacer()
        }
        .padding()
    }
}
    
struct UploadImageView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        
        VStack {
            // Top Section
            Spacer() // Leaves space above
            Image("upload")
            
            ZStack {
                Rectangle()
                    .frame(height: 200)
                    .foregroundColor(.gray.opacity(0.2))
                    .overlay(
                        Image("Image")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    )
                    .padding()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        HStack(spacing: 15) {
                            Button(action: {
                                // Add action for document icon
                            }) {
                                Text(Image(systemName: "document.badge.plus"))
                                    .font(.title2)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                            Button(action: {
                                // Add action for camera icon
                            }) {
                                Text(Image(systemName: "camera"))
                                    .font(.title2)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                        .padding(20)
                        
                    }
                }
                
            }
            .frame(height: 200) // Adjust to the same size as the Rectangle
            .padding()
            
        }
    }
}
    
    struct EchoTextView: View {
        @Environment(\.colorScheme) private var colorScheme
        @State private var memoMessage: String = "Write a short memo" // Default text
        @FocusState private var isFocused: Bool
        
        var body: some View {
            
            TextEditor(text: $memoMessage)
                .focused($isFocused)
                .padding(10)
                .background(colorScheme == .dark ? .black : .white)
                .cornerRadius(10)
                .font(.body)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                .padding(.horizontal)
                .onChange(of: isFocused) {
                    if memoMessage == "Write a short memo" {
                        memoMessage = ""
                    }
                }
        }
    }

    
    #Preview {
        UploadEchoView(onNext: {}, onBack: {})
    }
