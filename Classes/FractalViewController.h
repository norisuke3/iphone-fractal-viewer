//
//  LogisticMapTestViewController.h
//  LogisticMapTest
//
//  Created by Nori@FireDictionary on 09/09/22.
//  Copyright FireDictionary.com 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouchSensitiveView;

@interface FractalViewController : UIViewController < UIActionSheetDelegate, UIScrollViewDelegate >{
    NSString* mapClassName;
    TouchSensitiveView* mCanvas;
    CGPoint SCROLL_VIEW_BOUNDS_ORIGIN;
    CGPoint lastOffset;
}

@property (retain) NSString* mapClassName;
@property (retain) TouchSensitiveView* mCanvas;

@end

