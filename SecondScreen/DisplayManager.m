//
//  DisplayManager.m
//  SecondScreen
//
//  Created by Syed Haris Ali on 5/17/17.
//  Copyright © 2017 Ausome Apps LLC. All rights reserved.
//

#import "DisplayManager.h"

//------------------------------------------------------------------------------
#pragma mark - DisplayManager (Interface Extension)
//------------------------------------------------------------------------------

@interface DisplayManager ()
@property (readwrite, strong) Display *display;
@end

//------------------------------------------------------------------------------
#pragma mark - DisplayManager (Implementation)
//------------------------------------------------------------------------------

@implementation DisplayManager

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//------------------------------------------------------------------------------
// MARK: Singleton
//------------------------------------------------------------------------------

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

//------------------------------------------------------------------------------
// MARK: Initializer
//------------------------------------------------------------------------------

- (instancetype) init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

//------------------------------------------------------------------------------

- (void)setup {
    NSArray<UIScreen *> *screens = [UIScreen screens];
    if (screens.count > 1) {
        UIScreen *externalScreen = screens[1];
        UIWindow *window = [[UIWindow alloc] initWithFrame:externalScreen.bounds];
        window.screen = externalScreen;
        self.display = [[Display alloc] initWithScreen:externalScreen window:window];
    }
}

//------------------------------------------------------------------------------
// MARK: Instance Methods
//------------------------------------------------------------------------------

- (void)beginMonitoring {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenDidConnect:)
                                                 name:UIScreenDidConnectNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenDidDisconnect:)
                                                 name:UIScreenDidDisconnectNotification
                                               object:nil];
}

//------------------------------------------------------------------------------

- (void)stopMonitoring {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//------------------------------------------------------------------------------
// MARK: Notifications
//------------------------------------------------------------------------------

- (void)screenDidConnect:(NSNotification *)notification {
    //
    // Get the screen
    //
    UIScreen *screen = (UIScreen *)[notification object];
    
    //
    // Create a window for that screen and associate it so we can
    // add subviews
    //
    UIWindow *window = [[UIWindow alloc] initWithFrame:screen.bounds];
    window.screen = screen;
    
    //
    // Store reference to current external display
    //
    self.display = [[Display alloc] initWithScreen:screen window:window];
    
    //
    // Notify delegate of new display
    //
    if ([self.delegate respondsToSelector:@selector(displayManagerDidConnectDisplay:)]) {
        [self.delegate displayManagerDidConnectDisplay:self];
    }
}

//------------------------------------------------------------------------------

- (void)screenDidDisconnect:(NSNotification *)notification {
    //
    // Clear current reference to the display
    //
    if (self.display) {
        self.display = nil;
    }
    
    //
    // Notify delegate of disconnected display
    //
    if ([self.delegate respondsToSelector:@selector(displayManagerDidConnectDisplay:)]) {
        [self.delegate displayManagerDidConnectDisplay:self];
    }
}

@end
