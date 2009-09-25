//
//  RevertableScrollView.h
//  LogisticMapTest
//
//  Created by Hamamoto Noriaki on 09/09/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RevertableScrollView : UIScrollView {
    CGPoint boundsOrigin;
    CGSize contentSize;
}

@property CGPoint boundsOrigin;

-(CGPoint)boundsOrigin;
-(void)setBoundsOrigin:(CGPoint)origin;
-(void)initContentSize:(CGSize)size;
-(void)revert;

@end
