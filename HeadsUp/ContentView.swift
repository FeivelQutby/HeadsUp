import SwiftUI

struct ContentView: View {
    @StateObject private var vm = GameViewModel()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            switch vm.state {
            case .home:
                HomeView(vm: vm)
                    .transition(.opacity)
            case .countdown:
                CountdownView(vm: vm)
                    .transition(.opacity)
            case .playing:
                PlayingView(vm: vm)
                    .transition(.opacity)
            case .result:
                ResultView(vm: vm)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.25), value: vm.state)
        .preferredColorScheme(.dark)
    }
}

#Preview{
    ContentView()
}
