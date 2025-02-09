import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:sundial_wellness_tracker/extensions/extensions.dart';
import 'package:sundial_wellness_tracker/models/base_model/base_model.dart';
import 'package:sundial_wellness_tracker/models/health_metrics_model/health_metrics_model.dart';
import 'package:sundial_wellness_tracker/models/motivational_model/motivational_model.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';

part 'api_service.dart';
part 'health_metrics_service.dart';
part 'motivational_service.dart';
part 'networking_service.dart';

enum HTTPMethodsEnum { get, post, put, delete, head, patch }

typedef HTTPResponseSchema<T> = ({String? error, T? data});
