//
//  TableViewCell.swift
//  intern_hackathon
//
//  Created by 益子智裕 on 2020/08/13.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func favoriteSet(title:String,url:String,id:Int,tapDate:Date){
        titleLabel.text = title
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
