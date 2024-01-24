import SwiftUI

struct HomeView: View {
    @State private var notes: [Note] = []
    @State private var newNote: Note
    @State private var showAuthView = false
    
    var body: some View {
        AppLayout() {
            AppTitle(
                title: "Notes"
            )
            ScrollView {
//                ForEach(
//                    self.notes,
//                    id: \.self
//                ) { note in
//                    if let index = self.notes.firstIndex(of: note) {
//                         AppNote(
//                            title: "",
//                            body_: "",
//                            onTitleChange: { value in
//                                self.notes[index] = nil
//                            },
//                            onBodyChange: { value in
//                                self.notes[index] = nil
//                            },
//                            onUpdate: {},
//                            onDelete: {}
//                         )
//                     }
//                }
            }
            AppNote(
               title: "",
               body_: "",
               onTitleChange: { value in
//                   self.newNote = nil
               },
               onBodyChange: { value in
//                   self.newNote = value
               },
               onCreate: {},
               isNew: true
            )
        }
            .padding()
            .onAppear() {
                self.showAuthView = true
            }
            .sheet(
                isPresented: $showAuthView
            ) {
                AuthView()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(newNote: <#Note#>)
    }
}
