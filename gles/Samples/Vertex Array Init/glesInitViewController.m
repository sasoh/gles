//
//  glesInitViewController.m
//  ch1_init
//
//  Created by Alexander Popov on 7/1/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import "glesInitViewController.h"

//static const GLKVector3 

@implementation glesInitViewController

- (void)viewDidLoad
{
 
    [super viewDidLoad];
    
    // demo triangle
    vertices[0] = GLKVector3Make(-0.5, -0.5, 0.0);
    vertices[1] = GLKVector3Make(0.5, -0.5, 0.0);
    vertices[2] = GLKVector3Make(-0.5, 0.5, 0.0);
    
    GLKView *view = (GLKView *)[self view];
    NSAssert([view isKindOfClass:[GLKView class]] == YES, @"View not GLKView.");
    
    // create & set current context
    [view setContext:[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2]];
    [EAGLContext setCurrentContext:[view context]];
    
    // init base effect
    _baseEffect = [[GLKBaseEffect alloc] init];
    [_baseEffect setUseConstantColor:GL_TRUE];
    [_baseEffect setConstantColor:GLKVector4Make(0.0f, 1.0f, 0.0f, 1.0f)];
    
    // background clear color
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    
    // (vertex) buffer generation, binding & init
    glGenBuffers(1, &_vertexBufferId);
    
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBufferId);
    
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    
    // prep base effect
    [_baseEffect prepareToDraw];
    
    // clear background
    glClear(GL_COLOR_BUFFER_BIT);
    
    // enable use of currently bound buffer
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    // point to data & describe how the information is stored
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(GLKVector3), NULL);
    
    glDrawArrays(GL_TRIANGLES, 0, 3);
    
}

- (void)dealloc
{
    
    GLKView *view = (GLKView *)[self view];
    [EAGLContext setCurrentContext:[view context]];
    
    // release buffer
    if (_vertexBufferId != 0) {
        glDeleteBuffers(1, &_vertexBufferId);
        _vertexBufferId = 0;
    }
    
    // remove context
    [view setContext:nil];
    [EAGLContext setCurrentContext:nil];
    
}

@end
