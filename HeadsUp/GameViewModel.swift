import Foundation
import Combine
import UIKit

enum GameState {
    case home
    case countdown
    case playing
    case result
}

struct GameLogEntry: Identifiable {
    let id = UUID()
    let song: Song
    let wasCorrect: Bool
}

class GameViewModel: ObservableObject {
    @Published var state: GameState = .home
    @Published var selectedCategory: Category = .random
    @Published var currentSong: Song? = nil
    @Published var timeLeft: Int = 60
    @Published var countdownValue: Int = 3
    @Published var correctCount: Int = 0
    @Published var skipCount: Int = 0
    @Published var gameLog: [GameLogEntry] = []
    @Published var flashCorrect: Bool = false
    @Published var flashSkip: Bool = false

    var totalDuration: Int = 60
    private var queue: [Song] = []
    private var timer: AnyCancellable?
    private var countdownTimer: AnyCancellable?

    var score: Int { max(0, correctCount * 100 - skipCount * 10) }
    var accuracy: Int {
        let total = correctCount + skipCount
        guard total > 0 else { return 0 }
        return Int(Double(correctCount) / Double(total) * 100)
    }

    var timerProgress: Double {
        guard totalDuration > 0 else { return 0 }
        return Double(timeLeft) / Double(totalDuration)
    }

    func startCountdown() {
        state = .countdown
        countdownValue = 3
        countdownTimer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                if self.countdownValue > 1 {
                    self.countdownValue -= 1
                } else {
                    self.countdownTimer?.cancel()
                    self.startGame()
                }
            }
    }

    private func startGame() {
//        queue = selectedCategory.songs.shuffled()
        // startGame()
        queue = Shuffler.shuffle(selectedCategory.songs)

        // advance()
        queue = Shuffler.shuffle(selectedCategory.songs)
        gameLog = []
        correctCount = 0
        skipCount = 0
        timeLeft = totalDuration
        currentSong = queue.first
        state = .playing
        startTimer()
    }

    private func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                if self.timeLeft > 0 {
                    self.timeLeft -= 1
                    if self.timeLeft <= 10 && self.timeLeft > 0 {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                    }
                } else {
                    UINotificationFeedbackGenerator().notificationOccurred(.warning)
                    self.endGame()
                }
            }
    }

    func markCorrect() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        guard let song = currentSong else { return }
        gameLog.append(GameLogEntry(song: song, wasCorrect: true))
        correctCount += 1
        flashCorrect = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            self.flashCorrect = false
        }
        advance()
    }

    func markSkip() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        guard let song = currentSong else { return }
        gameLog.append(GameLogEntry(song: song, wasCorrect: false))
        skipCount += 1
        flashSkip = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            self.flashSkip = false
        }
        advance()
    }

    private func advance() {
        queue.removeFirst()
        if queue.isEmpty {
            endGame()
        } else {
            currentSong = queue.first
        }
    }

    private func endGame() {
        timer?.cancel()
        state = .result
    }

    func goHome() {
        timer?.cancel()
        countdownTimer?.cancel()
        state = .home
    }
}
