//
//  ReviewController.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit
import SAConfettiView



private let reuseIdentifier = "Cell"
private let id = "123"



class ReviewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ReviewAnswerCellDelegate {
    
    
    var lesson: Lesson?
    
    var questionIndex = 0
    
    let nextQuestionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Question", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 22)
        button.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleNextQuestion), for: .touchUpInside)
        button.startAnimatingPressActions()
        return button
    }()
    

    
    let finishedView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8196163366)
        return view
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 30)
        button.backgroundColor = #colorLiteral(red: 0.455658259, green: 0.4972595047, blue: 0.8117647059, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        button.startAnimatingPressActions()
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        return button
    }()
    
    let doneLabel: UILabel = {
        let label = UILabel()
        label.text = "Nice Work \n Keep Crushing it!"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        label.backgroundColor = .clear
        
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.contentMode = .center
        stack.distribution = .fill


        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavigationBar(false, true, titleColor: UIColor.black, barTintColor: .white, fontSize: 30)
        navigationItem.title = "Review Questions"

        
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        // Register cell classes
        collectionView.register(ReviewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: id)
        collectionView.register(ReviewAnswerCell.self, forCellWithReuseIdentifier: reuseIdentifier)
 
        // nextquestionButton setup
        collectionView.superview?.addSubview(nextQuestionButton)
        nextQuestionButton.isHidden = true
        nextQuestionButton.anchor(top: nil, left: collectionView.leftAnchor, bottom: collectionView.bottomAnchor, right: collectionView.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 15, paddingRight: 15, width: 0, height: 60)
        
    
    }
    
    
    
    
    @objc func handleNextQuestion() {
        scrollToTop()
        nextQuestion()
    }
    
    @objc func handleDone() {
        print("handleDone")
        // Uses extension to achieve this, pops back to a controller in the stack
        navigationController?.popToViewController(ofClass: LessonController.self)
        finishedView.isHidden = true

    }
    
    func generateConfetti() {
        let confettiView = SAConfettiView(frame: self.view.bounds)
        confettiView.type = .Triangle
        confettiView.intensity = 0.7
        confettiView.colors = [ #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.9231068868, blue: 0.3604702354, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), #colorLiteral(red: 1, green: 0.8851481122, blue: 0.583913813, alpha: 1), ]
        confettiView.startConfetti()
        finishedView.addSubview(confettiView)
        confettiView.anchor(top: finishedView.topAnchor, left: finishedView.leftAnchor, bottom: finishedView.bottomAnchor, right: finishedView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

    }
    
    func displayFinishView() {
        navigationController?.view.superview?.addSubview(finishedView)
        finishedView.isHidden = true
        finishedView.anchor(top: navigationController?.view.topAnchor, left: navigationController?.view.leftAnchor, bottom: navigationController?.view.bottomAnchor, right: navigationController?.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        generateConfetti()
        stackView.addArrangedSubview(doneLabel)
        stackView.addArrangedSubview(doneButton)
        finishedView.addSubview(stackView)
        stackView.anchor(top: finishedView.topAnchor, left: nil, bottom: finishedView.bottomAnchor, right: nil, paddingTop: 25, paddingLeft: 0, paddingBottom: 40, paddingRight: 0, width: 320, height: 0)
        stackView.centerXAnchor.constraint(equalTo: finishedView.centerXAnchor).isActive = true
    }
    
    func checkLogic(index: Int) {
        guard let correctAnswer = lesson?.reviewQuestions[questionIndex].correctAnswer else {return}

        guard let lessonCount = (lesson?.reviewQuestions.count) else {return}
        
        switch correctAnswer {
        case .answerA:
            if index == 0 {
                if questionIndex < lessonCount - 1 {
                nextQuestionButton.isHidden = false
                collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 1, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 2, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 3, section: 0))?.isUserInteractionEnabled = false
                } else if questionIndex == lessonCount - 1 {
                    displayFinishView()
                    finishedView.isHidden = false
                    saveCompletionData(lessonTitle: lesson!.lessonTitle, subject: lesson!.subject)
                    print("This is the result of the saved data", loadSavedCompletionData(lessonTitle: lesson!.lessonTitle))
                    
                }
            }
        case .answerB:
            if index == 1 {
                if questionIndex < lessonCount - 1 {
                nextQuestionButton.isHidden = false
                collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 1, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 2, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 3, section: 0))?.isUserInteractionEnabled = false
                } else if questionIndex == lessonCount - 1 {
                    displayFinishView()
                    finishedView.isHidden = false
                    saveCompletionData(lessonTitle: lesson!.lessonTitle, subject: lesson!.subject)
                    print("This is the result of the saved data", loadSavedCompletionData(lessonTitle: lesson!.lessonTitle))
                }
            }
        case .answerC:
            if index == 2 {
                if questionIndex < lessonCount - 1 {
                nextQuestionButton.isHidden = false
                collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 1, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 2, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 3, section: 0))?.isUserInteractionEnabled = false
                } else if questionIndex == lessonCount - 1 {
                    displayFinishView()
                    finishedView.isHidden = false
                    saveCompletionData(lessonTitle: lesson!.lessonTitle, subject: lesson!.subject)
                    print("This is the result of the saved data", loadSavedCompletionData(lessonTitle: lesson!.lessonTitle))
                }
            }
        case .answerD:
            if index == 3 {
                if questionIndex < lessonCount - 1 {
                nextQuestionButton.isHidden = false
                collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 1, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 2, section: 0))?.isUserInteractionEnabled = false
                collectionView.cellForItem(at: IndexPath(row: 3, section: 0))?.isUserInteractionEnabled = false
                } else if questionIndex == lessonCount - 1 {
                    displayFinishView()
                    finishedView.isHidden = false
                    saveCompletionData(lessonTitle: lesson!.lessonTitle, subject: lesson!.subject)
                    print("This is the result of the saved data", loadSavedCompletionData(lessonTitle: lesson!.lessonTitle))
                }
            }
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < (lesson?.reviewQuestions.count)! {
            let currentQuestion = lesson?.reviewQuestions[questionIndex]
            let currentQuestionTotalAnswers = lesson?.reviewQuestions.count
            
            // Cell Updates
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: IndexPath(row: 0, section: 0)) as! ReviewAnswerCell
            collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = true
            cell.answerLabel.attributedText = currentQuestion?.answers[0]
            cell.answer = currentQuestion?.correctAnswer

            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: IndexPath(row: 0, section: 0)) as! ReviewAnswerCell
            collectionView.cellForItem(at: IndexPath(row: 1, section: 0))?.isUserInteractionEnabled = true
            cell2.answerLabel.attributedText = currentQuestion?.answers[0]
            cell2.answer = currentQuestion?.correctAnswer
            
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: IndexPath(row: 0, section: 0)) as! ReviewAnswerCell
            collectionView.cellForItem(at: IndexPath(row: 2, section: 0))?.isUserInteractionEnabled = true
            cell3.answerLabel.attributedText = currentQuestion?.answers[0]
            cell3.answer = currentQuestion?.correctAnswer
            
            let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: IndexPath(row: 0, section: 0)) as! ReviewAnswerCell
            collectionView.cellForItem(at: IndexPath(row: 3, section: 0))?.isUserInteractionEnabled = true
            cell4.answerLabel.attributedText = currentQuestion?.answers[0]
            cell4.answer = currentQuestion?.correctAnswer
            collectionView.reloadSections(IndexSet(arrayLiteral: 0))
            
            // Header Updates
            let indexPath: IndexPath = IndexPath(row: 0, section: 0)
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: id, for: indexPath) as! ReviewHeader
            header.questionIndex = questionIndex
            header.questionTextView.attributedText = currentQuestion?.questionText.font(name: "Times New Roman", size: 20)

            nextQuestionButton.isHidden = true
        }
        
        
    }
    
    func scrollToTop() {
        
        let indexPath = NSIndexPath(row: 0, section: 0)
        self.collectionView.scrollToItem(at: indexPath as IndexPath, at: .bottom, animated: true)
    }
    
// Header Setup
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: id, for: indexPath) as! ReviewHeader
        header.lesson = lesson
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height = CGFloat(view.frame.height * 0.3)
        return CGSize(width: view.frame.width, height: height)
    }
    
// Cell
    // Increases Space Between Header and Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 1.0, bottom: 100.0, right: 1.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lesson?.reviewQuestions[questionIndex].answers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 25)
        let height:CGFloat = 80
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ReviewAnswerCell
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        cell.layer.borderWidth = 0.5
        cell.delegate = self
        cell.cellIndexPath = indexPath.item
        cell.answer = lesson?.reviewQuestions[questionIndex].correctAnswer
        cell.question = lesson?.reviewQuestions[questionIndex].answers[indexPath.item]

        return cell
    }

}
