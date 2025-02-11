//
//  DateView.swift
//  Echo
//
//  Created by Ethan Gale on 11/21/24.
//

import SwiftUI
import SwiftData

struct DateView: View {
    var onNext: () -> Void
    var onBack: () -> Void
    
    @State private var selectedDate: Date = Date() // Tracks the selected date
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(onBack: onBack) // Keep the existing header
            Spacer()
            
            // Add the selectable date functionality within the existing layout
            DateDisplayView(selectedDate: $selectedDate)
            
            Spacer()
            ToggleOptionsView() // Existing toggle options
            Spacer()
            
            Button("Publish") {
                onNext()
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct HeaderView: View {
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

struct DateDisplayView: View {
    @Binding var selectedDate: Date // Bind selected date to the parent
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(spacing: 16) {
            // Current date display
            Text(formatDate(date: selectedDate, format: "EEE MMM"))
                .font(.headline)
                .foregroundColor(.green)
            
            Text(formatDate(date: selectedDate, format: "dd"))
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(.green)
            
            // Date selection using a picker
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle()) // Wheel picker to match the style
                .frame(height: 150)
            
            HStack {
                Spacer()
                Text(formatDate(date: selectedDate, format: "MMM dd, yyyy"))
                    .font(.subheadline)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                Spacer()
                Text(formatDate(date: Date(), format: "h:mm a")) // Keep current time display
                    .font(.subheadline)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                Spacer()
            }
        }
        .padding()
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
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        Button(action: {
            // Publish action here
        }) {
            Text("Publish")
                .font(.title2)
                .frame(maxWidth: .infinity)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding()
                .background(colorScheme == .dark ? .black : .white)
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
    DateView(onNext: {}, onBack: {})
}

