import SwiftUI

struct ResultView: View {
    @ObservedObject var vm: GameViewModel
    var body: some View {
        ScrollView {
            
            Text("HeadsUp")
                .font(.system(size: 36, weight: .black, design: .rounded))
                .foregroundColor(.white)
            
            VStack(spacing: 0) {
                // Stats row
                HStack(spacing: 10) {
                    StatBox(value: "\(vm.correctCount)", label: "Bener")
                    StatBox(value: "\(vm.skipCount)", label: "Skip")
                    StatBox(value: "\(vm.accuracy)%", label: "Akurasi")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 28)

                // Log
                if !vm.gameLog.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        VStack(spacing: 4) {
                            ForEach(vm.gameLog) { entry in
                                HStack(spacing: 10) {
                                    Circle()
                                        .fill(entry.wasCorrect ? Color.white : Color(white: 0.3))
                                        .frame(width: 7, height: 7)
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text(entry.song.title)
                                            .font(.subheadline)
                                            .foregroundColor(entry.wasCorrect ? .white : Color(white: 0.45))
                                        Text(entry.song.artist)
                                            .font(.caption)
                                            .foregroundColor(Color(white: 0.35))
                                    }
                                    Spacer()
                                    Text(entry.wasCorrect ? "BENER" : "SKIP")
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                        .foregroundColor(entry.wasCorrect ? .black : Color(white: 0.4))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(entry.wasCorrect ? Color.white : Color(white: 0.1))
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 9)
                                .background(Color(white: 0.07))
                                .clipShape(RoundedRectangle(cornerRadius: 11))
                                .padding(.horizontal, 20)
                            }
                        }
                    }
                    .padding(.bottom, 28)
                }

                // Buttons
                VStack(spacing: 10) {
                    Button {
                        vm.startCountdown()
                    } label: {
                        Text("MAIN LAGI")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }

                    Button {
                        vm.goHome()
                    } label: {
                        Text("Menu")
                            .font(.subheadline)
                            .foregroundColor(Color(white: 0.5))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color(white: 0.07))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(white: 0.12), lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }
}

struct StatBox: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundColor(.white)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
                .tracking(0.5)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Color(white: 0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(white: 0.1), lineWidth: 1)
        )
    }
}

#Preview {
    ContentView()
}
