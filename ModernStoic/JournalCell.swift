//
//  JournalCell.swift
//  ModernStoic
//
//  Created by Maaz M on 4/21/24.
//

import UIKit

class JournalCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func update(with journal: Journal) {
        titleLabel.text = journal.title
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
