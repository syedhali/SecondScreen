//
//  Display.m
//  SecondScreen
//
//  Created by Syed Haris Ali on 5/17/17.
//  Copyright © 2017 Ausome Apps LLC. All rights reserved.
//

#import "Display.h"

//------------------------------------------------------------------------------
#pragma mark - Display (Interface Extension)
//------------------------------------------------------------------------------

@interface Display ()
@property (readwrite, strong) UIScreen *screen;
@property (readwrite, strong) UIWindow *window;
@end

//------------------------------------------------------------------------------
#pragma mark - Display (Implementation)
//------------------------------------------------------------------------------

@implementation Display

//------------------------------------------------------------------------------
#pragma mark - Initializer
//------------------------------------------------------------------------------

- (instancetype)initWithScreen:(UIScreen *)screen window:(UIWindow *)window {
    self = [super init];
    if (self) {
        _screen = screen;
        _window = window;
    }
    return self;
}

@end
