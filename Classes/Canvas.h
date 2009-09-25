//
//  Canvas.h
//  LogisticMapTest
//
//  Created by Hamamoto Noriaki on 09/09/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchSensitiveView.h"
@class Coordinate;

@interface Canvas : TouchSensitiveView {
    Coordinate* map;
    float lastScale;
}

@property (readonly)CGAffineTransform affineTransform;
@property (readonly)CGAffineTransform mapToView;
@property (readonly)CGAffineTransform viewToMap;

-(void)zoom:(float)scale;
-(void)setOrigin:(CGPoint)origin;

@end
