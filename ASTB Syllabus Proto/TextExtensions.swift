//
//  TextExtension.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/20/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

// This is my extension Swift 4, to change image to attributed String with size and tint color change

public extension UIImage {

    func tint(with color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()

        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    func toAttributedString(with heightRatio: CGFloat, tint color: UIColor? = nil) -> NSAttributedString {
        let attachment = NSTextAttachment()
        var image = self

        if let tintColor = color {
            image.withRenderingMode(.alwaysTemplate)
            image = image.tint(with: tintColor)
        }

        attachment.image = image

        let ratio: CGFloat = image.size.width / image.size.height
        let attachmentBounds = attachment.bounds

        attachment.bounds = CGRect(x: attachmentBounds.origin.x,
                                   y: attachmentBounds.origin.y,
                                   width: ratio * heightRatio,
                                   height: heightRatio)

        return NSAttributedString(attachment: attachment)
    }
    
    func toNSMutableAttributedString(with heightRatio: CGFloat, tint color: UIColor? = nil) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        var image = self

        if let tintColor = color {
            image.withRenderingMode(.alwaysTemplate)
            image = image.tint(with: tintColor)
        }

        attachment.image = image

        let ratio: CGFloat = image.size.width / image.size.height
        let attachmentBounds = attachment.bounds

        attachment.bounds = CGRect(x: attachmentBounds.origin.x,
                                   y: attachmentBounds.origin.y,
                                   width: ratio * heightRatio,
                                   height: heightRatio)

        return NSMutableAttributedString(attachment: attachment)
    }
    
    func toNSMutableAttributedStringWidth(with widthRatio: CGFloat, tint color: UIColor? = nil) -> NSMutableAttributedString {
        let attachment = NSTextAttachment()
        var image = self

        if let tintColor = color {
            image.withRenderingMode(.alwaysTemplate)
            image = image.tint(with: tintColor)
        }

        attachment.image = image

        let ratio: CGFloat = image.size.width / image.size.height
        let attachmentBounds = attachment.bounds

        attachment.bounds = CGRect(x: attachmentBounds.origin.x,
                                   y: attachmentBounds.origin.y,
                                   width: widthRatio,
                                   height: widthRatio / ratio)

        return NSMutableAttributedString(attachment: attachment)
    }
}



//  NSAttributedString+Extensions.swift
//
//  Created by Ben Kreeger on 12/11/15.
//
// The MIT License (MIT)
//
// Copyright (c) 2014-2016 Oven Bits, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
import Foundation

extension NSAttributedString {
    /**
    Returns a new mutable string with characters from a given character set removed.
    See http://panupan.com/2012/06/04/trim-leading-and-trailing-whitespaces-from-nsmutableattributedstring/
    - Parameters:
      - charSet: The character set with which to remove characters.
    - returns: A new string with the matching characters removed.
    */
    public func trimmingCharacters(in set: CharacterSet) -> NSAttributedString {
        let modString = NSMutableAttributedString(attributedString: self)
        modString.trimCharacters(in: set)
        return NSAttributedString(attributedString: modString)
    }
}


extension NSMutableAttributedString {
    /**
    Modifies this instance of the string to remove characters from a given character set from
    the beginning and end of the string.
    See http://panupan.com/2012/06/04/trim-leading-and-trailing-whitespaces-from-nsmutableattributedstring/
    - Parameters:
      - charSet: The character set with which to remove characters.
    */
    public func trimCharacters(in set: CharacterSet) {
        var range = (string as NSString).rangeOfCharacter(from: set)

        // Trim leading characters from character set.
        while range.length != 0 && range.location == 0 {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: set)
        }

        // Trim trailing characters from character set.
        range = (string as NSString).rangeOfCharacter(from: set, options: .backwards)
        while range.length != 0 && NSMaxRange(range) == length {
            replaceCharacters(in: range, with: "")
            range = (string as NSString).rangeOfCharacter(from: set, options: .backwards)
        }
    }

}


extension NSMutableAttributedString {
    
    fileprivate var range: NSRange {
        return NSRange(location: 0, length: length)
    }
    
    fileprivate var paragraphStyle: NSMutableParagraphStyle? {
        return attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle
    }
    
}

// MARK: - Font
extension NSMutableAttributedString {
    /**
     Applies a font to the entire string.
     
     - parameter font: The font.
     */
    @discardableResult
    public func font(_ font: UIFont) -> Self {
        addAttribute(NSAttributedString.Key.font, value: font, range: range)
        return self
    }
    
    /**
     Applies a font to the entire string.
     
     - parameter name: The font name.
     - parameter size: The font size.
     
     Note: If the specified font name cannot be loaded, this method will fallback to the system font at the specified size.
     */
    @discardableResult
    public func font(name: String, size: CGFloat) -> Self {
        addAttribute(NSAttributedString.Key.font, value: UIFont(name: name, size: size) ?? .systemFont(ofSize: size), range: range)
        return self
    }
}

// MARK: - Paragraph style
extension NSMutableAttributedString {
    
    /**
     Applies a text alignment to the entire string.
     
     - parameter alignment: The text alignment.
     */
    @discardableResult
    public func alignment(_ alignment: NSTextAlignment) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies line spacing to the entire string.
     
     - parameter lineSpacing: The line spacing amount.
     */
    @discardableResult
    public func lineSpacing(_ lineSpacing: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies paragraph spacing to the entire string.
     
     - parameter paragraphSpacing: The paragraph spacing amount.
     */
    @discardableResult
    public func paragraphSpacing(_ paragraphSpacing: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = paragraphSpacing
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a line break mode to the entire string.
     
     - parameter mode: The line break mode.
     */
    @discardableResult
    public func lineBreak(_ mode: NSLineBreakMode) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = mode
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }

    /**
     Applies a line height multiplier to the entire string.
     
     - parameter multiple: The line height multiplier.
     */
    @discardableResult
    public func lineHeight(multiple: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = multiple
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a first line head indent to the string.
     
     - parameter indent: The first line head indent amount.
     */
    @discardableResult
    public func firstLineHeadIndent(_ indent: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = indent
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a head indent to the string.
     
     - parameter indent: The head indent amount.
     */
    @discardableResult
    public func headIndent(_ indent: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.headIndent = indent
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a tail indent to the string.
     
     - parameter indent: The tail indent amount.
     */
    @discardableResult
    public func tailIndent(_ indent: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.tailIndent = indent
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }

    /**
     Applies a minimum line height to the entire string.
     
     - parameter height: The minimum line height.
     */
    @discardableResult
    public func minimumLineHeight(_ height: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = height
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a maximum line height to the entire string.
     
     - parameter height: The maximum line height.
     */
    @discardableResult
    public func maximumLineHeight(_ height: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = height
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a base writing direction to the entire string.
     
     - parameter direction: The base writing direction.
     */
    @discardableResult
    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.baseWritingDirection = direction
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
    
    /**
     Applies a paragraph spacing before amount to the string.
     
     - parameter spacing: The distance between the paragraph’s top and the beginning of its text content.
     */
    @discardableResult
    public func paragraphSpacingBefore(_ spacing: CGFloat) -> Self {
        let paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacingBefore = spacing
        
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        return self
    }
}

// MARK: - Foreground color
extension NSMutableAttributedString {
    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult @nonobjc
    public func color(_ color: UIColor, white:CGFloat = 0, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: range)
        return self
    }

    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult
    public func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: red, green: green, blue: blue, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult
    public func color(white: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(white: white, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies the given color over the entire string, as the foreground color.
     
     - parameter color: The color to apply.
     */
    @discardableResult @nonobjc
    public func color(_ hex: UInt32, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(white: CGFloat(hex), alpha: alpha), range: range)
        return self
    }
}

// MARK: - Underline, kern, strikethrough, stroke, shadow, text effect
extension NSMutableAttributedString {
    /**
     Applies a single underline under the entire string.
     
     - parameter style: The `NSUnderlineStyle` to apply. Defaults to `.styleSingle`.
     */
    @discardableResult
    public func underline(style: NSUnderlineStyle = .single, color: UIColor? = nil) -> Self {
        addAttribute(NSAttributedString.Key.underlineStyle, value: style.rawValue, range: range)
        
        if let color = color {
            addAttribute(NSAttributedString.Key.underlineColor, value: color, range: range)
        }
        
        return self
    }

    /**
     Applies a kern (spacing) value to the entire string.
     
     - parameter value: The space between each character in the string.
     */
    @discardableResult
    public func kern(_ value: CGFloat) -> Self {
        addAttribute(NSAttributedString.Key.kern, value: value, range: range)
        return self
    }
    
    /**
     Applies a strikethrough to the entire string.
     
     - parameter style: The `NSUnderlineStyle` to apply. Defaults to `.styleSingle`.
     - parameter color: The underline color. Defaults to the color of the text.
     */
    @discardableResult
    public func strikethrough(style: NSUnderlineStyle = .single, color: UIColor? = nil) -> Self {
        addAttribute(NSAttributedString.Key.strikethroughStyle, value: style.rawValue, range: range)
        
        if let color = color {
            addAttribute(NSAttributedString.Key.strikethroughColor, value: color, range: range)
        }
        
        return self
    }
    
    /**
     Applies a stroke to the entire string.
     
     - parameter color: The stroke color.
     - parameter width: The stroke width.
     */
    @discardableResult
    public func stroke(color: UIColor, width: CGFloat) -> Self {
        addAttributes([
            NSAttributedString.Key.strokeColor : color,
            NSAttributedString.Key.strokeWidth : width
        ], range: range)
        
        return self
    }
    
    /**
     Applies a shadow to the entire string.
     
     - parameter color: The shadow color.
     - parameter radius: The shadow blur radius.
     - parameter offset: The shadow offset.
     */
    @discardableResult
    public func shadow(color: UIColor, radius: CGFloat, offset: CGSize) -> Self {
        let shadow = NSShadow()
        shadow.shadowColor = color
        shadow.shadowBlurRadius = radius
        shadow.shadowOffset = offset
        
        addAttribute(NSAttributedString.Key.shadow, value: shadow, range: range)
        
        return self
    }
    
}

// MARK: - Background color
extension NSMutableAttributedString {
    
    /**
     Applies a background color to the entire string.
     
     - parameter color: The color to apply.
     */
    @discardableResult @nonobjc
    public func backgroundColor(_ color: UIColor, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: color, range: range)
        return self
    }
    
    /**
     Applies a background color to the entire string.
     
     - parameter red: The red color component.
     - parameter green: The green color component.
     - parameter blue: The blue color component.
     - parameter alpha: The alpha component.
     */
    @discardableResult
    public func backgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor(red: red, green: green, blue: blue, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies a background color to the entire string.
     
     - parameter white: The white color component.
     - parameter alpha: The alpha component.
     */
    @discardableResult
    public func backgroundColor(white: CGFloat, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor(white: white, alpha: alpha), range: range)
        return self
    }
    
    /**
     Applies a background color to the entire string.
     
     - parameter hex: The hex color value.
     - parameter alpha: The alpha component.
     */
    @discardableResult @nonobjc
    public func backgroundColor(_ hex: UInt32, alpha: CGFloat = 1) -> Self {
        addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor(white: CGFloat(hex), alpha: alpha), range: range)
        return self
    }
}

extension NSMutableAttributedString {
    
    /**
     Applies a baseline offset to the entire string.
     
     - parameter offset: The offset value.
     */
    @discardableResult
    public func baselineOffset(_ offset: Float) -> Self {
        addAttribute(NSAttributedString.Key.baselineOffset, value: NSNumber(value: offset), range: range)
        return self
    }
}

public func +(lhs: NSMutableAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
    let lhs = NSMutableAttributedString(attributedString: lhs)
    lhs.append(rhs)
    return lhs
}

public func +=(lhs: NSMutableAttributedString, rhs: NSAttributedString) {
    lhs.append(rhs)
}
