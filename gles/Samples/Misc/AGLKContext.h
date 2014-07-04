//
//  AGLKContext.h
//  gles
//
//  Created by Alexander Popov on 7/4/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface AGLKContext : EAGLContext {
    GLKVector4 _clearColor;
}

@property (nonatomic, assign) GLKVector4 clearColor;

- (void)clear:(GLbitfield)mask;

@end
