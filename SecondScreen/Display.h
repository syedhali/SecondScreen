//
//  Display.h
//  SecondScreen
//
//  Created by Syed Haris Ali on 5/17/17.
//  Copyright © 2017 Ausome Apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

//------------------------------------------------------------------------------
#pragma mark - Display
//------------------------------------------------------------------------------

@interface Display : NSObject

//------------------------------------------------------------------------------
#pragma mark - Properties
//------------------------------------------------------------------------------

@property (readonly, strong) UIScreen *screen;
@property (readonly, strong) UIWindow *window;

//------------------------------------------------------------------------------
#pragma mark - Initializers
//------------------------------------------------------------------------------

- (instancetype)initWithScreen:(UIScreen *)screen
                        window:(UIWindow *)window;

@end
