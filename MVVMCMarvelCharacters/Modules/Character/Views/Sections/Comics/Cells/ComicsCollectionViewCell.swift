import UIKit

class ComicsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    func configure(comic: Comic) {
        thumbnailImage.byUrl(url: comic.thumbnail?.url, placeholder: R.image.character_placeholder())
    }
}
