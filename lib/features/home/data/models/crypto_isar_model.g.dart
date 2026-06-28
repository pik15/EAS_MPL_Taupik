// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCryptoIsarModelCollection on Isar {
  IsarCollection<CryptoIsarModel> get cryptoIsarModels => this.collection();
}

const CryptoIsarModelSchema = CollectionSchema(
  name: r'CryptoIsarModel',
  id: 1556650396457175214,
  properties: {
    r'changePercent24h': PropertySchema(
      id: 0,
      name: r'changePercent24h',
      type: IsarType.double,
    ),
    r'cryptoId': PropertySchema(
      id: 1,
      name: r'cryptoId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'priceUsd': PropertySchema(
      id: 3,
      name: r'priceUsd',
      type: IsarType.double,
    ),
    r'symbol': PropertySchema(
      id: 4,
      name: r'symbol',
      type: IsarType.string,
    )
  },
  estimateSize: _cryptoIsarModelEstimateSize,
  serialize: _cryptoIsarModelSerialize,
  deserialize: _cryptoIsarModelDeserialize,
  deserializeProp: _cryptoIsarModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'cryptoId': IndexSchema(
      id: 5958733721945768272,
      name: r'cryptoId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'cryptoId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cryptoIsarModelGetId,
  getLinks: _cryptoIsarModelGetLinks,
  attach: _cryptoIsarModelAttach,
  version: '3.1.0+1',
);

int _cryptoIsarModelEstimateSize(
  CryptoIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cryptoId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.symbol.length * 3;
  return bytesCount;
}

void _cryptoIsarModelSerialize(
  CryptoIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.changePercent24h);
  writer.writeString(offsets[1], object.cryptoId);
  writer.writeString(offsets[2], object.name);
  writer.writeDouble(offsets[3], object.priceUsd);
  writer.writeString(offsets[4], object.symbol);
}

CryptoIsarModel _cryptoIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CryptoIsarModel();
  object.changePercent24h = reader.readDouble(offsets[0]);
  object.cryptoId = reader.readString(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.priceUsd = reader.readDouble(offsets[3]);
  object.symbol = reader.readString(offsets[4]);
  return object;
}

P _cryptoIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cryptoIsarModelGetId(CryptoIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cryptoIsarModelGetLinks(CryptoIsarModel object) {
  return [];
}

void _cryptoIsarModelAttach(
    IsarCollection<dynamic> col, Id id, CryptoIsarModel object) {
  object.id = id;
}

extension CryptoIsarModelByIndex on IsarCollection<CryptoIsarModel> {
  Future<CryptoIsarModel?> getByCryptoId(String cryptoId) {
    return getByIndex(r'cryptoId', [cryptoId]);
  }

  CryptoIsarModel? getByCryptoIdSync(String cryptoId) {
    return getByIndexSync(r'cryptoId', [cryptoId]);
  }

  Future<bool> deleteByCryptoId(String cryptoId) {
    return deleteByIndex(r'cryptoId', [cryptoId]);
  }

  bool deleteByCryptoIdSync(String cryptoId) {
    return deleteByIndexSync(r'cryptoId', [cryptoId]);
  }

  Future<List<CryptoIsarModel?>> getAllByCryptoId(List<String> cryptoIdValues) {
    final values = cryptoIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'cryptoId', values);
  }

  List<CryptoIsarModel?> getAllByCryptoIdSync(List<String> cryptoIdValues) {
    final values = cryptoIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'cryptoId', values);
  }

  Future<int> deleteAllByCryptoId(List<String> cryptoIdValues) {
    final values = cryptoIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'cryptoId', values);
  }

  int deleteAllByCryptoIdSync(List<String> cryptoIdValues) {
    final values = cryptoIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'cryptoId', values);
  }

  Future<Id> putByCryptoId(CryptoIsarModel object) {
    return putByIndex(r'cryptoId', object);
  }

  Id putByCryptoIdSync(CryptoIsarModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'cryptoId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCryptoId(List<CryptoIsarModel> objects) {
    return putAllByIndex(r'cryptoId', objects);
  }

  List<Id> putAllByCryptoIdSync(List<CryptoIsarModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'cryptoId', objects, saveLinks: saveLinks);
  }
}

extension CryptoIsarModelQueryWhereSort
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QWhere> {
  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CryptoIsarModelQueryWhere
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QWhereClause> {
  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhereClause>
      cryptoIdEqualTo(String cryptoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cryptoId',
        value: [cryptoId],
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterWhereClause>
      cryptoIdNotEqualTo(String cryptoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cryptoId',
              lower: [],
              upper: [cryptoId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cryptoId',
              lower: [cryptoId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cryptoId',
              lower: [cryptoId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cryptoId',
              lower: [],
              upper: [cryptoId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CryptoIsarModelQueryFilter
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QFilterCondition> {
  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      changePercent24hEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changePercent24h',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      changePercent24hGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'changePercent24h',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      changePercent24hLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'changePercent24h',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      changePercent24hBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'changePercent24h',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cryptoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cryptoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cryptoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cryptoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cryptoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cryptoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cryptoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cryptoId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cryptoId',
        value: '',
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      cryptoIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cryptoId',
        value: '',
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      priceUsdEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceUsd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      priceUsdGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceUsd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      priceUsdLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceUsd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      priceUsdBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceUsd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }
}

extension CryptoIsarModelQueryObject
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QFilterCondition> {}

extension CryptoIsarModelQueryLinks
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QFilterCondition> {}

extension CryptoIsarModelQuerySortBy
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QSortBy> {
  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortByChangePercent24h() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent24h', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortByChangePercent24hDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent24h', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortByCryptoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cryptoId', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortByCryptoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cryptoId', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortByPriceUsd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUsd', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortByPriceUsdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUsd', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy> sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }
}

extension CryptoIsarModelQuerySortThenBy
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QSortThenBy> {
  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenByChangePercent24h() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent24h', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenByChangePercent24hDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent24h', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenByCryptoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cryptoId', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenByCryptoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cryptoId', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenByPriceUsd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUsd', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenByPriceUsdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceUsd', Sort.desc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy> thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QAfterSortBy>
      thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }
}

extension CryptoIsarModelQueryWhereDistinct
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QDistinct> {
  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QDistinct>
      distinctByChangePercent24h() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'changePercent24h');
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QDistinct> distinctByCryptoId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cryptoId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QDistinct>
      distinctByPriceUsd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceUsd');
    });
  }

  QueryBuilder<CryptoIsarModel, CryptoIsarModel, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }
}

extension CryptoIsarModelQueryProperty
    on QueryBuilder<CryptoIsarModel, CryptoIsarModel, QQueryProperty> {
  QueryBuilder<CryptoIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CryptoIsarModel, double, QQueryOperations>
      changePercent24hProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'changePercent24h');
    });
  }

  QueryBuilder<CryptoIsarModel, String, QQueryOperations> cryptoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cryptoId');
    });
  }

  QueryBuilder<CryptoIsarModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CryptoIsarModel, double, QQueryOperations> priceUsdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceUsd');
    });
  }

  QueryBuilder<CryptoIsarModel, String, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }
}
