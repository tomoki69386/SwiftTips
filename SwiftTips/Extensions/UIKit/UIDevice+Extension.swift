    //
//  UIDevice+Extension.swift
//  SwiftTips
//
//  Created by 築山朋紀 on 2019/08/05.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit

private let deviceList = [
    
    /* iPhone 5s */       "iPhone6,1": "iPhone 5s", "iPhone6,2": "iPhone 5s",
    /* iPhone 6 */        "iPhone7,2": "iPhone 6",
    /* iPhone 6 Plus */   "iPhone7,1": "iPhone 6 Plus",
    /* iPhone 6s */       "iPhone8,1": "iPhone 6s",
    /* iPhone 6s Plus */  "iPhone8,2": "iPhone 6s Plus",
    /* iPhone SE */       "iPhone8,4": "iPhone SE",
    /* iPhone 7 */        "iPhone9,1": "iPhone 7",
    /* iPhone 7 Plus */   "iPhone9,2": "iPhone 7 Plus",
    /* iPhone 8 */        "iPhone10,4": "iPhone 8",
    /* iPhone 8 Plus */   "iPhone10,5": "iPhone 8 Plus",
    /* iPhone X */        "iPhone10,6": "iPhone X",
    /* iPhone XS */       "iPhone11,2": "iPhone XS",
    /* iPhone XS Max */   "iPhone11,4": "iPhone XS Max", "iPhone11,6": "iPhone XS Max",
    /* iPhone XR */       "iPhone11,8": "iPhone XR",
                          
    /* iPod touch 6 */    "iPod7,1": "iPod touch 6",
    /* iPod touch 7 */    "iPod9,1": "iPod touch 7",

    /* iPad 5 */           "iPad6,11": "iPad 5", "iPad6,12": "iPad 5",
    /* iPad 6 */           "iPad7,5": "iPad 6", "iPad7,6": "iPad 6",
                           
    /* iPad Air */        "iPad4,1": "iPad Air", "iPad4,2": "iPad Air", "iPad4,3": "iPad Air",
    /* iPad Air 2 */      "iPad5,3": "iPad Air 2", "iPad5,4": "iPad Air 2",
    /* iPad Air 3 */      "iPad11,3": "iPad Air 3", "iPad11,4": "iPad Air 3",
                          
    /* iPad Mini 2 */     "iPad4,4": "iPad Mini 2", "iPad4,5": "iPad Mini 2", "iPad4,6": "iPad Mini 2",
    /* iPad Mini 3 */     "iPad4,7": "iPad Mini 3", "iPad4,8": "iPad Mini 3", "iPad4,9": "iPad Mini 3",
    /* iPad Mini 4 */     "iPad5,1": "iPad Mini 4", "iPad5,2": "iPad Mini 4",
    /* iPad Mini 5 */     "iPad11,1": "iPad Mini 5", "iPad11,2": "iPad Mini 5",
                          
    /* iPad Pro (9.7-inch) */                   "iPad6,3": "iPad Pro (9.7-inch)", "iPad6,4": "iPad Pro (9.7-inch)",
    /* iPad Pro (12.9-inch) */                  "iPad6,7": "iPad Pro (12.9-inch)", "iPad6,8": "iPad Pro (12.9-inch)",
    /* iPad Pro (10.5-inch) */                  "iPad7,3": "iPad Pro (10.5-inch)", "iPad7,4": "iPad Pro (10.5-inch)",
    /* iPad Pro (12.9-inch) (2nd generation) */ "iPad7,1": "iPad Pro (12.9-inch) (2nd generation)", "iPad7,2": "iPad Pro (12.9-inch) (2nd generation)",
    /* iPad Pro (12.9-inch) (3rd generation) */ "iPad8,5": "iPad Pro (12.9-inch) (3rd generation)", "iPad8,6": "iPad Pro (12.9-inch) (3nd generation)",
                                                "iPad8,7": "iPad Pro (12.9-inch) (3rd generation)", "iPad8,8": "iPad Pro (12.9-inch) (3rd generation)",
    /* iPad Pro (11-inch) */                    "iPad8,1": "iPad Pro (11-inch)", "iPad8,2": "iPad Pro (11-inch)",
                                                "iPad8,3": "iPad Pro (11-inch)", "iPad8,4": "iPad Pro (11-inch)",
                                                
    /* Simulator */       "x86_64": "Simulator", "i386": "Simulator"
]

extension UIDevice {
    var platform: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        
        let characters = mirror.children
            .compactMap { $0.value as? Int8 }
            .filter { $0 != 0 }
            .map { Character(UnicodeScalar(UInt8($0))) }
        
        return String(characters)
    }
    
    var modelName: String {
        let identifier = platform
        return deviceList[identifier] ?? identifier
    }
}
