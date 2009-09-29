//
//  FractalViewerAppDelegate.m
//  FractalViewer
//
//  Created by Nori@FireDictionary on 09/09/25.
//  Copyright FireDictionary.com 2009. All rights reserved.
//

#import "FractalViewerAppDelegate.h"
#import "RootViewController.h"


@implementation FractalViewerAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
    [window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

