import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
     let imageFilter = ImageProcessor()
    var post: PostBody? {
        didSet {
            postImageView.image = post?.image
            postTitle.text = post?.title
            postDescription.text = post?.description
            postViews.text = "Views: \(post?.views ?? 0)"
            postLikes.text = "Likes: \(post?.likes ?? 0)"
        }
    }
    
    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
 //       imageFilter.processImage(sourceImage: imageView.image, filter: .fade, completion: nil)
        return imageView
    }()
 //   ImageProcessor().processImage(sourceImage: postImageView.image, filter: .fade, completion: nil)
    
    var postTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
 
    var postDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    var postViews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    var postLikes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        ImageProcessor().processImage(sourceImage: postImageView.image!, filter: .fade, completion: (UIImage?) -> Void)
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
}

extension PostTableViewCell {
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(postImageView)
        contentView.addSubview(postTitle)
        contentView.addSubview(postDescription)
        contentView.addSubview(postViews)
        contentView.addSubview(postLikes)

        
        let constraints = [
            
            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
 
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postLikes.topAnchor.constraint(equalTo: postViews.topAnchor),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
