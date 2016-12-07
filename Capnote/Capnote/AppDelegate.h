//
//  AppDelegate.h
//  Capnote
//
//  Created by Daler Asrorov on 12/5/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

