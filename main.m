//
//  main.m
//  FractalViewer
//
//  Created by Hamamoto Noriaki on 09/09/25.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FractalViewerAppDelegate.h"

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([FractalViewerAppDelegate class]));
    [pool release];
    return retVal;
}
