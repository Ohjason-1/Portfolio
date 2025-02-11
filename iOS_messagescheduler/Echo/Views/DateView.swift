//
//  DateView.swift
//  Echo
//
//  Created by Ethan Gale on 11/21/24.
//

import SwiftUI
import SwiftData

struct DateView: View {

    var body: some View {
        
        VStack(spacing: 20) {
            HeaderView()
            Spacer()
            DateDisplayView()
            Spacer()
            ToggleOptionsView()
            Spacer()
            ActionButtonView()
        }
       
    }
    
}

struct HeaderView: View {
    var body: some View {
        HStack {
            
            Button {
                dummyFunction()
            } label: {
                Image(systemName: "arrow.left").font(.title2)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Text(Image("logo"))
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            

        }.padding()

    }
}



struct DateDisplayView: View {
    @State private var currentDate = Date()
      private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 8) {
                    Text(formatDate(date: currentDate, format: "EEE MMM"))
                        .font(.headline)
                        .foregroundColor(.green)
                    Text(formatDate(date: currentDate, format: "dd"))
                        .font(.system(size: 100, weight: .bold))
                        .foregroundColor(.green)
                    HStack {
                        Spacer()
                        Text(formatDate(date: currentDate, format: "MMM dd, yyyy")).font(.subheadline) .foregroundColor(Color.black.opacity(0.8))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.gray.quaternary)
                                .cornerRadius(10)
                                .padding(.horizontal, 20)
                        Spacer()
                        Text(formatDate(date: currentDate, format: "h:mm a")).font(.subheadline) .foregroundColor(Color.black.opacity(0.8))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.gray.quaternary)
                                .cornerRadius(10)
                                .padding(.horizontal, 20)
                        Spacer()
                    }
                    .font(.subheadline)
                    .padding(.horizontal)
                }
                .padding()
                .onReceive(timer) { input in
                    currentDate = input
                }
    }
}


struct ToggleOptionsView: View {
    @State private var remindMe = true
    @State private var addToFavorites1 = true
    @State private var addToFavorites2 = false

        var body: some View {
            VStack(spacing: 16) {
                Toggle("Remind me", isOn: $remindMe)
                Toggle("Add to Favorites", isOn: $addToFavorites1)
                Toggle("Add to Favorites", isOn: $addToFavorites2)
            }
            .padding(.horizontal)
        }
}


struct ActionButtonView: View {
    var body: some View {
        Button(action: {
            dummyFunction()
        }) {
            Text("Publish")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
        }
        .padding()
    }
}


func dummyFunction() -> Void {
    return
}

private func formatDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

#Preview {
    DateView()
}

