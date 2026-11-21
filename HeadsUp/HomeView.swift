import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: GameViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 8) {
                    Text("HEADS UP")
                        .font(.system(size: 36, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 40)
                }
                .padding(.bottom, 32)


                // Category
                VStack(alignment: .leading, spacing: 10) {
                    Text("Categories")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .tracking(1.5)
                        .padding(.horizontal, 20)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(Category.allCases) { cat in
                            Button {
                                vm.selectedCategory = cat
                            } label: {
                                Text(cat.rawValue)
                                    .font(.subheadline)
                                    .fontWeight(vm.selectedCategory == cat ? .semibold : .regular)
                                    .foregroundColor(vm.selectedCategory == cat ? .white : Color(white: 0.55))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(
                                        vm.selectedCategory == cat
                                        ? Color(white: 0.18)
                                        : Color(white: 0.07)
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(
                                                vm.selectedCategory == cat
                                                ? Color(white: 0.35)
                                                : Color(white: 0.1),
                                                lineWidth: 1
                                            )
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 28)

                // Timer setting
                VStack(alignment: .leading, spacing: 10) {
                    Text("Time")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .tracking(1.5)
                        .padding(.horizontal, 20)

                    HStack(spacing: 10) {
                        ForEach([60, 90, 120], id: \.self) { sec in
                            Button {
                                vm.totalDuration = sec
                            } label: {
                                Text("\(sec)s")
                                    .font(.subheadline)
                                    .fontWeight(vm.totalDuration == sec ? .semibold : .regular)
                                    .foregroundColor(vm.totalDuration == sec ? .white : Color(white: 0.55))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 11)
                                    .background(vm.totalDuration == sec ? Color(white: 0.18) : Color(white: 0.07))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(vm.totalDuration == sec ? Color(white: 0.35) : Color(white: 0.1), lineWidth: 1)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 32)

                // Start button
                Button {
                    vm.startCountdown()
                } label: {
                    Text("START")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview{
    ContentView()
}
