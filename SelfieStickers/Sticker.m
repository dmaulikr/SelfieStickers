//
//  Sticker.m
//  SelfieStickers
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import "Sticker.h"

@interface Sticker () <UIGestureRecognizerDelegate>

@end

@implementation Sticker

-(instancetype)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    
    if (self) {
        self.userInteractionEnabled = YES;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
        
         UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandler:)];
        
         UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationHandler:)];
        
        self.gestureRecognizers = @[pan, pinch, rotation];
        
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
            recognizer.delegate = self;
        }
    }
    return self;
}


-(void)panHandler:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [gestureRecognizer.view setTransform:CGAffineTransformTranslate(gestureRecognizer.view.transform, translation.x, translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:gestureRecognizer.view];
    }
}

-(void)pinchHandler:(UIPinchGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged){
        CGFloat scale = gestureRecognizer.scale;
        [gestureRecognizer.view setTransform:CGAffineTransformScale(gestureRecognizer.view.transform, scale, scale)];
        [gestureRecognizer setScale:1.0];
    }
}

-(void)rotationHandler:(UIRotationGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat rotation = gestureRecognizer.rotation;
        [gestureRecognizer.view setTransform:CGAffineTransformRotate(gestureRecognizer.view.transform, rotation)];
        [gestureRecognizer setRotation:0];
    }
    
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return  YES;
}

@end
