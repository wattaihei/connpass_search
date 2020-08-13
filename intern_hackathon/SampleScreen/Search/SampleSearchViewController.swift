import UIKit
import RealmSwift
final class SampleSearchViewContorller: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    var favoriteData : [FavoriteData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
 
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchEvents()
//        do{
//            let realm = try Realm()
//            let realmdata2 = realm.objects(Realmdatas.self)
//            for data in realmdata2 {
//                print("name: \(String(describing: data.title))")
//                print("name: \(String(describing: data.url))")
//                let title = data.title
//                let url = data.url
//                let id = data.id
//                let tapDate = data.tapDate
//                let favorite = FavoriteData(title:title,url:url,id:id,tapDate:tapDate)
//                favoriteData.append(favorite)
//
//            }
//        }
//        catch(let message){
//            print(message)
//        }
        
        
        
        

    }

    private func searchEvents() {
        // 多重タップ防止
        searchButton.isEnabled = false

        guard let text = textField.text, !text.isEmpty else { return }

        APIClient.fetchEvents(keyword: text) { [weak self] result in
            // URLSessionはbackground threadで行われる為UIの更新を明示的にMain Theadで行う
            DispatchQueue.main.sync {
                switch result {
                case .success(let events):
                    self?.showSampleEventListScreen(events)


                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert, animated: true)

                }
                self?.searchButton.isEnabled = true
            }
        }
    }

    private func showSampleEventListScreen(_ events: [Event]) {
        let sampleEventListViewController = SampleEventListViewController.makeInstance(events)
        navigationController?.pushViewController(sampleEventListViewController, animated: true)
    }
}
