//
//  NoteCellView.swift
//  NotesClone
//
//

import UIKit

class NoteCellView: UITableViewCell {
  @IBOutlet private weak var noteTitleLabel: UILabel!
  @IBOutlet private weak var noteBodyLabel: UILabel!
  @IBOutlet private weak var noteDateLabel: UILabel!

  var note: Note? {
    didSet {
      configureTitleLabel(text: note?.title)
      configureBodyLabel(text: note?.body)
      configureDateLabel(date: note?.date)
    }
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}

extension NoteCellView {
  private func configureTitleLabel(text: String?) {
    guard let text = text else { return }
    noteTitleLabel.text = text
  }

  private func configureBodyLabel(text: String?) {
    guard let text = text?.trimmingCharacters(in: .whitespaces) else { return }
    noteBodyLabel.text = text
  }

  private func configureDateLabel(date: Date?) {
    guard let date = date else { return }
    let dateFormated: String = Utils.dateFormater(date: date, format: "dd/MM/yy")
    noteDateLabel.text = dateFormated
  }
}
