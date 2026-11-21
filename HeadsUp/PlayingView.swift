import SwiftUI
import CoreMotion

struct PlayingView: View {
    @ObservedObject var vm: GameViewModel
    @StateObject private var motion = MotionManager()

    var body: some View {
        ZStack {
            // Flash overlay
            if vm.flashCorrect {
                Color.green.opacity(0.40).ignoresSafeArea()
                    .transition(.opacity)
            }
            if vm.flashSkip {
                Color.red.opacity(0.40).ignoresSafeArea()
                    .transition(.opacity)
            }

            VStack(spacing: 0) {
                // Top bar
                HStack {
                    // Correct / Skip counters
                    HStack(spacing: 12) {
                        Label("\(vm.correctCount)", systemImage: "checkmark")
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(Color(white: 0.75))
                        Label("\(vm.skipCount)", systemImage: "arrow.counterclockwise")
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(Color(white: 0.75))
                    }
                    Spacer()
                    // Timer
                    ZStack {
                        Circle()
                            .stroke(Color(white: 0.12), lineWidth: 4)
                        Circle()
                            .trim(from: 0, to: vm.timerProgress)
                            .stroke(
                                vm.timeLeft > 10 ? Color.white : Color.red,
                                style: StrokeStyle(lineWidth: 4, lineCap: .round)
                            )
                            .rotationEffect(.degrees(-90))
                            .animation(.linear(duration: 1), value: vm.timeLeft)
                        Text("\(vm.timeLeft)")
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .foregroundColor(vm.timeLeft <= 10 ? .red : .white)
                    }
                    .frame(width: 48, height: 48)

                    // Stop button
                    Button {
                        vm.goHome()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color(white: 0.5))
                            .frame(width: 32, height: 32)
                            .background(Color(white: 0.12))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
                .padding(.bottom, 24)

                // Song card
                if let song = vm.currentSong {
                    VStack(spacing: 12) {
                        Text(song.title)
                            .font(.system(size: 82, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.1)  // ← sekecil mungkin
                            .lineLimit(nil)            // ← hapus limit baris
                            .fixedSize(horizontal: false, vertical: true)  // ← ← tambah ini
                            .padding(.horizontal, 24)

                        Text(song.artist)
                            .font(.title3)
                            .foregroundColor(Color(white: 0.5))
                    }
                } else {
                    Text("Semua lagu selesai!")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }

                Spacer()

            }
        }
        .animation(.easeInOut(duration: 0.2), value: vm.flashCorrect)
        .animation(.easeInOut(duration: 0.2), value: vm.flashSkip)
        .onReceive(motion.$pitch) { pitch in
            guard vm.state == .playing else { return }
            if pitch > -0.7 {
                vm.markCorrect()
            } else if pitch < 0.7 {
                vm.markSkip()
            }
        }
        .onAppear {
            motion.start()
            UIApplication.shared.isIdleTimerDisabled = true  // ← tambah ini
        }
        .onDisappear {
            motion.stop()
            UIApplication.shared.isIdleTimerDisabled = false  // ← tambah ini
        }
        .onDisappear { motion.stop() }
    }
}

// MARK: - Motion Manager
class MotionManager: ObservableObject {
    @Published var pitch: Double = 0
    private let manager = CMMotionManager()
    private var lastAction: Date = .distantPast

    func start() {
        guard manager.isDeviceMotionAvailable else { return }
        manager.deviceMotionUpdateInterval = 0.1
        manager.startDeviceMotionUpdates(to: .main) { [weak self] data, _ in
            guard let self, let data else { return }
            let p = data.attitude.pitch
            if abs(p) > 0.7, Date().timeIntervalSince(self.lastAction) > 1.2 {
                self.lastAction = Date()
                self.pitch = p
            }
        }
    }

    func stop() {
        manager.stopDeviceMotionUpdates()
    }
}

#Preview {
    ContentView()
}
