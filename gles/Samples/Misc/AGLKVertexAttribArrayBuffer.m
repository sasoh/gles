//
//  AGLKVertexAttribArrayBuffer.m
//  gles
//
//  Created by Alexander Popov on 7/4/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import "AGLKVertexAttribArrayBuffer.h"

@implementation AGLKVertexAttribArrayBuffer

- (instancetype)initWithAttribStride:(GLsizeiptr)stride numberOfVertices:(GLsizei)count data:(const GLvoid *)data usage:(GLenum)usage
{
    
    NSParameterAssert(stride > 0);
    NSParameterAssert(count > 0);
    NSParameterAssert(data != NULL);
    
    self = [super init];
    
    if (self != nil) {
        _stride = stride;
        _bufferSizeBytes = stride * count;
        
        glGenBuffers(1, &_bufferId);
        glBindBuffer(GL_ARRAY_BUFFER, _bufferId);
        glBufferData(GL_ARRAY_BUFFER, _bufferSizeBytes, data, usage);
        
        NSAssert(_bufferId != 0, @"Failed to generate buffer.");
    }
    
    return self;
    
}

- (void)prepareToDrawWithAttrib:(GLuint)index numberOfCoordinates:(GLuint)count attribOffset:(GLsizeiptr)offset shouldEnable:(BOOL)shouldEnable
{
    
    NSParameterAssert(count > 0 && count < 4);
    NSParameterAssert(offset < _stride);
    NSAssert(_bufferId != 0, @"Buffer not initialized.");
    
    glBindBuffer(GL_ARRAY_BUFFER, _bufferId);
    
    if (shouldEnable == YES) {
        glEnableVertexAttribArray(index);
    }
    
    glVertexAttribPointer(index, count, GL_FLOAT, GL_FALSE, (GLsizei)_stride, NULL + offset);
    
}

- (void)drawArrayWithMode:(GLenum)mode startVertexIndex:(GLint)first numberOfVertices:(GLsizei)count
{
    
    NSAssert(_bufferSizeBytes >= (first + count) * _stride, @"Attempt to draw more vertex data than available.");
    
    glDrawArrays(mode, first, count);
    
}

- (void)dealloc
{
    
    if (_bufferId != 0) {
        glDeleteBuffers(1, &_bufferId);
        _bufferId = 0;
    }
    
}

@end
