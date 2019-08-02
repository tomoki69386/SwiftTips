//
//  UISearchBar+Extension.swift
//  SwiftTips
//
//  Created by 築山朋紀 on 2019/08/02.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

extension UISearchBar {
    var textField: UITextField {
        guard let textField = value(forKey: "_searchField") as? UITextField else {
            fatalError("Invalid _searchField")
        }
        return textField
    }
}
