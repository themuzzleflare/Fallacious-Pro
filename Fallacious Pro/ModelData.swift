import Foundation

final class ModelData: ObservableObject {
    @Published var fallacies: [Fallacy] = []
}
