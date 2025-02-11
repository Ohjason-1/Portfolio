import SwiftUI

struct RecordEchoView: View {
    @Binding var echoMessage: String
    var onNext: () -> Void

    @Environment(\.colorScheme) private var colorScheme
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 40)
                Spacer()
                Button("Next") {
                    onNext()
                }
                .font(.body)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
            }
            .padding(.horizontal)
            .padding()

            TextEditor(text: $echoMessage)
                .focused($isFocused)
                .padding()
                .font(.body)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .onChange(of: isFocused) {
                    if echoMessage.isEmpty { echoMessage = "" }
                }

            Spacer()
        }
        .padding()
    }
}

struct RecordEchoView_Previews: PreviewProvider {
    static var previews: some View {
        RecordEchoView(
            echoMessage: .constant("This is a preview placeholder"), // Provide a placeholder string
            onNext: {} // Provide an empty action for onNext
        )
    }
}
