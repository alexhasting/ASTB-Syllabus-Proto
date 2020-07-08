//
//  ReviewAnswerCell.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

protocol ReviewAnswerCellDelegate {
    func checkLogic(index: Int)
}



class ReviewAnswerCell: UICollectionViewCell {
    
    
    var delegate: ReviewAnswerCellDelegate?
    var cellIndexPath: Int?
    var answer: ReviewQuestions.CorrectAnswer?
    var question: NSMutableAttributedString? {
        didSet {
            setupUI()
            answerLabel.attributedText = question
        }
    }
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.text = "Introduction"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 18)
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }()
    
    lazy var checkmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Checkmark Box Unfilled"), for: .normal)
        button.addTarget(self, action: #selector(handleCheckLogic), for: .touchUpInside)
        return button
    }()
    
    lazy var checkmarkImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Green Circle with Checkmark")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var redImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Red Circle with X")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleCheckLogic))
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)


    }
    
    @objc func handleCheckLogic() {
        guard let index = cellIndexPath else {return}
        delegate?.checkLogic(index: index)
        checkmarkButton.setImage(#imageLiteral(resourceName: "Checkmark Box Filled"), for: .normal)
        guard let correctAnswer = answer else {return}
        switch correctAnswer {
            case .answerA:
                if cellIndexPath == 0 {
                    checkmarkImageView.isHidden = false
                } else {
                    redImageView.isHidden = false
                }
            case .answerB:
                if cellIndexPath == 1 {
                    checkmarkImageView.isHidden = false
                } else {
                    redImageView.isHidden = false
            }
            case .answerC:
                if cellIndexPath == 2 {
                    checkmarkImageView.isHidden = false
                } else {
                    redImageView.isHidden = false
            }
            case .answerD:
                if cellIndexPath == 3 {
                    checkmarkImageView.isHidden = false
                } else {
                    redImageView.isHidden = false
            }
        }
    }
    

    
    
    
    func setupUI() {
        addSubview(checkmarkButton)
        checkmarkButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 32, height: 32)
        checkmarkButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(redImageView)
        redImageView.isHidden = true
        redImageView.anchor(top: nil, left: nil, bottom: nil, right: checkmarkButton.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 32, height: 32)
        redImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(checkmarkImageView)
        checkmarkImageView.isHidden = true
        checkmarkImageView.anchor(top: nil, left: nil, bottom: nil, right: checkmarkButton.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 32, height: 32)
        checkmarkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(answerLabel)
        answerLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: checkmarkButton.leftAnchor, paddingTop: 1, paddingLeft: 7, paddingBottom: 1, paddingRight: 38, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
