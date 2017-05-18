//
//  DisplayManager.h
//  SecondScreen
//
//  Created by Syed Haris Ali on 5/17/17.
//  Copyright © 2017 Ausome Apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Display.h"

@class DisplayManager;

//------------------------------------------------------------------------------
#pragma mark - DisplayManagerDelegate
//------------------------------------------------------------------------------

@protocol DisplayManagerDelegate <NSObject>

- (void)displayManagerDidConnectDisplay:(DisplayManager *)manager;
- (void)displayManagerDidDisconnectDisplay:(DisplayManager *)manager;

@end

//------------------------------------------------------------------------------
#pragma mark - DisplayManager
//------------------------------------------------------------------------------

@interface DisplayManager : NSObject

//------------------------------------------------------------------------------
// MARK: Properties
//------------------------------------------------------------------------------

@property (weak) id<DisplayManagerDelegate> delegate;
@property (readonly, strong) Display *display;

//------------------------------------------------------------------------------
// MARK: Singleton
//------------------------------------------------------------------------------

+ (instancetype)sharedInstance;

//------------------------------------------------------------------------------
// MARK: Instance Methods
//------------------------------------------------------------------------------

- (void)beginMonitoring;
- (void)stopMonitoring;

@end
