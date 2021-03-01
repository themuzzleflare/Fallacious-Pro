import SwiftUI

@main
struct Fallacious_ProApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .onAppear(perform: fetchFallacies)
        }
    }
    
    private func fetchFallacies() {
        CKFallacy.fetch { (results) in
            switch results {
                case .success(let newFallacies):
                    modelData.fallacies = newFallacies
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
