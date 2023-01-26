//
//  SessionManager.swift
//  TripitacaTestApp
//
//  Created by Muthoni on 26/01/2023.
//

import Foundation
import SwiftUI

class SessionManager {
    let userDefaults = UserDefaults(suiteName: "tripitacaSuite")!
    
    func setUserAuthCompleted(authorised: Bool) {
        userDefaults.set(authorised, forKey: "UserAuthenticated")
    }
    
    func userAuthCompleted() -> Bool {
        return userDefaults.bool(forKey: "UserAuthenticated")
    }
    
}
