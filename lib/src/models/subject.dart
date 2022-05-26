Set<DSBSubject> _subjects = {
  DSBSubject(DSBSubjectType.entfaellt                   , '-'     , 'Entfällt'                      , ' '                         , DSBSubjectScope.both),
  DSBSubject(DSBSubjectType.unbekannt                   , '?'     , 'Unbekannt'                     , ''                          , DSBSubjectScope.both),
  DSBSubject(DSBSubjectType.pause                       , ' '     , 'Pause'                         , ''                          , DSBSubjectScope.both),
  DSBSubject(DSBSubjectType.modulZurBeruflOrientierung  , 'BO'    , 'Modul zur berufl. Orientierung', ''                          , DSBSubjectScope.both),

  DSBSubject(DSBSubjectType.englisch                    , 'E'     , 'Englisch'                      , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.englischILV                 , 'Eilv'  , 'Englisch Indiv. Lernzeitverk.' , 'e (ilv)'                   , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.mathematik                  , 'M'     , 'Mathematik'                    , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.mathematikILV               , 'Milv'  , 'Mathematik Indiv. Lernzeitverk.', 'm (ilv)'                  , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.kunst                       , 'K'     , 'Kunst'                         , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.deutsch                     , 'D'     , 'Deutsch'                       , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.deutschILV                  , 'Dilv'  , 'Deutsch Indiv. Lernzeitverk.'  , 'd (ilv)'                   , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.latein                      , 'L'     , 'Latein'                        , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.franzoesisch                , 'Fr'    , 'Französisch'                   , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.chemie                      , 'Ch'    , 'Chemie'                        , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.chemieUebung                , 'ChÜ'   , 'Chemie (Übungen)'              , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.evReligion                  , 'EvR'   , 'Evangelische Religionslehre'   , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.kathReligion                , 'KtR'   , 'Katholische Religionslehre'    , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.physik                      , 'Ph'    , 'Physik'                        , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.ethik                       , 'Eth'   , 'Ethik'                         , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.geografie                   , 'Geo'   , 'Geografie'                     , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.geografie                   , 'Geo'   , 'Geographie'                    , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.geschichte                  , 'G'     , 'Geschichte'                    , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.biologie                    , 'Bio'   , 'Biologie'                      , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.musik                       , 'Mu'    , 'Musik'                         , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.sportM                      , 'Sp'    , 'Sport (m)'                     , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.sportW                      , 'Sp'    , 'Sport (w)'                     , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.sportMW                     , 'Sp'    , 'Sport (m/w)'                   , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.sportMW                     , 'Sp'    , 'Sport (mw)'                    , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.diffSportunterrichtM        , 'DSp'   , 'Diff. Sportunterricht (m)'     , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.diffSportunterrichtW        , 'DSp'   , 'Diff. Sportunterricht (w)'     , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.wirtschaftUndRecht          , 'WuR'   , 'Wirtschaft und Recht'          , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.informatik                  , 'Info'  , 'Informatik'                    , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.sozialkunde                 , 'Sozi'  , 'Sozialkunde'                   , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.naturUndTechnik             , 'NuT'   , 'Natur und Technik'             , ''                          , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.naturUndTechnikOderInformatik, 'NuT/I' , 'Natur und Technik / Informatik', 'nut/inf'                  , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.naturUndTechnikOderInformatik, 'NuT/I' , 'Natur und Technik / Informatik', 'nut (informatik)'         , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.naturUndTechnikOderBiologie , 'NuT/B' , 'Natur und Technik / Biologie'  , 'nut/b'                     , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.naturUndTechnikOderBiologie , 'NuT/B' , 'Natur und Technik / Biologie'  , 'nut (biologie)'            , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.naturUndTechnikOderPhysik   , 'NuT/P' , 'Natur und Technik / Physik'    , 'nut/p'                     , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.naturUndTechnikOderPhysik   , 'NuT/P' , 'Natur und Technik / Physik'    , 'nut (physik)'              , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.nta                         , 'NTA'   , 'Naturwissenschafliches Arbeiten', 'naturw. arb. (nta)'       , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.chorUnterstufe              , 'Cho'   , 'Unterstufen Chor'              , 'cho_u-chor'                , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.orchesterUnterstufe         , 'Orch'  , 'Unterstufen Orchester'         , 'wu_orchester (unterstufe)' , DSBSubjectScope.exceptSeniorGrades),
  DSBSubject(DSBSubjectType.franzoesischSpaetbeginnend  , 'FrSp'  , 'Französisch spätbeginnend'     , ''                          , DSBSubjectScope.exceptSeniorGrades),

  DSBSubject(DSBSubjectType.englischKonversation        , ''      , 'Englisch Konversation'         , 'eko'                       , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.fotokurs                    , ''      , 'Fotokurs'                      , 'fot'                       , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.psychologie                 , ''      , 'Psychologie'                   , 'psy'                       , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.instrumentalistenGruppe     , ''      , 'Instrumentalisten Gruppe'      , 'ins'                       , DSBSubjectScope.seniorGradesOnly),

  DSBSubject(DSBSubjectType.englisch                    , ''      , 'Englisch'                      , 'e'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.physik                      , ''      , 'Physik'                        , 'ph'                        , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.mathematik                  , ''      , 'Mathematik'                    , 'm'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.kunst                       , ''      , 'Kunst'                         , 'ku'                        , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.deutsch                     , ''      , 'Deutsch'                       , 'd'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.latein                      , ''      , 'Latein'                        , 'l'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.franzoesisch                , ''      , 'Französisch'                   , 'f'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.franzoesisch                , ''      , 'Französisch - spätbeginnend'   , 'fs'                        , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.chemie                      , ''      , 'Chemie'                        , 'c'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.evReligion                  , ''      , 'Evangelische Religionslehre'   , 'ev'                        , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.kathReligion                , ''      , 'Katholische Religionslehre'    , 'k'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.ethik                       , ''      , 'Ethik'                         , 'eth'                       , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.geografie                   , ''      , 'Geografie'                     , 'geo'                       , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.geschichte                  , ''      , 'Geschichte'                    , 'g'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.biologie                    , ''      , 'Biologie'                      , 'b'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.musik                       , ''      , 'Musik'                         , 'mu'                        , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.sportMW                     , ''      , 'Sport'                         , 'smw'                       , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.wirtschaftUndRecht          , ''      , 'Wirtschaft und Recht'          , 'wr'                        , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.informatik                  , ''      , 'Informatik'                    , 'inf'                       , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.sozialkunde                 , ''      , 'Sozialkunde'                   , 'sk'                        , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.wSeminar                    , ''      , 'W-Seminar'                     , 'w'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.pSeminar                    , ''      , 'P-Seminar'                     , 'p'                         , DSBSubjectScope.seniorGradesOnly),
  DSBSubject(DSBSubjectType.sporttheorie                , ''      , 'Sporttheorie'                  , 'spt'                       , DSBSubjectScope.seniorGradesOnly),
};

Set<DSBSubject> subjects = () {
  var subjects = <DSBSubject>{};
  _subjects.forEach((e) {
    subjects.add(DSBSubject(e.subjectType, e.shortName == '' ? e.id : e.shortName, e.longName, e.id == '' ? e.longName.toLowerCase() : e.id.toLowerCase(), e.scope));
  });
  return subjects;
}();

//returns null if not found
DSBSubject getSubjectById(String id) {
  if (id.isEmpty) id = ' ';
  return subjects.firstWhere((e) => e.id == id.toLowerCase(), orElse: () => null);
}

/*
 scopes:  also returns subjects with scope "both"
          if scope is "both" returns the first
 */
DSBSubject getSubjectByType(DSBSubjectType type, DSBSubjectScope scope) {
  return subjects.firstWhere((e) => e.subjectType == type && (e.scope == scope || e.scope == DSBSubjectScope.both || scope == DSBSubjectScope.both), orElse: () => null,);
}

class DSBSubject {
  final DSBSubjectType  subjectType;
  final String          shortName;
  final String          longName;
  final String          id;
  final DSBSubjectScope scope;

  DSBSubject(this.subjectType, this.shortName, this.longName, this.id, this.scope);
}

enum DSBSubjectScope {
  exceptSeniorGrades,
  seniorGradesOnly,
  both
}

enum DSBSubjectType {
  unbekannt,
  englisch,
  englischILV,
  mathematik,
  mathematikILV,
  kunst,
  deutsch,
  deutschILV,
  latein,
  franzoesisch,
  chemie,
  chemieUebung,
  evReligion,
  ethik,
  kathReligion,
  physik,
  geografie,
  geschichte,
  biologie,
  entfaellt,
  musik,
  sportW,
  sportM,
  sportMW,
  wirtschaftUndRecht,
  informatik,
  sozialkunde,
  naturUndTechnik,
  diffSportunterrichtW,
  diffSportunterrichtM,
  pause,
  naturUndTechnikOderPhysik,
  naturUndTechnikOderBiologie,
  naturUndTechnikOderInformatik,
  nta,
  englischKonversation,
  fotokurs,
  instrumentalistenGruppe,
  psychologie,
  modulZurBeruflOrientierung,
  wSeminar,
  pSeminar,
  chorUnterstufe,
  orchesterUnterstufe,
  sporttheorie,
  franzoesischSpaetbeginnend,
}

class DSBSubjectData {
  DSBSubjectType subject;
  int seniorGradeIndex1;
  int seniorGradeIndex2;

  DSBSubjectData(this.subject, this.seniorGradeIndex1, this.seniorGradeIndex2);
}

//TODO: Add "drg" "il/d2"