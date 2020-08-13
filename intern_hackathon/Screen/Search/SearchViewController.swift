//
//  SearchViewController.swift
//  intern_hackathon
//
//  Created by 家田真帆 on 2020/08/12.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchEvents()
    }
    
    // 検索ボタンタップ機能
    private func searchEvents() {
        searchButton.isEnabled = false
        // nilあるいは空の確認
        guard let text = textField.text, !text.isEmpty else {
            
            return
        }
        
        // API
        APIClient.fetchEvents(keyword: text) { [ weak self] result in
            DispatchQueue.main.sync {
                switch result {
                // 成功した場合
                case .success(let events):
                    self?.showEventListScreen(events)
                // 失敗した場合
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert, animated: true)
                }
                self?.searchButton.isEnabled = true
            }
        }
    }
    
    // EventScreenを表示する機能
    private func showEventListScreen(_ events: [Event]) {
        let searchResultViewController = SearchResultViewController.makeInstance(events)
        navigationController?.pushViewController(searchResultViewController, animated: true)
    }
    
}
