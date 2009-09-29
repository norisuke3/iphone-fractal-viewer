//
//  Canvas.m
//  LogisticMapTest
//
//  Created by Hamamoto Noriaki on 09/09/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Canvas.h"
#import "LogisticMap.h"
#import "MandelbrotSet.h"
#import "ColoredMandelbrotSet.h"
#import "JuliaSet.h"
#import "ColoredJuliaSet.h"
#import "ColoredJuliaSet2.h"

@implementation Canvas


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        map = [[LogisticMap alloc] init];
        lastScale = 1.0;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame mapClassName:(NSString*)name{
    if (self = [super initWithFrame:frame]){
        Class mapClass = NSClassFromString(name);
        map = [[mapClass alloc] init];
        lastScale = 1.0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextConcatCTM(c, self.mapToView);
    
    map.context = c;
    [map draw];
    
    CGContextStrokePath(c);
}

-(void)drawToImageContext{
    UIGraphicsBeginImageContext([[UIScreen mainScreen] applicationFrame].size);
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextConcatCTM(c, self.mapToImageContext);
    
    map.context = c;
    [map draw];
    
    CGContextStrokePath(c);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

-(void)zoom:(float)theScale onOffset:(CGPoint)offset{
    CGPoint adjusted = CGPointMake( offset.x + ( 1.0 - 1.0 / theScale * lastScale ) / 2.0 * (320.0 * 3.0),
                                   offset.y + ( 1.0 - 1.0 / theScale * lastScale ) / 2.0 * (460.0 * 3.0));
    CGPoint originOnMap = CGPointApplyAffineTransform(adjusted, self.viewToMap);
    
    [map modifyRect:originOnMap scale:theScale / 3.0];
    
    lastScale = theScale;
}

-(void)setOrigin:(CGPoint)origin{
    CGPoint adjusted = CGPointMake( origin.x - 320, origin.y - 460);
    CGPoint originOnMap = CGPointApplyAffineTransform(adjusted, self.viewToMap);

    [map modifyRect:originOnMap scale:lastScale / 3.0];
}

-(CGAffineTransform)mapToView{
    return CGAffineTransformInvert(self.affineTransform);
}

-(CGAffineTransform)mapToImageContext{
    CGAffineTransform result = CGAffineTransformIdentity;
    
    result = CGAffineTransformConcat(result, CGAffineTransformMakeTranslation(320.0, 460.0));
    result = CGAffineTransformConcat(result, self.affineTransform);
    result = CGAffineTransformInvert(result);
    
    return result;
}

-(CGAffineTransform)viewToMap{
    return self.affineTransform;
}

-(CGAffineTransform)affineTransform{
    CGAffineTransform result = CGAffineTransformIdentity;
    CGRect            rect   = map.rect;
    float             scale  = rect.size.width / map.outlineWidth;

    result = CGAffineTransformConcat(result, CGAffineTransformMakeScale( 1.0 / (320.0 * 3.0), 1.0 / (460.0 * 3.0) ));
    result = CGAffineTransformConcat(result, CGAffineTransformMakeScale(scale, scale));
    result = CGAffineTransformConcat(result, CGAffineTransformMakeTranslation( rect.origin.x, rect.origin.y ));
    
    return result;
}

- (void)dealloc {
    [map release];
    [super dealloc];
}

@end
