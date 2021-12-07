Map<String, DSBSubject> dsbSubjectMapPretty = {
  'Entfällt': DSBSubject.entfaellt,
  'Englisch': DSBSubject.englisch,
  'Mathematik': DSBSubject.mathematik,
  'Kunst': DSBSubject.kunst,
  'Deutsch': DSBSubject.deutsch,
  'Latein': DSBSubject.latein,
  'Französisch': DSBSubject.franzoesisch,
  'Chemie': DSBSubject.chemie,
  'Chemie (Übungen)': DSBSubject.chemieUebung,
  'Evangelische Religionslehre': DSBSubject.evReligion,
  'Katholische Religionslehre': DSBSubject.kathReligion,
  'Physik': DSBSubject.physik,
  'Ethik': DSBSubject.ethik,
  'Geografie': DSBSubject.geografie,
  'Geographie': DSBSubject.geografie,
  'Geschichte': DSBSubject.geschichte,
  'Biologie': DSBSubject.biologie,
  'Musik': DSBSubject.musik,
  'Sport (w)': DSBSubject.sportW,
  'Sport (m)': DSBSubject.sportM,
  'Sport (m/w)': DSBSubject.sportM,
  'Wirtschaft und Recht': DSBSubject.wirtschaftUndRecht,
  'Informatik': DSBSubject.informatik,
  'Sozialkunde': DSBSubject.sozialkunde,
  'Natur und Technik': DSBSubject.naturUndTechnik,
  'Diff. Sportunterricht (w)': DSBSubject.diffSportunterrichtW,
  'Diff. Sportunterricht (m)': DSBSubject.diffSportunterrichtM,
  'Pause': DSBSubject.pause,
  'Natur und Technik / Physik': DSBSubject.naturUndTechnikOderPhysik,
  'Natur und Technik / Biologie': DSBSubject.naturUndTechnikOderBiologie,
  'Englisch Konversation': DSBSubject.englischKonversation,
  'Fotokurs': DSBSubject.fotokurs,
  'Instrumentalisten Gruppe': DSBSubject.instrumentalistenGruppe,
  'Psychologie': DSBSubject.psychologie,
  'Unbekannt': DSBSubject.unbekannt
};

Map<String, DSBSubject> dsbSubjectMapSeniorGrades = {
  'e': DSBSubject.englisch,
  'm': DSBSubject.mathematik,
  'ku': DSBSubject.kunst,
  'd': DSBSubject.deutsch,
  'l': DSBSubject.latein,
  'f': DSBSubject.franzoesisch,
  'c': DSBSubject.chemie,
  'ev': DSBSubject.evReligion,
  'k': DSBSubject.kathReligion,
  'ph': DSBSubject.physik,
  'eth': DSBSubject.ethik,
  'geo': DSBSubject.geografie,
  'g': DSBSubject.geschichte,
  'b': DSBSubject.biologie,
  'mu': DSBSubject.musik,
  'smw': DSBSubject.sportMW,
  'wr': DSBSubject.wirtschaftUndRecht,
  'inf': DSBSubject.informatik,
  'sk': DSBSubject.sozialkunde,
  'eko': DSBSubject.englischKonversation,
  'fot': DSBSubject.fotokurs,
  'ins': DSBSubject.instrumentalistenGruppe,
  'psy': DSBSubject.psychologie,
};

Map<String, DSBSubject> dsbSubjectMapOther = {
  'nut/b': DSBSubject.naturUndTechnikOderBiologie,
  'nut/p': DSBSubject.naturUndTechnikOderPhysik
};

Map<String, DSBSubject> dsbSubjectMap = () {
  var dsbSubjectMap = dsbSubjectMapPretty.map((key, value) => MapEntry(key.toLowerCase() != 'entfällt' ? key.toLowerCase() : '---', value));
  dsbSubjectMap.addAll(dsbSubjectMapSeniorGrades);
  dsbSubjectMap.addAll(dsbSubjectMapOther);
  return dsbSubjectMap;
}();

Map<DSBSubject, String> dsbSubjectShortPretty = {
  DSBSubject.entfaellt: '-',
  DSBSubject.englisch: 'E',
  DSBSubject.mathematik: 'M',
  DSBSubject.kunst: 'K',
  DSBSubject.deutsch: 'D',
  DSBSubject.latein: 'L',
  DSBSubject.franzoesisch: 'Fr',
  DSBSubject.chemie: 'Ch',
  DSBSubject.chemieUebung: 'ChÜ',
  DSBSubject.evReligion: 'EvR',
  DSBSubject.kathReligion: 'KtR',
  DSBSubject.physik: 'Ph',
  DSBSubject.ethik: 'Eth',
  DSBSubject.geografie: 'Geo',
  DSBSubject.geschichte: 'G',
  DSBSubject.biologie: 'Bio',
  DSBSubject.musik: 'Mu',
  DSBSubject.sportW: 'Sp',
  DSBSubject.sportM: 'Sp',
  DSBSubject.sportMW: 'Sp',
  DSBSubject.diffSportunterrichtW: 'DSp',
  DSBSubject.diffSportunterrichtM: 'DSp',
  DSBSubject.wirtschaftUndRecht: 'WuR',
  DSBSubject.informatik: 'Info',
  DSBSubject.sozialkunde: 'Sozi',
  DSBSubject.naturUndTechnik: 'NuT',
  DSBSubject.pause: '',
  DSBSubject.naturUndTechnikOderPhysik: 'NuT/P',
  DSBSubject.naturUndTechnikOderBiologie: 'NuT/B',
  DSBSubject.englischKonversation: 'EKo',
  DSBSubject.fotokurs: 'Fot',
  DSBSubject.instrumentalistenGruppe: 'Ins',
  DSBSubject.psychologie: 'Psy',
  DSBSubject.unbekannt: '?'
};

enum DSBSubject {
  unbekannt,
  englisch,
  mathematik,
  kunst,
  deutsch,
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
  englischKonversation,
  fotokurs,
  instrumentalistenGruppe,
  psychologie
}

class DSBSubjectData {
  final DSBSubject subject;
  final int seniorGradeIndex1;
  final int seniorGradeIndex2;

  DSBSubjectData(this.subject, this.seniorGradeIndex1, this.seniorGradeIndex2);
}

//TODO: Add "drg"