//
//  IAccelerationModule.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 06/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

public protocol IAccelerationModule: IModule {
    var delegateManager: AccelDelegateManager! {get}
    func setDetectionThreshold(_ threshold:Double)
    

}


