//
//  Theme.swift
//  Kjorelista
//
//  Created by Sven Aanesen on 05/03/2019.
//  Copyright © 2019 svenway. All rights reserved.
//

import UIKit
//import RMessage

class Theme: NSObject {
    
    static let shared = Theme()
    
    fileprivate override init() {
        super.init()
    }
    
    func initializeAppearances() {
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barStyle = .black
        navigationBarAppearance.barTintColor = UIColor.appBarBackgroundColor()
        navigationBarAppearance.tintColor = UIColor.appBarButtonColor()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.defaultThin(withSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.appLightTextColor()
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.defaultMedium(withSize: 14),
             NSAttributedString.Key.foregroundColor: UIColor.appBarButtonColor()], for: .normal)
        
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.defaultMedium(withSize: 14),
             NSAttributedString.Key.foregroundColor: UIColor.hexColor(rgbValue: 0x4D4D4F)], for: .disabled)
        
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.defaultMedium(withSize: 14),
             NSAttributedString.Key.foregroundColor: UIColor.appHighlightColor()], for: .highlighted)
        
//        RMessageView.appearance().titleFont = UIFont.defaultBoldFontWithSize(14)
//        RMessageView.appearance().subtitleFont = UIFont.defaultSemiBoldFontWithSize(12)
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barStyle = .blackTranslucent
    }
}

extension UIFont {
    
    static func defaultRegular(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size)!
    }
    
    static func defaultLight(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: size)!
    }
    
    static func defaultThin(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: size)!
    }
    
    static func defaultMedium(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size)!
    }
    
    static func defaultBold(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
    
    static func defaultBlack(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: size)!
    }
}

extension UILabel{
    var defaultFont: UIFont? {
        get { return self.font }
        set { self.font = newValue }
    }
    
    var defaultColor: UIColor? {
        get { return self.textColor }
        set { self.textColor = newValue }
    }
}

extension UIColor {
    
    static func hexColor(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    static func appBackgroundColor() -> UIColor {
        return hexColor(rgbValue: 0x2B2C3B)
        
    }
    
    static func appBarBackgroundColor() -> UIColor {
        return  hexColor(rgbValue: 0x2B2C3B)
    }
    
    static func appHeadlineBackgroundColor() -> UIColor {
        return hexColor(rgbValue: 0x464654)
    }
    
    static func appSeperatorColor() -> UIColor {
        return hexColor(rgbValue: 0x464654)
    }
    
    static func appBarButtonColor() -> UIColor {
        return hexColor(rgbValue: 0x0185D5)
    }
    
    static func appDarkTextColor() -> UIColor {
        return hexColor(rgbValue: 0x898B8E)
    }
    
    static func appDarkTextColor2() -> UIColor {
        return hexColor(rgbValue: 0x84868A)
    }
    
    static func appDarkTextColor3() -> UIColor {
        return hexColor(rgbValue: 0x446688)
    }
    
    static func appButtonColor() -> UIColor {
        return hexColor(rgbValue: 0x26956B)
    }
    
    static func appDisabledColor() -> UIColor {
        return UIColor(red: 90.0/255.0, green: 90.0/255.0, blue: 90.0/255.0, alpha: 1.0)
    }
    
    static func appHighlightColor() -> UIColor {
        return hexColor(rgbValue: 0x5EA280)
    }
    
    static func appFieldValueColor() -> UIColor {
        return hexColor(rgbValue: 0x26956B)
    }
    
    static func appLightTextColor() -> UIColor {
        return hexColor(rgbValue: 0xD8DADC)
    }
    
    static func backgroundGradient() -> [UIColor] {
        var colors = [UIColor]()
        colors.append(UIColor(red: 0/255, green: 156/255, blue: 154/255, alpha: 1))
        colors.append(UIColor(red: 0/255, green: 105/255, blue: 103/255, alpha: 1))
        return colors
    }
    
    static func buttonGradient() -> [UIColor] {
        var colors = [UIColor]()
        colors.append(UIColor.hexColor(rgbValue: 0x0088D7))
        colors.append(UIColor.hexColor(rgbValue: 0x015DBC))
        return colors
    }
}


import AVFoundation

class Feedback {
    
    static func feedback(ofType type: FeedbackType) {
        let feedback = UINotificationFeedbackGenerator()
        switch type {
        case .success:
            feedback.notificationOccurred(.success)
        case .error:
            feedback.notificationOccurred(.error)
        case .warning:
            feedback.notificationOccurred(.warning)
        case .impactLight:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case .impactMedium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        case .impactHeavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
    }
    
    enum FeedbackType {
        case success, error, warning, impactLight, impactMedium, impactHeavy
    }
}

extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 0, y: 0)
        endPoint = CGPoint(x: 0, y: 1)
    }
    
    func createGradientImage() -> UIImage? {
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIView {
    
    func addGradientBackground(withColors colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        if let sublayers = self.layer.sublayers {
            for subLayer in sublayers {
                if let gradientLayer = subLayer as? CAGradientLayer {
                    gradientLayer.removeFromSuperlayer()
                }
            }
        }
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

extension UINavigationBar {
    func setGradientBackground(colors: [UIColor]) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}

extension UIViewController {
    
    func alertUser(title: String, error: Error) {
        print("Error: \(error)")
        let alertView = UIAlertController(title: title, message: "Operasjonen feilet: \(error.localizedDescription)", preferredStyle: .alert)
        alertView.addAction(UIAlertAction.OK)
        present(alertView, animated: true, completion: nil)
    }
    
    func alertUser(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction.OK)
        present(alertView, animated: true, completion: nil)
    }
    
//    func displayErrorMessage(withTitle title: String, message: String?) {
//        RMessage.showNotification(withTitle: title, subtitle: message, type: RMessageType.error, customTypeName: "errormessage", callback: nil)
//    }
    
}

extension UIAlertAction {
    static var OK: UIAlertAction {
        return UIAlertAction(title: "OK", style: .default, handler: nil)
    }
}

extension UILabel {
    func sizeOfString(constrainedToWidth width: Double) -> CGSize {
        let attributes = [NSAttributedString.Key.font: self.font]
        let attString = NSAttributedString(string: self.text ?? "", attributes: attributes as [NSAttributedString.Key : Any])
        let framesetter = CTFramesetterCreateWithAttributedString(attString)
        return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0,length: 0), nil, CGSize(width: width, height: .greatestFiniteMagnitude), nil)
    }
}

extension UIImage {
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    var jpeg: Data? {
        return self.jpegData(compressionQuality: 1)
    }
    var png: Data? {
        return self.pngData()
    }
    
    func jpeg(withQuality quality: JPEGQuality) -> Data? {
        return self.jpegData(compressionQuality: quality.rawValue)
    }
}

extension Data {
    var uiImage: UIImage? {
        return UIImage(data: self)
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
