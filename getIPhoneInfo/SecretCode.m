//
//  SecretCode.m
//  HiddenApi
//
//  Created by Vincent on 14-12-10.
//  Copyright (c) 2014年 Vincent. All rights reserved.
//

#import "SecretCode.h"

@implementation SecretCode

OBJC_EXTERN CFStringRef MGCopyAnswer(CFStringRef key) WEAK_IMPORT_ATTRIBUTE;

+ (NSString *)UDID {
    
    if (kCFCoreFoundationVersionNumber < 800) {//iOS 7以下
        
        NSString *udid = [[UIDevice currentDevice] valueForKey:@"uniqueIdentifier"];
        
        return udid;
    }
    
    CFStringRef result = MGCopyAnswer(CFSTR("UniqueDeviceID"));

    return (__bridge NSString *)(result);
}

+ (NSString *)IMEI {

    CFStringRef result = MGCopyAnswer(CFSTR("InternationalMobileEquipmentIdentity"));
    
    
    return  [NSString stringWithFormat:@"\nUDID:\n%@\nserialNumber:\n%@\nIMEI:\n%@\nICCID:\n%@\nwifiAddress:\n%@\nbluetoothAddress:\n%@\ncpuArchitecture:\n%@\nproductType:\n%@\nairplaneMode:\n%@",
     [SecretCode UDID],
     [SecretCode serialNumber],
     @"fwfwf",
     [SecretCode ICCID],
     [SecretCode wifiAddress],
     [SecretCode bluetoothAddress],
     [SecretCode cpuArchitecture],
     [SecretCode productType],
     [SecretCode airplaneMode]?@"YES":@"NO"
     ];
}

+ (NSString *)ICCID {
    
    
    NSString *retVal = nil;
    CFArrayRef infoArray = MGCopyAnswer(CFSTR("CarrierBundleInfoArray"));
    if (infoArray) {
        CFDictionaryRef infoDic = CFArrayGetValueAtIndex(infoArray, 0);
        if (infoDic) {
            retVal = [NSString stringWithString:CFDictionaryGetValue(infoDic, CFSTR("IntegratedCircuitCardIdentity"))];
        }
        CFRelease(infoArray);
    }
    return retVal;
}

+ (NSString *)serialNumber {
    
    CFStringRef result = MGCopyAnswer(CFSTR("SerialNumber"));
    
    return (__bridge NSString *)(result);
}

+ (NSString *)wifiAddress {
    
    CFStringRef result = MGCopyAnswer(CFSTR("WifiAddress"));
    
    return (__bridge NSString *)(result);
}

+ (NSString *)bluetoothAddress {
    
    CFStringRef result = MGCopyAnswer(CFSTR("BluetoothAddress"));
    
    return (__bridge NSString *)(result);
}

+ (NSString *)cpuArchitecture {
    
    CFStringRef result = MGCopyAnswer(CFSTR("CPUArchitecture"));
    
    return (__bridge NSString *)(result);
}

+ (NSString *)productType {
    
    CFStringRef result = MGCopyAnswer(CFSTR("ProductType"));
    
    return (__bridge NSString *)(result);
}

+ (BOOL)airplaneMode {
    
    BOOL retVal = NO;
    CFTypeRef tmp = MGCopyAnswer(CFSTR("AirplaneMode"));
    if (tmp) {
        if (tmp == kCFBooleanTrue) {
            retVal = YES;
        }
        CFRelease(tmp);
    }
    return retVal;
}

@end
