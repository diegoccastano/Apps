//
//  PageCollectionViewCell.swift
//  AutoLayout
//
//  Created by Diego Castaño on 07/03/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(
                string: unwrappedPage.headerText,
                attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
            )
            
            attributedText.append(
                NSMutableAttributedString(
                    string: "\n\n\n\(unwrappedPage.bodyText)", 
                    attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                                 NSAttributedString.Key.foregroundColor: UIColor.gray])
            )
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let bearImageView: UIImageView = {
        
        let image = UIImage()
        let imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
                
        textView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Coder not implemented!")
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        topImageContainerView.addSubview(bearImageView)
        
        addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
