import 'package:flutter/material.dart';

void main() => runApp(const UrapMirApp());

class UrapMirApp extends StatelessWidget {
  const UrapMirApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'URAPMIR',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6E69)),
      useMaterial3: true,
    ),
    home: const HomePage(),
  );
}

class ClinicalTopic {
  final String title, diagnosis, conduct, treatment, referral, safety;
  const ClinicalTopic(this.title, this.diagnosis, this.conduct, this.treatment, this.referral, this.safety);
}

const topics = <ClinicalTopic>[
  ClinicalTopic(
    'Hipertensión arterial',
    'Confirmar cifras elevadas con medidas repetidas y, cuando sea posible, AMPA o MAPA. Revisar técnica, adherencia, fármacos que elevan la PA y riesgo cardiovascular.',
    'En AP: descartar daño agudo de órgano diana si la PA es muy elevada. Valorar función renal, iones, glucemia/HbA1c, perfil lipídico, albuminuria y ECG según contexto.',
    'Opciones habituales de primera línea: IECA o ARA-II, calcioantagonista dihidropiridínico y diurético tiazídico/tiazida-like. Con frecuencia se usan combinaciones a dosis bajas. Ajustar siempre a función renal, potasio, comorbilidad y ficha técnica.',
    'Urgencias ante déficit neurológico, dolor torácico, edema agudo de pulmón, disección aórtica, lesión renal aguda u otra disfunción aguda de órgano diana.',
    'No reducir de forma brusca una elevación asintomática sin daño agudo de órgano diana.'
  ),
  ClinicalTopic(
    'Diabetes mellitus tipo 2',
    'Confirmar con criterios bioquímicos aceptados salvo hiperglucemia inequívoca con síntomas. Valorar riesgo cardiovascular, renal, peso y riesgo de hipoglucemia.',
    'Educación, alimentación, ejercicio, peso, PA, pies, función renal y albuminuria. Individualizar objetivos.',
    'Metformina es una opción basal frecuente si no hay contraindicación. En enfermedad cardiovascular, insuficiencia cardiaca o ERC, priorizar fármacos con beneficio cardiorrenal cuando estén indicados, como iSGLT2 y/o agonistas GLP-1. Ajustar por filtrado y ficha técnica.',
    'Urgencias ante cetoacidosis, estado hiperosmolar, hipoglucemia grave o deterioro agudo.',
    'No modificar insulina sin un plan claro de autocontroles, prevención de hipoglucemia y seguimiento.'
  ),
  ClinicalTopic(
    'Dislipemia y prevención cardiovascular',
    'Calcular riesgo cardiovascular global y detectar enfermedad cardiovascular establecida, diabetes, ERC y otros modificadores de riesgo.',
    'Revisar dieta, ejercicio, tabaquismo, PA, peso y adherencia.',
    'Las estatinas son la base. Intensificar según riesgo y objetivo de LDL; si no se alcanza, valorar ezetimiba y terapias adicionales en pacientes seleccionados.',
    'Valorar derivación en sospecha de hipercolesterolemia familiar, intolerancia compleja o hipertrigliceridemia grave.',
    'La intensidad terapéutica depende del riesgo basal, no solo de un valor aislado de LDL.'
  ),
  ClinicalTopic(
    'Insuficiencia cardiaca',
    'Sospechar ante disnea, ortopnea, edemas, crepitantes, ingurgitación yugular o intolerancia al esfuerzo. ECG, analítica, péptidos natriuréticos y ecocardiografía ayudan a definir el cuadro.',
    'Distinguir estabilidad de descompensación. Controlar peso, PA, frecuencia, función renal, potasio y congestión.',
    'En IC con FE reducida, el tratamiento modificador pronóstico suele combinar ARNI/IECA/ARA-II, betabloqueante, antagonista mineralocorticoide e iSGLT2 si están indicados. Diuréticos para congestión.',
    'Urgencias si disnea en reposo, hipoxemia, hipotensión, dolor torácico, síncope, edema agudo de pulmón o hipoperfusión.',
    'Evitar AINE cuando sea posible por retención hidrosalina y deterioro renal.'
  ),
  ClinicalTopic(
    'Fibrilación auricular',
    'Confirmar con ECG. Valorar síntomas, frecuencia ventricular, desencadenantes y riesgo tromboembólico/hemorrágico.',
    'En paciente estable, plantear control de frecuencia o ritmo según contexto y valorar anticoagulación con una escala validada.',
    'Los anticoagulantes orales directos son preferidos en muchos pacientes con FA no valvular cuando están indicados. Ajustar dosis a función renal, edad, peso e interacciones.',
    'Urgencias ante inestabilidad hemodinámica, dolor isquémico, insuficiencia cardiaca aguda, síncope o deterioro con respuesta ventricular rápida.',
    'No iniciar o suspender anticoagulación automáticamente sin revisar indicación, sangrado, función renal e interacciones.'
  ),
  ClinicalTopic(
    'Asma',
    'Clínica compatible más demostración de variabilidad del flujo aéreo cuando sea posible. La espirometría con broncodilatación es fundamental.',
    'Valorar control, exacerbaciones, técnica inhalatoria, adherencia, tabaquismo y comorbilidades.',
    'El tratamiento controlador debe incluir corticoide inhalado. GEMA recomienda escalado según control y riesgo; las combinaciones con formoterol permiten estrategias de mantenimiento y rescate en determinados escalones.',
    'Urgencias ante dificultad respiratoria intensa, habla entrecortada, agotamiento, alteración de conciencia, silencio auscultatorio, hipoxemia o mala respuesta inicial.',
    'Revisar siempre la técnica del inhalador antes de escalar.'
  ),
  ClinicalTopic(
    'EPOC',
    'Confirmar obstrucción persistente con espirometría posbroncodilatador en paciente con exposición y clínica compatible.',
    'Valorar disnea, exacerbaciones, tabaquismo, vacunación, comorbilidades, técnica inhalatoria y actividad física.',
    'Broncodilatadores de larga duración son la base. LAMA/LABA y el uso de corticoide inhalado dependen de síntomas, exacerbaciones, eosinófilos y fenotipo clínico según GesEPOC.',
    'Urgencias ante disnea grave, cianosis, confusión, uso intenso de musculatura accesoria, hipoxemia o fracaso del manejo inicial.',
    'El abandono del tabaco es una intervención fundamental.'
  ),
  ClinicalTopic(
    'Infección urinaria',
    'Distinguir cistitis no complicada de pielonefritis, prostatitis, infección complicada y bacteriuria asintomática.',
    'Solicitar cultivo cuando haya complicación, recurrencia, embarazo, varón, sospecha de pielonefritis o fracaso terapéutico.',
    'Elegir antibiótico según resistencias locales, alergias, embarazo, función renal y guía antimicrobiana del área. Evitar amplio espectro si hay alternativa adecuada.',
    'Urgencias si sepsis, vómitos persistentes, dolor intenso, obstrucción sospechada o incapacidad para tratamiento oral.',
    'No tratar bacteriuria asintomática de rutina salvo indicaciones específicas.'
  ),
  ClinicalTopic(
    'Neumonía adquirida en la comunidad',
    'Sospechar con fiebre, tos, expectoración, disnea, dolor pleurítico o focalidad auscultatoria. Confirmar con imagen cuando proceda.',
    'Valorar saturación, frecuencia respiratoria, PA, estado mental, comorbilidades y posibilidad de manejo domiciliario.',
    'El antibiótico depende de edad, comorbilidad, gravedad, alergias y resistencias locales. Seguir guía antimicrobiana del área y revisar respuesta clínica.',
    'Urgencias si hipoxemia, hipotensión, confusión, taquipnea marcada, sepsis, incapacidad para vía oral o deterioro rápido.',
    'Evitar antibióticos en infecciones virales sin datos de neumonía bacteriana.'
  ),
  ClinicalTopic(
    'Enfermedad renal crónica',
    'Definir por alteraciones estructurales o funcionales persistentes, incluyendo filtrado reducido y/o albuminuria.',
    'Controlar PA, diabetes, albuminuria, potasio, función renal y medicación nefrotóxica. Ajustar dosis al filtrado.',
    'IECA/ARA-II son especialmente útiles en albuminuria cuando están indicados. Los iSGLT2 aportan beneficio renal y cardiovascular en grupos amplios de pacientes con ERC según indicación.',
    'Derivar según progresión rápida, FG muy reducido, albuminuria marcada, hematuria persistente, alteraciones electrolíticas complejas o etiología incierta.',
    'Tras iniciar o intensificar bloqueo del sistema renina-angiotensina, controlar creatinina y potasio.'
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget module(BuildContext c, IconData i, String t, String s, Widget p) => Card(
    margin: const EdgeInsets.only(bottom: 14),
    child: ListTile(
      contentPadding: const EdgeInsets.all(18),
      leading: CircleAvatar(radius: 26, child: Icon(i)),
      title: Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(s),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => p)),
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('URAPMIR'), centerTitle: true),
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('Estudio clínico y preparación MIR', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        const Text('Versión 1.1 · Atención Primaria ampliada'),
        const SizedBox(height: 18),
        module(context, Icons.quiz_outlined, 'EXAMEN MIR', 'Módulo en expansión', const PlaceholderPage()),
        module(context, Icons.local_hospital_outlined, 'ATENCIÓN PRIMARIA', '10 fichas clínicas desarrolladas', const PrimaryCarePage()),
        module(context, Icons.emergency_outlined, 'URGENCIAS MÉDICAS', 'SCA · Ictus · Sepsis · Politrauma', const EmergencyPage()),
        const Card(child: Padding(
          padding: EdgeInsets.all(14),
          child: Text('Uso educativo. Verifica siempre dosis, presentaciones, contraindicaciones, ficha técnica y protocolos locales antes de prescribir o actuar.'),
        )),
      ],
    ),
  );
}

class PrimaryCarePage extends StatefulWidget {
  const PrimaryCarePage({super.key});
  @override
  State<PrimaryCarePage> createState() => _PrimaryCarePageState();
}

class _PrimaryCarePageState extends State<PrimaryCarePage> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final f = topics.where((x) => x.title.toLowerCase().contains(query.toLowerCase())).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Atención Primaria')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(14),
          child: TextField(
            onChanged: (v) => setState(() => query = v),
            decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Buscar tema', border: OutlineInputBorder()),
          ),
        ),
        Expanded(child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(14,0,14,14),
          itemCount: f.length,
          itemBuilder: (_, i) => Card(child: ListTile(
            leading: const Icon(Icons.medical_information_outlined),
            title: Text(f[i].title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ClinicalDetailPage(f[i]))),
          )),
        )),
      ]),
    );
  }
}

class ClinicalDetailPage extends StatelessWidget {
  final ClinicalTopic topic;
  const ClinicalDetailPage(this.topic, {super.key});

  Widget section(String t, String v) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(v, style: const TextStyle(fontSize: 16, height: 1.45)),
      ]),
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(topic.title)),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        section('Diagnóstico / claves', topic.diagnosis),
        section('Conducta en Atención Primaria', topic.conduct),
        section('Tratamiento', topic.treatment),
        section('Cuándo derivar / urgencias', topic.referral),
        section('Puntos de seguridad', topic.safety),
        const Card(child: Padding(
          padding: EdgeInsets.all(14),
          child: Text('Fuentes base: semFYC, Guía Terapéutica semFYC 9.ª ed. 2025, GEMA para asma, GesEPOC para EPOC y guías clínicas vigentes.'),
        )),
      ],
    ),
  );
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});
  static const items = [
    ['Síndrome coronario agudo', 'ABCDE, ECG precoz, identificar inestabilidad y activar traslado/reperfusión según red local.'],
    ['Ictus', 'ABCDE, glucemia, hora de inicio/última vez visto bien y activación precoz del código ictus.'],
    ['Sepsis', 'ABCDE, constantes seriadas, foco, perfusión y traslado urgente si deterioro o disfunción orgánica.'],
    ['Paciente politraumatizado', 'ABCDE, protección cervical, control de hemorragia y prevención de hipotermia.'],
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Urgencias Médicas')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: items.map((e) => Card(child: ListTile(
        leading: const Icon(Icons.warning_amber_rounded),
        title: Text(e[0], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(e[1]),
      ))).toList(),
    ),
  );
}

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Examen MIR')),
    body: const Center(child: Padding(
      padding: EdgeInsets.all(24),
      child: Text('Este módulo seguirá ampliándose en las próximas versiones.', textAlign: TextAlign.center),
    )),
  );
}
