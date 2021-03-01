import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List(modelData.fallacies) { fallacy in
                NavigationLink(destination: FallacyDetail(fallacy: fallacy)) {
                    FallacyRow(fallacy: fallacy)
                }
            }
            .overlay(Group {
                if modelData.fallacies.isEmpty {
                    Text("No fallacies")
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            })
            .listStyle(GroupedListStyle())
            .navigationTitle("Fallacies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
