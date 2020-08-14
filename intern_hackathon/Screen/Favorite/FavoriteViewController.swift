//
//  FavoriteViewController.swift
//  intern_hackathon
//
//  Created by 渡辺泰平 on 2020/08/14.
//  Copyright © 2020 caraquri. All rights reserved.
//

import RealmSwift
import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var favoriteData: [FavoriteData] = []
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        favoriteTableView.register(UINib(nibName: "FavoriteViewCell", bundle: nil), forCellReuseIdentifier: "favoriteCell")
        do {
            let realm = try Realm()
            let realmdata2 = realm.objects(RealmEventData.self)
            for data in realmdata2 {
                print("name: \(String(describing: data.title))")
                print("url: \(String(describing: data.url))")
                print("id: \(String(describing: data.id))")
                print("tapData: \(String(describing: data.tapDate))")
                let title = data.title
                let url = data.url
                let id = data.id
                let tapDate = data.tapDate
                let startedAt = data.startedAt
                let favorite = FavoriteData(title: title, url: url, id: id, tapDate: tapDate, startedAt: startedAt!)
                
                favoriteData.append(favorite)
            }
            print("favoriteData\(favoriteData)")
            
        } catch let message {
            print(message)
        }
        favoriteTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)as?FavoriteViewCell else {
            fatalError()
        }
        let favoriteCell = favoriteData[indexPath.row]
        cell.favoriteSet(title: favoriteCell.title!, url: favoriteCell.url!, id: favoriteCell.id!, startedAt: favoriteCell.startedAt)
        return cell
    }
}
