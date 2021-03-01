import SwiftUI

struct TerminologyView: View {
    var fallacy: Fallacy
    
    var body: some View {
        List(fallacy.newTerminology, id: \.self) { term in
            Text(term)
                .contextMenu {
                    Button(action: {
                        UIPasteboard.general.string = term
                    }) {
                        Label("Copy", systemImage: "doc.on.clipboard")
                    }
                }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Terminology")
        .navigationBarTitleDisplayMode(.inline)
    }
}
