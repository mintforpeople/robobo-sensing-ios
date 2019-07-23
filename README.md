# robobo-sensing-ios


The sensing library is used to get infomation form the smartphone sensors in an easy mode.
This library is composed by 3 modules:

### Acceleration module

This module can be used for getting information about the state of the acceleration sensor of the smartphone.
The interface of the  module is the following one:


### Orientation module

This module can be used for getting information about the state of the orientation sensor of the smartphone. This virtual sensor uses a mix of the acceleration, gyroscope and magnetometer sensor to obtain the absolute position of the device, therefore, if the smartphone lacks any of this hardware sensors, this module will not work.


### Battery module

This module allows the programmer to access the battery level of the device.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

robobo-sensing-ios is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'robobo-sensing-ios'
```

## Author
<!--
623e45d3ebd5e88abf84e2a4f33c4511abb531ad, 
-->
lfllamas93@gmail.com

## License

robobo-sensing-ios is available under the Apache 2.0 license. See the LICENSE file for more info.

***
<!-- 
    ROSIN acknowledgement from the ROSIN press kit
    @ https://github.com/rosin-project/press_kit
-->

<a href="http://rosin-project.eu">
  <img src="http://rosin-project.eu/wp-content/uploads/rosin_ack_logo_wide.png" 
       alt="rosin_logo" height="60" >
</a>

Supported by ROSIN - ROS-Industrial Quality-Assured Robot Software Components.  
More information: <a href="http://rosin-project.eu">rosin-project.eu</a>

<img src="http://rosin-project.eu/wp-content/uploads/rosin_eu_flag.jpg" 
     alt="eu_flag" height="45" align="left" >  

This project has received funding from the European Union’s Horizon 2020  
research and innovation programme under grant agreement no. 732287. 

