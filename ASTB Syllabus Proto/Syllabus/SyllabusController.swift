//
//  ViewController.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/19/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class SyllabusController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var lessons = [[Lesson]]()
    
    override func viewDidLayoutSubviews() {
        navigationController?.reloadInputViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        collectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        lessons = loadLessons()
        collectionView.backgroundColor = .white
        collectionView.register(SyllabusHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView.register(TopicCell.self, forCellWithReuseIdentifier: cellId)
        
        
        // Setup Top Offset in collectionview
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 50, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: false)
        
    }
    
    
    
// Header Setup
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! SyllabusHeader
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
// Cell Setup
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 25)
        let height:CGFloat = 140
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopicCell
        cell.layer.cornerRadius = 15
        cell.lessons = lessons[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let lessonController = LessonController(collectionViewLayout: UICollectionViewFlowLayout())
        lessonController.lessons = lessons[indexPath.item]
        navigationController?.pushViewController(lessonController, animated: true)
    }
}

