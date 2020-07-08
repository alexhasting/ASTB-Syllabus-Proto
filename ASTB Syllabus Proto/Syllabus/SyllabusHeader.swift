//
//  SyllabusHeader.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/19/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class SyllabusHeader: UICollectionViewCell {
    
    let wingImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "wings")
        return iv
    }()
    
    let syllabusLabel: UILabel = {
         let label = UILabel()
         label.text = "Syllabus"
         label.font = UIFont(name: "Times New Roman", size: 35)
         return label
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
func setupUI() {
        
        // Wing Image
        addSubview(wingImageView)
        wingImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 85)
        NSLayoutConstraint.activate([
            wingImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        // User Progress Label
        addSubview(syllabusLabel)
        syllabusLabel.anchor(top: wingImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 0, width: 0, height: 40)
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
