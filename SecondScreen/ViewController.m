//
//  ViewController.m
//  SecondScreen
//
//  Created by Syed Haris Ali on 5/17/17.
//  Copyright © 2017 Ausome Apps LLC. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

//------------------------------------------------------------------------------
// MARK: View Lifecycle
//------------------------------------------------------------------------------

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //
    // Begin monitoring for external display connections
    //
    [[DisplayManager sharedInstance] beginMonitoring];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //
    // Stop monitoring external display connections
    //
    [[DisplayManager sharedInstance] stopMonitoring];
}

//------------------------------------------------------------------------------
// MARK: DisplayManagerDelegate
//------------------------------------------------------------------------------

- (void)displayManagerDidConnectDisplay:(DisplayManager *)manager {
    Display *display = manager.display;
    NSLog(@"Connected external display! [Screen: %@, Window: %@]",
          display.screen,
          display.window);
}

//------------------------------------------------------------------------------

- (void)displayManagerDidDisconnectDisplay:(DisplayManager *)manager {
    NSLog(@"Disconnected external display!");
}

@end
