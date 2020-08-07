import Nuke
import UIKit

final class SampleArticleListCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    func set(_ article: Article) {
        titleTextLabel.text = article.title
        descriptionTextLabel.text = "LGTM: " +  String(article.likesCount)
        
        if let urlString = article.user?.profileImageUrl,
            let url = URL(string: urlString) {
            Nuke.loadImage(with: url, into: userImageView)
        }
    }
}
