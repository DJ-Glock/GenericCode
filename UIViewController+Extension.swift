//
//  UIViewController+Extension.swift
//  CafeManager
//
//  Created by Denis Kurashko on 20.01.2018.
//  Copyright © 2018 Denis Kurashko. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    /// Function for presenting AlertViewController with fixed colors for iOS 9
    func presentAlert(alert: UIAlertController, animated flag: Bool, completion: (() -> Swift.Void)? = nil){
        // Temporary change global colors
        UIView.appearance().tintColor = ColorThemes.alertViewButtonTextColor
        UIApplication.shared.keyWindow?.tintColor = ColorThemes.alertViewButtonTextColor
        
        //Present the controller
        self.present(alert, animated: flag, completion: {
            // Rollback change global colors
            UIView.appearance().tintColor = ColorThemes.tintColor
            UIApplication.shared.keyWindow?.tintColor = ColorThemes.tintColor
            if completion != nil {
                completion!()
            }
        })
    }
}

extension UIViewController {
    /// Function for presenting UIActivityViewController with fixed colors for iOS 9 and 10+
    func presentActivityVC(vc: UIActivityViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        // Temporary change global colors for changing "Cancel" button color for iOS 9 and 10+
        if UIDevice.current.systemVersion.range(of: "9.") != nil {
            UIApplication.shared.keyWindow?.tintColor = ColorThemes.alertViewButtonTextColor
        } else {
            UILabel.appearance().textColor = ColorThemes.alertViewButtonTextColor
        }
        
        self.present(vc, animated: flag) {
            // Rollback for changing global colors for changing "Cancel" button color for iOS 9 and 10+
            if UIDevice.current.systemVersion.range(of: "9.") != nil {
                UIApplication.shared.keyWindow?.tintColor = ColorThemes.tintColor
            } else {
                UILabel.appearance().textColor = ColorThemes.textColorNormal
            }
            if completion != nil {
                completion!()
            }
        }
    }
}


