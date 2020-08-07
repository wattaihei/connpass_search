import SafariServices
import UIKit

final class SampleArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articles: [Article] = []

    static func makeInstance(_ articles: [Article]) -> SampleArticleListViewController {
        let sampleArticleListViewController = R.storyboard.sampleArticleList.instantiateInitialViewController()!
        sampleArticleListViewController.articles = articles
        return sampleArticleListViewController
    }

    override func viewDidLoad() {
        tableView.register(R.nib.sampleArticleListCell)
        tableView.reloadData()
    }
}

extension SampleArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.sampleArticleListCell, for: indexPath),
            let article = articles[safe: indexPath.row] else { return UITableViewCell() }
        
        cell.set(article)
        return cell
    }
}

extension SampleArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let urlString = articles[safe: indexPath.row]?.url,
            let url = URL(string: urlString) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
