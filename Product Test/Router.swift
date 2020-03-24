//
//  Router.swift
//  Product Test
//
//  Created by George Bakaykin on 24.03.20.
//  Copyright © 2020 George Bakaykin. All rights reserved.
//

import UIKit
import Marshroute

class Router: BaseRouter {
    
    weak var viewController: UIViewController?
    
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
        
        let marshrouteSetupService = MarshrouteSetupServiceImpl()
        let applicationModuleSeed = ApplicationModuleSeedProvider().applicationModuleSeed(
            marshrouteSetupService: marshrouteSetupService
        )
        let animatingTransitionsHandler = applicationModuleSeed.marshrouteStack.transitionsHandlersProvider.animatingTransitionsHandler()
        let transitionsHandlerBox = RouterTransitionsHandlerBox(animatingTransitionsHandler: animatingTransitionsHandler)
        let routerSeed = RouterSeed(moduleSeed: applicationModuleSeed, transitionsHandlerBox: transitionsHandlerBox)
                
        super.init(routerSeed: routerSeed)
    }
    
//    func push() {
//        self.pushViewControllerDerivedFrom { seed -> UIViewController in
//            let vc = ViewController2()
//
//            let handler = seed.transitionsHandlersProvider.animatingTransitionsHandler()
//
//            let navigationController = self.viewController!.navigationController!
//
//            let animatingTransitionsHandler = seed.transitionsHandlersProvider.navigationTransitionsHandler(
//                navigationController: navigationController
//            )
//
//
//            let resetContext = ResettingTransitionContext(
//                settingRootViewController: vc,
//                forNavigationController: navigationController,
//                animatingTransitionsHandler: animatingTransitionsHandler,
//                animator: SetNavigationTransitionsAnimator(),
//                transitionId: seed.transitionId
//            )
//
//            handler.resetWithTransition(context: resetContext)
//            return vc
//        }
//    }
    
    func present() {
        self.presentModalViewControllerDerivedFrom { seed -> UIViewController in
            
            let vc = ViewController2()
            
            let handler = seed.transitionsHandlersProvider.animatingTransitionsHandler()
            
            let resetContext = ResettingTransitionContext(resettingRootViewController: self.viewController!,
                                                          animatingTransitionsHandler: seed.transitionsHandlersProvider.animatingTransitionsHandler(),
                                                          animator: ResetNavigationTransitionsAnimator(),
                                                          transitionId: seed.transitionId)
            
            handler.resetWithTransition(context: resetContext)
            return vc
        }
    }
    
}
