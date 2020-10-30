//
//  ContactTableViewCell.swift
//  ContactApp
//
//  Created by Ulvi Bashirov on 10/2/20.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    var nameText: String?
    var descText: String?
    var timeText: String?
    var color: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        descLabel.text = nil
        timeLabel.text = nil
        nameLabel.textColor = UIColor.green
    }
  

}
