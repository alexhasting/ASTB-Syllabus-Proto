//
//  LessonTextController.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class LessonTextController: UIViewController {
    
    var lesson: Lesson? {
        didSet {
            guard let lessonText = lesson?.lessonText else {return}
//            lessonText.font(name: "Times New Roman", size: 20)
        
            lessonTextView.attributedText = lessonText
            let nsRange = NSRange(location: 0, length: 0)
            lessonTextView.scrollRangeToVisible(nsRange)
            lessonTextView.setContentOffset(CGPoint.zero, animated: false)
            
        }
    }
    
    let lessonTextView: UITextView = {
        let tv = UITextView()
        tv.isScrollEnabled = true
        tv.isEditable = false
        tv.isSelectable = false
        tv.backgroundColor = .white
        return tv
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.title = lesson?.lessonTitle ?? ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavigationBar(false, true, titleColor: UIColor.black, barTintColor: .white, fontSize: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Review", style: .plain, target: self, action: #selector(handleReview))
//        navigationItem.title = lesson?.lessonTitle ?? ""
        setupNavBarTitle()
        view.backgroundColor = .white

        setupUI()

    }
    
    @objc func handleReview() {
        let reviewController = ReviewController(collectionViewLayout: UICollectionViewFlowLayout())
        reviewController.lesson = lesson
        navigationItem.title = nil
        navigationController?.pushViewController(reviewController, animated: true)
    }
    
    func setupUI() {
        view.addSubview(lessonTextView)
        lessonTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 1, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setupNavBarTitle() {
        if lesson?.abreviatedLessonTitle != nil {
            self.title = lesson?.abreviatedLessonTitle
        } else {
            self.title = lesson?.lessonTitle
        }

        let tlabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 30, height: 40))
        tlabel.text = self.title
        tlabel.textColor = UIColor.black
        tlabel.font = UIFont(name: "Times New Roman", size: 20)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .center
        self.navigationItem.titleView = tlabel
    }
    
}
