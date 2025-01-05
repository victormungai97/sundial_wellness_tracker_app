import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';

part 'api_service.dart';
part 'networking_service.dart';

enum HTTPMethodsEnum { get, post, put, delete, head, patch }

typedef HTTPResponseSchema<T> = ({String? error, T? data});
