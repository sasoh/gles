//
//  AGLKContext.m
//  gles
//
//  Created by Alexander Popov on 7/4/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import "AGLKContext.h"

@implementation AGLKContext

- (void)setClearColor:(GLKVector4)clearColor
{
    
    _clearColor = clearColor;
    
    NSAssert(self == [[self class] currentContext], @"Receiving context required to be the current one.");
    
    glClearColor(_clearColor.r, _clearColor.g, _clearColor.b, _clearColor.a);
    
}

- (void)clear:(GLbitfield)mask
{
    
    NSAssert(self == [[self class] currentContext], @"Receiving context required to be the current one.");
    
    glClear(mask);
    
}

@end
