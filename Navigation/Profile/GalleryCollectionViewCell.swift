//
//  GalleryCollectionViewCell.swift
//  Navigation
//
//  Created by Simon Pegg on 27.09.2021.
//

import UIKit
import StorageService
class GalleryCollectionViewCell: UICollectionViewCell {
    static let identifier = "GalleryCollectionViewCell"
    var sourse: ImageSet? {
        didSet {
            image.image = sourse?.image
        }
    }

    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.clipsToBounds = true
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
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}


