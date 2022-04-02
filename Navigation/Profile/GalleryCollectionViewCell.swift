//
//  GalleryCollectionViewCell.swift
//  Navigation
//
//  Created by Simon Pegg on 27.09.2021.
//

import UIKit
import SnapKit

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
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let galleryButton: CustomButton = {
        let btn = CustomButton(title: "", titleColor: .white) {
            ProfileViewController().openGallery()
            print("GalleryButton Pressed")
        }
        btn.translatesAutoresizingMaskIntoConstraints = false
  //      btn.addTarget(self, action: #selector(ProfileViewController.openGallery), for: .touchUpInside)
       return btn
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
        image.addSubview(galleryButton)
        translatesAutoresizingMaskIntoConstraints = false
        image.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.leading.equalTo(contentView.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        galleryButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(image.snp.top)
            make.trailing.equalTo(image.snp.trailing)
            make.leading.equalTo(image.snp.leading)
            make.bottom.equalTo(image.snp.bottom)
        }
    }
    
}


