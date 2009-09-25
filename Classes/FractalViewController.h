//
//  LogisticMapTestViewController.h
//  LogisticMapTest
//
//  Created by Hamamoto Noriaki on 09/09/22.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouchSensitiveView;

@interface FractalViewController : UIViewController < UIActionSheetDelegate, UIScrollViewDelegate >{
    TouchSensitiveView* mCanvas;
    CGPoint SCROLL_VIEW_BOUNDS_ORIGIN;
}

@property (retain) TouchSensitiveView* mCanvas;

@end

