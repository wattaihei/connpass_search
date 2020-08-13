//
//  SearchResult.swift
//  intern_hackathon
//
//  Created by 渡辺泰平 on 2020/08/12.
//  Copyright © 2020 caraquri. All rights reserved.
//

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
        
        cell.set(event)
        return cell
    }
}

extension SearchResultViewController: UITableViewDelegate {
    
    // height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlString = events[safe: indexPath.row]?.eventURL,
            let url = URL(string: urlString) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
