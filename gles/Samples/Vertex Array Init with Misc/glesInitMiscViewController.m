//
//  glesInitMiscViewController.h
//  gles
//
//  Created by Alexander Popov on 7/4/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import "glesInitMiscViewController.h"
#import "AGLKContext.h"

@implementation glesInitMiscViewController

- (void)viewDidLoad
{
 
    [super viewDidLoad];
    
    // demo triangle
    GLKVector3 vertices[3];
    vertices[0] = GLKVector3Make(-0.5, -0.5, 0.0);
    vertices[1] = GLKVector3Make(0.5, -0.5, 0.0);
    vertices[2] = GLKVector3Make(0.5, 0.5, 0.0);
    
    GLKView *view = (GLKView *)[self view];
    NSAssert([view isKindOfClass:[GLKView class]] == YES, @"View not GLKView.");
    
    // create & set current context
    [view setContext:[[AGLKContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2]];
    [EAGLContext setCurrentContext:[view context]];
    
    // init base effect
    _baseEffect = [[GLKBaseEffect alloc] init];
    [_baseEffect setUseConstantColor:GL_TRUE];
    [_baseEffect setConstantColor:GLKVector4Make(1.0f, 1.0f, 0.0f, 1.0f)];

    [(AGLKContext *)[view context] setClearColor:GLKVector4Make(0.0f, 0.0f, 0.0f, 1.0f)];
    
    _vertexBuffer = [[AGLKVertexAttribArrayBuffer alloc] initWithAttribStride:sizeof(GLKVector3) numberOfVertices:3 data:vertices usage:GL_STATIC_DRAW];
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    
    // prep base effect
    [_baseEffect prepareToDraw];
    
    // clear background
    glClear(GL_COLOR_BUFFER_BIT);

    [_vertexBuffer prepareToDrawWithAttrib:GLKVertexAttribPosition numberOfCoordinates:3 attribOffset:0 shouldEnable:YES];
    
    [_vertexBuffer drawArrayWithMode:GL_TRIANGLES startVertexIndex:0 numberOfVertices:3];
    
}

- (void)dealloc
{
    
    GLKView *view = (GLKView *)[self view];
    [view setContext:nil];
    
}

@end
