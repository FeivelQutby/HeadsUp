import SwiftUI

struct CountdownView: View {
    @ObservedObject var vm: GameViewModel

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Siap-siap!")
                .font(.subheadline)
                .foregroundColor(.gray)
                .tracking(0.5)

            Text(vm.countdownValue > 0 ? "\(vm.countdownValue)" : "GO!")
                .font(.system(size: 96, weight: .black, design: .rounded))
                .foregroundColor(.white)
                .contentTransition(.numericText())
                .animation(.spring(response: 0.3), value: vm.countdownValue)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
