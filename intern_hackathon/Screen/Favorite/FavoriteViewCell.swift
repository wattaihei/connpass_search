//
//  FavoriteViewCell.swift
//  intern_hackathon
//
//  Created by 渡辺泰平 on 2020/08/14.
//  Copyright © 2020 caraquri. All rights reserved.
//
import Nuke
import RealmSwift
import UIKit

class FavoriteViewCell: UITableViewCell {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    
    override func awakeFromNib() {        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func favoriteSet(title: String, url: String, id: Int, startedAt: String) {
        titleTextLabel.text = title
        eventDate.text = "\(startedAt)"
        
    }
}
