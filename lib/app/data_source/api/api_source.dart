import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:move_app/utils/errors/api_exception.dart';

import '../../../utils/app_exception.dart';
import '../../../utils/connectivity/connectivity.dart';
import '../../../utils/errors/not_internet_exception.dart';

@lazySingleton
class ApiSource {
  final String? baseUrl;
  final http.Client? client;
  final Connectivity? connectivity;

  ApiSource(
    @Named('baseUrl') this.baseUrl,
    this.client,
    this.connectivity,
  );

  Map<String, String> getHeaders(Map<String, String> headers) {
    return headers;
  }

  Duration get timeout => const Duration(seconds: 50);

  Future<T> _callApi<T>(
    Future<http.Response> caller,
    T Function(dynamic value) mapperFunction,
  ) async {
    try {
      if (!await connectivity!.isConnected()) {
        throw NotInternetException();
      }
      var response = await caller;
      return await _manageResponse(response, mapperFunction);
    } on AppException catch (e) {
      log(e.toString(), name: 'error');
      rethrow;
    } on ApiException catch (e) {
      log(e.toString(), name: 'error');
      rethrow;
    } catch (error) {
      log(error.toString(), name: 'error');
      throw AppException(description: 'defaultError');
    }
  }

  Future<T> getApi<T>(
    Uri uri,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
    bool sendHeaders = true,
  }) async {
    headers = getHeaders(headers ?? {});
    var caller = client!
        .get(
          uri,
          headers: sendHeaders ? headers : null,
        )
        .timeout(timeout);
    return _callApi(caller, mapperFunction);
  }

  Future<T> deleteApi<T>(
    Uri uri,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
  }) async {
    headers = getHeaders(headers ?? {});
    var caller = client!.delete(uri, headers: headers).timeout(timeout);

    return _callApi(caller, mapperFunction);
  }

  Future<T> postApi<T>(
    Uri uri,
    dynamic body,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
  }) async {
    headers = getHeaders(headers ?? {});
    var newBody = getRequestBody(body);
    log("Method: POST  , Headers: ${headers.toString()}, Request Body: ${json.encode(body)} ",
        name: "method_$uri");
    var caller = client!
        .post(
          uri,
          body: newBody,
          headers: headers,
        )
        .timeout(timeout);
    return _callApi(caller, mapperFunction);
  }

  Future<T> putApi<T>(
    Uri uri,
    dynamic body,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
  }) async {
    headers = getHeaders(headers ?? {});
    var bodyString = getRequestBody(body);
    log(bodyString, name: 'requestBody');
    var caller =
        client!.put(uri, body: bodyString, headers: headers).timeout(timeout);
    return _callApi(caller, mapperFunction);
  }

  Future<T> patchApi<T>(
    Uri uri,
    Map<String, dynamic> body,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
  }) async {
    headers = getHeaders(headers ?? {});
    log(json.encode(body), name: 'requestBody');
    var caller = client!
        .patch(uri, body: json.encode(body), headers: headers)
        .timeout(timeout);

    return _callApi(caller, mapperFunction);
  }

  Future<T> multipartApi<T>(
    Uri uri,
    Map<String, String> fields,
    String filePath,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
  }) async {
    try {
      if (!await connectivity!.isConnected()) {
        throw AppException(description: 'defaultError');
      }
      headers = getHeaders(headers ?? {});
      var multipart = http.MultipartRequest('POST', uri);
      multipart.headers.addAll(headers);
      multipart.fields.addAll(fields);
      multipart.files.add(await http.MultipartFile.fromPath('file', filePath));
      var response = await multipart.send();
      return await _manageStreamedResponse(response, mapperFunction);
    } on AppException catch (e) {
      log(e.toString(), name: 'error');
      rethrow;
    } on ApiException catch (e) {
      log(e.toString(), name: 'error');
      rethrow;
    } catch (ex) {
      log(ex.toString(), name: 'responseError', error: ex);
      throw AppException(description: 'defaultError');
    }
  }

  dynamic getRequestBody(dynamic body) {
    if (body is String || body is Map) {
      return body;
    }
    return json.encode(body);
  }

  Future<T> _manageResponse<T>(
    http.Response response,
    T Function(dynamic value) mapperFunction,
  ) async {
    _showLogs(response);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return compute(mapperFunction, _getBody(response.bodyBytes));
    } else {
      return _manageError<T>(response);
    }
  }

  Future<T> _manageStreamedResponse<T>(
    http.StreamedResponse response,
    T Function(dynamic value) mapperFunction,
  ) async {
    _showLogs(response);
    var body = await response.stream.transform(utf8.decoder).first;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return compute(mapperFunction, _getBody(body));
    } else {
      throw AppException(description: 'defaultError');
    }
  }

  T _manageError<T>(http.Response response) {
    if (response.statusCode >= 500) {
      throw AppException(description: 'defaultError');
    } else {
      return _errorFromResponse(response);
    }
  }

  T _errorFromResponse<T>(http.Response response) {
    var body = _getBody(response.body);
    throw ApiException(response.statusCode, body);
  }

  dynamic _getBody(dynamic body) {
    String bodyString;
    if (body is String) {
      bodyString = body;
    } else {
      bodyString = utf8.decode(body);
    }
    try {
      return json.decode(bodyString);
    } catch (_) {
      return bodyString;
    }
  }

  void _showLogs(http.BaseResponse response) {
    log(response.request!.url.toString(), name: 'url');
    log(response.request!.method, name: 'method');
    log(response.request!.headers.toString(), name: 'headers');
    log(response.statusCode.toString(), name: 'statusCode');
  }
}
