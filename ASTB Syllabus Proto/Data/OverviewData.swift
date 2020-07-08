//
//  OverviewData.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/22/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class OverviewData {

    func loadOverviewLessons() -> [Lesson] {
        var overviewLessons: [Lesson] = []
        
    // Introduction
        let introductionTitle = "Introduction"
        
        let introductionText = NSMutableAttributedString(string: "Officers in the United States military occupy a position considered by many as the most prestigious and noble in our society today. Not only do officers serve in the armed forces, but are expected to lead as a superior upon their commissioning. The challenges one faces in this position are enormous and take a toll on all who answer the call to duty. Many individuals apply to become officers every year, but the number of people that apply significantly outnumber the commissioning spots available. Given the fierce competition and the few commissioning slots available, the military must carefully screen all applicants, selecting only the most qualified and capable. It is paramount that an individual interested in becoming an officer goes above and beyond the requirements to be competitive. The military uses the Aviation Selection Test Battery (ASTB) and the Officer Aptitude Rating Exam (OAR) as tools to determine an applicants potential as a Naval or Marine Officer. Your performance on either exam will directly affect whether an offer will be extended to you and what programs are available to you in the military. \n\n").font(name: "Times New Roman", size: 21).lineSpacing(5).firstLineHeadIndent(20)
            
        let blues: NSMutableAttributedString = #imageLiteral(resourceName: "blues").toNSMutableAttributedStringWidth(with: 320)
        blues.alignment(.center)
        introductionText.append(blues)
        introductionText.append(NSMutableAttributedString(string: "\nFour USN Blue Angles in close formation.").alignment(.center).font(name: "Times New Roman", size: 10).color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))

        introductionText.append(NSMutableAttributedString(string: "\n\n The ASTB uses seven subtests to determine an applicants aptitude. They consist of Math Skills, Reading Comprehension, Mechanical Comprehension, Aviation and Nautical Information, Naval Aviation Trait Facet Inventory, Performance-Based Measures Battery and Biographical Inventory and Response Validation. The OAR, a condensed version of the ASTB, is designed for individuals interested in non-aviation related programs in the military. The OAR contains three of the seven subtests found within the ASTB; they are Math Skills, Reading Comprehension, and Mechanical Comprehension. This course will prepare you for each of these subtests found in both the ASTB and the OAR.  However, your success depends on how consistently you study and understand the material.  An explanation on how to best use this product in your studies in a later section.").font(name: "Times New Roman", size: 21).lineSpacing(5).firstLineHeadIndent(20))
        
        // Review Questions
        var introductionReviewQuestions:[ReviewQuestions] = []
        
        let introductionQuestion1 = NSMutableAttributedString(string: "How many subtests make up the ASTB?")
        introductionReviewQuestions.append(ReviewQuestions(questionText: introductionQuestion1, answers: [
            NSMutableAttributedString(string: "2"),
            NSMutableAttributedString(string: "9"),
            NSMutableAttributedString(string: "7"),
            NSMutableAttributedString(string: "10")
            ], correctAnswer: .answerC))
        
        let introductionQuestion2 = NSMutableAttributedString(string: "What subtests make up the OAR?")
        introductionReviewQuestions.append(ReviewQuestions(questionText: introductionQuestion2, answers: [
            NSMutableAttributedString(string: "Mechanical Comprehension, Math Skills, Performance Based Measures"),
            NSMutableAttributedString(string: "Math Skills, Reading Skills, and Mechanical Comprehension"),
            NSMutableAttributedString(string: "Performance Based Measures, Biographical Inventory with Response Validation"),
            NSMutableAttributedString(string: "Math Skills and Mechanical Comprehension"),
        ], correctAnswer: .answerB))
        
        
        let introductionLesson = Lesson(subject: .overview, lessonTitle: introductionTitle, lessonText: introductionText, reviewQuestions: introductionReviewQuestions)
        
        overviewLessons.append(introductionLesson)
    // Introduction End
        
        
        
        
        


        
        return overviewLessons
    }
}

