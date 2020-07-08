//
//  Extensions.swift
//  ASTB Syllabus Proto
//
//  Created by Alex Hastings on 3/19/20.
//  Copyright © 2020 Alex Hastings. All rights reserved.
//

import UIKit

extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        // Sets all objects anchored() to false, so dont need to type out everytime
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
}

extension UIColor {
    
    static let cellGray = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    
    static let cellBlue =  #colorLiteral(red: 0.5294117647, green: 0.6823529412, blue: 1, alpha: 1)
    
    static let cellYellow = #colorLiteral(red: 0.9647058824, green: 0.8980392157, blue: 0.5490196078, alpha: 1)
    
    static let randomColor = #colorLiteral(red: 0.5294117647, green: 0.6823529412, blue: 1, alpha: 1)
    
}


extension Array where Element: Equatable {
    func all(where predicate: (Element) -> Bool) -> [Element]  {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}


// https://stackoverflow.com/questions/56910797/ios13-navigation-bar-large-titles-not-covering-status-bar/58688422#58688422?newreg=b7faba175633472ba95886be8a1ff4ed
extension UIViewController {


    open func showNavigationBar(_ large: Bool,
                                _ animated: Bool,
                                titleColor: UIColor,
                                barTintColor: UIColor,
                                fontSize: CGFloat) {

        navigationController?.navigationBar.barTintColor = barTintColor
        navigationController?.navigationBar.backgroundColor = barTintColor
        navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        if large {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            if #available(iOS 13.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = barTintColor
                appearance.titleTextAttributes = [.foregroundColor: titleColor]
                appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                                                       NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: fontSize)!]

                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.compactAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = appearance
            } else {
                self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                                                                                     NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: fontSize)!]
            }
        } else {
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                                                                            NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 20.0)!]
        }
    }
}

extension UIButton {
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
  
      func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
  
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    func shrink() {
        let shrink = CASpringAnimation(keyPath: "transform.scale")
        shrink.duration = 1.0
        shrink.fromValue = 1.0
        shrink.toValue = 0.50
        shrink.autoreverses = false
        shrink.repeatCount = 0
        shrink.initialVelocity = 0.3
//        shrink.damping = 1.0
        
        layer.add(shrink, forKey: "shrink")
    }
    
    func expandAlot() {
        let shrink = CASpringAnimation(keyPath: "transform.scale")
        shrink.duration = 10.0
        shrink.fromValue = 1.0
        shrink.toValue = 9.00
        shrink.autoreverses = true
        shrink.repeatCount = 1
        shrink.initialVelocity = 0.1
        shrink.damping = 1.0
            
        layer.add(shrink, forKey: "shrink")
    }
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
}
