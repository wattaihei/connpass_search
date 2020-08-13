//
//  SearchResultCell.swift
//  intern_hackathon
//
//  Created by 渡辺泰平 on 2020/08/13.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func set(_ event: Event) {
        titleLabel.text = event.title
        descriptionLabel.text = event.address
    }
    
}
