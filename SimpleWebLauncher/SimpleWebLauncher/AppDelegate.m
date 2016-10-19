//
//  AppDelegate.m
//  SimpleWebLauncher
//
//  Created by Sam Tarakajian on 10/18/16.
//  Copyright © 2016 Girlfriends Labs. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	NSURL *configurl = [[NSBundle mainBundle] URLForResource:@"config" withExtension:@"plist"];
//	NSData *configdata = [NSData dataWithContentsOfURL:configurl];
	NSDictionary *configdict = [NSDictionary dictionaryWithContentsOfURL:configurl];
	NSString *launchurl = [configdict objectForKey:@"LaunchURL"];
	
	[self.webView setMainFrameURL:launchurl];
	
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

@end
