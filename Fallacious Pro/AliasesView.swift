import SwiftUI

struct AliasesView: View {
    var fallacy: Fallacy
    
    var body: some View {
        List(fallacy.aliases, id: \.self) { alias in
            Text(alias)
                .contextMenu {
                    Button(action: {
                        UIPasteboard.general.string = alias
                    }) {
                        Label("Copy", systemImage: "doc.on.clipboard")
                    }
                }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Aliases")
        .navigationBarTitleDisplayMode(.inline)
    }
}
