//
//  MathData.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/22/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

class MathData {
    
    func loadMathLessons() -> [Lesson] {
    
        var mathLessons: [Lesson] = []
        
    // Math Skills Overview
        
        let mathSkillsOverviewTitle = "Math Skills Test (MST) Overview"
        let mathSkillsOverviewAbreviatedTitle = "MST Overview"
        
        let mathSkillsOverviewText = NSMutableAttributedString(string: "\t Many examinees find that the Math Skills Test (MST) is the most challenging section of the ASTB .\n\n").font(name: "Times New Roman", size: 21).lineSpacing(5).firstLineHeadIndent(20)
        
        let mechanicalPracImage = #imageLiteral(resourceName: "velocityExampleDrawing").toNSMutableAttributedStringWidth(with: 310).alignment(.center)
        mathSkillsOverviewText.append(mechanicalPracImage)
        
        mathSkillsOverviewText.append(NSMutableAttributedString(string: "\n\n"))
        
        let mechanicalPracImage2 = #imageLiteral(resourceName: "relativeRotationalSpeedsDrawing").toNSMutableAttributedStringWidth(with: 310).alignment(.center)
        mathSkillsOverviewText.append(mechanicalPracImage2)
        
        mathSkillsOverviewText.append(NSMutableAttributedString(string: "\n\n"))
        
        let mechanicalImage3 = #imageLiteral(resourceName: "ProjectileCliffDrawing").toNSMutableAttributedStringWidth(with: 310).alignment(.center)
        mathSkillsOverviewText.append(mechanicalImage3)
        
            // Review Questions
        
        var mathSkillsOverviewReviewQuestions: [ReviewQuestions] = []
        let mathSkillsOverviewReviewQuestion1 = NSMutableAttributedString(string: "How many questions are on the MST?")
        mathSkillsOverviewReviewQuestions.append(ReviewQuestions(questionText: mathSkillsOverviewReviewQuestion1, answers: [
            NSMutableAttributedString(string: "40"),
            NSMutableAttributedString(string: "30"),
            NSMutableAttributedString(string: "20"),
            NSMutableAttributedString(string: "10"),
            ],
            correctAnswer: .answerB))
        
        let mathSkillsOverviewReviewQuestion2 = NSMutableAttributedString(string: "What is the time limit for the MST?")
        mathSkillsOverviewReviewQuestions.append(ReviewQuestions(questionText: mathSkillsOverviewReviewQuestion2, answers: [
            NSMutableAttributedString(string: "20 minutes"),
            NSMutableAttributedString(string: "10 minutes"),
            NSMutableAttributedString(string: "30 minutes"),
            NSMutableAttributedString(string: "40 minutes"),
            ], correctAnswer: .answerD))
        
        
        let mathSkillsOverviewLesson = Lesson(subject: .mathSkills, lessonTitle: mathSkillsOverviewTitle, lessonText: mathSkillsOverviewText, reviewQuestions: mathSkillsOverviewReviewQuestions, abreviatedLessonTitle: mathSkillsOverviewAbreviatedTitle)
        mathLessons.append(mathSkillsOverviewLesson)
        
    // Math Skils Overview End
        
    // Types of Numbers Lesson
        let typesOfNumbersTitle = "Types of Numbers"
        let typesOfNumbersText = NSMutableAttributedString(string: "Numbers are fundamental to how we interpret mathematics; it is essential to understand the different types of numbers before discussing mathematical processes. \n \n ∙ Integers - An integer is a whole number. An integer cannot be a fraction or a decimal. It may be negative or positive. (-1, 0, 1, 2, 3) \n \n ∙ Even Numbers - Numbers that can be divided by 2 and remain an integer. The last digit of an even number will be 0, 2, 4, 6, or 8. (128, 150, 98) \n \n ∙ Odd Numbers - Numbers that cannot be divided by 2 and remain an integer. The last digit of an odd number will be 1, 3, 5, 7, or 9. (11, 121, 3,269) \n \n ∙ Negative Numbers - Numbers that are less than one. Indicated with a negative sign in front of the number. (-5, -20, -431) \n \n ∙ Prime Numbers - A whole number greater than 1, that is not divisible by any numbers besides 1 and itself. (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 37) \n \n ∙ Decimals - A decimal number is a number with a decimal point. The number to the left of the decimal is the whole number, the number to the right is the decimal. The first number to the right is to the tenth place; the second number is to the hundredth place, and so forth. \n \n ∙ Absolute Numbers - These numbers represent a value from zero. When asked what the absolute value of a negative is, remove the negative sign to solve. \n \n ∙ Fractions - Fractions express a numerical quantity that is not a whole number. The number above the line, the numerator, represents a part of the whole. The bottom number resents the whole, which is called the denominator. \n \n ∙ Rational and Irrational Numbers - A rational number can be divided into two integers. An Irrational number does not conform to that standard and continues indefinitely. For example, 𝜋 is an irrational number.").font(name: "Times New Roman", size: 21).lineSpacing(5).firstLineHeadIndent(20)
        
        // Review Questions
        var typesOfNumbersReviewQuestions: [ReviewQuestions] = []
        //1
        let typesOfNumbersReviewQuestion1 = NSMutableAttributedString(string: "Which number is not an integer?")
        typesOfNumbersReviewQuestions.append(ReviewQuestions(questionText: typesOfNumbersReviewQuestion1, answers: [
            NSMutableAttributedString(string: "56"),
            NSMutableAttributedString(string: "25"),
            NSMutableAttributedString(string: "10.4"),
            NSMutableAttributedString(string: "55"),
        ], correctAnswer: .answerC))
        
        //2
        let typesOfNumbersReviewQuestion2 = NSMutableAttributedString(string: "Which number is a prime number?")
        typesOfNumbersReviewQuestions.append(ReviewQuestions(questionText: typesOfNumbersReviewQuestion2, answers: [
            NSMutableAttributedString(string:  "11"),
            NSMutableAttributedString(string: "12"),
            NSMutableAttributedString(string: "6"),
            NSMutableAttributedString(string: "9"),
        ], correctAnswer: .answerA))
        
        //3
        let typesOfNumbersReviewQuestion3 = NSMutableAttributedString(string: "Which number is a prime number?")
        typesOfNumbersReviewQuestions.append(ReviewQuestions(questionText: typesOfNumbersReviewQuestion3, answers: [
            NSMutableAttributedString(string: "8"),
            NSMutableAttributedString(string: "29"),
            NSMutableAttributedString(string: "49"),
            NSMutableAttributedString(string: "60"),

        ], correctAnswer: .answerB))
        
        
        //4
        let typesOfNumbersReviewQuestion4 = NSMutableAttributedString(string: "Which number is an irrational number?")
        typesOfNumbersReviewQuestions.append(ReviewQuestions(questionText: typesOfNumbersReviewQuestion4, answers: [
            NSMutableAttributedString(string: "25.890"),
            NSMutableAttributedString(string: "𝜋"),
            NSMutableAttributedString(string: "45"),
            NSMutableAttributedString(string: " ̅25"),
        
        ], correctAnswer: .answerB))
        
        //5
        let typesOfNumbersReviewQuestion5 = NSMutableAttributedString(string: "Which number is even?")
        typesOfNumbersReviewQuestions.append(ReviewQuestions(questionText: typesOfNumbersReviewQuestion5, answers: [
            NSMutableAttributedString(string: "35"),
            NSMutableAttributedString(string: "27"),
            NSMutableAttributedString(string: " ̅29"),
            NSMutableAttributedString(string: "48"),

        ], correctAnswer: .answerD))
        
        
        let typesOfNumbersLesson = Lesson(subject: .mathSkills, lessonTitle: typesOfNumbersTitle, lessonText: typesOfNumbersText, reviewQuestions: typesOfNumbersReviewQuestions)
        mathLessons.append(typesOfNumbersLesson)
        
        return mathLessons
    }
    
    
}
