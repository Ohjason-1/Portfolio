//
//  DestinationSearchView.swift
//  Airbnb2
//
//  Created by Jaewon Oh on 4/8/25.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}
struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }

            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destination", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    ExtractedView(title: "Where", description: "Add destination")
                }
                
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding()
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
            
            // date selection view
            VStack {
                if selectedOption == .dates {
                    HStack {
                        Text("show expanded view")
                        Spacer()
                    }
                } else {
                    ExtractedView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding()
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }
            
            
            // num guests view
            VStack {
                if selectedOption == .guests {
                    HStack {
                        Text("show expanded view")
                        Spacer()
                    }
                } else {
                    ExtractedView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .padding()
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }
        }
    }
}

#Preview {
    DestinationSearchView(show:.constant(false))
}

struct ExtractedView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
