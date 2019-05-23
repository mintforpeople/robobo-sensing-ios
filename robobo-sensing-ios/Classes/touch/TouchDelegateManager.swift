//
//  TouchDelegateManager.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 12/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

open class TouchDelegateManager: DelegateManager {
    func notifyTap (_ tapX: Double, _ tapY:Double ){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onTap(tapX, tapY)
            }
        }
    }
    func notifyTouch(_ tapX: Double, _ tapY:Double ){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onTouch(tapX, tapY)
            }
        }
    }
    func notifyFling (_ direction: TouchGestureDirection, _ angle:Double, _ time: Double, _ distance: Double ){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onFling(direction, angle,  time, distance)
            }
        }
    }
    func notifyCaress (_ direction: TouchGestureDirection){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onCaress(direction)
            }
        }
    }
}
