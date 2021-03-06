//
//  glesInitTextureViewController.h
//  gles
//
//  Created by Alexander Popov on 7/8/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import "glesInitTextureViewController.h"
#import "AGLKContext.h"

typedef struct {
    GLKVector3 positionCoordinates;
    GLKVector2 textureCoordinates;
} SceneVertex;

@implementation glesInitTextureViewController

- (void)viewDidLoad
{
 
    [super viewDidLoad];
    
    // demo triangle
    SceneVertex vertices[3] = {
        { { -0.5f, -0.5f, 0.0f }, { 0.0f, 0.0f } },
        { { 0.5f, -0.5f, 0.0f }, { 1.0f, 0.0f } },
        { { -0.5f, 0.5f, 0.0f }, { 0.0f, 1.0f } },
    };
    
    GLKView *view = (GLKView *)[self view];
    NSAssert([view isKindOfClass:[GLKView class]] == YES, @"View not GLKView.");
    
    // create & set current context
    [view setContext:[[AGLKContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2]];
    [EAGLContext setCurrentContext:[view context]];
    
    // init base effect
    _baseEffect = [[GLKBaseEffect alloc] init];
    [_baseEffect setUseConstantColor:GL_TRUE];
    [_baseEffect setConstantColor:GLKVector4Make(1.0f, 1.0f, 1.0f, 1.0f)];

    [(AGLKContext *)[view context] setClearColor:GLKVector4Make(0.0f, 0.0f, 0.0f, 1.0f)];
    
    _vertexBuffer = [[AGLKVertexAttribArrayBuffer alloc] initWithAttribStride:sizeof(SceneVertex) numberOfVertices:sizeof(vertices) / sizeof(SceneVertex) data:vertices usage:GL_STATIC_DRAW];
    
    UIImage *image = [UIImage imageNamed:@"texture_sample.jpg"];
    NSAssert(image != nil, @"Failed to load texture for sample.");
    CGImageRef imageRef = [image CGImage];
    
    NSError *error = nil;
    GLKTextureInfo *textureInfo = [GLKTextureLoader textureWithCGImage:imageRef options:nil error:&error];
    NSAssert(error == nil, [error description]);
    
    [[_baseEffect texture2d0] setName:[textureInfo name]];
    [[_baseEffect texture2d0] setTarget:[textureInfo target]];
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    
    // prep base effect
    [_baseEffect prepareToDraw];
    
    // clear background
    glClear(GL_COLOR_BUFFER_BIT);
    
    [_vertexBuffer prepareToDrawWithAttrib:GLKVertexAttribPosition numberOfCoordinates:3 attribOffset:offsetof(SceneVertex, positionCoordinates) shouldEnable:YES];
    
    [_vertexBuffer prepareToDrawWithAttrib:GLKVertexAttribTexCoord0 numberOfCoordinates:3 attribOffset:offsetof(SceneVertex, textureCoordinates) shouldEnable:YES];
    
    [_vertexBuffer drawArrayWithMode:GL_TRIANGLES startVertexIndex:0 numberOfVertices:3];
    
}

- (void)dealloc
{
    
    GLKView *view = (GLKView *)[self view];
    [view setContext:nil];
    
}

@end
