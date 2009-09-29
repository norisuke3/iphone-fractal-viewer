//
//  Canvas.h
//  LogisticMapTest
//
//  Created by Nori@FireDictionary on 09/09/22.
//  Copyright 2009 FireDictionary.com. All rights reserved.
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
@property (readonly)CGAffineTransform mapToImageContext;
@property (readonly)CGAffineTransform viewToMap;

-(void)zoom:(float)scale onOffset:(CGPoint)offset;
-(void)setOrigin:(CGPoint)origin;
-(id)initWithFrame:(CGRect)frame mapClassName:(NSString*)name;
-(void)drawToImageContext;

@end
