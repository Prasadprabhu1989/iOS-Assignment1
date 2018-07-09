//
//  TableViewListCellTableViewCell.swift
//  iOS Assignment1
//
//  Created by Prasad.d on 04/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit

class TableViewListCell: UITableViewCell {
    let titleLabel : UILabel
    let descriptionLabel : UILabel
    let photoImageView : UIImageView

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        photoImageView = UIImageView()
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureView() {
        descriptionLabel.textColor = UIColor.black
         descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        photoImageView.contentMode = .scaleToFill
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(photoImageView)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        let descriptionLabelmargins = contentView.layoutMarginsGuide
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: descriptionLabelmargins.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: descriptionLabelmargins.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        
        let titleLabelMargins = contentView.layoutMarginsGuide
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 0).isActive = true
         titleLabel.topAnchor.constraint(equalTo: titleLabelMargins.topAnchor, constant: 10).isActive = true

        let imageViewMargins = contentView.layoutMarginsGuide
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.leadingAnchor.constraint(equalTo: imageViewMargins.leadingAnchor, constant: 5).isActive = true

        photoImageView.centerYAnchor.constraint(equalTo: imageViewMargins.centerYAnchor, constant: 0).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

      

        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
}
