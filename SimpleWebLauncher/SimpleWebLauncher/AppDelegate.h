//
//  AppDelegate.h
//  SimpleWebLauncher
//
//  Created by Sam Tarakajian on 10/18/16.
//  Copyright © 2016 Girlfriends Labs. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) IBOutlet WebView *webView;

@end

