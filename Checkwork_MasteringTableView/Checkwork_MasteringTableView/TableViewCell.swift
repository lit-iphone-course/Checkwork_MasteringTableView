//
//  TableViewCell.swift
//  Checkwork_MasteringTableView
//
//  Created by 伊藤明孝 on 2023/10/23.
//

import UIKit
class TableViewCell: UITableViewCell {
    @IBOutlet weak var vacationImageView: UIImageView!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vacationImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
