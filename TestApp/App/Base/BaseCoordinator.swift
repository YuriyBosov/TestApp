//
//  BaseCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    let session: Session
    
    init(session: Session, router: Router) {
        self.session = session
        super.init(router: router)
    }
}
