import SwiftUI

struct HomeView: View {
//    @State private var notes: [Note] = []
//    @State private var newNote: Note = Note(
//        id: 0,
//        title: "",
//        body: "",
//        user_id: 0,
//        created_at: "",
//        updated_at: ""
//    )
    @State private var showAuthView = false
    
    var body: some View {
        AppLayout() {
            AppTitle(
                title: "Notes"
            )
//            ScrollView {
//                ForEach(self.notes) { note in
//                    AppNote(
//                        title: note.title,
//                        body_: note.body,
//                        onTitleChange: {value in},
//                        onBodyChange: {value in},
//                        onUpdate: {},
//                        onDelete: {}
//                    )
//                }
//            }
//            AppNote(
//                title: self.newNote.title,
//                body_: self.newNote.body,
//                onTitleChange: { value in
//                    self.newNote.title = value
//                },
//                onBodyChange: { value in
//                    self.newNote.body = value
//                },
//                onCreate: {},
//                isNew: true
//            )
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
        HomeView()
    }
}
