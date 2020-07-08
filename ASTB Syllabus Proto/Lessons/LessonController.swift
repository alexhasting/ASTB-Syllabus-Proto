//
//  LessonController.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class LessonController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var lessons: [Lesson]?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Very Helpful NavigationBar Extension
        self.showNavigationBar(false, true, titleColor: UIColor.black, barTintColor: .white, fontSize: 30)
        navBarSetup()
        collectionView.backgroundColor = .white

        collectionView.register(LessonCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func navBarSetup() {
        guard let firstLesson = lessons?[0].subject else {return}
        
            switch firstLesson {
            case .overview:
                print("Overview")
                navigationItem.title = "Overview"
            case .mathSkills:
                navigationItem.title = "Math Skills"
            case .BIRV:
                navigationItem.title = "BI-RV"
            default:
                print("Doesnt work")
        }
    }
    
// Header Spacer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 30)
    }
    
// Cell Setup
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessons?.count ?? 0


    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 25)
        let height:CGFloat = 80
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LessonCell
        cell.layer.cornerRadius = 15
        cell.lesson = lessons?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let lessonTextController = LessonTextController()
        lessonTextController.lesson = lessons?[indexPath.item]
        navigationController?.pushViewController(lessonTextController, animated: true)
    }
    
}
