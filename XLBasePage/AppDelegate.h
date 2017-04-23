//
//  AppDelegate.h
//  XLBasePage
//
//  Created by apple on 17/3/24.
//  Copyright © 2017年 ZXL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

