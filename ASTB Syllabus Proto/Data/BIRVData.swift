//
//  BIRVData.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/22/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class BIRVData {
    
    func loadBIRVLessons() -> [Lesson] {
        var BIRVLessons: [Lesson] = []
        
        // BIRV Overview
        let BIRVOverviewTitle = "The Biographical Inventory with Response Validation (BI-VR) Overview"
        
        let BIRVOverviewText = NSMutableAttributedString(string: "\tThe Biographical Inventory with Response Validation (BI-VR) section of ASTB serves as a data collection function for the ASTB. The BI-VR will ask questions regarding your education level, flight experience, leadership experience, and previous military experience. This allows the Navy to correlate specific applicant experiences with applicants that go on to have a successful career in naval aviation. The most important thing for an examinee on this portion of the ASTB is to remain truthful and not exaggerate previous experiences. The Department of Defense reserves the right to investigate any experiences listed in on this exam, if they are exaggerated or untruthful, it could be grounds to disqualify or remove you from the military. \n \n \tThe BI-VR will ask questions regarding the experiences list previously if you do have any of these experiences it will ask for amplifying information. For example, if the BI-VR asks if you have ever received flight training, a follow on prompt may ask where you received your flight training.").font(name: "Times New Roman", size: 21).lineSpacing(5).firstLineHeadIndent(20)
        
        
        // Review Questions
        var BIRVReviewQuestions: [ReviewQuestions] = []
        let test1 = NSMutableAttributedString().scripts(string: "23 * 454", characters: ["3", "5"], type: .aSuper, stringFont: UIFont(name: "Times New Roman", size: 20)!, fontSize: 20, scriptFont: UIFont(name: "Times New Roman", size: 15)!, scriptFontSize: 15, offSet: 8, length: [1,1], alignment: .left)
        BIRVReviewQuestions.append(ReviewQuestions(questionText: test1, answers: [
            test1
            ], correctAnswer: .answerA))
        
        
        //1
        let BIRVOverviewQuestion1 = NSMutableAttributedString(string: "What is the primary purpose of the BI-VR?")
        BIRVReviewQuestions.append(ReviewQuestions(questionText: BIRVOverviewQuestion1, answers: [
            NSMutableAttributedString(string: "Builds a Resume"),
            NSMutableAttributedString(string: "Generates the PFAR Score"),
            NSMutableAttributedString(string: "Data Collection"),
            NSMutableAttributedString(string: "Generates the OAR Score"),
            ], correctAnswer: .answerC))
        
        
        //2
        let BIRVOverviewQuestion2  = NSMutableAttributedString(string: "What biographical information is not asked about?")
        BIRVReviewQuestions.append(ReviewQuestions(questionText: BIRVOverviewQuestion2, answers: [
             NSMutableAttributedString(string: "Previous Military Experience"),
             NSMutableAttributedString(string: "Education Level"),
             NSMutableAttributedString(string: "Letters of Recommendation"),
             NSMutableAttributedString(string: "Previous flight experience "),
        
        ], correctAnswer: .answerC))
        
        
        let BIRVOverviewLesson = Lesson(subject: .BIRV, lessonTitle: BIRVOverviewTitle, lessonText: BIRVOverviewText, reviewQuestions: BIRVReviewQuestions, abreviatedLessonTitle: "BIRV Overview")
        BIRVLessons.append(BIRVOverviewLesson)
        
        return BIRVLessons
    }
}
