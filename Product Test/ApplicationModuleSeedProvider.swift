//
//  ApplicationModuleSeedProvider.swift
//  Product Test
//
//  Created by George Bakaykin on 24.03.20.
//  Copyright © 2020 George Bakaykin. All rights reserved.
//

import Marshroute

final class ApplicationModuleSeedProvider {
    func applicationModuleSeed(marshrouteSetupService: MarshrouteSetupService) -> ApplicationModuleSeed {
        let marshrouteStack = marshrouteSetupService.marshrouteStack()
        
        let transitionId = marshrouteStack.transitionIdGenerator.generateNewTransitionId()
        
        let result = ApplicationModuleSeed(transitionId: transitionId,
                                           presentingTransitionsHandler: nil,
                                           marshrouteStack: marshrouteStack)
        
        return result
    }
}
