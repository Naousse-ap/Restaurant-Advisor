//
//  AATableViewCell.swift
//  Restaurant
//
//  Created by Anaïs Puig on 17/03/2021.
//

import UIKit

class AATableViewCell: UITableViewCell {

    @IBOutlet weak var aze: UILabel!
    @IBOutlet weak var qsd: UILabel!
    @IBOutlet weak var wxc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
