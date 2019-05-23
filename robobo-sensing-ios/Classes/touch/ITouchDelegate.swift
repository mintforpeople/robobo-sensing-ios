//
//  ITouchDelegate.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 12/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

public protocol ITouchDelegate: IModuleDelegate {
    func onTap (_ tapX: Double, _ tapY:Double )
    func onTouch(_ tapX: Double, _ tapY:Double )
    func onFling (_ direction: TouchGestureDirection, _ angle:Double, _ time: Double, _ distance: Double )
    func onCaress (_ direction: TouchGestureDirection)
}
