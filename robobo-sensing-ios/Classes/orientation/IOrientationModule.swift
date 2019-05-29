//
//  IOrientationModule.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 11/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

public protocol  IOrientationModule: IModule {
    var delegateManager: OrientationDelegateManager! {get}
    func setDetectionThreshold(_ threshold:Double)
    
}
