//
//  FavoriteViewController.swift
//  intern_hackathon
//
//  Created by 益子智裕 on 2020/08/13.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var favoriteData : [FavoriteData] = []
    
    @IBOutlet weak var favoriteTableData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       favoriteTableData.delegate = self
        favoriteTableData.dataSource = self
        favoriteTableData.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteCell")
        do{
            let realm = try Realm()
            let realmdata2 = realm.objects(RealmEventData.self)
            for data in realmdata2 {
                print("name: \(String(describing: data.title))")
                print("name: \(String(describing: data.url))")
                let title = data.title
                let url = data.url
                let id = data.id
                let tapDate = data.tapDate
                let favorite = FavoriteData(title:title,url:url,id:id,tapDate:tapDate)
                favoriteData.append(favorite)
            }
        }
        catch(let message){
            print(message)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableData.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)as?FavoriteTableViewCell
        let favoriteCell  = favoriteData[indexPath.row]
        cell?.favoriteSet(title:favoriteCell.title!,url:favoriteCell.url!,id:favoriteCell.id!,tapDate:favoriteCell.tapDate!)
        return cell!
       }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         favoriteData.count
     }
}
