//
//  AGLKVertexAttribArrayBuffer.h
//  gles
//
//  Created by Alexander Popov on 7/4/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface AGLKVertexAttribArrayBuffer : NSObject {
    GLsizeiptr _stride;
    GLsizeiptr _bufferSizeBytes;
    GLuint _bufferId;
}

@property (nonatomic, readonly) GLsizeiptr stride;
@property (nonatomic, readonly) GLsizeiptr bufferSizeBytes;
@property (nonatomic, readonly) GLuint bufferId;

- (instancetype)initWithAttribStride:(GLsizeiptr)stride numberOfVertices:(GLsizei)count data:(const GLvoid *)data usage:(GLenum)usage;
- (void)prepareToDrawWithAttrib:(GLuint)index numberOfCoordinates:(GLuint)count attribOffset:(GLsizeiptr)offset shouldEnable:(BOOL)shouldEnable;
- (void)drawArrayWithMode:(GLenum)mode startVertexIndex:(GLint)first numberOfVertices:(GLsizei)count;

@end
