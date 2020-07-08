//
//  SyllabusData.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/19/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

// Syllabus Cells


// Syllabus Data Structures

enum Subject {
    case overview, mathSkills, readingComprehension, mechanicalComprehension, aviationAndNauticalInformation, NAFTI, perfromanceBasedMeasuresBattery, BIRV
}



struct ReviewQuestions {
    var questionText: NSMutableAttributedString
    var answers: [NSMutableAttributedString]
    var correctAnswer: CorrectAnswer
    
    enum CorrectAnswer {
        case answerA, answerB, answerC, answerD
    }
}

struct LessonComplete: Codable {
    var lessonComplete: Bool
}

struct Lesson {
    var subject: Subject
    var lessonTitle: String
    var lessonText: NSMutableAttributedString
    var reviewQuestions: [ReviewQuestions]
    var lessonComplete: LessonComplete = LessonComplete(lessonComplete: false)
    var abreviatedLessonTitle: String? = nil
}




func loadLessons() ->([[Lesson]]) {
    let overviewLessons =  OverviewData().loadOverviewLessons()
    let mathSkillsLessons = MathData().loadMathLessons()
    let mechanicalLessons = MechanicaData().loadmechanicalLessons()
    let BIRV = BIRVData().loadBIRVLessons()
    
    
    
    let allLessons = [overviewLessons, mathSkillsLessons, mechanicalLessons, BIRV]
    
    return allLessons
}







// Must be revised when all lessons are accounted for ****
func saveCompletionData(lessonTitle: String, subject: Subject) {
    let subject = subject
    var subjectNumber = 0
    switch subject {
    case .overview:
        subjectNumber = 0
    case .mathSkills:
        subjectNumber = 1
    case .BIRV:
        subjectNumber = 2
    default:
        subjectNumber = 99
    }
    
    let allLessons = loadLessons()
    let specificSubject = allLessons[subjectNumber]
    var specificLesson = (specificSubject.filter { $0.lessonTitle == lessonTitle})[0]
    specificLesson.lessonComplete = LessonComplete(lessonComplete: true)
    let defaults = UserDefaults.standard
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(specificLesson.lessonComplete) {
        defaults.set(encoded, forKey: specificLesson.lessonTitle)
    }
}




func loadSavedCompletionData(lessonTitle: String) -> (Bool) {
    let defaults = UserDefaults.standard
    if let savedData = defaults.object(forKey: lessonTitle) as? Data {
        let decoder = JSONDecoder()
        if let loadedData = try? decoder.decode(LessonComplete.self, from: savedData) {
            print(loadedData.lessonComplete)
            return loadedData.lessonComplete
        }
    }
    return false
}
