//
//  LessonCell.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class LessonCell: UICollectionViewCell {
    
    var lesson: Lesson? {
        didSet {
            guard let lessonTitle = lesson?.lessonTitle else {return}
            print(lessonTitle)
            lessonTitleLabel.text = lessonTitle
            
            if loadSavedCompletionData(lessonTitle: lessonTitle) == false {
                completeImageView.isHidden = true
            } else if loadSavedCompletionData(lessonTitle: lessonTitle) == true {
                completeImageView.isHidden = false
            }
        }
    }
    
    var lessonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Introduction"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 18)
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }()
    
    let completeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Green Circle with Checkmark")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .cellGray
        setupUI()
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            shrink(down: isHighlighted)
        }
    }
    
    func setupUI() {
        addSubview(lessonTitleLabel)
        lessonTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 8, paddingBottom: 5, paddingRight: 45, width: 0, height: 0)
        
        addSubview(completeImageView)
        completeImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 40, height: 40)
        completeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius + 10).cgPath
    }
    
    func shrink(down: Bool) {
        UIView.animate(withDuration: 0.2) {
        if down {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } else  {
            self.transform = .identity
        }
      }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
