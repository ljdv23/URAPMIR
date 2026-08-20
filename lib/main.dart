import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const UrapMirApp());
}

class UrapMirApp extends StatelessWidget {
  const UrapMirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'URAPMIR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6E69)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F8FA),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URAPMIR'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Estudio clínico y preparación MIR',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Versión funcional 1.0 · navegación, preguntas demo y módulos clínicos.',
          ),
          const SizedBox(height: 20),
          _HomeCard(
            icon: Icons.quiz_outlined,
            title: 'EXAMEN MIR',
            subtitle: 'Preguntas aleatorias, simulacro y especialidades',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MirHomePage()),
            ),
          ),
          _HomeCard(
            icon: Icons.local_hospital_outlined,
            title: 'ATENCIÓN PRIMARIA',
            subtitle: '30 temas prioritarios para consulta y urgencias AP',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PrimaryCarePage()),
            ),
          ),
          _HomeCard(
            icon: Icons.emergency_outlined,
            title: 'URGENCIAS MÉDICAS',
            subtitle: 'SCA · Ictus · Sepsis · Politraumatizado',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EmergencyPage()),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.info_outline),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Esta versión demuestra el funcionamiento de la app. '
                      'El banco MIR es de ejemplo y el contenido clínico detallado '
                      'se irá incorporando únicamente tras validar las fuentes.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _HomeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                child: Icon(icon, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------- MIR --------------------

class MirQuestion {
  final String specialty;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const MirQuestion({
    required this.specialty,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

const demoQuestions = <MirQuestion>[
  MirQuestion(
    specialty: 'Cardiología',
    question: 'Paciente con dolor torácico opresivo y elevación persistente del ST. ¿Cuál es la prioridad inicial?',
    options: [
      'Esperar marcadores seriados antes de actuar',
      'Activar estrategia de reperfusión urgente',
      'Solicitar prueba de esfuerzo',
      'Dar el alta si el dolor cede',
    ],
    correctIndex: 1,
    explanation: 'La elevación persistente del ST con clínica compatible requiere una estrategia de reperfusión urgente.',
  ),
  MirQuestion(
    specialty: 'Neurología',
    question: 'En sospecha de ictus agudo, ¿qué dato debe conocerse cuanto antes?',
    options: [
      'La última vez que el paciente fue visto bien',
      'El grupo sanguíneo',
      'El perímetro abdominal',
      'La densitometría previa',
    ],
    correctIndex: 0,
    explanation: 'La hora de inicio o “última vez visto bien” condiciona las opciones de reperfusión.',
  ),
  MirQuestion(
    specialty: 'Infecciosas',
    question: 'En un paciente con sospecha de sepsis, ¿qué elemento es esencial en la valoración inicial?',
    options: [
      'Buscar disfunción orgánica y foco infeccioso',
      'Esperar 24 horas antes de reevaluar',
      'Evitar constantes seriadas',
      'Priorizar solo la temperatura',
    ],
    correctIndex: 0,
    explanation: 'La sepsis implica infección con disfunción orgánica; hay que valorar gravedad y foco de forma precoz.',
  ),
  MirQuestion(
    specialty: 'Neumología',
    question: 'En una exacerbación de asma, ¿qué parámetro ayuda a objetivar gravedad si está disponible?',
    options: [
      'Flujo espiratorio máximo',
      'Colesterol LDL',
      'Índice tobillo-brazo',
      'Calcemia',
    ],
    correctIndex: 0,
    explanation: 'El PEF/flujo espiratorio máximo puede ayudar a objetivar la limitación al flujo aéreo.',
  ),
  MirQuestion(
    specialty: 'Endocrinología',
    question: 'En un paciente con diabetes y síntomas neuroglucopénicos, ¿qué debe comprobarse de inmediato?',
    options: [
      'Glucemia capilar',
      'Ácido úrico',
      'TSH',
      'Vitamina D',
    ],
    correctIndex: 0,
    explanation: 'La glucemia capilar permite confirmar rápidamente una hipoglucemia.',
  ),
  MirQuestion(
    specialty: 'Traumatología',
    question: 'En un politraumatizado, el enfoque inicial sistemático se organiza clásicamente como:',
    options: [
      'ABCDE',
      'SOAP',
      'APGAR',
      'CHA2DS2-VASc',
    ],
    correctIndex: 0,
    explanation: 'ABCDE prioriza amenazas vitales: vía aérea, respiración, circulación, neurología y exposición.',
  ),
];

class MirHomePage extends StatelessWidget {
  const MirHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final specialties = demoQuestions.map((e) => e.specialty).toSet().toList()..sort();

    return Scaffold(
      appBar: AppBar(title: const Text('Examen MIR')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _MenuTile(
            icon: Icons.shuffle,
            title: 'Preguntas aleatorias',
            subtitle: 'Modo continuo con preguntas mezcladas',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => QuizPage(
                  title: 'Preguntas aleatorias',
                  questions: List<MirQuestion>.from(demoQuestions)..shuffle(),
                ),
              ),
            ),
          ),
          _MenuTile(
            icon: Icons.timer_outlined,
            title: 'Simulacro',
            subtitle: 'Modo simulacro con el banco disponible',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => QuizPage(
                  title: 'Simulacro',
                  questions: List<MirQuestion>.from(demoQuestions)..shuffle(),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 14, bottom: 8),
            child: Text('Por especialidad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...specialties.map(
            (s) => _MenuTile(
              icon: Icons.menu_book_outlined,
              title: s,
              subtitle: '${demoQuestions.where((q) => q.specialty == s).length} pregunta(s) demo',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizPage(
                    title: s,
                    questions: demoQuestions.where((q) => q.specialty == s).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String title;
  final List<MirQuestion> questions;

  const QuizPage({
    super.key,
    required this.title,
    required this.questions,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int? selected;
  int correct = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: Text('No hay preguntas disponibles.')),
      );
    }

    if (index >= widget.questions.length) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.emoji_events_outlined, size: 64),
                    const SizedBox(height: 12),
                    const Text('Resultado',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text('$correct / ${widget.questions.length}',
                        style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 18),
                    FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Volver'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    final q = widget.questions[index];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LinearProgressIndicator(value: (index + 1) / widget.questions.length),
          const SizedBox(height: 12),
          Text('Pregunta ${index + 1} de ${widget.questions.length}',
              style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Chip(label: Text(q.specialty)),
          const SizedBox(height: 12),
          Text(q.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          for (int i = 0; i < q.options.length; i++)
            Card(
              child: RadioListTile<int>(
                value: i,
                groupValue: selected,
                onChanged: selected == null
                    ? (v) => setState(() {
                          selected = v;
                          if (v == q.correctIndex) correct++;
                        })
                    : null,
                title: Text(q.options[i]),
              ),
            ),
          if (selected != null) ...[
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selected == q.correctIndex ? 'Correcta' : 'Incorrecta',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected == q.correctIndex
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(q.explanation),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => setState(() {
                index++;
                selected = null;
              }),
              child: Text(index + 1 == widget.questions.length
                  ? 'Ver resultado'
                  : 'Siguiente'),
            ),
          ],
        ],
      ),
    );
  }
}

// -------------------- ATENCIÓN PRIMARIA --------------------

const primaryCareTopics = <String>[
  'Hipertensión arterial',
  'Diabetes mellitus tipo 2',
  'Dislipemia y prevención cardiovascular',
  'Insuficiencia cardiaca',
  'Fibrilación auricular',
  'Cardiopatía isquémica estable',
  'Asma',
  'EPOC',
  'Infecciones respiratorias',
  'Neumonía adquirida en la comunidad',
  'Infección urinaria',
  'Enfermedad renal crónica',
  'Hipotiroidismo',
  'Obesidad',
  'Anemia',
  'Dolor lumbar',
  'Cervicalgia',
  'Artrosis',
  'Osteoporosis',
  'Cefalea',
  'Mareo y vértigo',
  'Ansiedad',
  'Depresión',
  'Insomnio',
  'ERGE y dispepsia',
  'Diarrea y estreñimiento',
  'Dermatitis y eccema',
  'Anticoagulación en AP',
  'Vacunación del adulto',
  'Tabaquismo',
];

class PrimaryCarePage extends StatefulWidget {
  const PrimaryCarePage({super.key});

  @override
  State<PrimaryCarePage> createState() => _PrimaryCarePageState();
}

class _PrimaryCarePageState extends State<PrimaryCarePage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = primaryCareTopics
        .where((t) => t.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Atención Primaria')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              onChanged: (v) => setState(() => query = v),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar tema',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (_, i) {
                final topic = filtered[i];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.medical_information_outlined),
                    title: Text(topic),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TopicDetailPage(
                          title: topic,
                          body:
                              'Contenido clínico estructurado pendiente de incorporar y validar con fuentes actualizadas. '
                              'La ficha final incluirá: diagnóstico, actuación en consulta, tratamiento, dosis, duración, '
                              'efectos adversos, contraindicaciones, interacciones y criterios de derivación.',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- URGENCIAS --------------------

class EmergencyTopic {
  final String title;
  final String summary;
  final List<String> steps;

  const EmergencyTopic(this.title, this.summary, this.steps);
}

const emergencyTopics = <EmergencyTopic>[
  EmergencyTopic(
    'Síndrome coronario agudo',
    'Reconocimiento rápido del dolor torácico de posible origen isquémico y activación de la red asistencial.',
    [
      'ABCDE y constantes; monitorización si está disponible.',
      'ECG de 12 derivaciones lo antes posible.',
      'Identificar inestabilidad hemodinámica, arritmias o insuficiencia cardiaca.',
      'Si existe sospecha de SCA, coordinar traslado urgente según circuito local.',
    ],
  ),
  EmergencyTopic(
    'Ictus',
    'El tiempo es crítico: identificar déficit neurológico focal y la hora de inicio o última vez visto bien.',
    [
      'ABCDE y glucemia capilar.',
      'Registrar hora de inicio/última vez visto bien.',
      'Valorar déficit neurológico y signos de alarma.',
      'Activar código ictus/traslado urgente según protocolo local.',
    ],
  ),
  EmergencyTopic(
    'Sepsis',
    'Sospechar infección con deterioro sistémico o disfunción orgánica.',
    [
      'ABCDE, constantes y reevaluación frecuente.',
      'Buscar foco infeccioso y signos de hipoperfusión.',
      'Valorar gravedad y necesidad de soporte inmediato.',
      'Traslado urgente si existe inestabilidad o sospecha de sepsis grave.',
    ],
  ),
  EmergencyTopic(
    'Paciente politraumatizado',
    'Priorizar lesiones que amenazan la vida mediante un enfoque ABCDE.',
    [
      'A: vía aérea con protección cervical.',
      'B: respiración y lesiones torácicas vitales.',
      'C: circulación y control de hemorragias.',
      'D/E: valoración neurológica, exposición y prevención de hipotermia.',
    ],
  ),
];

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Urgencias Médicas')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: emergencyTopics.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) {
          final t = emergencyTopics[i];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.warning_amber_rounded),
              title: Text(t.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(t.summary),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EmergencyDetailPage(topic: t),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EmergencyDetailPage extends StatelessWidget {
  final EmergencyTopic topic;
  const EmergencyDetailPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(topic.title)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(topic.summary,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 18),
          const Text('Actuación inicial',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          for (int i = 0; i < topic.steps.length; i++)
            Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text(topic.steps[i]),
              ),
            ),
          const SizedBox(height: 14),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'Material educativo. En una urgencia real deben seguirse los protocolos '
                'del centro, la red de emergencias y las guías clínicas vigentes.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- COMUNES --------------------

class TopicDetailPage extends StatelessWidget {
  final String title;
  final String body;

  const TopicDetailPage({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(body, style: const TextStyle(fontSize: 17, height: 1.5)),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
