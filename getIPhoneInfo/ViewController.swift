//
//  ViewController.swift
//  getIPhoneInfo
//
//  Created by jointsky on 2017/2/13.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var showCurrentTime: UILabel!
    
    var timer:Timer!
    
    
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getiPhoneInfo()
        
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRunLoop(sender:)), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {

    // MARK: get iphone information
    fileprivate func getiPhoneInfo() {
        // 设备型号
        self.textView.text = self.textView.text+"设备型号："+DeviceTool.getDeviceName()+"\n"
        
        // iPhone名称
        self.textView.text = self.textView.text+"iPhone名称："+UIDevice.current.name+"\n"
        
        // App版本号
        let versionNo = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        self.textView.text = self.textView.text+"App版本号："+versionNo+"\n"
        
        // 电池电量
        self.textView.text = self.textView.text+"电池电量："+String(UIDevice.current.batteryLevel)+"\n"
        
        // localizedModel
        self.textView.text = self.textView.text+"localizedModel："+UIDevice.current.localizedModel+"\n"
        
        // 系统名称
        self.textView.text = self.textView.text+"系统名称："+UIDevice.current.systemName+"\n"

        // 系统版本号
        self.textView.text = self.textView.text+"系统版本号："+UIDevice.current.systemVersion+"\n"
        
        // DeviceModel
        self.textView.text = self.textView.text+"DeviceModel："+DeviceTool.deviceModel()+"\n"
        
        // macAddress
        self.textView.text = self.textView.text+"macAddress："+DeviceTool.getMacAddress()+"\n"
        
        // deviceIP
        self.textView.text = self.textView.text+"deviceIP："+DeviceTool.getDeviceIPAddresses()+"\n"
        
        // 广告位标识符idfa
//        self.textView.text = self.textView.text+"广告位标识符idfa："++"\n"
        
        // UUID
        self.textView.text = self.textView.text+"UUID："+(UIDevice.current.identifierForVendor?.uuidString)!+"\n"
        
        // 获取运营商信息
        self.textView.text = self.textView.text+"运营商："+DeviceTool.getCarrierName()+"\n"
        
        // 获取设置总空间大小
        self.textView.text = self.textView.text+"总空间大小："+DeviceTool.deviceAllSize()+"\n"
        
        // 可用空间大小
        self.textView.text = self.textView.text+"可用空间大小："+DeviceTool.deviceUnUseSize()+"\n"
        
        // 总物理内存大小
        self.textView.text = self.textView.text+"总物理内存大小："+DeviceTool.devicePhysicalRunTimeSize()+"\n"
        
        // 可使用物理内存大小
        self.textView.text = self.textView.text+"可使用物理内存大小："+DeviceTool.deviceUnUsePhysicalRunTimeSize()+"\n"
        
        // 系统语言
        self.textView.text = self.textView.text+"系统语言："+NSLocale.preferredLanguages[0]+"\n"
        
        // 国家
        self.textView.text = self.textView.text+"国家："+NSLocale.current.identifier+"\n"
        
        // 手机号码
        self.textView.text = self.textView.text+"手机号码："+DeviceTool.myNumber()+"\n"
        
        // UIID
        self.textView.text = self.textView.text+"手机号码："+SecretCode.imei()+"\n"
    }
    
    
    @objc fileprivate func timerRunLoop(sender: Timer) {
        let dateFormatter = DateFormatter.init()
        
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH时mm分ss秒"
        
        self.showCurrentTime.text = dateFormatter.string(from: Date.init())
        
        self.textView.text = ""
        getiPhoneInfo()
    }
}
