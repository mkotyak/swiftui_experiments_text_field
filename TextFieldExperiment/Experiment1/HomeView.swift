import SwiftUI

struct HomeView: View {
    private enum Constants {
        static var maxTextLength: Int { 15 }
        static var textFieldPlaceholder: String { "User name" }
    }

    @StateObject var manager: TFManager
    @State var isTapped = false

    var body: some View {
        VStack {
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                HStack(spacing: 15) {
                    TextField("", text: $manager.text) { status in
                        if status {
                            withAnimation(.easeIn) {
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        if manager.text == "" {
                            withAnimation(.easeOut) {
                                isTapped = false
                            }
                        }
                    }
                    .padding(.top, isTapped ? 15 : 0)
                    .background(
                        Text(Constants.textFieldPlaceholder)
                            .scaleEffect(isTapped ? 0.8 : 1)
                            .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                            .foregroundColor(.gray),
                        alignment: .leading
                    )
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.09))
            .cornerRadius(5)

            HStack {
                Spacer()
                Text("\(manager.text.count)/\(Constants.maxTextLength)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    .padding(.top, 4)
            }
        }
        .padding()
    }
}
