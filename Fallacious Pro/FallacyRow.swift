import SwiftUI

struct FallacyRow: View {
    var fallacy: Fallacy
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(fallacy.name)
                    .bold()
                Text(fallacy.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .contextMenu {
            Button(action: {
                UIPasteboard.general.string = fallacy.name
            }) {
                Label("Copy Name", systemImage: "doc.on.clipboard")
            }
            Button(action: {
                UIPasteboard.general.string = fallacy.description
            }) {
                Label("Copy Description", systemImage: "doc.on.clipboard")
            }
        }
    }
}
