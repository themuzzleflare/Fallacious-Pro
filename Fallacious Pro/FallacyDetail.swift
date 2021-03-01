import SwiftUI

struct FallacyDetail: View {
    var fallacy: Fallacy
    
    var body: some View {
        List {
            Section(header: Text("Overview"), footer: Text("Last Updated: \(fallacy.updateDate)")) {
                HStack(alignment: .center, spacing: 0) {
                    Text("Name")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(fallacy.name)
                        .multilineTextAlignment(.trailing)
                }
                .contextMenu {
                    Button(action: {
                        UIPasteboard.general.string = fallacy.name
                    }) {
                        Label("Copy", systemImage: "doc.on.clipboard")
                    }
                }
                if fallacy.latinName != "" {
                    HStack(alignment: .center, spacing: 0) {
                        Text("Latin Name")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(fallacy.latinName)
                            .multilineTextAlignment(.trailing)
                    }
                    .contextMenu {
                        Button(action: {
                            UIPasteboard.general.string = fallacy.latinName
                        }) {
                            Label("Copy", systemImage: "doc.on.clipboard")
                        }
                    }
                }
                if fallacy.aliases != [""] {
                    NavigationLink(destination: AliasesView(fallacy: fallacy)) {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Aliases")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(fallacy.aliases.count.description)
                                .multilineTextAlignment(.trailing)
                        }
                        .contextMenu {
                            Button(action: {
                                UIPasteboard.general.string = fallacy.aliases.joined(separator: ", ")
                            }) {
                                Label("Copy All", systemImage: "doc.on.clipboard")
                            }
                        }
                    }
                }
                if fallacy.newTerminology != [""] {
                    NavigationLink(destination: TerminologyView(fallacy: fallacy)) {
                        HStack(alignment: .center, spacing: 0) {
                            Text("New Terminology")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(fallacy.newTerminology.count.description)
                                .multilineTextAlignment(.trailing)
                        }
                        .contextMenu {
                            Button(action: {
                                UIPasteboard.general.string = fallacy.newTerminology.joined(separator: ", ")
                            }) {
                                Label("Copy All", systemImage: "doc.on.clipboard")
                            }
                        }
                    }
                }
            }
            if fallacy.logicalForms != [""] {
                Section(header: Text("Logical Forms (\(fallacy.logicalForms.count))")) {
                    ForEach(fallacy.logicalForms, id: \.self) { logicalForm in
                        Text(logicalForm)
                            .contextMenu {
                                Button(action: {
                                    UIPasteboard.general.string = logicalForm
                                }) {
                                    Label("Copy", systemImage: "doc.on.clipboard")
                                }
                            }
                    }
                }
            }
            Section(header: Text("Description")) {
                Text(fallacy.description)
                    .contextMenu {
                        Button(action: {
                            UIPasteboard.general.string = fallacy.description
                        }) {
                            Label("Copy", systemImage: "doc.on.clipboard")
                        }
                    }
            }
            Section(header: Text("Examples (\(fallacy.examples.count))")) {
                ForEach(fallacy.examples, id: \.self) { example in
                    Text(example)
                        .contextMenu {
                            Button(action: {
                                UIPasteboard.general.string = example
                            }) {
                                Label("Copy", systemImage: "doc.on.clipboard")
                            }
                        }
                }
            }
            if fallacy.exceptions != [""] {
                Section(header: Text("Exceptions (\(fallacy.exceptions.count))")) {
                    ForEach(fallacy.exceptions, id: \.self) { exception in
                        Text(exception)
                            .contextMenu {
                                Button(action: {
                                    UIPasteboard.general.string = exception
                                }) {
                                    Label("Copy", systemImage: "doc.on.clipboard")
                                }
                            }
                    }
                }
            }
            if fallacy.tip != "" {
                Section(header: Text("Tip")) {
                    Text(fallacy.tip)
                        .contextMenu {
                            Button(action: {
                                UIPasteboard.general.string = fallacy.tip
                            }) {
                                Label("Copy", systemImage: "doc.on.clipboard")
                            }
                        }
                }
            }
            if fallacy.references != [""] {
                Section(header: Text("References (\(fallacy.references.count))")) {
                    ForEach(fallacy.references, id: \.self) { reference in
                        Text(reference)
                            .contextMenu {
                                Button(action: {
                                    UIPasteboard.general.string = reference
                                }) {
                                    Label("Copy", systemImage: "doc.on.clipboard")
                                }
                            }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(fallacy.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
