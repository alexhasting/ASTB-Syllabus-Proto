//
//  MechanicalData.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Miguel Hastings on 7/8/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit


class MechanicaData {
    
    func loadmechanicalLessons() -> [Lesson] {
        
        var mechanicalLessons: [Lesson] = []
        
        // Mechanical Lessons
        
        //MARK: Standard Units
        
        let standardUnitsTitle = "Standard Units"
        
        let standardUnits = NSMutableAttributedString(string: "When quantities are measured, they reference a standard. The standard defines the unit of the quantity and allows us to make reliable measurements. There are two commonly used standards, the International System (SI) and the British system, of which the latter is primarily used in the United States.\n\n").font(name: "Times New Roman", size: 21).lineSpacing(5)
        
        standardUnits.append(NSMutableAttributedString(string: "Time\n").font(name: "TimesNewRomanPS-BoldMT", size: 22).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: "The measurement of time is based on an atomic clock. A second (s) is based on the time for a cesium atom to undergo 9,192,631,770 cycles of state transition of the microwave radiation. Seconds, minutes, and hours are the standard unit for both SI and British systems.\n\n").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: " SI").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": second(s), minutes (min), hour (hr)\n").font(name: "Times New Roman", size: 21).lineSpacing(8))
        standardUnits.append(NSMutableAttributedString(string: "British").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": second(s), minutes (min), hour (hr)\n").font(name: "Times New Roman", size: 21).lineSpacing(8))
        standardUnits.append(NSMutableAttributedString(string: "Conversions\n").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 minute = 60 seconds\n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 hour = 60 minutes = 3600 seconds\n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 day = 24 hours = 1,440 minutes = 86,400 seconds\n\n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20).headIndent(20).tailIndent(300))
        
        standardUnits.append(NSMutableAttributedString(string: "Length\n").font(name: "TimesNewRomanPS-BoldMT", size: 22).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: "The standard for length for the SI unit meter (m) is based on the wavelength of light emitted by Krypton in 1/299,792,458 second in a vacuum environment.\n\n").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: " SI").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": meter (m)\n").font(name: "Times New Roman", size: 21).lineSpacing(8))
        standardUnits.append(NSMutableAttributedString(string: "British").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": inch (in), foot (ft), mile (mi)\n").font(name: "Times New Roman", size: 21).lineSpacing(8))
        standardUnits.append(NSMutableAttributedString(string: "Conversions\n").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 inch = 2.54 cm   \n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 ft = 0.3048 m   \n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 yd = 0 .9144 m   \n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 km = 0.6214 mi     \n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 mi = 5280 ft   \n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 nautical mile = 6080 ft\n\n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        
        //**(Time when added, Mass section still not corrected)
        
        standardUnits.append(NSMutableAttributedString(string: "Force\n").font(name: "TimesNewRomanPS-BoldMT", size: 22).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: "Force is the interaction between a body and its environment or another body. The standard for a newton is the net force required to accelerate a body with a mass of 1 kg, to 1 m/s").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString().scripts(string: "2", characters: ["2"], type: .aSuper, stringFont: UIFont(name: "Times New Roman", size: 20)!, fontSize: 20, scriptFont: UIFont(name: "Times New Roman", size: 15)!, scriptFontSize: 10, offSet: 10, length: [1], alignment: .left))
        standardUnits.append(NSMutableAttributedString(string: ".\n\n").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: " SI").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": Newton (N)\n").font(name: "Times New Roman", size: 21).lineSpacing(8))
        standardUnits.append(NSMutableAttributedString(string: "British").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": pound (pd. Or lb.)\n").font(name: "Times New Roman", size: 21).lineSpacing(8))
        standardUnits.append(NSMutableAttributedString(string: "Conversion\n").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: "1 lb = 4.448 N\n\n").font(name: "Times New Roman", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        
        
        standardUnits.append(NSMutableAttributedString(string: "Pressure\n").font(name: "TimesNewRomanPS-BoldMT", size: 22).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: "Pressure is defined as the amount of force per area.\n\n").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: " SI").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": Pascal (Pa), Newton per sq. meter (N/m").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString().scripts(string: "2", characters: ["2"], type: .aSuper, stringFont: UIFont(name: "Times New Roman", size: 20)!, fontSize: 20, scriptFont: UIFont(name: "Times New Roman", size: 15)!, scriptFontSize: 10, offSet: 10, length: [1], alignment: .left))
        standardUnits.append(NSMutableAttributedString(string: "), millimeters of mercury (mm Hg), torr, atmosphere (atm)\n").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: "British").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        standardUnits.append(NSMutableAttributedString(string: ": pound per sq. foot (lb/ft").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString().scripts(string: "2", characters: ["2"], type: .aSuper, stringFont: UIFont(name: "Times New Roman", size: 20)!, fontSize: 20, scriptFont: UIFont(name: "Times New Roman", size: 15)!, scriptFontSize: 10, offSet: 10, length: [1], alignment: .left))
        standardUnits.append(NSMutableAttributedString(string: "), bar\n").font(name: "Times New Roman", size: 21).lineSpacing(5))
        standardUnits.append(NSMutableAttributedString(string: "Conversions\n").font(name: "TimesNewRomanPS-BoldMT", size: 21).lineSpacing(8).firstLineHeadIndent(20))
        
        let scientificNotationImage = #imageLiteral(resourceName: "ScientificNotationChart").toNSMutableAttributedStringWidth(with: 300).alignment(.center)
        standardUnits.append(scientificNotationImage)
        
        
        
        
            //Review Questions
        var standardUnitsReviewQuestions:[ReviewQuestions] = []
        
        let standardUnitsReviewQuestion1 = NSMutableAttributedString(string: " How many seconds in an hour?")
        standardUnitsReviewQuestions.append(ReviewQuestions(questionText: standardUnitsReviewQuestion1, answers: [
            NSMutableAttributedString(string: "60"),
            NSMutableAttributedString(string: "360"),
            NSMutableAttributedString(string: "3,600"),
            NSMutableAttributedString(string: "216,000"),
        ], correctAnswer: .answerC))
        
        let standardUnitsReviewQuestion2 = NSMutableAttributedString(string: "How many minutes are in a day?")
        standardUnitsReviewQuestions.append(ReviewQuestions(questionText: standardUnitsReviewQuestion2, answers: [
            NSMutableAttributedString(string: "1,440 "),
            NSMutableAttributedString(string: "2,400"),
            NSMutableAttributedString(string: "3,600"),
        ], correctAnswer: .answerA))
        
        let standardUnitsReviewQuestion3 = NSMutableAttributedString(string: "What is the SI unit of force?")
        standardUnitsReviewQuestions.append(ReviewQuestions(questionText: standardUnitsReviewQuestion3, answers: [
            NSMutableAttributedString(string: "Pounds"),
            NSMutableAttributedString(string: "Kilograms"),
            NSMutableAttributedString(string: "Newtons"),
            NSMutableAttributedString(string: "Watts"),
        ], correctAnswer: .answerC))
        
        mechanicalLessons.append(Lesson(subject: .mechanicalComprehension, lessonTitle: standardUnitsTitle, lessonText: standardUnits, reviewQuestions: standardUnitsReviewQuestions))
        
        return mechanicalLessons
    }
    
}
