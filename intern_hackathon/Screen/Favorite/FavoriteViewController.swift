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
        
        // navbarの色設定
        navigationController?.navigationBar.barTintColor = UIColor(red: 43 / 255, green: 136 / 255, blue: 203 / 255, alpha: 87)
        
        // navbarの文字色
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        // tabbarの色設定
        tabBarController?.tabBar.barTintColor = UIColor(red: 43 / 255, green: 136 / 255, blue: 203 / 255, alpha: 87)
        
        // ダークモード適用を回避
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }

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
                let favorite = FavoriteData(title: title, url: url, id: id, tapDate: tapDate)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)as?FavoriteViewCell else {
            fatalError()
        }
        let favoriteCell = favoriteData[indexPath.row]
        cell.favoriteSet(title: favoriteCell.title!, url: favoriteCell.url!, id: favoriteCell.id!)
        return cell
    }
}
