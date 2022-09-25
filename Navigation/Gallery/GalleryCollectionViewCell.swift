import UIKit
import SnapKit

class GalleryCollectionViewCell: UICollectionViewCell {
    static let identifier = "GalleryCollectionViewCell"
    var sourse: ImageSet? {
        didSet {
            image.image = sourse?.image
        }
    }

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func setupViews() {
        contentView.addSubview(image)
        image.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.leading.equalTo(contentView.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
