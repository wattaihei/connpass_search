//
//  SearchResult.swift
//  intern_hackathon
//
//  Created by 渡辺泰平 on 2020/08/12.
//  Copyright © 2020 caraquri. All rights reserved.
//

import RealmSwift
import SafariServices
import UIKit

final class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
