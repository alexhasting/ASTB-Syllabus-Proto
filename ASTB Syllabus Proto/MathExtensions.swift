//
//  MathExtensions.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit


// https://stackoverflow.com/questions/29225779/how-to-use-subscript-and-superscript-in-swift

// I wrote the following extension or you can use it as a function, it is working well for me . you can modify it by skipping the parts that are not essential to you


extension NSMutableAttributedString {

    enum Scripting : Int {
        case aSub = -1
        case aSuper = 1
    }

    func scripts(string: String,
                  characters: [Character],
                  type: Scripting,
                  stringFont: UIFont,
                  fontSize: CGFloat,
                  scriptFont: UIFont,
                  scriptFontSize: CGFloat,
                  offSet: Int,
                  length: [Int],
                  alignment: NSTextAlignment) -> NSMutableAttributedString {

        let paraghraphStyle = NSMutableParagraphStyle()
        paraghraphStyle.alignment = alignment

        var scriptedCharaterLocation = Int()

        let attributes = [
            NSAttributedString.Key.font: stringFont,
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.paragraphStyle: paraghraphStyle
        ]

        let attString = NSMutableAttributedString(string:string, attributes: attributes)

        let baseLineOffset = offSet * type.rawValue

        let scriptTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: scriptFont,
            NSAttributedString.Key.baselineOffset: baseLineOffset,
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ]

        for (i,c) in string.enumerated() {

            for (theLength, aCharacter) in characters.enumerated() {
                if c == aCharacter {
                    scriptedCharaterLocation = i
                    attString.setAttributes(scriptTextAttributes, range: NSRange(location:scriptedCharaterLocation,
                                                                                 length: length[theLength]))
                }
            }
        }
        return attString
    }
}


