import SwiftUI

struct AppNote: View {
    var title: String
    var body_: String
    var onTitleChange: (String) -> Void
    var onBodyChange: (String) -> Void
    var onCreate: () -> Void
    var onUpdate: () -> Void
    var onDelete: () -> Void
    var isNew: Bool
     
    init(
        title: String,
        body_: String,
        onTitleChange: @escaping (String) -> Void,
        onBodyChange: @escaping (String) -> Void,
        onCreate: @escaping () -> Void = {},
        onUpdate: @escaping () -> Void = {},
        onDelete: @escaping () -> Void = {},
        isNew: Bool = false
     ) {
         self.title = title
         self.body_ = body_
         self.onTitleChange = onTitleChange
         self.onBodyChange = onBodyChange
         self.onCreate = onCreate
         self.onUpdate = onUpdate
         self.onDelete = onDelete
         self.isNew = isNew
     }
  

    var body: some View {
        AppForm() {
            AppField(
                label: "Title:",
                value: title,
                placeholder: "Your title",
                onChange: onTitleChange
            )
            AppField(
                label: "Body:",
                value: body_,
                placeholder: "Your body",
                onChange: onBodyChange,
                multiLines: true
            )
            if isNew {
                AppButton(
                    title: "Create",
                    color: Color("SuccessColor"),
                    onClick: onCreate
                )
            } else {
                AppButton(
                    title: "Update",
                    color: Color("WarningColor"),
                    onClick: onUpdate
                )
                AppButton(
                    title: "Delete",
                    color: Color("DangerColor"),
                    onClick: onDelete
                )
            }
        }
    }
}
