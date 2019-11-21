//
//  KanjiCell.swift
//  JSON
//
//  Created by Rei Sturm on 11/18/19.
//  Copyright © 2019 Rei Sturm. All rights reserved.
//

import UIKit

class KanjiCell: UITableViewCell {

    @IBOutlet weak var hiragana: UILabel!
    
    @IBOutlet weak var Kanji: UILabel!
    
    @IBOutlet weak var definitions: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
