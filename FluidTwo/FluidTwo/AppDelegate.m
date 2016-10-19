//
//  AppDelegate.m
//  FluidTwo
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
	// Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (IBAction)urlEntered:(NSTextField *)sender {
	NSLog(@"%@", sender.stringValue);
	NSError *error;
	
	NSURL *configURL = [[NSBundle mainBundle] URLForResource:@"SimpleWebLauncher" withExtension:@"app"];
	NSString *tempURLString = [NSTemporaryDirectory() stringByAppendingPathComponent:@"SimpleWebLauncher.app"];
	NSURL *tempURL = [NSURL fileURLWithPath:tempURLString];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	[fileManager removeItemAtURL:tempURL error:&error];
	[fileManager copyItemAtURL:configURL toURL:tempURL error:&error];
	
	NSString *configFileURLString = [tempURLString stringByAppendingPathComponent:@"Contents/Resources/config.plist"];
	NSURL *configFileURL = [NSURL fileURLWithPath:configFileURLString];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfURL:configFileURL];
	[dict setValue:sender.stringValue forKey:@"LaunchURL"];
	[dict writeToURL:configFileURL atomically:YES];
	
	NSString *destURLString = [NSHomeDirectory() stringByAppendingPathComponent:@"SimpleWebLauncher.app"];
	NSURL *destURL = [NSURL fileURLWithPath:destURLString];
	[fileManager removeItemAtURL:destURL error:&error];
	[fileManager copyItemAtURL:tempURL toURL:destURL error:&error];
	
	NSLog(@"SUCCESSS!!!!");
}

@end
