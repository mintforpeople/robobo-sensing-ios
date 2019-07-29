//
//  ViewController.swift
//  robobo-sensing-ios
//
//  Created by 623e45d3ebd5e88abf84e2a4f33c4511abb531ad on 05/23/2019.
//  Copyright (c) 2019 623e45d3ebd5e88abf84e2a4f33c4511abb531ad. All rights reserved.
//

import UIKit
import robobo_sensing_ios
import robobo_framework_ios_pod
import robobo_remote_control_ios

class ViewController: UIViewController, IAccelerationDelegate, IOrientationDelegate, RoboboManagerDelegate, ITouchDelegate {
    

    var manager : RoboboManager!
   
    var accelModule :IAccelerationModule!
    var orientationModule :IOrientationModule!
    var touchModule :ITouchModule!
    var remoteModule :IRemoteControlModule!
    
    
    
    @IBOutlet var mainView: UIView!
    var remoteProxy : ProxyTest!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = RoboboManager()
        manager.addFrameworkDelegate(self)
        remoteProxy = ProxyTest()
        
        do{
            try manager.startup()
            
            var module = try manager.getModuleInstance("IAccelerationModule")
            accelModule = module as? IAccelerationModule
            module = try manager.getModuleInstance("IOrientationModule")
            orientationModule = module as? IOrientationModule
            module = try manager.getModuleInstance("ITouchModule")
            touchModule = module as? ITouchModule
            
            module = try manager.getModuleInstance("IRemoteControlModule")
            remoteModule = module as? IRemoteControlModule
            
            
            remoteModule.registerRemoteControlProxy(remoteProxy)
            
            accelModule.delegateManager.suscribe(self)
            orientationModule.delegateManager.suscribe(self)
            touchModule.delegateManager.suscribe(self)
            
            touchModule.setView(mainView)
            
            
        } catch {
            print(error)
        }
    }
    
    func loadingModule(_ moduleInfo: String, _ moduleVersion: String) {
        self.manager.log("Loading \(moduleInfo) \(moduleVersion)",LogLevel.VERBOSE)
        
    }
    
    func moduleLoaded(_ moduleInfo: String, _ moduleVersion: String) {
        self.manager.log("Loaded \(moduleInfo) \(moduleVersion)", LogLevel.INFO)
    }
    
    func frameworkStateChanged(_ state: RoboboManagerState) {
        self.manager.log("Framework state changed: \(state)")
    }
    
    func frameworkError(_ error: Error) {
        self.manager.log("Framework error: \(error)", LogLevel.WARNING)
    }
    
    func onAccelerationChange() {
        
    }
    
    func onAcceleration(_ xAccel: Double, _ yAccel: Double, _ zAccel: Double) {
        manager.log("x:\(xAccel) y:\(yAccel) z:\(zAccel)")
        
    }
    
    func onOrientation(_ yaw: Double, _ pitch: Double, _ roll: Double) {
        manager.log("yaw:\(yaw) pitch:\(pitch) roll:\(roll)")
    }
    
    func onTap(_ tapX: Double, _ tapY: Double) {
        manager.log("Tap x:\(tapX) y:\(tapY)")

    }
    
    func onTouch(_ tapX: Double, _ tapY: Double) {
        manager.log("Touch x:\(tapX) y:\(tapY)")

    }
    
    func onFling(_ direction: TouchGestureDirection, _ angle: Double, _ time: Double, _ distance: Double) {
        manager.log("Fling angle:\(angle) time:\(time)")

    }
    
    func onCaress(_ direction: TouchGestureDirection) {
        manager.log(String(direction.hashValue))
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

