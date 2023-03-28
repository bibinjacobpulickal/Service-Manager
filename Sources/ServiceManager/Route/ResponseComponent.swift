//
//  ResponseComponent.swift
//
//  Copyright © 2020 Bibin Jacob Pulickal (https://github.com/bibinjacobpulickal)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public protocol ResponseComponent {

    // URLSession response object decoder, defaults to JSONDecoder().
    var decoder: AnyDecoder { get }
}

public extension ResponseComponent {

    var decoder: AnyDecoder { JSONDecoder() }
}

public protocol URLResponseConvertible {
  func asURLResponse() throws -> URLResponse
}

extension URLResponse: URLResponseConvertible {
  public func asURLResponse() throws -> URLResponse { self }
}

public protocol HTTPURLResponseConvertible {
  func asHTTPURLResponse() throws -> HTTPURLResponse
}

extension URLResponse: HTTPURLResponseConvertible {
  public func asHTTPURLResponse() throws -> HTTPURLResponse {
    if let this = self as? HTTPURLResponse {
      return this
    } else {
      throw HTTPError.invalidResponse(response: self)
    }
  }
}
