//
//  ReviewHeader.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class ReviewHeader: UICollectionViewCell {
    
    var questionIndex: Int = 0
    var lesson: Lesson? {
        didSet {
            guard let questionText = lesson?.reviewQuestions[questionIndex].questionText else {return}
            
            questionText.font(name: "Times New Roman", size: 20)
            questionTextView.attributedText = questionText
            let nsRange = NSRange(location: 0, length: 0)
            questionTextView.scrollRangeToVisible(nsRange)
            questionTextView.setContentOffset(CGPoint.zero, animated: false)
        }
    }
    
    let questionTextView: UITextView = {
        let tv = UITextView()
        tv.isScrollEnabled = true
        tv.isEditable = false
        tv.isSelectable = false
        tv.backgroundColor = .white
        return tv
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6570256839, green: 0.7078476704, blue: 0.7781481195, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupTextView()
    }
    
    func setupTextView() {
        addSubview(questionTextView)
        questionTextView.anchor(top: topAnchor, left: safeAreaLayoutGuide.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 2, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(seperatorView)
        seperatorView.anchor(top: questionTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
