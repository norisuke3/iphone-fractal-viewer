//
//  TouchSensitiveView.h
//  DrawSample
//
//  Created by Hamamoto Noriaki on 09/09/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchSensitiveView : UIView {
    NSTimer* timer;
    UIViewController <UIActionSheetDelegate>* dataSource;
}

@property (assign) UIViewController <UIActionSheetDelegate>* dataSource;

-(void)resetRect;

@end
