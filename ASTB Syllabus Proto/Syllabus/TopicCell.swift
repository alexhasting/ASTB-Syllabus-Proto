//
//  SyllabusCell.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/19/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit



class TopicCell: UICollectionViewCell {
    
    var lessons: [Lesson]? {
        didSet {
            guard let firstLesson = lessons?[0].subject else {return}
            
            switch firstLesson {
                case .overview:
                    print("Overview")
                    lessonTitleLabel.text = "Overview"
                    backgroundColor = .cellGray
                case .mathSkills:
                    lessonTitleLabel.text = "Math Skills"
                    backgroundColor = .cellBlue
                case .mechanicalComprehension:
                    lessonTitleLabel.text = "Mechanical Comprehension"
                    backgroundColor = .cellBlue
                    iconImageView.image = #imageLiteral(resourceName: "MechanicalIcon")
                case .BIRV:
                    lessonTitleLabel.text = "Biographical Inventory with Response Validation"
                    backgroundColor = .cellYellow
                default:
                    print("Doesnt work")
            }
            
            guard let lessonCount = lessons?.count else {return}
            totalLessons.text = "\(lessonCount) Total Lessons"
            
            
        // Determine how many lessons are completed then have appropriate label appear
            var lessonsCompleted:[Bool] = []
            
            for lesson in lessons! {
                let completionData = loadSavedCompletionData(lessonTitle: lesson.lessonTitle)
                lessonsCompleted.append(completionData)
            }
            
            let numberOfLessonsCompleted = lessonsCompleted.filter{$0}.count
            if numberOfLessonsCompleted == lessonCount {
                completedLabel.isHidden = false
                inProgressLabel.isHidden = true
            } else if numberOfLessonsCompleted > 0 && numberOfLessonsCompleted < lessonCount {
                completedLabel.isHidden = true
                inProgressLabel.isHidden = false
            } else if numberOfLessonsCompleted == 0 {
                completedLabel.isHidden = true
                inProgressLabel.isHidden = true
            }
    
        }
    }
    
    let completedLabel: UILabel = {
        let label = UILabel()
        label.text = "Completed"
        label.numberOfLines = 1
        label.font = UIFont(name: "Times New Roman", size: 12)
        label.textAlignment = .center
        label.contentMode = .center
        label.layer.backgroundColor = #colorLiteral(red: 0.7843137255, green: 1, blue: 0.6509803922, alpha: 1)
        label.layer.cornerRadius = 11.5
        return label
    }()
    
    let inProgressLabel: UILabel = {
        let label = UILabel()
        label.text = "In Progress"
        label.numberOfLines = 1
        label.font = UIFont(name: "Times New Roman", size: 12)
        label.textAlignment = .center
        label.contentMode = .center
        label.layer.backgroundColor = #colorLiteral(red: 0.9489428849, green: 0.9489428849, blue: 0.9489428849, alpha: 1)
        label.layer.cornerRadius = 11.5
        return label
    }()
    
    let lessonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 18)
        label.contentMode = .top
        label.sizeToFit()
        return label
    }()
    
    let totalLessons: UILabel = {
        let label = UILabel()
        label.text = "3 Total Lessons"
        label.font = UIFont(name: "Times New Roman", size: 16)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
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
        // Completed Label
        addSubview(completedLabel)
        completedLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 75, height: 23)
        
        // In Progress Label
        addSubview(inProgressLabel)
        inProgressLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 75, height: 23)
        
        // Lesson Title Label
        addSubview(lessonTitleLabel)
        lessonTitleLabel.anchor(top: completedLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 180, height: 0)
        
        
        // Total Lessons
        addSubview(totalLessons)
        totalLessons.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 12, paddingLeft: 25, paddingBottom: 10, paddingRight: 0, width: 150, height: 30)
        
//         Completed Label
        addSubview(completedLabel)
        completedLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 7, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 75, height: 25)
        
        // In Progress Label
        addSubview(inProgressLabel)
        inProgressLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 7, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 75, height: 25)
        
        //Icon Imageview
        addSubview(iconImageView)
        iconImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 130, height: 110)
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius + 10).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        
        
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
