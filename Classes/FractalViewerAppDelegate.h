//
//  FractalViewerAppDelegate.h
//  FractalViewer
//
//  Created by norisuke3@gmail.com on 09/09/25.
//  Copyright FireDictionary.com 2009. All rights reserved.
//

@interface FractalViewerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

