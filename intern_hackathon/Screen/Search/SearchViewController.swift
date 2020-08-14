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
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        // navbarの色設定
        navigationController?.navigationBar.barTintColor = UIColor(red: 109 / 255, green: 185 / 255, blue: 208 / 255, alpha: 100)
        
        // navbarの文字色
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        // tabbarの色設定
        tabBarController?.tabBar.barTintColor = UIColor(red: 109 / 255, green: 185 / 255, blue: 208 / 255, alpha: 100)
        
//        // 常にライトモード（明るい外観）を指定することでダークモード適用を回避
//        self.overrideUserInterfaceStyle = .light
//
        
        label.isHidden = true
        
        // 角丸
        searchButton.layer.cornerRadius = 10.0
        // 背景色
        searchButton.backgroundColor = UIColor(red: 77 / 255, green: 147 / 255, blue: 182 / 255, alpha: 100)
        // 影
        searchButton.layer.shadowOpacity = 0.16
        searchButton.layer.shadowRadius = 2.0
        searchButton.layer.shadowColor = UIColor.black.cgColor
        searchButton.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        searchButton.layer.borderWidth = 2.0
        searchButton.layer.borderColor = UIColor.clear.cgColor
            
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchEvents()
    }
    
    // 検索ボタンタップ機能
    private func searchEvents() {

        // nilあるいは空の確認
        guard let text = textField.text, !text.isEmpty else {
            label.isHidden = false
            return
        }
        
        label.isHidden = true
        searchButton.isEnabled = false
        
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
