//
//  TouchSensitiveView.h
//  FractalViewer
//
//  Created by norisuke3@gmail.com on 09/09/18.
//  Copyright 2009 FireDictionary.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchSensitiveView : UIView {
    NSTimer* timer;
    UIViewController <UIActionSheetDelegate>* dataSource;
}

@property (assign) UIViewController <UIActionSheetDelegate>* dataSource;

-(void)resetRect;

@end
