import SwiftUI

struct HomeView: View {
    @State private var todos: [String] = []
    @State private var newTodo: String = ""
    @State private var showAuthView = false
    
    var body: some View {
        VStack() {
            AppTitle(
                title: "Todos"
            )
            ScrollView {
                ForEach(
                    todos,
                    id: \.self
                ) { todo in
                    if let index = todos.firstIndex(of: todo) {
                         Todo(
                             value: todo,
                             onChange: { value in
                                 todos[index] = value
                             },
                             onClick: {
                                 todos.remove(at: index)
                             }
                         )
                     }
                }
            }
            Todo(
                value: newTodo,
                onChange: { value in
                    newTodo = value
                },
                onClick: {
                    if !newTodo.isEmpty {
                        todos.append(newTodo)
                    }
                },
                new: true
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
