import Foundation

struct Note: Codable {
    let id: Int
    let title: String
    let body: String
    let user_id: Int
    let created_at: String
    let updated_at: String
}

class NoteManager {
    func createNote() -> Void {}
    
    func readNotes() -> [Note] {}
    
    func readNote() -> Note {}
    
    func updateNote(id: Int, note: Note) -> Note {}
    
    func deleteNote(id: Int) -> Void {}
}
