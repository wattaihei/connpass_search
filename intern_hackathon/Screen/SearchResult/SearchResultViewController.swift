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

final class SearchResultViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var events: [Event] = []

    static func makeInstance(_ events: [Event]) -> SearchResultViewController {
        let searchResultViewController = R.storyboard.searchResult.instantiateInitialViewController()!
        searchResultViewController.events = events
        return searchResultViewController
    }
    
    override func viewDidLoad() {
        tableView.register(R.nib.searchResultCell)
        tableView.reloadData()
    }
}

extension SearchResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.searchResultCell, for: indexPath),
            let event = events[safe: indexPath.row] else { return UITableViewCell() }
        _ = UIButton()
        cell.favoriteButton.addTarget(self, action: #selector(self.buttonEvent(_: )), for: UIControl.Event.touchUpInside)
        cell.favoriteButton.tag = indexPath.row
        if isFavored(event) {
            changeFavoriteIcon(cell.favoriteButton)
        }
        cell.set(event)
        return cell
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        let newRealmRecord = RealmEventData()
        let event = events[sender.tag]
        changeFavoriteIcon(sender)
        // すでに押されてたら何もしない
        guard !isFavored(event) else { return }
        newRealmRecord.title = event.title
        newRealmRecord.url = event.eventURL
        newRealmRecord.address = event.address
        newRealmRecord.id = event.eventID!
        newRealmRecord.tapDate = Date()
        newRealmRecord.startedAt = event.startedAt

        do {
            let realm = try Realm()
            try realm.write {
                realm.add(newRealmRecord)
            }
            print(realm.objects(RealmEventData.self))
        } catch let error {
            print(error)
        }
    }
    
    // event がFavされてるか
    private func isFavored(_ event: Event) -> Bool {
        do {
            let realm = try Realm()
            let matchingEvents = realm.objects(RealmEventData.self).filter("id == " + String(event.eventID!))
            return !matchingEvents.isEmpty
        } catch let error {
            print(error)
            return false
        }
    }
    
    private func changeFavoriteIcon(_ button: UIButton) {
        let image = UIImage(named: "heart")
        button.setBackgroundImage(image, for: .normal)
    }
}

extension SearchResultViewController: UITableViewDelegate {
    
    // height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlString = events[safe: indexPath.row]?.eventURL,
            let url = URL(string: urlString) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
