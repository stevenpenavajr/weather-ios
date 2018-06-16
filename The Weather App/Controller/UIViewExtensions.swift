/* UIViewExtensions.swift */

/* Import statements */
import Foundation
import UIKit

extension UIView {
    func fadeIn() {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
}
