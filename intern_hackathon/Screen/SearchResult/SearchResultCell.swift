//
//  SearchResultCell.swift
//  intern_hackathon
//
//  Created by 渡辺泰平 on 2020/08/13.
//  Copyright © 2020 caraquri. All rights reserved.
//

import RealmSwift
import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func set(_ event: Event) {
        titleLabel.text = event.title
        guard let eventDate = event.startedAt else { return }
        guard let eventAddress = event.address else { return }
        descriptionLabel.text = "日時: " +  eventDate.prefix(10) + "  開催地: " + eventAddress
    }
    
}
