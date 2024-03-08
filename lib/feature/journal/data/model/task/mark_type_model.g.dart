// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssessmentTypeModelAdapter extends TypeAdapter<_$MarkTypeModelImpl> {
  @override
  final int typeId = 11;

  @override
  _$MarkTypeModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MarkTypeModelImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      minValue: fields[2] as int,
      maxValue: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$MarkTypeModelImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.minValue)
      ..writeByte(3)
      ..write(obj.maxValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssessmentTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkTypeModelImpl _$$MarkTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$MarkTypeModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      minValue: json['minValue'] as int,
      maxValue: json['maxValue'] as int,
    );

Map<String, dynamic> _$$MarkTypeModelImplToJson(_$MarkTypeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
    };
