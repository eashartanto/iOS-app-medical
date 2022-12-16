//
//  FinancialMovementTableCell.swift
//  iOSFinal
//
//  Created by Muhammed Kocabas on 2022-12-15.
//

import UIKit

class FinancialMovementTableCell: UITableViewCell {

    
    @IBOutlet weak var movementtext: UILabel!
   
    @IBOutlet weak var cellimage: UIImageView!
    
    @IBOutlet weak var detailslabel: UILabel!
    
    @IBOutlet weak var amountlabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
