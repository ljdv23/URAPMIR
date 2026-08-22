import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

void main() => runApp(const UrapMirApp());

class DrugOption {
  final String generic, brand, presentation, dose, duration, contraindications, interactions;
  const DrugOption({
    required this.generic,
    required this.brand,
    required this.presentation,
    required this.dose,
    required this.duration,
    required this.contraindications,
    required this.interactions,
  });
}

class ClinicalTopic {
  final String title, definition, classification, causes, symptoms, diagnosis, generalMeasures, referral;
  final List<DrugOption> treatments;
  const ClinicalTopic({
    required this.title,
    required this.definition,
    required this.classification,
    required this.causes,
    required this.symptoms,
    required this.diagnosis,
    required this.generalMeasures,
    required this.referral,
    required this.treatments,
  });
}

const topics = <ClinicalTopic>[
  ClinicalTopic(
    title: 'Hipertensión arterial',
    definition: 'Elevación persistente de la presión arterial que incrementa el riesgo de ictus, cardiopatía, insuficiencia renal y mortalidad cardiovascular.',
    classification: 'Confirmar con medidas repetidas y, siempre que sea posible, AMPA/MAPA. Diferenciar HTA sostenida, bata blanca y enmascarada.',
    causes: 'HTA esencial en la mayoría. Buscar causas secundarias si debut precoz, resistente, hipopotasemia, deterioro renal o clínica sugerente.',
    symptoms: 'Suele ser asintomática. Una PA muy elevada con déficit neurológico, dolor torácico, disnea, edema pulmonar o lesión renal sugiere emergencia.',
    diagnosis: 'Técnica correcta de PA, riesgo cardiovascular, ECG, creatinina/FG, sodio/potasio, glucemia/HbA1c, perfil lipídico y albuminuria según contexto.',
    generalMeasures: 'Pérdida ponderal si procede, dieta saludable, reducción de sal, ejercicio regular, moderar alcohol, dejar tabaco y revisar AINE/descongestionantes.',
    referral: 'Urgente si daño agudo de órgano diana. Valorar derivación si HTA resistente, secundaria probable, embarazo o enfermedad renal significativa.',
    treatments: [
      DrugOption(
        generic: 'Ramipril', brand: 'Acovil',
        presentation: '2,5 mg · 5 mg · 10 mg comprimidos',
        dose: 'Inicio habitual 2,5 mg cada 24 h; titular cada 2–4 semanas según PA y tolerancia. Máx. 10 mg/día.',
        duration: 'Crónico; reevaluar PA, creatinina y potasio tras inicio/titulación.',
        contraindications: 'Embarazo, antecedente de angioedema por IECA, estenosis bilateral significativa de arterias renales, hipotensión/inestabilidad.',
        interactions: 'No combinar con sacubitrilo/valsartán; precaución con ARA-II/aliskireno, diuréticos ahorradores de K+, suplementos de K+ y AINE.',
      ),
      DrugOption(
        generic: 'Amlodipino', brand: 'Norvas',
        presentation: '5 mg · 10 mg comprimidos',
        dose: '5 mg cada 24 h; puede aumentarse a 10 mg cada 24 h según respuesta.',
        duration: 'Crónico.',
        contraindications: 'Hipotensión grave, shock; precaución en insuficiencia cardiaca avanzada y hepatopatía.',
        interactions: 'Inhibidores/inductores CYP3A4 pueden modificar exposición; vigilar con simvastatina a dosis altas.',
      ),
      DrugOption(
        generic: 'Indapamida', brand: 'Tertensif Retard',
        presentation: '1,5 mg comprimido de liberación prolongada',
        dose: '1,5 mg cada 24 h, preferentemente por la mañana.',
        duration: 'Crónico; monitorizar Na+, K+, creatinina y ácido úrico.',
        contraindications: 'Insuficiencia renal grave, encefalopatía hepática/hepatopatía grave, hipopotasemia.',
        interactions: 'Litio, fármacos que prolongan QT, otros diuréticos/hipotensores; AINE pueden reducir efecto y empeorar función renal.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Diabetes mellitus tipo 2',
    definition: 'Trastorno metabólico crónico caracterizado por hiperglucemia por resistencia a insulina y deterioro progresivo de la secreción.',
    classification: 'Individualizar objetivo de HbA1c según edad, comorbilidad, fragilidad, riesgo de hipoglucemia y expectativa de vida.',
    causes: 'Predisposición genética, exceso ponderal, sedentarismo y factores metabólicos. Buscar causas secundarias si presentación atípica.',
    symptoms: 'Puede ser asintomática. Poliuria, polidipsia, pérdida de peso, infecciones recurrentes o visión borrosa orientan a hiperglucemia.',
    diagnosis: 'HbA1c y/o glucemia según criterios diagnósticos. Valorar PA, peso, FG, albuminuria, pies, retina y riesgo cardiovascular.',
    generalMeasures: 'Plan nutricional, ejercicio, reducción de peso si procede, educación diabetológica, abandono de tabaco y control de PA/lípidos.',
    referral: 'Urgencias ante cetoacidosis, estado hiperosmolar, hipoglucemia grave o deshidratación/deterioro importante.',
    treatments: [
      DrugOption(
        generic: 'Metformina', brand: 'Dianben',
        presentation: '850 mg comprimidos',
        dose: 'Inicio habitual 500–850 mg 1–2 veces/día con comidas; titular cada 10–15 días. Máx. habitual hasta 3 g/día según ficha técnica y función renal.',
        duration: 'Crónico mientras sea eficaz, tolerada y renalmente apropiada.',
        contraindications: 'Acidosis metabólica, insuficiencia renal grave; suspender temporalmente en situaciones de hipoxia/deshidratación grave o procedimientos con contraste según protocolo.',
        interactions: 'Alcohol excesivo aumenta riesgo de acidosis láctica; precaución con fármacos que deterioren función renal.',
      ),
      DrugOption(
        generic: 'Empagliflozina', brand: 'Jardiance',
        presentation: '10 mg · 25 mg comprimidos',
        dose: '10 mg cada 24 h; en DM2 puede aumentarse a 25 mg si procede y función renal lo permite.',
        duration: 'Crónico.',
        contraindications: 'Hipersensibilidad; no usar para tratar cetoacidosis. Valorar función renal y estado de volumen.',
        interactions: 'Diuréticos pueden aumentar depleción de volumen; con insulina/sulfonilureas puede requerir ajuste para evitar hipoglucemia.',
      ),
      DrugOption(
        generic: 'Semaglutida', brand: 'Ozempic',
        presentation: 'Pluma precargada subcutánea',
        dose: '0,25 mg una vez/semana 4 semanas; después 0,5 mg/semana. Escalado posterior según respuesta, tolerancia y ficha técnica.',
        duration: 'Crónico mientras exista beneficio y tolerancia.',
        contraindications: 'Hipersensibilidad; precaución en antecedentes de pancreatitis y enfermedad gastrointestinal grave.',
        interactions: 'Retrasa vaciamiento gástrico; vigilar fármacos orales de margen estrecho. Con insulina/sulfonilureas aumenta riesgo de hipoglucemia.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Dislipemia y prevención cardiovascular',
    definition: 'Alteración de colesterol y/o triglicéridos asociada a riesgo aterosclerótico. El objetivo de LDL depende del riesgo cardiovascular global.',
    classification: 'Prevención primaria vs secundaria; estratificar riesgo y buscar hipercolesterolemia familiar cuando proceda.',
    causes: 'Genética, dieta, obesidad, diabetes, hipotiroidismo, nefropatía, hepatopatía y fármacos.',
    symptoms: 'Generalmente asintomática; la enfermedad aterosclerótica puede debutar como SCA, ictus o arteriopatía periférica.',
    diagnosis: 'Perfil lipídico, riesgo cardiovascular, función hepática según contexto y búsqueda de causas secundarias.',
    generalMeasures: 'Dieta mediterránea, ejercicio, peso saludable, abandono de tabaco y control de diabetes/PA.',
    referral: 'Valorar derivación ante sospecha de hipercolesterolemia familiar, intolerancia compleja o necesidad de terapias avanzadas.',
    treatments: [
      DrugOption(
        generic: 'Atorvastatina', brand: 'Cardyl',
        presentation: '10 · 20 · 40 · 80 mg comprimidos',
        dose: 'Inicio habitual 10–20 mg cada 24 h; alta intensidad 40–80 mg/día según riesgo y objetivo.',
        duration: 'Crónico; revisar respuesta tras 4–12 semanas y después periódicamente.',
        contraindications: 'Enfermedad hepática activa, embarazo/lactancia, hipersensibilidad.',
        interactions: 'Inhibidores potentes CYP3A4, ciclosporina, algunos antivirales y macrólidos aumentan riesgo de miopatía; revisar ficha técnica.',
      ),
      DrugOption(
        generic: 'Ezetimiba', brand: 'Ezetrol',
        presentation: '10 mg comprimidos',
        dose: '10 mg cada 24 h, sola o añadida a estatina.',
        duration: 'Crónico.',
        contraindications: 'Hipersensibilidad; si se asocia a estatina, aplicar también contraindicaciones hepáticas de la estatina.',
        interactions: 'Ciclosporina; resinas secuestradoras de ácidos biliares deben espaciarse; vigilar anticoagulantes cumarínicos.',
      ),
      DrugOption(
        generic: 'Atorvastatina + ezetimiba', brand: 'Cardyl Plus',
        presentation: '10/20 · 10/40 · 10/80 mg comprimidos',
        dose: '1 comprimido cada 24 h según intensidad requerida y tolerancia.',
        duration: 'Crónico.',
        contraindications: 'Embarazo/lactancia, enfermedad hepática activa y contraindicaciones de atorvastatina.',
        interactions: 'Las de atorvastatina (CYP3A4) más las de ezetimiba; revisar antivirales, macrólidos, ciclosporina y fibratos.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Insuficiencia cardiaca',
    definition: 'Síndrome clínico por alteración estructural/funcional cardiaca con síntomas y signos de congestión o bajo gasto.',
    classification: 'Diferenciar FE reducida, ligeramente reducida y preservada; distinguir estable de descompensada.',
    causes: 'Cardiopatía isquémica, HTA, valvulopatías, miocardiopatías, arritmias y causas tóxicas/metabólicas.',
    symptoms: 'Disnea, ortopnea, edemas, fatiga, aumento de peso, crepitantes e ingurgitación yugular.',
    diagnosis: 'ECG, analítica, péptidos natriuréticos, radiografía según contexto y ecocardiografía para caracterizar fenotipo.',
    generalMeasures: 'Control de peso, PA y frecuencia; educación sobre signos de congestión, adherencia, ejercicio adaptado y evitar AINE.',
    referral: 'Urgencias si edema agudo de pulmón, hipoxemia, hipotensión, síncope, dolor torácico, hipoperfusión o arritmia inestable.',
    treatments: [
      DrugOption(
        generic: 'Sacubitrilo/valsartán', brand: 'Entresto',
        presentation: '24/26 · 49/51 · 97/103 mg comprimidos',
        dose: 'Habitual 49/51 mg cada 12 h; 24/26 mg cada 12 h si dosis bajas previas, PAS 100–110 o determinados perfiles. Titular cada 2–4 semanas hacia 97/103 mg cada 12 h si tolera.',
        duration: 'Crónico en IC-FEr sintomática cuando esté indicado.',
        contraindications: 'Uso simultáneo con IECA, angioedema previo relacionado, embarazo, hepatopatía grave; no iniciar con PAS <100 o K+ >5,4 mmol/L.',
        interactions: 'Debe separarse al menos 36 h de un IECA; evitar aliskireno en diabetes/FG reducido; vigilar K+, AINE y diuréticos.',
      ),
      DrugOption(
        generic: 'Bisoprolol', brand: 'Emconcor',
        presentation: '1,25 · 2,5 · 5 · 10 mg comprimidos',
        dose: 'En IC estable: inicio 1,25 mg cada 24 h y titulación gradual hasta 10 mg/día si tolera.',
        duration: 'Crónico.',
        contraindications: 'IC aguda descompensada con necesidad de inotrópicos, shock cardiogénico, BAV avanzado sin marcapasos, bradicardia sintomática.',
        interactions: 'Verapamilo/diltiazem y otros cronotropos negativos aumentan riesgo de bradicardia/bloqueo; precaución con antiarrítmicos.',
      ),
      DrugOption(
        generic: 'Dapagliflozina', brand: 'Forxiga',
        presentation: '10 mg comprimidos',
        dose: '10 mg cada 24 h.',
        duration: 'Crónico en IC cuando esté indicada.',
        contraindications: 'Hipersensibilidad; valorar función renal, volemia y riesgo de cetoacidosis.',
        interactions: 'Diuréticos pueden aumentar depleción de volumen; con insulina/sulfonilureas puede aumentar hipoglucemia en pacientes diabéticos.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Fibrilación auricular',
    definition: 'Arritmia supraventricular con activación auricular desorganizada y ritmo ventricular irregular.',
    classification: 'Primer diagnóstico, paroxística, persistente o permanente. Valorar síntomas, frecuencia, riesgo tromboembólico y hemorrágico.',
    causes: 'HTA, cardiopatía estructural, edad, hipertiroidismo, alcohol, apnea del sueño, infecciones y alteraciones electrolíticas.',
    symptoms: 'Palpitaciones, disnea, cansancio, dolor torácico, mareo o síncope; puede ser asintomática.',
    diagnosis: 'Confirmar con ECG. Analítica con función renal/electrolitos y TSH según contexto; valorar ecocardiograma.',
    generalMeasures: 'Control de factores precipitantes, peso, PA, alcohol y apnea del sueño. Decidir control de frecuencia/ritmo y anticoagulación individualizada.',
    referral: 'Urgencias si inestabilidad hemodinámica, isquemia, edema pulmonar, síncope o frecuencia muy rápida con deterioro.',
    treatments: [
      DrugOption(
        generic: 'Apixabán', brand: 'Eliquis',
        presentation: '2,5 mg · 5 mg comprimidos',
        dose: 'FA no valvular: 5 mg cada 12 h. Reducir a 2,5 mg cada 12 h cuando se cumplan criterios de reducción de dosis según ficha técnica.',
        duration: 'Crónico mientras persista indicación de prevención tromboembólica.',
        contraindications: 'Hemorragia activa clínicamente significativa, hepatopatía con coagulopatía, lesiones con alto riesgo de sangrado.',
        interactions: 'Inhibidores/inductores potentes de CYP3A4 y P-gp; AINE, antiagregantes y otros anticoagulantes aumentan riesgo hemorrágico.',
      ),
      DrugOption(
        generic: 'Rivaroxabán', brand: 'Xarelto',
        presentation: '15 mg · 20 mg comprimidos',
        dose: 'FA no valvular: 20 mg cada 24 h con comida; 15 mg cada 24 h en determinados grados de insuficiencia renal según ficha técnica.',
        duration: 'Crónico mientras persista indicación.',
        contraindications: 'Hemorragia activa significativa, hepatopatía con coagulopatía, embarazo/lactancia.',
        interactions: 'Inhibidores potentes combinados CYP3A4/P-gp, otros anticoagulantes, AINE y antiagregantes.',
      ),
      DrugOption(
        generic: 'Acenocumarol', brand: 'Sintrom',
        presentation: '1 mg · 4 mg comprimidos',
        dose: 'Dosis individualizada según INR; no existe dosis fija universal.',
        duration: 'Crónico cuando esté indicado; requiere controles de INR.',
        contraindications: 'Hemorragia activa, alto riesgo hemorrágico, embarazo salvo situaciones muy concretas.',
        interactions: 'Muy numerosas: antibióticos, antifúngicos, AINE, antiagregantes, amiodarona, antiepilépticos y cambios dietéticos con vitamina K.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Asma',
    definition: 'Enfermedad inflamatoria crónica con síntomas respiratorios variables y limitación variable del flujo aéreo.',
    classification: 'Valorar control actual, riesgo de exacerbación y escalón terapéutico. Confirmar variabilidad con espirometría cuando sea posible.',
    causes: 'Predisposición, alérgenos, infecciones virales, humo, ejercicio, exposición laboral y fármacos como AINE/betabloqueantes en susceptibles.',
    symptoms: 'Sibilancias, disnea, opresión torácica y tos variable, a menudo nocturna o con ejercicio.',
    diagnosis: 'Espirometría con prueba broncodilatadora, PEF/variabilidad cuando proceda y evaluación de técnica inhalatoria/adherencia.',
    generalMeasures: 'Evitar tabaco y desencadenantes, vacunas indicadas, revisar técnica del inhalador y plan de acción escrito.',
    referral: 'Urgencias ante dificultad respiratoria intensa, agotamiento, silencio auscultatorio, alteración de conciencia, hipoxemia o mala respuesta.',
    treatments: [
      DrugOption(
        generic: 'Budesonida/formoterol', brand: 'Symbicort',
        presentation: 'Distintas dosis según dispositivo; p. ej. 160/4,5 mcg por inhalación',
        dose: 'Según escalón GEMA y dispositivo. Una pauta frecuente de mantenimiento es 1–2 inhalaciones cada 12 h; en estrategias MART, el mismo inhalador puede usarse de rescate según prescripción.',
        duration: 'Controlador crónico; reevaluar control y técnica periódicamente.',
        contraindications: 'Hipersensibilidad; precaución en arritmias, hipertiroidismo, hipopotasemia y tuberculosis activa/no tratada.',
        interactions: 'Betabloqueantes pueden antagonizar formoterol; inhibidores potentes CYP3A4 aumentan exposición a budesonida.',
      ),
      DrugOption(
        generic: 'Beclometasona/formoterol', brand: 'Foster',
        presentation: '100/6 mcg por inhalación (según dispositivo)',
        dose: 'Pauta según escalón y dispositivo; frecuentemente 1–2 inhalaciones cada 12 h. Algunas presentaciones permiten MART según ficha técnica.',
        duration: 'Crónico; ajustar a mínimo escalón eficaz.',
        contraindications: 'Hipersensibilidad; precaución en arritmias, QT prolongado, hipopotasemia y diabetes.',
        interactions: 'Betabloqueantes, fármacos que prolongan QT e inhibidores potentes CYP3A4.',
      ),
      DrugOption(
        generic: 'Fluticasona furoato/vilanterol', brand: 'Relvar Ellipta',
        presentation: '92/22 mcg · 184/22 mcg inhalación',
        dose: '1 inhalación cada 24 h; dosis según gravedad y ficha técnica.',
        duration: 'Crónico.',
        contraindications: 'Hipersensibilidad; no sirve como tratamiento de rescate agudo.',
        interactions: 'Betabloqueantes; inhibidores potentes CYP3A4 pueden elevar exposición sistémica.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'EPOC',
    definition: 'Enfermedad respiratoria crónica con síntomas persistentes y obstrucción al flujo aéreo no completamente reversible.',
    classification: 'Confirmar con espirometría posbroncodilatador. Valorar disnea, exacerbaciones, eosinófilos y fenotipo según GesEPOC.',
    causes: 'Tabaco es la principal causa; también biomasa, exposición laboral y déficit de alfa-1-antitripsina.',
    symptoms: 'Disnea progresiva, tos crónica, expectoración y exacerbaciones.',
    diagnosis: 'Espirometría, saturación, tabaquismo/exposición, exacerbaciones, comorbilidades y técnica inhalatoria.',
    generalMeasures: 'Abandono tabaco, vacunas, actividad física/rehabilitación, nutrición y educación inhalatoria.',
    referral: 'Urgencias si disnea grave, cianosis, confusión, uso intenso de musculatura accesoria, hipoxemia o fracaso del manejo inicial.',
    treatments: [
      DrugOption(
        generic: 'Umeclidinio/vilanterol', brand: 'Anoro Ellipta',
        presentation: '55/22 mcg polvo para inhalación',
        dose: '1 inhalación cada 24 h.',
        duration: 'Mantenimiento crónico.',
        contraindications: 'Hipersensibilidad; no indicado para asma ni rescate agudo.',
        interactions: 'Betabloqueantes pueden reducir efecto LABA; inhibidores potentes CYP3A4 pueden aumentar exposición a vilanterol.',
      ),
      DrugOption(
        generic: 'Tiotropio', brand: 'Spiriva Respimat',
        presentation: '2,5 mcg por pulsación; una dosis = 2 pulsaciones',
        dose: '2 pulsaciones una vez al día (5 mcg/día) para mantenimiento.',
        duration: 'Crónico.',
        contraindications: 'Hipersensibilidad a tiotropio/derivados atropínicos; precaución en glaucoma de ángulo estrecho y retención urinaria.',
        interactions: 'Evitar asociación crónica con otros anticolinérgicos inhalados salvo indicación específica.',
      ),
      DrugOption(
        generic: 'Fluticasona furoato/umeclidinio/vilanterol', brand: 'Trelegy Ellipta',
        presentation: 'Triple terapia inhalada, una dosis diaria',
        dose: '1 inhalación cada 24 h según presentación autorizada.',
        duration: 'Crónico en pacientes seleccionados con indicación de triple terapia.',
        contraindications: 'Hipersensibilidad; no para rescate agudo. Evaluar riesgo de neumonía por corticoide inhalado.',
        interactions: 'Betabloqueantes e inhibidores potentes CYP3A4; precaución con otros anticolinérgicos.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Infección urinaria',
    definition: 'Infección del tracto urinario; distinguir cistitis no complicada, pielonefritis, prostatitis e infección complicada.',
    classification: 'No complicada vs complicada; baja vs alta; recurrente. El tratamiento depende de sexo, embarazo, función renal y resistencias locales.',
    causes: 'Predominan enterobacterias, especialmente E. coli.',
    symptoms: 'Cistitis: disuria, polaquiuria, urgencia sin fiebre alta. Pielonefritis: fiebre, dolor lumbar, náuseas/vómitos y afectación sistémica.',
    diagnosis: 'Tira/orina según contexto. Urocultivo en embarazo, varón, recurrencia, pielonefritis, complicación o fracaso terapéutico.',
    generalMeasures: 'Hidratación según tolerancia, analgesia si procede y revisar factores predisponentes.',
    referral: 'Urgencias si sepsis, vómitos persistentes, obstrucción, embarazo con afectación sistémica o incapacidad para vía oral.',
    treatments: [
      DrugOption(
        generic: 'Fosfomicina trometamol', brand: 'Monurol',
        presentation: '3 g granulado para solución oral',
        dose: 'Cistitis aguda no complicada en mujer adulta: 3 g dosis única, según indicación y guía local.',
        duration: 'Dosis única.',
        contraindications: 'Hipersensibilidad; revisar función renal y ficha técnica.',
        interactions: 'Metoclopramida puede reducir concentraciones urinarias; separar de comidas según ficha técnica.',
      ),
      DrugOption(
        generic: 'Nitrofurantoína', brand: 'Furantoína',
        presentation: 'Cápsulas/comprimidos según presentación comercial',
        dose: 'Pauta habitual en cistitis no complicada: 100 mg cada 12 h durante 5 días, ajustada a formulación y guía local.',
        duration: 'Habitualmente 5 días en cistitis no complicada.',
        contraindications: 'Insuficiencia renal significativa, déficit de G6PD, determinadas etapas del embarazo; no indicada para pielonefritis.',
        interactions: 'Antiácidos con magnesio pueden reducir absorción; quinolonas pueden antagonizar actividad antibacteriana.',
      ),
      DrugOption(
        generic: 'Amoxicilina/ácido clavulánico', brand: 'Augmentine',
        presentation: '875/125 mg comprimidos',
        dose: '875/125 mg cada 8–12 h según infección, función renal y guía local; usar solo cuando sensibilidad/indicación lo apoye.',
        duration: 'Según localización y gravedad; típicamente varios días, individualizar.',
        contraindications: 'Alergia a betalactámicos; antecedente de ictericia/disfunción hepática por amoxicilina-clavulánico.',
        interactions: 'Anticoagulantes orales, metotrexato, alopurinol; probenecid modifica eliminación de amoxicilina.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Neumonía adquirida en la comunidad',
    definition: 'Infección aguda del parénquima pulmonar adquirida fuera del hospital.',
    classification: 'Valorar gravedad, comorbilidad, saturación, PA, frecuencia respiratoria y capacidad de tratamiento domiciliario.',
    causes: 'S. pneumoniae y otros patógenos bacterianos/atípicos; virus respiratorios también son frecuentes.',
    symptoms: 'Fiebre, tos, expectoración, disnea, dolor pleurítico y focalidad auscultatoria.',
    diagnosis: 'Clínica más imagen cuando esté indicada y disponible. Considerar analítica/microbiología según gravedad.',
    generalMeasures: 'Hidratación, antitérmicos/analgesia si procede, control de saturación y reevaluación en 48–72 h.',
    referral: 'Urgencias si hipoxemia, hipotensión, confusión, taquipnea marcada, sepsis, deterioro rápido o imposibilidad de vía oral.',
    treatments: [
      DrugOption(
        generic: 'Amoxicilina', brand: 'Clamoxyl',
        presentation: '500 mg · 1 g comprimidos/sobres según presentación',
        dose: 'En NAC ambulatoria seleccionada: 1 g cada 8 h es una pauta frecuente; adaptar a guía local y función renal.',
        duration: 'Habitualmente 5–7 días si buena evolución, según guía y gravedad.',
        contraindications: 'Alergia a penicilinas/betalactámicos.',
        interactions: 'Metotrexato, anticoagulantes orales, alopurinol; probenecid aumenta niveles.',
      ),
      DrugOption(
        generic: 'Amoxicilina/ácido clavulánico', brand: 'Augmentine',
        presentation: '875/125 mg comprimidos',
        dose: '875/125 mg cada 8 h en determinadas NAC con comorbilidad/riesgo, según guía local.',
        duration: 'Habitualmente 5–7 días, individualizar por evolución.',
        contraindications: 'Alergia a betalactámicos; hepatotoxicidad previa por esta combinación.',
        interactions: 'Anticoagulantes orales, metotrexato, alopurinol, probenecid.',
      ),
      DrugOption(
        generic: 'Levofloxacino', brand: 'Tavanic',
        presentation: '500 mg comprimidos',
        dose: '500 mg cada 24 h en situaciones seleccionadas, especialmente alergias o indicaciones específicas; ajustar a FG.',
        duration: 'Habitualmente 5–7 días según gravedad/guía.',
        contraindications: 'Embarazo/lactancia, menores, antecedentes de lesión tendinosa por quinolonas; precaución en QT y aneurisma/aortopatía.',
        interactions: 'Antiácidos/hierro/calcio reducen absorción; fármacos que prolongan QT, corticoides (tendón), anticoagulantes.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Enfermedad renal crónica',
    definition: 'Alteración estructural o funcional renal persistente ≥3 meses, definida por FG reducido y/o marcadores de daño como albuminuria.',
    classification: 'Clasificar por categoría de FG y albuminuria; valorar progresión y riesgo cardiovascular.',
    causes: 'Diabetes, HTA, enfermedad vascular, glomerulopatías, enfermedad tubulointersticial y causas hereditarias.',
    symptoms: 'Suele ser asintomática hasta estadios avanzados. Puede haber edema, HTA, anemia, prurito o síntomas urémicos.',
    diagnosis: 'Creatinina/FG, cociente albúmina/creatinina, sedimento, PA, electrolitos y ecografía si procede.',
    generalMeasures: 'Control de PA y diabetes, evitar nefrotóxicos/AINE, ajustar dosis al FG, controlar sal y riesgo cardiovascular.',
    referral: 'Derivar según FG muy reducido, progresión rápida, albuminuria marcada, hematuria persistente, alteraciones electrolíticas o etiología incierta.',
    treatments: [
      DrugOption(
        generic: 'Ramipril', brand: 'Acovil',
        presentation: '2,5 · 5 · 10 mg comprimidos',
        dose: 'En albuminuria/HTA: iniciar a dosis baja y titular según PA, función renal y potasio.',
        duration: 'Crónico si tolerado e indicado.',
        contraindications: 'Angioedema previo por IECA, embarazo, estenosis bilateral significativa de arterias renales, hipotensión.',
        interactions: 'Sacubitrilo/valsartán, aliskireno/ARA-II, suplementos K+, espironolactona y AINE aumentan riesgos específicos.',
      ),
      DrugOption(
        generic: 'Dapagliflozina', brand: 'Forxiga',
        presentation: '10 mg comprimidos',
        dose: '10 mg cada 24 h cuando esté indicada por FG/albuminuria y ficha técnica.',
        duration: 'Crónico.',
        contraindications: 'Hipersensibilidad; valorar riesgo de cetoacidosis y estado de volumen.',
        interactions: 'Diuréticos pueden aumentar depleción de volumen; hipoglucemiantes pueden requerir ajuste si hay diabetes.',
      ),
      DrugOption(
        generic: 'Empagliflozina', brand: 'Jardiance',
        presentation: '10 mg comprimidos',
        dose: '10 mg cada 24 h cuando esté indicada para protección cardiorrenal.',
        duration: 'Crónico.',
        contraindications: 'Hipersensibilidad; no usar para tratar cetoacidosis.',
        interactions: 'Diuréticos y otros antihipertensivos pueden favorecer hipotensión/depleción; ajustar otros hipoglucemiantes si procede.',
      ),
    ],
  ),

  ClinicalTopic(
    title: 'Ansiedad',
    definition: 'Respuesta emocional anticipatoria que se considera patológica cuando es desproporcionada, persistente y produce malestar clínicamente significativo o deterioro funcional.',
    classification: 'Incluye trastorno de ansiedad generalizada, trastorno de pánico, agorafobia, fobias, ansiedad social y cuadros secundarios a sustancias, fármacos o enfermedad médica.',
    causes: 'Factores psicosociales, predisposición individual, comorbilidad depresiva, consumo o retirada de sustancias y causas orgánicas que deben descartarse según la presentación.',
    symptoms: 'Preocupación, miedo, irritabilidad, inquietud, insomnio, palpitaciones, disnea, temblor, sudoración, mareo, parestesias, tensión muscular y síntomas digestivos.',
    diagnosis: 'Diagnóstico clínico. Valorar duración, desencadenantes, deterioro funcional, depresión, consumo de sustancias y riesgo autolítico. Descartar causas orgánicas cuando la clínica lo sugiera.',
    generalMeasures: 'Psicoeducación, ejercicio, higiene del sueño, reducción de cafeína/alcohol, técnicas de respiración y relajación, manejo del estrés y terapia cognitivo-conductual cuando esté disponible.',
    referral: 'Urgencias ante riesgo suicida significativo, intento autolítico, psicosis, agitación grave, incapacidad para autocuidado, intoxicación/abstinencia grave o sospecha de causa orgánica grave. Salud Mental si cuadro grave, complejo o refractario.',
    treatments: [
      DrugOption(
        generic: 'Sertralina', brand: 'Besitran', presentation: '50 mg · 100 mg comprimidos',
        dose: 'Inicio práctico 25 mg/día; aumentar habitualmente a 50 mg/día y titular según respuesta y tolerancia. Rango habitual 50–200 mg/día.',
        duration: 'Mantener varios meses tras respuesta/remisión; retirada gradual.',
        contraindications: 'Uso concomitante con IMAO; precaución en trastorno bipolar, epilepsia, hiponatremia y riesgo hemorrágico.',
        interactions: 'Fármacos serotoninérgicos, anticoagulantes/antiagregantes, AINE y otros medicamentos con potencial de interacción CYP.'),
      DrugOption(
        generic: 'Escitalopram', brand: 'Cipralex', presentation: '5 mg · 10 mg · 15 mg · 20 mg comprimidos',
        dose: 'Inicio práctico 5 mg/día; habitualmente 10 mg/día. Máximo habitual 20 mg/día según indicación y ficha técnica.',
        duration: 'Mantener varios meses tras respuesta/remisión; retirada gradual.',
        contraindications: 'Uso concomitante con IMAO; precaución en QT prolongado, hiponatremia, epilepsia y trastorno bipolar.',
        interactions: 'Fármacos que prolongan QT, serotoninérgicos, anticoagulantes/antiagregantes y algunos inhibidores enzimáticos.'),
      DrugOption(
        generic: 'Lorazepam', brand: 'Orfidal', presentation: '1 mg comprimidos',
        dose: 'Uso puntual en crisis intensa seleccionada: 0,5–1 mg VO, individualizando edad, comorbilidad y tratamientos. Evitar uso rutinario o prolongado.',
        duration: 'Si se utiliza, el menor tiempo posible; generalmente no más de 2–4 semanas incluyendo retirada gradual.',
        contraindications: 'Miastenia gravis, insuficiencia respiratoria grave, SAOS grave, insuficiencia hepática grave; precaución extrema en mayores y antecedentes de dependencia.',
        interactions: 'Alcohol, opioides y otros depresores del SNC aumentan sedación y depresión respiratoria.'),
    ],
  ),
];


class UrapDatabase {
  UrapDatabase._();
  static final UrapDatabase instance = UrapDatabase._();
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    final dbPath = p.join(await getDatabasesPath(), 'urapmir.db');
    if (!await databaseExists(dbPath)) {
      try {
        final data = await rootBundle.load('assets/db/urapmir_seed.db');
        await File(dbPath).writeAsBytes(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          flush: true,
        );
      } catch (_) {}
    }
    _db = await openDatabase(dbPath, version: 1, onCreate: (db, v) => _schema(db));
    await _schema(_db!);
    return _db!;
  }

  Future<void> _schema(Database db) async {
    const sql = [
      'CREATE TABLE IF NOT EXISTS specialties(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL UNIQUE,sort_order INTEGER NOT NULL DEFAULT 0)',
      'CREATE TABLE IF NOT EXISTS topics(id INTEGER PRIMARY KEY AUTOINCREMENT,specialty_id INTEGER,name TEXT NOT NULL,slug TEXT NOT NULL UNIQUE)',
      'CREATE TABLE IF NOT EXISTS questions(id INTEGER PRIMARY KEY AUTOINCREMENT,exam_year INTEGER NOT NULL,original_number INTEGER,specialty_id INTEGER,topic_id INTEGER,stem TEXT NOT NULL,explanation TEXT,image_asset TEXT,difficulty TEXT,source_label TEXT)',
      'CREATE TABLE IF NOT EXISTS answers(id INTEGER PRIMARY KEY AUTOINCREMENT,question_id INTEGER NOT NULL,option_index INTEGER NOT NULL,answer_text TEXT NOT NULL,is_correct INTEGER NOT NULL DEFAULT 0)',
      'CREATE TABLE IF NOT EXISTS clinical_topics(id INTEGER PRIMARY KEY AUTOINCREMENT,module TEXT NOT NULL,title TEXT NOT NULL,slug TEXT NOT NULL UNIQUE,summary TEXT,content_json TEXT,source_label TEXT,updated_at TEXT)',
      'CREATE TABLE IF NOT EXISTS clinical_images(id INTEGER PRIMARY KEY AUTOINCREMENT,module TEXT NOT NULL,topic_slug TEXT,title TEXT NOT NULL,asset_path TEXT NOT NULL,caption TEXT,source_name TEXT,source_url TEXT,license TEXT,attribution TEXT)',
      'CREATE TABLE IF NOT EXISTS exam_sessions(id INTEGER PRIMARY KEY AUTOINCREMENT,mode TEXT NOT NULL,exam_year INTEGER,started_at TEXT NOT NULL,finished_at TEXT,time_limit_seconds INTEGER,score REAL,correct_count INTEGER DEFAULT 0,wrong_count INTEGER DEFAULT 0,blank_count INTEGER DEFAULT 0)',
      'CREATE TABLE IF NOT EXISTS user_answers(id INTEGER PRIMARY KEY AUTOINCREMENT,session_id INTEGER,question_id INTEGER NOT NULL,selected_option_index INTEGER,is_correct INTEGER,answered_at TEXT NOT NULL)',
      'CREATE TABLE IF NOT EXISTS favorites(id INTEGER PRIMARY KEY AUTOINCREMENT,item_type TEXT NOT NULL,item_id INTEGER NOT NULL,created_at TEXT NOT NULL,UNIQUE(item_type,item_id))',
    ];
    for (final statement in sql) { await db.execute(statement); }
    await db.execute('CREATE INDEX IF NOT EXISTS idx_questions_year ON questions(exam_year)');
    await db.execute('CREATE INDEX IF NOT EXISTS idx_questions_specialty ON questions(specialty_id)');
    await db.execute('CREATE INDEX IF NOT EXISTS idx_questions_topic ON questions(topic_id)');
    await db.execute('CREATE INDEX IF NOT EXISTS idx_answers_question ON answers(question_id)');
  }

  Future<int> questionCount({int? year}) async {
    final db = await database;
    final rows = year == null
      ? await db.rawQuery('SELECT COUNT(*) n FROM questions')
      : await db.rawQuery('SELECT COUNT(*) n FROM questions WHERE exam_year=?', [year]);
    return (rows.first['n'] as int?) ?? 0;
  }

  Future<List<Map<String,Object?>>> randomQuestions({int limit=20}) async {
    final db = await database;
    return db.rawQuery('SELECT * FROM questions ORDER BY RANDOM() LIMIT ?', [limit]);
  }

  Future<List<Map<String,Object?>>> questionsBySpecialty(int id) async {
    final db = await database;
    return db.query('questions', where:'specialty_id=?', whereArgs:[id], orderBy:'original_number');
  }

  Future<List<Map<String,Object?>>> questionsByTopic(int id) async {
    final db = await database;
    return db.query('questions', where:'topic_id=?', whereArgs:[id], orderBy:'original_number');
  }

  Future<void> saveAnswer(int questionId, int? selected, bool correct, {int? sessionId}) async {
    final db = await database;
    await db.insert('user_answers', {
      'session_id': sessionId, 'question_id': questionId,
      'selected_option_index': selected, 'is_correct': correct ? 1 : 0,
      'answered_at': DateTime.now().toIso8601String(),
    });
  }


  Future<List<Map<String,Object?>>> specialties() async {
    final db = await database;
    return db.rawQuery('SELECT s.*, COUNT(q.id) question_count FROM specialties s LEFT JOIN questions q ON q.specialty_id=s.id GROUP BY s.id ORDER BY s.sort_order,s.name');
  }

  Future<List<Map<String,Object?>>> topicsForSpecialty(int specialtyId) async {
    final db = await database;
    return db.rawQuery('SELECT t.*, COUNT(q.id) question_count FROM topics t LEFT JOIN questions q ON q.topic_id=t.id WHERE t.specialty_id=? GROUP BY t.id ORDER BY t.name',[specialtyId]);
  }

  Future<List<Map<String,Object?>>> examQuestions({int? specialtyId,int? topicId,bool random=false,int? limit}) async {
    final db = await database;
    final where=<String>['exam_year=2026'];
    final args=<Object?>[];
    if(specialtyId!=null){where.add('specialty_id=?');args.add(specialtyId);}
    if(topicId!=null){where.add('topic_id=?');args.add(topicId);}
    var sql='SELECT * FROM questions WHERE ${where.join(' AND ')} ORDER BY ${random ? 'RANDOM()' : 'original_number'}';
    if(limit!=null){sql+=' LIMIT ?';args.add(limit);}
    return db.rawQuery(sql,args);
  }

  Future<List<Map<String,Object?>>> answersForQuestion(int questionId) async {
    final db=await database;
    return db.query('answers',where:'question_id=?',whereArgs:[questionId],orderBy:'option_index');
  }

  Future<List<Map<String,Object?>>> wrongQuestions() async {
    final db = await database;
    return db.rawQuery('SELECT q.* FROM questions q JOIN user_answers u ON u.question_id=q.id WHERE u.is_correct=0 GROUP BY q.id ORDER BY MAX(u.answered_at) DESC');
  }
}

class DatabaseStatusCard extends StatelessWidget {
  const DatabaseStatusCard({super.key});
  @override
  Widget build(BuildContext context) => FutureBuilder<int>(
    future: UrapDatabase.instance.questionCount(),
    builder: (_, snap) => Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children:[
        const Icon(Icons.storage_outlined, color: Color(0xFF0C56A0)),
        const SizedBox(width:8),
        Expanded(child: Text('SQLite local activa · ${snap.data ?? 0} preguntas cargadas',
          style: const TextStyle(fontWeight: FontWeight.w600))),
      ]),
    ),
  );
}

class UrapMirApp extends StatelessWidget {
  const UrapMirApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF0C356A);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'URAPMIR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const MainModulesPage(),
    );
  }
}


class MainModulesPage extends StatelessWidget {
  const MainModulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URAPMIR · v1.9 MIR-IMG'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('Estudio clínico y preparación MIR',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Selecciona un módulo',
              style: TextStyle(fontSize: 16, color: Colors.black54)),
          const SizedBox(height: 22),
          _ModuleCard(
            icon: Icons.quiz_outlined,
            title: 'EXAMEN MIR',
            subtitle: 'Preguntas aleatorias · Simulacro 200 · Especialidades · Temas',
            color: Color(0xFF0C56A0),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const MirModulePage())),
          ),
          const SizedBox(height: 14),
          _ModuleCard(
            icon: Icons.local_hospital_outlined,
            title: 'ATENCIÓN PRIMARIA',
            subtitle: 'Temas clínicos · Algoritmos · Tratamiento · Derivación',
            color: Color(0xFF147A72),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TopicListPage())),
          ),
          const SizedBox(height: 14),
          _ModuleCard(
            icon: Icons.emergency_outlined,
            title: 'URGENCIAS MÉDICAS',
            subtitle: 'SCA · Ictus · Sepsis · Paciente politraumatizado',
            color: Color(0xFFC64A3B),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const EmergencyModulePage())),
          ),
        ],
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  const _ModuleCard({
    required this.icon, required this.title, required this.subtitle,
    required this.color, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            Container(
              width: 58, height: 58,
              decoration: BoxDecoration(
                color: color.withOpacity(0.10),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: color)),
                const SizedBox(height: 5),
                Text(subtitle),
              ],
            )),
            const Icon(Icons.chevron_right),
          ]),
        ),
      ),
    );
  }
}


class MirModulePage extends StatelessWidget {
  const MirModulePage({super.key});

  void openExam(BuildContext context,{required String title,bool random=false,int? limit,int? specialtyId,int? topicId,int? seconds}) {
    Navigator.push(context,MaterialPageRoute(builder:(_)=>MirQuizPage(
      title:title,random:random,limit:limit,specialtyId:specialtyId,topicId:topicId,timeLimitSeconds:seconds)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EXAMEN MIR · 2026')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const DatabaseStatusCard(),
          _MirMenuCard(icon:Icons.shuffle,title:'Preguntas aleatorias',subtitle:'Banco MIR 2026 mezclado',onTap:()=>openExam(context,title:'Aleatorias MIR 2026',random:true,limit:50)),
          _MirMenuCard(icon:Icons.timer_outlined,title:'Simulacro MIR 2026',subtitle:'200 preguntas · 4 h 30 min',onTap:()=>openExam(context,title:'Simulacro MIR 2026',limit:200,seconds:16200)),
          _MirMenuCard(icon:Icons.medical_information_outlined,title:'Por especialidad',subtitle:'Cardiología, Neurología, Pediatría…',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const MirSpecialtiesPage()))),
          _MirMenuCard(icon:Icons.topic_outlined,title:'Por tema',subtitle:'Elige especialidad y capítulo',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const MirSpecialtiesPage(openTopics:true)))),
          _MirMenuCard(icon:Icons.replay_circle_filled_outlined,title:'Repasar falladas',subtitle:'Repite las preguntas que hayas fallado',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const MirWrongQuestionsPage()))),
        ],
      ),
    );
  }
}

class _MirMenuCard extends StatelessWidget{
  final IconData icon; final String title,subtitle; final VoidCallback onTap;
  const _MirMenuCard({required this.icon,required this.title,required this.subtitle,required this.onTap});
  @override Widget build(BuildContext context)=>Card(child:ListTile(
    contentPadding:const EdgeInsets.symmetric(horizontal:16,vertical:8),
    leading:CircleAvatar(child:Icon(icon)),title:Text(title,style:const TextStyle(fontWeight:FontWeight.bold)),
    subtitle:Text(subtitle),trailing:const Icon(Icons.chevron_right),onTap:onTap));
}

class MirSpecialtiesPage extends StatelessWidget{
  final bool openTopics;
  const MirSpecialtiesPage({super.key,this.openTopics=false});
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:Text(openTopics?'MIR · POR TEMA':'MIR · ESPECIALIDADES')),
    body:FutureBuilder<List<Map<String,Object?>>>(
      future:UrapDatabase.instance.specialties(),
      builder:(context,snap){
        if(!snap.hasData)return const Center(child:CircularProgressIndicator());
        return ListView.separated(padding:const EdgeInsets.all(14),itemCount:snap.data!.length,separatorBuilder:(_,__)=>const SizedBox(height:8),
          itemBuilder:(context,i){final s=snap.data![i];return Card(child:ListTile(
            title:Text('${s['name']}',style:const TextStyle(fontWeight:FontWeight.bold)),
            subtitle:Text('${s['question_count']} preguntas MIR 2026'),trailing:const Icon(Icons.chevron_right),
            onTap:(){
              final id=s['id'] as int;
              if(openTopics){Navigator.push(context,MaterialPageRoute(builder:(_)=>MirTopicsPage(specialtyId:id,specialtyName:'${s['name']}')));}
              else{Navigator.push(context,MaterialPageRoute(builder:(_)=>MirQuizPage(title:'${s['name']}',specialtyId:id)));}
            }));});
      }));
}

class MirTopicsPage extends StatelessWidget{
  final int specialtyId; final String specialtyName;
  const MirTopicsPage({super.key,required this.specialtyId,required this.specialtyName});
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:Text(specialtyName)),
    body:FutureBuilder<List<Map<String,Object?>>>(
      future:UrapDatabase.instance.topicsForSpecialty(specialtyId),
      builder:(context,snap){
        if(!snap.hasData)return const Center(child:CircularProgressIndicator());
        return ListView.separated(
          padding: const EdgeInsets.all(14),
          itemCount: snap.data!.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final t = snap.data![i];
            return Card(
              child: ListTile(
                title: Text(
                  '${t['name']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${t['question_count']} preguntas'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MirQuizPage(
                      title: '${t['name']}',
                      topicId: t['id'] as int,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}


class MirQuestionImage extends StatelessWidget {
  final String assetPath;
  const MirQuestionImage({super.key, required this.assetPath});

  void _zoom(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 5.0,
                child: Center(
                  child: Image.asset(assetPath, fit: BoxFit.contain),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton.filled(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 12),
      InkWell(
        onTap: () => _zoom(context),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            color: Colors.black12,
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Padding(
                padding: EdgeInsets.all(18),
                child: Text('No se pudo cargar la imagen de esta pregunta.'),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 5),
      const Row(
        children: [
          Icon(Icons.zoom_in, size: 16, color: Colors.black54),
          SizedBox(width: 5),
          Text(
            'Imagen original MIR 2026 · toca para ampliar',
            style: TextStyle(fontSize: 11, color: Colors.black54),
          ),
        ],
      ),
    ],
  );
}

class MirQuizPage extends StatefulWidget{
  final String title; final bool random; final int? limit,specialtyId,topicId,timeLimitSeconds;
  const MirQuizPage({super.key,required this.title,this.random=false,this.limit,this.specialtyId,this.topicId,this.timeLimitSeconds});
  @override State<MirQuizPage> createState()=>_MirQuizPageState();
}

class _MirQuizPageState extends State<MirQuizPage>{
  List<Map<String,Object?>> qs=[]; List<Map<String,Object?>> answers=[];
  int index=0; int? selected; bool checked=false; int correct=0,wrong=0;
  DateTime? started;

  @override void initState(){super.initState();started=DateTime.now();load();}
  Future<void> load()async{
    qs=await UrapDatabase.instance.examQuestions(specialtyId:widget.specialtyId,topicId:widget.topicId,random:widget.random,limit:widget.limit);
    if(qs.isNotEmpty)answers=await UrapDatabase.instance.answersForQuestion(qs.first['id'] as int);
    if(mounted)setState((){});
  }
  Future<void> choose(int option)async{
    if(checked)return;
    final q=qs[index]; final correctRows=answers.where((a)=>a['is_correct']==1).toList();
    final annulled=correctRows.isEmpty; final ok=annulled || correctRows.any((a)=>a['option_index']==option);
    await UrapDatabase.instance.saveAnswer(q['id'] as int,option,ok);
    setState((){selected=option;checked=true;if(!annulled){if(ok)correct++;else wrong++;}});
  }
  Future<void> next()async{
    if(index>=qs.length-1){showResult();return;}
    index++; selected=null; checked=false;
    answers=await UrapDatabase.instance.answersForQuestion(qs[index]['id'] as int);
    if(mounted)setState((){});
  }
  void showResult()=>showDialog(context:context,builder:(c)=>AlertDialog(
    title:const Text('Resultado'),content:Text('Correctas: $correct\nIncorrectas: $wrong\nContestadas: ${correct+wrong}\nTotal del bloque: ${qs.length}'),
    actions:[TextButton(onPressed:()=>Navigator.pop(c),child:const Text('Seguir revisando')),FilledButton(onPressed:(){Navigator.pop(c);Navigator.pop(context);},child:const Text('Finalizar'))]));
  String remaining(){
    if(widget.timeLimitSeconds==null)return '';
    final elapsed=DateTime.now().difference(started!).inSeconds;
    final r=(widget.timeLimitSeconds!-elapsed).clamp(0,widget.timeLimitSeconds!);
    final h=r~/3600,m=(r%3600)~/60,s=r%60;
    return '${h.toString().padLeft(2,'0')}:${m.toString().padLeft(2,'0')}:${s.toString().padLeft(2,'0')}';
  }
  @override Widget build(BuildContext context){
    if(qs.isEmpty)return Scaffold(appBar:AppBar(title:Text(widget.title)),body:const Center(child:CircularProgressIndicator()));
    final q=qs[index]; final annulled=answers.isNotEmpty && !answers.any((a)=>a['is_correct']==1);
    return Scaffold(
      appBar:AppBar(title:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text(widget.title,style:const TextStyle(fontSize:17,fontWeight:FontWeight.bold)),
        Text('Pregunta ${index+1}/${qs.length}${widget.timeLimitSeconds!=null?' · ${remaining()}':''}',style:const TextStyle(fontSize:11))
      ])),
      body:ListView(padding:const EdgeInsets.all(16),children:[
        LinearProgressIndicator(value:(index+1)/qs.length),
        const SizedBox(height:16),
        Text('MIR 2026 · Pregunta ${q['original_number']}',style:const TextStyle(fontWeight:FontWeight.bold,color:Color(0xFF0C56A0))),
        const SizedBox(height:10),Text('${q['stem']}',style:const TextStyle(fontSize:17,height:1.45)),
        if (q['image_asset'] != null && '${q['image_asset']}'.isNotEmpty)
          MirQuestionImage(assetPath: '${q['image_asset']}'),
        const SizedBox(height:14),
        ...answers.map((a){
          final oi=a['option_index'] as int; final isCorrect=a['is_correct']==1;
          Color? bg;
          if(checked && isCorrect)bg=Colors.green.withOpacity(.12);
          if(checked && selected==oi && !isCorrect && !annulled)bg=Colors.red.withOpacity(.10);
          return Card(color:bg,child:RadioListTile<int>(value:oi,groupValue:selected,onChanged:checked?null:(v)=>choose(v!),title:Text('$oi. ${a['answer_text']}')));
        }),
        if(checked)...[
          const SizedBox(height:10),
          Container(padding:const EdgeInsets.all(14),decoration:BoxDecoration(color:annulled?Colors.orange.withOpacity(.1):Colors.blue.withOpacity(.07),borderRadius:BorderRadius.circular(14)),
            child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              Text(annulled?'PREGUNTA ANULADA':'EXPLICACIÓN',style:const TextStyle(fontWeight:FontWeight.bold)),
              const SizedBox(height:6),Text('${q['explanation']}',style:const TextStyle(height:1.4))
            ])),
          const SizedBox(height:14),FilledButton.icon(onPressed:next,icon:const Icon(Icons.arrow_forward),label:Text(index==qs.length-1?'Ver resultado':'Siguiente pregunta'))
        ]
      ]));
  }
}

class MirWrongQuestionsPage extends StatelessWidget{
  const MirWrongQuestionsPage({super.key});
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('PREGUNTAS FALLADAS')),
    body:FutureBuilder<List<Map<String,Object?>>>(future:UrapDatabase.instance.wrongQuestions(),builder:(context,snap){
      if(!snap.hasData)return const Center(child:CircularProgressIndicator());
      if(snap.data!.isEmpty)return const Center(child:Padding(padding:EdgeInsets.all(24),child:Text('Todavía no tienes preguntas falladas.')));
      return ListView.separated(padding:const EdgeInsets.all(14),itemCount:snap.data!.length,separatorBuilder:(_,__)=>const Divider(),
        itemBuilder:(_,i){final q=snap.data![i];return ListTile(title:Text('MIR 2026 · ${q['original_number']}'),subtitle:Text('${q['stem']}',maxLines:3,overflow:TextOverflow.ellipsis));});
    }));
}

class EmergencyModulePage extends StatelessWidget {
  const EmergencyModulePage({super.key});
  @override
  Widget build(BuildContext context) {
    const names = [
      'Síndrome coronario agudo',
      'Ictus',
      'Sepsis',
      'Paciente politraumatizado',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('URGENCIAS MÉDICAS')),
      body: ListView.separated(
        padding: const EdgeInsets.all(18),
        itemCount: names.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.emergency_outlined),
            title: Text(names[i]),
            subtitle: Text(
              i == 0
                  ? 'Actuación rápida · ECG · medicación · traslado'
                  : i == 1
                      ? 'Código ictus · neurológico · TC · tratamiento · traslado'
                      : i == 2
                          ? 'ABCDE · qSOFA · antibióticos · fluidos · traslado'
                          : 'ABCDE · hemorragia · inmovilización · eFAST · traslado',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              if (i == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AcsEmergencyPage()),
                );
              } else if (i == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StrokeEmergencyPage()),
                );
              } else if (i == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SepsisEmergencyPage()));
              } else if (i == 3) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TraumaEmergencyPage()));
              }
            },
          ),
        ),
      ),
    );
  }
}

enum AcsEcgPattern {
  inferiorStemi,
  anteriorStemi,
  posteriorMi,
  nsteIschemia,
  deWinter,
  pericarditis,
}

class AcsEcgTrace extends StatelessWidget {
  final AcsEcgPattern pattern;
  final String lead;
  const AcsEcgTrace({super.key, required this.pattern, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8CACA)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: _AcsEcgPainter(pattern)),
          ),
          Positioned(
            top: 7,
            left: 9,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                lead,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AcsEcgPainter extends CustomPainter {
  final AcsEcgPattern pattern;
  _AcsEcgPainter(this.pattern);

  @override
  void paint(Canvas canvas, Size size) {
    final minor = Paint()
      ..color = const Color(0xFFF3DCDC)
      ..strokeWidth = 0.5;
    final major = Paint()
      ..color = const Color(0xFFE8BDBD)
      ..strokeWidth = 0.8;

    const small = 8.0;
    for (double x = 0; x <= size.width; x += small) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height),
          ((x / small).round() % 5 == 0) ? major : minor);
    }
    for (double y = 0; y <= size.height; y += small) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y),
          ((y / small).round() % 5 == 0) ? major : minor);
    }

    final trace = Paint()
      ..color = const Color(0xFF161616)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final p = Path();
    final base = size.height * 0.58;
    final beats = 3;
    final beatW = size.width / beats;

    for (int b = 0; b < beats; b++) {
      final x = b * beatW;
      if (b == 0) p.moveTo(x, base);

      // P wave
      p.lineTo(x + beatW * 0.08, base);
      p.cubicTo(
        x + beatW * 0.12, base,
        x + beatW * 0.14, base - 7,
        x + beatW * 0.18, base,
      );

      // PR segment and QRS
      p.lineTo(x + beatW * 0.30, base);
      p.lineTo(x + beatW * 0.34, base + 5);
      p.lineTo(x + beatW * 0.38, base - 35);
      p.lineTo(x + beatW * 0.43, base + 18);
      p.lineTo(x + beatW * 0.47, base);

      switch (pattern) {
        case AcsEcgPattern.inferiorStemi:
        case AcsEcgPattern.anteriorStemi:
          // Elevated ST plateau with prominent T wave.
          p.lineTo(x + beatW * 0.53, base - 15);
          p.lineTo(x + beatW * 0.66, base - 15);
          p.cubicTo(
            x + beatW * 0.72, base - 16,
            x + beatW * 0.77, base - 38,
            x + beatW * 0.84, base - 15,
          );
          p.cubicTo(
            x + beatW * 0.89, base,
            x + beatW * 0.92, base,
            x + beatW * 0.98, base,
          );
          break;
        case AcsEcgPattern.posteriorMi:
          // Reciprocal anterior pattern: horizontal ST depression, tall R.
          p.lineTo(x + beatW * 0.53, base + 12);
          p.lineTo(x + beatW * 0.70, base + 12);
          p.cubicTo(
            x + beatW * 0.76, base + 10,
            x + beatW * 0.80, base - 16,
            x + beatW * 0.86, base + 2,
          );
          p.lineTo(x + beatW * 0.98, base);
          break;
        case AcsEcgPattern.nsteIschemia:
          // Horizontal ST depression + inverted T wave.
          p.lineTo(x + beatW * 0.54, base + 12);
          p.lineTo(x + beatW * 0.70, base + 12);
          p.cubicTo(
            x + beatW * 0.76, base + 13,
            x + beatW * 0.80, base + 32,
            x + beatW * 0.86, base + 12,
          );
          p.lineTo(x + beatW * 0.98, base);
          break;
        case AcsEcgPattern.deWinter:
          // Upsloping ST depression followed by tall symmetric T.
          p.lineTo(x + beatW * 0.52, base + 14);
          p.lineTo(x + beatW * 0.64, base + 8);
          p.cubicTo(
            x + beatW * 0.70, base,
            x + beatW * 0.75, base - 45,
            x + beatW * 0.82, base - 2,
          );
          p.cubicTo(
            x + beatW * 0.88, base + 10,
            x + beatW * 0.92, base,
            x + beatW * 0.98, base,
          );
          break;
        case AcsEcgPattern.pericarditis:
          // Diffuse concave ST elevation.
          p.cubicTo(
            x + beatW * 0.54, base - 5,
            x + beatW * 0.62, base - 18,
            x + beatW * 0.72, base - 15,
          );
          p.cubicTo(
            x + beatW * 0.78, base - 13,
            x + beatW * 0.82, base - 24,
            x + beatW * 0.87, base - 12,
          );
          p.cubicTo(
            x + beatW * 0.91, base - 2,
            x + beatW * 0.95, base,
            x + beatW * 0.98, base,
          );
          break;
      }
    }
    canvas.drawPath(p, trace);
  }

  @override
  bool shouldRepaint(covariant _AcsEcgPainter oldDelegate) =>
      oldDelegate.pattern != pattern;
}


class RealClinicalImage extends StatelessWidget {
  final String url;
  final String title;
  final String attribution;
  final Widget fallback;
  const RealClinicalImage({
    super.key,
    required this.url,
    required this.title,
    required this.attribution,
    required this.fallback,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: const BoxConstraints(minHeight: 180),
          color: Colors.black12,
          child: Image.network(
            url,
            width: double.infinity,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => fallback,
          ),
        ),
      ),
      const SizedBox(height: 6),
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      Text(attribution, style: const TextStyle(fontSize: 10, color: Colors.black54)),
    ],
  );
}

class AcsEmergencyPage extends StatefulWidget {
  const AcsEmergencyPage({super.key});
  @override
  State<AcsEmergencyPage> createState() => _AcsEmergencyPageState();
}

class _AcsEmergencyPageState extends State<AcsEmergencyPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  static const navy = Color(0xFF0C356A);
  static const red = Color(0xFFB52C2C);
  static const orange = Color(0xFFC77700);
  static const green = Color(0xFF147A72);
  static const blue = Color(0xFF0C56A0);
  static const purple = Color(0xFF67469A);

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Widget bullet(String text, {Color color = navy, IconData icon = Icons.circle}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: icon == Icons.circle ? 7 : 18, color: color),
            const SizedBox(width: 9),
            Expanded(child: Text(text, style: const TextStyle(height: 1.42))),
          ],
        ),
      );

  Widget rich(String label, String text, {Color color = navy}) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black87, height: 1.42),
            children: [
              TextSpan(
                text: '$label: ',
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
              TextSpan(text: text),
            ],
          ),
        ),
      );

  Widget section({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.34)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: color,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 12),
            child,
          ],
        ),
      );

  Widget emergencyHeader(String title, String subtitle) => Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            const SizedBox(height: 5),
            Text(subtitle,
                style: const TextStyle(color: Colors.white70, height: 1.35)),
          ],
        ),
      );

  Widget drug({
    required String name,
    required String dose,
    required String when,
    required String avoid,
    String? notes,
    Color color = green,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.45)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: color)),
            const Divider(height: 20),
            rich('Dosis', dose, color: color),
            rich('Cuándo', when, color: color),
            rich('Evitar / precaución', avoid, color: color),
            if (notes != null) rich('Notas', notes, color: color),
          ],
        ),
      );

  Widget ecgCard({
    required String title,
    required String leads,
    required String key,
    required AcsEcgPattern pattern,
    required String lead,
    String? action,
  }) =>
      section(
        title: title,
        icon: Icons.monitor_heart_outlined,
        color: red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pattern == AcsEcgPattern.anteriorStemi)
              RealClinicalImage(
                url: 'https://upload.wikimedia.org/wikipedia/commons/8/8d/12_Lead_EKG_ST_Elevation_tracing_only.jpg',
                title: 'ECG real: SCACEST anterior',
                attribution: 'Displaced · dominio público · Wikimedia Commons',
                fallback: AcsEcgTrace(pattern: pattern, lead: lead),
              )
            else if (pattern == AcsEcgPattern.inferiorStemi)
              RealClinicalImage(
                url: 'https://upload.wikimedia.org/wikipedia/commons/a/a0/ECG_001.jpg',
                title: 'ECG real: IAM inferior (II, III, aVF)',
                attribution: 'Glenlarson/Patho · CC BY-SA 3.0 · Wikimedia Commons',
                fallback: AcsEcgTrace(pattern: pattern, lead: lead),
              )
            else
              AcsEcgTrace(pattern: pattern, lead: lead),
            const SizedBox(height: 10),
            rich('Derivaciones', leads, color: red),
            rich('Clave', key, color: red),
            if (action != null) rich('Conducta', action, color: red),
            const Text(
              'Trazado esquemático educativo: confirmar siempre con ECG real de 12 derivaciones y contexto clínico.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      );

  Widget quickPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          emergencyHeader(
            'SCA · ACTUACIÓN RÁPIDA EN AP',
            'Objetivo: reconocer, estabilizar lo imprescindible y activar traslado/reperfusión sin demoras evitables.',
          ),
          section(
            title: '0–10 minutos',
            icon: Icons.timer_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('ABCDE + aspecto general + nivel de conciencia.', color: red),
                bullet('TA, FC, FR, SatO₂ y glucemia capilar.', color: red),
                bullet('Reposo. Monitorización si disponible y desfibrilador preparado.', color: red),
                bullet('Canalizar vía IV; una segunda vía si cuadro grave/inestable.', color: red),
                bullet('ECG de 12 derivaciones lo antes posible, objetivo ≤10 min.', color: red),
                bullet('Si IAM inferior: registrar V3R–V4R. Si sospecha posterior: V7–V9.', color: red),
                bullet('Activar 112/UVI y circuito de reperfusión ante SCACEST o paciente inestable. No esperar troponina para activar traslado.', color: red),
              ],
            ),
          ),
          section(
            title: 'Síntomas que deben hacer pensar en SCA',
            icon: Icons.favorite_outline,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Dolor/opresión retroesternal, habitualmente mal localizado, con irradiación a brazo(s), mandíbula, espalda o epigastrio.'),
                bullet('Disnea, sudoración fría, náuseas/vómitos, síncope o presíncope pueden acompañar.'),
                bullet('En mujeres, personas mayores y diabetes puede predominar disnea, debilidad, náuseas o malestar sin dolor torácico típico.'),
              ],
            ),
          ),
          section(
            title: 'Antes de antiagregar: piensa en diagnósticos alternativos letales',
            icon: Icons.warning_amber_rounded,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Disección aórtica: dolor súbito máximo desde el inicio, irradiado a espalda, asimetría de pulsos/TA, déficit neurológico o nuevo soplo aórtico.', color: red),
                bullet('TEP: disnea brusca, dolor pleurítico, hipoxemia, taquicardia y factores de riesgo tromboembólico.', color: red),
                bullet('Neumotórax a tensión: deterioro brusco, hipoventilación unilateral, hipotensión.', color: red),
              ],
            ),
          ),
          section(
            title: 'No hacer',
            icon: Icons.block_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('No descartar SCA por un primer ECG normal.', color: red),
                bullet('No retrasar el traslado esperando analítica o troponina si la sospecha clínica/ECG es alta.', color: red),
                bullet('No administrar oxígeno de rutina si no hay hipoxemia.', color: red),
                bullet('No dar nitratos si hay hipotensión o sospecha de infarto de ventrículo derecho.', color: red),
                bullet('No banalizar presentaciones atípicas en mayores, mujeres o diabetes.', color: red),
              ],
            ),
          ),
        ],
      );

  Widget ecgPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          emergencyHeader(
            'ECG PATOLÓGICO EN SCA',
            'Ejemplos visuales esquemáticos para entrenar reconocimiento rápido. El diagnóstico se hace con el ECG real y el contexto clínico.',
          ),
          ecgCard(
            title: 'SCACEST inferior',
            leads: 'Elevación del ST en II, III y aVF; pueden existir cambios recíprocos en I/aVL.',
            key: 'Si III > II o hay hipotensión, bradicardia o pulmones limpios, sospecha afectación de VD.',
            pattern: AcsEcgPattern.inferiorStemi,
            lead: 'II / III / aVF',
            action: 'Añadir V3R–V4R. Si VD afectado, evitar nitratos y valorar precarga con prudencia.',
          ),
          ecgCard(
            title: 'SCACEST anterior',
            leads: 'Elevación del ST predominante en V1–V4; puede extenderse a V5–V6/I/aVL.',
            key: 'Territorio amplio = alto riesgo de disfunción ventricular, arritmias y shock.',
            pattern: AcsEcgPattern.anteriorStemi,
            lead: 'V2–V4',
            action: 'Activación inmediata de código infarto/reperfusión.',
          ),
          ecgCard(
            title: 'IAM posterior',
            leads: 'Descenso del ST en V1–V3, R altas y T positivas pueden ser imagen especular.',
            key: 'No confundir automáticamente con SCASEST anterior.',
            pattern: AcsEcgPattern.posteriorMi,
            lead: 'V1–V3',
            action: 'Registrar V7–V9 para buscar elevación posterior.',
          ),
          ecgCard(
            title: 'SCASEST / isquemia subendocárdica',
            leads: 'Descenso horizontal/descendente del ST y/o inversión dinámica de T.',
            key: 'Un ECG puede ser normal; los cambios dinámicos aumentan la sospecha.',
            pattern: AcsEcgPattern.nsteIschemia,
            lead: 'V4–V6',
            action: 'Traslado urgente y estratificación hospitalaria.',
          ),
          ecgCard(
            title: 'Patrón de De Winter',
            leads: 'Depresión ascendente del ST en precordiales con ondas T altas y simétricas; a menudo ascenso en aVR.',
            key: 'Equivalente de oclusión coronaria de alto riesgo.',
            pattern: AcsEcgPattern.deWinter,
            lead: 'V2–V5',
            action: 'Tratar como patrón de oclusión coronaria y activar evaluación urgente para reperfusión.',
          ),
          ecgCard(
            title: 'Pericarditis: diferencial',
            leads: 'Elevación difusa y habitualmente cóncava del ST, a menudo con descenso PR; no respeta un único territorio coronario.',
            key: 'El SCACEST suele localizar un territorio y puede mostrar cambios recíprocos.',
            pattern: AcsEcgPattern.pericarditis,
            lead: 'II (esquema)',
          ),
          section(
            title: 'BRI y oclusión coronaria',
            icon: Icons.electrical_services_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('El BRI dificulta interpretar el ST; un BRI nuevo por sí solo no debe sustituir la valoración clínica completa.'),
                bullet('Buscar criterios de Sgarbossa/modificados: elevación ST concordante, descenso ST concordante en V1–V3 o discordancia desproporcionada.'),
                bullet('Si clínica muy sugestiva + inestabilidad o criterios de oclusión: activar circuito urgente.'),
              ],
            ),
          ),
        ],
      );

  Widget medsPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          emergencyHeader(
            'MEDICACIÓN · DOSIS PRÁCTICAS',
            'Separado en lo que puede ser útil en el centro de salud y lo que debe coordinarse con UVI/hemodinámica/protocolo regional.',
          ),
          drug(
            name: 'Ácido acetilsalicílico (AAS)',
            dose: '150–300 mg VO de carga, preferiblemente masticado (en semFYC se usa con frecuencia 250 mg VO).',
            when: 'Sospecha de SCA cuando no existe contraindicación y no hay una alternativa peligrosa como disección aórtica.',
            avoid: 'Alergia grave, hemorragia activa significativa o sospecha clínica importante de disección aórtica. Individualizar si anticoagulación/sangrado.',
            notes: 'No esperar confirmación de troponina si el cuadro es claramente compatible.',
            color: green,
          ),
          drug(
            name: 'Nitroglicerina sublingual',
            dose: '0,4 mg SL; puede repetirse cada 5 min hasta 3 dosis si persiste dolor y la hemodinámica lo permite.',
            when: 'Dolor isquémico persistente en paciente hemodinámicamente estable.',
            avoid: 'TAS <90 mmHg o caída marcada respecto a basal, sospecha de IAM de VD, estenosis aórtica grave, shock o uso reciente de inhibidores PDE-5 (p. ej., sildenafilo/vardenafilo ~24 h; tadalafilo ~48 h).',
            notes: 'Reevaluar TA y síntomas tras cada dosis.',
            color: orange,
          ),
          drug(
            name: 'Oxígeno',
            dose: 'Titular para corregir hipoxemia; no administrar de rutina al paciente normoxémico.',
            when: 'SatO₂ <90%, insuficiencia respiratoria o hipoxemia clínicamente relevante.',
            avoid: 'Evitar hiperoxia innecesaria.',
            notes: 'El material base también reserva oxígeno para hipoxemia.',
            color: blue,
          ),
          drug(
            name: 'Morfina IV',
            dose: '2–4 mg IV lenta, titulando en dosis pequeñas según respuesta; repetir con cautela si persiste dolor intenso.',
            when: 'Dolor intenso refractario pese a medidas antiisquémicas apropiadas.',
            avoid: 'Hipotensión, depresión respiratoria, disminución del nivel de conciencia o alto riesgo de complicaciones. No usar de rutina.',
            notes: 'Puede producir náuseas, hipotensión y depresión respiratoria; vigilar estrechamente.',
            color: purple,
          ),
          section(
            title: 'Antiplaquetarios P2Y12: estudio / UVI-hemodinámica',
            icon: Icons.medication_liquid_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('Ticagrelor', '180 mg VO de carga → 90 mg cada 12 h.', color: purple),
                rich('Prasugrel', '60 mg VO de carga → 10 mg/día; 5 mg/día en perfiles seleccionados. Contraindicado si ictus/AIT previo.', color: purple),
                rich('Clopidogrel', '300–600 mg VO de carga → 75 mg/día; la estrategia depende de reperfusión, anticoagulación y protocolo.', color: purple),
                bullet('En SCASEST no debe banalizarse el “pretratamiento” antes de conocer la estrategia invasiva. Coordinar con SEM/UVI/hemodinámica.', color: purple),
              ],
            ),
          ),
          section(
            title: 'Fibrinólisis',
            icon: Icons.bloodtype_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('No es una medicación para iniciar de forma rutinaria en un centro de salud sin coordinación.', color: red),
                bullet('Si un SCACEST no puede acceder a angioplastia primaria dentro del tiempo recomendado, el SEM/UVI puede indicar fibrinólisis según tiempos, contraindicaciones y protocolo regional.', color: red),
                bullet('Antes de fibrinólisis hay que excluir contraindicaciones mayores, especialmente hemorragia intracraneal previa y sospecha de disección aórtica.', color: red),
              ],
            ),
          ),
        ],
      );

  Widget topicPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          emergencyHeader(
            'SÍNDROME CORONARIO AGUDO',
            'Enfoque de urgencias extrahospitalarias y Atención Primaria.',
          ),
          section(
            title: 'Concepto',
            icon: Icons.menu_book_outlined,
            color: navy,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('El SCA agrupa cuadros de isquemia miocárdica aguda por reducción brusca del flujo coronario.'),
                bullet('En la práctica urgente se divide en SCA con elevación persistente del ST (SCACEST) y sin elevación persistente (SCASEST).'),
                bullet('El diagnóstico integra clínica, ECG y biomarcadores; en AP la prioridad es no retrasar reperfusión/traslado esperando pruebas no disponibles.'),
              ],
            ),
          ),
          section(
            title: 'Anamnesis rápida: ALICIA',
            icon: Icons.question_answer_outlined,
            color: blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('Aparición', 'súbita/progresiva, reposo/esfuerzo, duración, primer episodio o cambio respecto a angina previa.', color: blue),
                rich('Localización', 'retrosternal/precordial; puede ser epigástrica, mandibular o en brazos.', color: blue),
                rich('Irradiación', 'brazo izquierdo o ambos brazos, mandíbula, espalda, epigastrio.', color: blue),
                rich('Características', 'opresivo, peso, quemazón o “falta de aire”; no exigir una descripción clásica.', color: blue),
                rich('Intensidad', 'la intensidad no determina por sí sola gravedad.', color: blue),
                rich('Acompañantes/alivio', 'sudoración, náuseas, disnea, síncope; preguntar por relación con esfuerzo y reposo.', color: blue),
              ],
            ),
          ),
          section(
            title: 'ECG por territorios',
            icon: Icons.monitor_heart,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('Septal', 'V1–V2', color: red),
                rich('Anterior', 'V3–V4', color: red),
                rich('Lateral alta', 'I, aVL', color: red),
                rich('Lateral baja', 'V5–V6', color: red),
                rich('Inferior', 'II, III, aVF', color: red),
                rich('Ventrículo derecho', 'V3R–V4R', color: red),
                rich('Posterior', 'V7–V9; sospechar por descenso ST V1–V3.', color: red),
              ],
            ),
          ),
          section(
            title: 'Complicaciones a detectar antes del traslado',
            icon: Icons.warning_amber,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('FV/TV, bradicardia sintomática, bloqueo AV avanzado.', color: red),
                bullet('Edema agudo de pulmón e insuficiencia cardiaca aguda.', color: red),
                bullet('Shock cardiogénico: hipotensión + signos de hipoperfusión.', color: red),
                bullet('Complicación mecánica: deterioro brusco, nuevo soplo, congestión o shock.', color: red),
              ],
            ),
          ),
          section(
            title: 'Killip práctico',
            icon: Icons.speed_outlined,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('I', 'sin signos de insuficiencia cardiaca.', color: orange),
                rich('II', 'crepitantes limitados, tercer tono u otros signos de IC leve.', color: orange),
                rich('III', 'edema agudo de pulmón.', color: orange),
                rich('IV', 'shock cardiogénico.', color: orange),
              ],
            ),
          ),
        ],
      );

  Widget transferPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          emergencyHeader(
            'TRASLADO Y COORDINACIÓN',
            'El centro de salud no debe convertirse en una “sala de espera” cuando la sospecha de SCA es relevante.',
          ),
          section(
            title: 'Activar 112/UVI de forma inmediata si',
            icon: Icons.local_hospital_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('SCACEST o equivalente de oclusión coronaria.', color: red),
                bullet('Dolor isquémico persistente/recurrente con cambios dinámicos de ST/T.', color: red),
                bullet('Hipotensión, shock, edema agudo de pulmón o hipoxemia.', color: red),
                bullet('TV/FV, bloqueo AV avanzado, síncope con sospecha isquémica o PCR recuperada.', color: red),
              ],
            ),
          ),
          section(
            title: 'Mientras llega el recurso medicalizado',
            icon: Icons.medical_services_outlined,
            color: green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Mantener monitorización y reevaluar ABCDE, TA, FC, SatO₂ y dolor.'),
                bullet('Desfibrilador disponible; parches colocados si riesgo arrítmico alto y el equipo lo permite.'),
                bullet('Registrar hora de inicio de síntomas, hora del primer contacto médico y hora del ECG.'),
                bullet('Preparar antecedentes clave: alergias, anticoagulantes/antiagregantes, función renal conocida, ictus/hemorragias previas y medicación PDE-5.'),
                bullet('Entregar ECG y tratamientos administrados al SEM/UVI.'),
              ],
            ),
          ),
          section(
            title: 'Paciente inestable',
            icon: Icons.warning_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Si PCR: iniciar RCP y seguir algoritmo de soporte vital con desfibrilación precoz cuando corresponda.', color: red),
                bullet('Si shock: decúbito, monitor, vía IV, oxígeno si hipoxemia y UVI inmediata. Evitar bolos indiscriminados de fluidos; en IAM de VD puede requerirse precarga prudente.', color: red),
                bullet('Si EAP: posición incorporada si tolera, oxígeno si hipoxemia y soporte ventilatorio según recursos; nitratos solo si la PA lo permite y no hay contraindicaciones.', color: red),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Síndrome coronario agudo',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('URGENCIAS · ATENCIÓN PRIMARIA · v1.9',
                style: TextStyle(fontSize: 11)),
          ],
        ),
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.emergency_outlined), text: 'Actuación'),
            Tab(icon: Icon(Icons.monitor_heart_outlined), text: 'ECG'),
            Tab(icon: Icon(Icons.medication_outlined), text: 'Medicación'),
            Tab(icon: Icon(Icons.menu_book_outlined), text: 'Tema'),
            Tab(icon: Icon(Icons.local_hospital_outlined), text: 'Traslado'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          quickPage(),
          ecgPage(),
          medsPage(),
          topicPage(),
          transferPage(),
        ],
      ),
    );
  }
}


enum StrokeCtPattern { ischemic, hemorrhagic }

class StrokeCtDiagram extends StatelessWidget {
  final StrokeCtPattern pattern;
  const StrokeCtDiagram({super.key, required this.pattern});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: const Color(0xFF111317),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black54),
      ),
      child: CustomPaint(
        painter: _StrokeCtPainter(pattern),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _StrokeCtPainter extends CustomPainter {
  final StrokeCtPattern pattern;
  _StrokeCtPainter(this.pattern);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final skullRect = Rect.fromCenter(
      center: center,
      width: size.width * .72,
      height: size.height * .88,
    );

    final skull = Paint()
      ..color = const Color(0xFFE7E7E7)
      ..style = PaintingStyle.fill;
    final brain = Paint()
      ..color = const Color(0xFF8F9398)
      ..style = PaintingStyle.fill;
    final ventricle = Paint()
      ..color = const Color(0xFF4E5359)
      ..style = PaintingStyle.fill;

    canvas.drawOval(skullRect, skull);
    final brainRect = Rect.fromCenter(
      center: center,
      width: size.width * .64,
      height: size.height * .80,
    );
    canvas.drawOval(brainRect, brain);

    // Falx / midline
    final mid = Paint()
      ..color = const Color(0xFFD7D7D7)
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(center.dx, brainRect.top + 12),
      Offset(center.dx, brainRect.bottom - 12),
      mid,
    );

    // Ventricles
    final leftV = Path()
      ..moveTo(center.dx - 8, center.dy - 18)
      ..quadraticBezierTo(center.dx - 35, center.dy - 10, center.dx - 15, center.dy + 10)
      ..quadraticBezierTo(center.dx - 5, center.dy + 2, center.dx - 8, center.dy - 18);
    final rightV = Path()
      ..moveTo(center.dx + 8, center.dy - 18)
      ..quadraticBezierTo(center.dx + 35, center.dy - 10, center.dx + 15, center.dy + 10)
      ..quadraticBezierTo(center.dx + 5, center.dy + 2, center.dx + 8, center.dy - 18);
    canvas.drawPath(leftV, ventricle);
    canvas.drawPath(rightV, ventricle);

    if (pattern == StrokeCtPattern.hemorrhagic) {
      // Hyperdense acute hemorrhage
      final bleed = Paint()
        ..color = const Color(0xFFF4F4F4)
        ..style = PaintingStyle.fill;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(center.dx - size.width * .13, center.dy + 4),
          width: size.width * .19,
          height: size.height * .24,
        ),
        bleed,
      );
      final edema = Paint()
        ..color = const Color(0xFF757A80)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(center.dx - size.width * .13, center.dy + 4),
          width: size.width * .25,
          height: size.height * .31,
        ),
        edema,
      );
    } else {
      // Early ischemic hypodensity / loss of gray-white differentiation
      final ischemia = Paint()
        ..color = const Color(0xFF6C7177)
        ..style = PaintingStyle.fill;
      final p = Path()
        ..moveTo(center.dx + 10, brainRect.top + 30)
        ..quadraticBezierTo(
            brainRect.right - 8, center.dy - 28, brainRect.right - 18, center.dy + 48)
        ..quadraticBezierTo(
            center.dx + 55, brainRect.bottom - 18, center.dx + 20, center.dy + 25)
        ..close();
      canvas.drawPath(p, ischemia);

      // Hyperdense MCA dot/segment schematic
      final artery = Paint()
        ..color = const Color(0xFFD6D6D6)
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
        Offset(center.dx + 10, center.dy - 3),
        Offset(center.dx + 45, center.dy + 7),
        artery,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _StrokeCtPainter oldDelegate) =>
      oldDelegate.pattern != pattern;
}

class StrokeEmergencyPage extends StatefulWidget {
  const StrokeEmergencyPage({super.key});

  @override
  State<StrokeEmergencyPage> createState() => _StrokeEmergencyPageState();
}

class _StrokeEmergencyPageState extends State<StrokeEmergencyPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  static const navy = Color(0xFF0C356A);
  static const red = Color(0xFFB52C2C);
  static const orange = Color(0xFFC77700);
  static const green = Color(0xFF147A72);
  static const blue = Color(0xFF0C56A0);
  static const purple = Color(0xFF67469A);

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Widget bullet(String text,
          {Color color = navy, IconData icon = Icons.circle}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: icon == Icons.circle ? 7 : 18, color: color),
            const SizedBox(width: 9),
            Expanded(
              child: Text(text, style: const TextStyle(height: 1.42)),
            ),
          ],
        ),
      );

  Widget rich(String label, String text, {Color color = navy}) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black87, height: 1.42),
            children: [
              TextSpan(
                text: '$label: ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
              TextSpan(text: text),
            ],
          ),
        ),
      );

  Widget section({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(.34)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      );

  Widget header(String title, String subtitle) => Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white70, height: 1.35),
            ),
          ],
        ),
      );

  Widget drug({
    required String name,
    required String dose,
    required String when,
    required String warning,
    Color color = green,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withOpacity(.05),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(.42)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: color)),
            const Divider(height: 20),
            rich('Dosis', dose, color: color),
            rich('Cuándo', when, color: color),
            rich('Precaución', warning, color: color),
          ],
        ),
      );

  Widget quickPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'ICTUS · ACTUACIÓN RÁPIDA EN AP',
            'Tiempo = cerebro. Reconocer déficit focal, conocer la última vez visto bien y activar Código Ictus sin demoras.',
          ),
          section(
            title: 'Primeros minutos',
            icon: Icons.timer_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('ABCDE y constantes: TA, FC, FR, SatO₂, temperatura y nivel de conciencia.', color: red),
                bullet('Glucemia capilar inmediata: la hipoglucemia puede simular un ictus.', color: red),
                bullet('Determinar hora exacta de inicio o “última vez visto bien”.', color: red),
                bullet('Exploración focal rápida: cara, brazos, lenguaje + mirada, campos visuales, sensibilidad, coordinación y marcha si es seguro.', color: red),
                bullet('Activar 112/Código Ictus precozmente. No retrasar el traslado para completar pruebas no imprescindibles en AP.', color: red),
                bullet('Nada por vía oral hasta valorar deglución.', color: red),
              ],
            ),
          ),
          section(
            title: 'FAST / Cincinnati',
            icon: Icons.psychology_outlined,
            color: blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('Face', 'asimetría facial al sonreír.', color: blue),
                rich('Arm', 'caída o debilidad de un brazo al mantener ambos elevados.', color: blue),
                rich('Speech', 'habla alterada, disartria, afasia o incapacidad para repetir una frase.', color: blue),
                rich('Time', 'si aparece cualquiera: anotar hora y activar Código Ictus.', color: blue),
              ],
            ),
          ),
          section(
            title: 'No hacer',
            icon: Icons.block_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('No dar AAS ni anticoagulantes antes de excluir hemorragia intracraneal con neuroimagen.', color: red),
                bullet('No bajar agresivamente la PA de forma rutinaria en el centro de salud.', color: red),
                bullet('No retrasar el traslado por hacer analíticas extensas, radiografías u otras pruebas no esenciales.', color: red),
                bullet('No dar comida, agua ni medicación oral hasta descartar disfagia.', color: red),
              ],
            ),
          ),
        ],
      );

  Widget neuroPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'EXAMEN NEUROLÓGICO',
            'Exploración estructurada que pueda repetirse y comunicarse al equipo de ictus.',
          ),
          section(
            title: '1. Estado mental y lenguaje',
            icon: Icons.record_voice_over_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Nivel de conciencia: alerta, somnoliento, estuporoso o coma. Glasgow si procede.'),
                bullet('Orientación en persona, lugar y tiempo.'),
                bullet('Lenguaje: fluencia, comprensión, denominación y repetición. Diferenciar afasia de disartria.'),
              ],
            ),
          ),
          section(
            title: '2. Pares craneales',
            icon: Icons.visibility_outlined,
            color: blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Pupilas: tamaño, simetría y reactividad.'),
                bullet('Mirada conjugada y movimientos oculares; buscar desviación forzada de la mirada.'),
                bullet('Campos visuales por confrontación si es posible.'),
                bullet('Facial: pedir mostrar dientes/sonreír y elevar cejas; valorar asimetría.'),
              ],
            ),
          ),
          section(
            title: '3. Fuerza y sensibilidad',
            icon: Icons.accessibility_new_outlined,
            color: green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Brazos: elevar 90° sentado o 45° en decúbito durante ~10 s; observar caída/pronación.'),
                bullet('Piernas: elevar ~30° en decúbito y comparar ambos lados.'),
                bullet('Graduar fuerza 0–5 cuando sea posible y describir hemiparesia/hemiplejia.'),
                bullet('Comparar sensibilidad táctil en cara, brazos y piernas; buscar extinción/inatención.'),
              ],
            ),
          ),
          section(
            title: '4. Coordinación, marcha y signos corticales',
            icon: Icons.directions_walk_outlined,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Dedo-nariz y talón-rodilla si el déficit lo permite.'),
                bullet('Buscar ataxia, dismetría o inestabilidad marcada.'),
                bullet('Valorar negligencia, apraxia y alteraciones visuoespaciales si sospecha hemisférica.'),
                bullet('No forzar la marcha si existe debilidad importante, vértigo intenso o riesgo de caída.'),
              ],
            ),
          ),
          section(
            title: 'Ejemplo de reporte',
            icon: Icons.description_outlined,
            color: navy,
            child: const Text(
              'Paciente alerta, orientado, Glasgow 15. Pupilas isocóricas y reactivas. Desviación de mirada ausente. '
              'Campos visuales sin defecto grosero por confrontación. Paresia facial central derecha. '
              'Lenguaje no fluente con dificultad para denominación y repetición, comprensión parcialmente conservada. '
              'Fuerza MSD 2/5, MID 3/5, hemicuerpo izquierdo 5/5. Hipoestesia derecha. '
              'Coordinación no valorable en lado derecho por paresia; izquierda conservada. '
              'Marcha no valorada por seguridad. Inicio de síntomas 09:20 h / última vez visto bien 09:15 h.',
              style: TextStyle(height: 1.45),
            ),
          ),
        ],
      );

  Widget ctPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'TC CRANEAL · QUÉ BUSCAR',
            'La TC sin contraste distingue principalmente hemorragia y puede mostrar signos precoces de isquemia.',
          ),
          section(
            title: 'Ictus isquémico',
            icon: Icons.image_search_outlined,
            color: blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RealClinicalImage(
                  url: 'https://upload.wikimedia.org/wikipedia/commons/e/e9/CT_Brain_MCA_Infarct.jpg',
                  title: 'TC real: infarto extenso en territorio de ACM',
                  attribution: 'Lucien Monfils · CC BY-SA 4.0 · Wikimedia Commons',
                  fallback: const StrokeCtDiagram(pattern: StrokeCtPattern.ischemic),
                ),
                const SizedBox(height: 12),
                bullet('En las primeras horas la TC puede ser normal.'),
                bullet('Signos precoces: pérdida de diferenciación sustancia gris-blanca, borramiento de surcos, pérdida del “ribete insular” e hipodensidad territorial.'),
                bullet('Puede observarse arteria cerebral media hiperdensa por trombo.'),
                bullet('La extensión del daño temprano puede estimarse con ASPECTS en territorio de ACM.'),
              ],
            ),
          ),
          section(
            title: 'Ictus hemorrágico',
            icon: Icons.bloodtype_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RealClinicalImage(
                  url: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Intracerebral%20hemorrage%20%28CT%20scan%29.jpg',
                  title: 'TC real: hemorragia intracerebral e intraventricular',
                  attribution: 'Glitzy queen00 · dominio público · Wikimedia Commons',
                  fallback: const StrokeCtDiagram(pattern: StrokeCtPattern.hemorrhagic),
                ),
                const SizedBox(height: 12),
                bullet('La sangre aguda suele verse hiperdensa (blanca) en TC sin contraste.', color: red),
                bullet('Describir localización, tamaño aproximado, edema, efecto masa, desviación de línea media y extensión intraventricular.', color: red),
                bullet('Una hemorragia excluye trombólisis y cambia por completo el manejo antitrombótico.', color: red),
              ],
            ),
          ),
          section(
            title: 'Importante',
            icon: Icons.info_outline,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Estas imágenes son esquemas educativos integrados en la app; no sustituyen TC diagnósticas reales.'),
                bullet('En AP la prioridad es Código Ictus y traslado; la neuroimagen se realiza en el centro receptor según circuito.'),
              ],
            ),
          ),
        ],
      );

  Widget medsPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'TRATAMIENTO Y DOSIS',
            'Distingue medidas prehospitalarias de tratamientos de reperfusión hospitalarios.',
          ),
          drug(
            name: 'Glucosa en hipoglucemia',
            dose: 'Si consciente: 15–20 g de glucosa oral y reevaluar a los 15 min. Si alteración de conciencia o no puede tragar: glucosa IV según disponibilidad/protocolo o glucagón 1 mg IM/SC.',
            when: 'Glucemia baja que pueda explicar o agravar el déficit neurológico.',
            warning: 'No retrasar Código Ictus si persiste déficit focal tras corregir la glucemia. Nada VO si disfagia o bajo nivel de conciencia.',
            color: green,
          ),
          drug(
            name: 'Oxígeno',
            dose: 'Titular para mantener una oxigenación adecuada; no usar de rutina si el paciente está normoxémico.',
            when: 'Hipoxemia o insuficiencia respiratoria.',
            warning: 'Evitar hiperoxia innecesaria.',
            color: blue,
          ),
          section(
            title: 'Presión arterial',
            icon: Icons.monitor_heart_outlined,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('En ictus agudo NO se recomienda reducir la PA de forma agresiva de rutina antes de conocer el contexto de reperfusión.'),
                bullet('Si es candidato a trombólisis, el objetivo hospitalario habitual es PA <185/110 mmHg antes del tratamiento y <180/105 mmHg después.'),
                bullet('Labetalol IV puede utilizarse en entorno monitorizado/protocolizado; no convertirlo en una intervención rutinaria del centro de salud.'),
              ],
            ),
          ),
          section(
            title: 'Reperfusión · hospital / unidad de ictus',
            icon: Icons.bolt_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('Alteplasa IV', '0,9 mg/kg (máx. 90 mg): 10% en bolo y el resto en 60 min, en pacientes seleccionados según ventana/criterios.', color: purple),
                rich('Tenecteplasa IV', '0,25 mg/kg (máx. 25 mg) en bolo único en pacientes seleccionados según protocolo de ictus/reperfusión.', color: purple),
                bullet('Trombectomía mecánica: pacientes seleccionados con oclusión de gran vaso; la ventana puede ampliarse hasta 24 h según neuroimagen y criterios.', color: purple),
                bullet('Estas terapias se deciden en hospital/SEM coordinado; el trabajo de AP es acortar tiempos y evitar tratamientos que interfieran.', color: purple),
              ],
            ),
          ),
          section(
            title: 'Antiagregación',
            icon: Icons.medication_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('NO administrar AAS en AP antes de excluir hemorragia mediante TC.', color: red),
                bullet('En ictus isquémico no trombolizado, la antiagregación se inicia tras neuroimagen según protocolo hospitalario.', color: red),
              ],
            ),
          ),
        ],
      );

  Widget transferPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'CÓDIGO ICTUS Y TRASLADO',
            'Objetivo: llegar al centro adecuado lo antes posible, aportando una historia temporal y neurológica clara.',
          ),
          section(
            title: 'Comunicar al 112 / equipo receptor',
            icon: Icons.local_hospital_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Hora de inicio o última vez visto bien.', color: red),
                bullet('Déficit: cara/brazo/pierna, lenguaje, mirada, campo visual, sensibilidad, coordinación, nivel de conciencia.', color: red),
                bullet('Glucemia, TA, SatO₂ y evolución durante la asistencia.', color: red),
                bullet('Anticoagulantes: nombre, última dosis y motivo; antiagregantes y antecedentes de hemorragia/ictus.', color: red),
                bullet('Situación funcional previa y comorbilidad relevante.', color: red),
              ],
            ),
          ),
          section(
            title: 'Mientras llega el recurso',
            icon: Icons.medical_services_outlined,
            color: green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Monitorizar y reevaluar ABCDE y estado neurológico.'),
                bullet('Cabeza elevada aproximadamente 30° si tolera y no hay hipotensión, vómitos o necesidad de maniobras de vía aérea.'),
                bullet('Vía IV si no retrasa el traslado. Suero isotónico si precisa; evitar soluciones hipotónicas.'),
                bullet('Tratar fiebre, hipoglucemia, convulsiones o compromiso de vía aérea según situación y recursos.'),
                bullet('Nada por boca hasta cribado de disfagia.'),
              ],
            ),
          ),
          section(
            title: 'AIT también es urgente',
            icon: Icons.warning_amber_outlined,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('La desaparición del déficit no convierte el episodio en banal.'),
                bullet('AIT de reciente comienzo requiere valoración urgente y prevención secundaria precoz según circuito asistencial.'),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ictus',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('URGENCIAS · ATENCIÓN PRIMARIA · v1.9',
                style: TextStyle(fontSize: 11)),
          ],
        ),
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.emergency_outlined), text: 'Actuación'),
            Tab(icon: Icon(Icons.psychology_outlined), text: 'Neurológico'),
            Tab(icon: Icon(Icons.image_search_outlined), text: 'TC'),
            Tab(icon: Icon(Icons.medication_outlined), text: 'Tratamiento'),
            Tab(icon: Icon(Icons.local_hospital_outlined), text: 'Traslado'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          quickPage(),
          neuroPage(),
          ctPage(),
          medsPage(),
          transferPage(),
        ],
      ),
    );
  }
}


class SepsisEmergencyPage extends StatelessWidget {
  const SepsisEmergencyPage({super.key});
  Widget b(String t)=>Padding(padding:const EdgeInsets.only(bottom:8),child:Text('• $t',style:const TextStyle(height:1.4)));
  Widget card(String title,List<String> lines,{Color color=const Color(0xFF0C356A)})=>Card(
    child:Padding(padding:const EdgeInsets.all(15),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text(title,style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:color)),const SizedBox(height:10),
      ...lines.map(b)
    ])));
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('Sepsis · Urgencias AP')),
    body:ListView(padding:const EdgeInsets.all(14),children:[
      card('ACTUACIÓN INMEDIATA',[
        'ABCDE, monitorización, TA, FC, FR, SatO₂, temperatura, Glasgow y glucemia.',
        'Sospecha infección + disfunción orgánica: activar traslado medicalizado precoz.',
        'qSOFA orienta riesgo (FR ≥22, PAS ≤100, alteración mental), pero un qSOFA negativo NO descarta sepsis.',
        'Canalizar 1–2 vías IV si es posible sin retrasar el traslado.'
      ],color:Colors.red),
      card('FLUIDOS',[
        'Cristaloide isotónico en bolos pequeños con reevaluación frecuente.',
        'En hipotensión/hipoperfusión puede requerirse reanimación más intensiva; individualizar en IC/ERC.',
        'Evitar sobrecarga: reevaluar TA, perfusión, crepitantes, trabajo respiratorio y respuesta clínica.'
      ],color:Colors.blue),
      card('ANTIBIÓTICOS',[
        'En shock séptico o alta sospecha de sepsis grave: antibiótico IV precoz si está disponible y NO retrasa el traslado.',
        'La elección depende del foco, alergias, epidemiología y protocolo local; tomar cultivos antes solo si no demora el tratamiento.',
        'No usar una pauta única para todos los focos: neumonía, urinario, abdominal, piel y SNC requieren estrategias distintas.'
      ],color:Colors.green),
      card('VASOPRESORES / UVI',[
        'Noradrenalina es el vasopresor de primera línea en shock séptico, pero requiere entorno monitorizado y protocolo de emergencias/UVI.',
        'En un centro de salud rural: prioridad a ABCDE, fluidos prudentes, antibiótico indicado y evacuación medicalizada.'
      ],color:Colors.deepPurple),
      card('NO OLVIDAR',[
        'Oxígeno si hipoxemia; controlar glucemia; tratar fiebre/dolor cuando proceda.',
        'Buscar foco y signos de alarma: meningismo, púrpura, abdomen agudo, obstrucción urinaria, infección necrotizante.',
        'Registrar tiempos: reconocimiento, antibiótico, fluidos y activación del SEM.'
      ],color:Colors.orange),
    ]));
}

class TraumaEmergencyPage extends StatelessWidget {
  const TraumaEmergencyPage({super.key});
  Widget b(String t)=>Padding(padding:const EdgeInsets.only(bottom:8),child:Text('• $t',style:const TextStyle(height:1.4)));
  Widget card(String title,List<String> lines,{Color color=const Color(0xFF0C356A)})=>Card(
    child:Padding(padding:const EdgeInsets.all(15),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text(title,style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:color)),const SizedBox(height:10),...lines.map(b)
    ])));
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('Politraumatizado · Urgencias AP')),
    body:ListView(padding:const EdgeInsets.all(14),children:[
      card('X · HEMORRAGIA CATASTRÓFICA',[
        'Antes de ABCDE, controlar hemorragia externa masiva: compresión directa, vendaje compresivo y torniquete cuando esté indicado.',
        'Anotar hora de colocación del torniquete.'
      ],color:Colors.red),
      card('A · AIRWAY + CERVICAL',[
        'Valorar si habla, cuerpos extraños, sangre/vómito y signos de obstrucción.',
        'Aspiración, maniobras básicas y cánulas según nivel de conciencia/competencia.',
        'Protección cervical manual y collarín cuando corresponda. Si no tienes experiencia en intubación, prioriza ventilación eficaz con bolsa-mascarilla y ayuda medicalizada.'
      ],color:Colors.blue),
      card('B · BREATHING',[
        'Inspección, palpación y auscultación; SatO₂ y FR.',
        'Buscar neumotórax a tensión, neumotórax abierto, tórax inestable y hemotórax masivo.',
        'Oxígeno en hipoxemia/trauma grave. Lesión torácica vital requiere tratamiento inmediato según capacitación y recursos.'
      ],color:Colors.teal),
      card('C · CIRCULATION',[
        'Pulso, TA, piel, relleno capilar y hemorragias ocultas.',
        'Dos vías periféricas gruesas si es posible; evitar retrasar traslado.',
        'Cristaloides con estrategia restrictiva cuando no hay TCE grave; sospechar hemorragia interna ante shock sin sangrado externo.'
      ],color:Colors.orange),
      card('D · DISABILITY',[
        'Glasgow, pupilas, lateralidad y glucemia.',
        'En TCE evitar hipoxia e hipotensión: ambas empeoran el pronóstico.'
      ],color:Colors.deepPurple),
      card('E · EXPOSURE / eFAST',[
        'Exponer lo necesario buscando lesiones y prevenir hipotermia.',
        'eFAST, si dispones de ecógrafo y entrenamiento, busca líquido libre pericárdico/intraperitoneal y neumotórax/hemotórax.',
        'Un eFAST negativo NO excluye lesión grave ni debe retrasar el traslado.'
      ],color:Colors.green),
      card('TRASLADO',[
        'Activar 112/UVI precozmente en mecanismo de alta energía, inestabilidad, deterioro neurológico o lesión potencialmente vital.',
        'Reevaluar ABCDE repetidamente y documentar intervenciones, tiempos y evolución.'
      ],color:Colors.red),
    ]));
}

class TopicListPage extends StatefulWidget {
  const TopicListPage({super.key});
  @override
  State<TopicListPage> createState() => _TopicListPageState();
}

class _TopicListPageState extends State<TopicListPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = topics.where((t) => t.title.toLowerCase().contains(query.toLowerCase())).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('URAPMIR', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('ATENCIÓN PRIMARIA · v1.9', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              onChanged: (v) => setState(() => query = v),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar tema clínico',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) {
                final t = filtered[i];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFFD7E2F2)),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFEAF2FF),
                      child: Icon(Icons.menu_book_rounded, color: Color(0xFF0C356A)),
                    ),
                    title: Text(t.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Algoritmo completo · diagnóstico · tratamiento · derivación'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => t.title == 'Hipertensión arterial'
                            ? const HtaInteractivePage()
                            : t.title == 'Diabetes mellitus tipo 2'
                                ? const DiabetesInteractivePage()
                                : t.title == 'Ansiedad'
                                    ? const AnxietyInteractivePage()
                                    : TopicDetailPage(topic: t),
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


class HtaInteractivePage extends StatefulWidget {
  const HtaInteractivePage({super.key});

  @override
  State<HtaInteractivePage> createState() => _HtaInteractivePageState();
}

class _HtaInteractivePageState extends State<HtaInteractivePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const navy = Color(0xFF0C356A);
  static const blue = Color(0xFF0C56A0);
  static const green = Color(0xFF1E7A5C);
  static const orange = Color(0xFFC77700);
  static const purple = Color(0xFF67469A);
  static const red = Color(0xFFB52C2C);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _sectionCard({
    required String number,
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
    bool initiallyExpanded = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withOpacity(0.35)),
      ),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        leading: CircleAvatar(
          backgroundColor: color,
          foregroundColor: Colors.white,
          child: Text(number, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        title: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ),
          ],
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [child],
      ),
    );
  }

  Widget _plainSection({
    required String number,
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                foregroundColor: Colors.white,
                child: Text(number, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 10),
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _bullet(String text, {IconData icon = Icons.circle, Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: icon == Icons.circle ? 7 : 18, color: color ?? navy),
          const SizedBox(width: 9),
          Expanded(child: Text(text, style: const TextStyle(height: 1.38))),
        ],
      ),
    );
  }

  Widget _rich(String label, String text, {Color color = navy}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, height: 1.42),
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }

  Widget _drugCard({
    required String name,
    required String brand,
    required String group,
    required String dose,
    required String role,
    required String adverse,
    required String controls,
    required String warnings,
    Color color = green,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.045),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.45)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$name — $brand',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 3),
          Text(group, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Divider(height: 20),
          _rich('Pauta', dose, color: color),
          _rich('Cuándo usarlo', role, color: color),
          _rich('RAM', adverse, color: color),
          _rich('Control', controls, color: color),
          _rich('Precauciones', warnings, color: color),
        ],
      ),
    );
  }

  Widget _quickSummary() {
    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: navy,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('HTA · RESUMEN RÁPIDO',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('Consulta rápida · diagnóstico · tratamiento · alarmas',
                  style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _plainSection(
          number: '1',
          title: 'Diagnóstico',
          icon: Icons.monitor_heart_outlined,
          color: blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Consulta ≥140/90 mmHg.'),
              _bullet('AMPA/MAPA diurna ≥135/85 mmHg.'),
              _bullet('MAPA 24 h ≥130/80 mmHg.'),
              _bullet('Confirmar generalmente en ≥2 visitas y, si es posible, con AMPA/MAPA.'),
            ],
          ),
        ),
        _plainSection(
          number: '2',
          title: 'Estudio inicial',
          icon: Icons.science_outlined,
          color: purple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Creatinina/FG · Na/K · glucemia · ácido úrico · perfil lipídico.'),
              _bullet('Sedimento y cociente albúmina/creatinina.'),
              _bullet('ECG; valorar fondo de ojo, ecocardiograma o ecografía renal según el caso.'),
            ],
          ),
        ),
        _plainSection(
          number: '3',
          title: 'Tratamiento',
          icon: Icons.medication_outlined,
          color: green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('Medidas no farmacológicas en todos: ↓ sal, peso si procede, ejercicio, dieta saludable, moderar alcohol y dejar tabaco.'),
              _bullet('Esquema habitual: IECA/ARA-II + calcioantagonista → añadir diurético si precisa.'),
              _bullet('Ramipril (Acovil®): 2,5 mg/24 h → máx. 10 mg/día.'),
              _bullet('Amlodipino (Norvas®): 5 mg/24 h → 10 mg/24 h.'),
              _bullet('Indapamida (Tertensif Retard®): 1,5 mg/24 h.'),
              _bullet('Carduran Neo® (doxazosina): 4 mg/24 h → máx. 8 mg/día. No es primera línea; útil sobre todo si HTA + HBP.'),
              _bullet('HTA resistente: confirmar adherencia/MAPA/secundaria → valorar espironolactona si función renal y K lo permiten.'),
            ],
          ),
        ),
        _plainSection(
          number: '4',
          title: 'Alarmas y derivación',
          icon: Icons.warning_amber_rounded,
          color: red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('PA muy elevada + daño agudo de órgano diana = emergencia hipertensiva → hospital.', icon: Icons.emergency, color: red),
              _bullet('Derivar si HTA secundaria sospechada, deterioro renal relevante/progresivo, embarazo o HTA resistente confirmada.'),
            ],
          ),
        ),
        _plainSection(
          number: '5',
          title: 'Complicaciones',
          icon: Icons.favorite_outline,
          color: orange,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bullet('❤️ Corazón: HVI, cardiopatía isquémica, IAM, IC, FA.'),
              _bullet('🧠 Cerebro: AIT, ictus, enfermedad de pequeño vaso, deterioro cognitivo vascular.'),
              _bullet('🫘 Riñón: albuminuria/proteinuria → ↓FG → ERC.'),
              _bullet('👁️ Retina: retinopatía, hemorragias, exudados, edema de papila en formas graves.'),
              _bullet('🩸 Vasos: aterosclerosis, EAP y mayor riesgo de enfermedad aórtica.'),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _topicSections({required bool expandable}) {
    final sections = <Widget>[];

    Widget add({
      required String number,
      required String title,
      required IconData icon,
      required Color color,
      required Widget child,
    }) {
      return expandable
          ? _sectionCard(number: number, title: title, icon: icon, color: color, child: child)
          : _plainSection(number: number, title: title, icon: icon, color: color, child: child);
    }

    sections.add(add(
      number: '1',
      title: 'Definición y diagnóstico',
      icon: Icons.monitor_heart_outlined,
      color: blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('HTA = elevación mantenida de la PA.'),
          _bullet('Consulta: ≥140/90 mmHg.'),
          _bullet('AMPA/MAPA diurna: ≥135/85 mmHg.'),
          _bullet('MAPA 24 h: ≥130/80 mmHg.'),
          _bullet('Confirmar generalmente en ≥2 visitas; hacer al menos dos mediciones separadas >1 min y usar el promedio.'),
          _bullet('Siempre que sea posible, confirmar mediante AMPA o MAPA.'),
          _rich('Bata blanca', 'PA elevada en consulta y normal fuera.'),
          _rich('Enmascarada', 'PA normal en consulta y elevada fuera.'),
          _rich('Resistente', 'PA ≥140/90 pese a ≥3 fármacos adecuados, incluido un diurético; comprobar adherencia, sustancias presoras y confirmar con MAPA.'),
        ],
      ),
    ));

    sections.add(add(
      number: '2',
      title: 'Fisiopatología práctica',
      icon: Icons.psychology_alt_outlined,
      color: purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PA ≈ gasto cardíaco × resistencia vascular periférica',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 10),
          _bullet('↑ actividad simpática + activación SRAA + retención renal de Na/agua + disfunción endotelial + rigidez/remodelado arterial.'),
          _bullet('Resultado: ↑ resistencia vascular y/o volumen circulante → HTA mantenida.'),
          const SizedBox(height: 8),
          _rich('IECA/ARA-II', '↓ SRAA.'),
          _rich('Calcioantagonistas', '↓ resistencia vascular.'),
          _rich('Diuréticos', '↓ Na⁺ y volumen.'),
          _bullet('Combinar mecanismos diferentes suele mejorar el control de la PA.', icon: Icons.lightbulb_outline, color: orange),
        ],
      ),
    ));

    sections.add(add(
      number: '3',
      title: 'Causas y factores asociados',
      icon: Icons.hub_outlined,
      color: orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('Más del 90% corresponde a HTA esencial.'),
          _bullet('Pensar en HTA secundaria ante presentación sugestiva, comienzo atípico, HTA resistente/refractaria o deterioro renal.'),
          _bullet('Revisar sustancias presoras: AINE, corticoides, determinados antidepresivos, anticonceptivos/hormonas, regaliz, entre otros.'),
        ],
      ),
    ));

    sections.add(add(
      number: '4',
      title: 'Evaluación inicial en Atención Primaria',
      icon: Icons.person_search_outlined,
      color: green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rich('Anamnesis', 'antecedentes familiares, estilo de vida, FRCV, comorbilidades, medicación, causas secundarias, enfermedad cardiovascular y lesión de órgano diana.'),
          _rich('Exploración', 'PA inicialmente en ambos brazos, FC, peso/talla/IMC, cardiovascular, pulsos, edemas, respiratorio, abdomen y tiroides.'),
          _bullet('Exploración neurológica cuando la clínica lo indique.'),
        ],
      ),
    ));

    sections.add(add(
      number: '5',
      title: 'Pruebas iniciales',
      icon: Icons.science_outlined,
      color: blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rich('Analítica', 'hemograma, creatinina/FG, Na, K, glucemia, ácido úrico, colesterol total/LDL/HDL y TG.'),
          _rich('Orina', 'sedimento + cociente albúmina/creatinina.'),
          _rich('ECG', 'especialmente para detectar HVI.'),
          _rich('AMPA/MAPA', 'confirmación diagnóstica, bata blanca, HTA enmascarada, variabilidad, HTA resistente y valoración del control.'),
          _bullet('Según el caso: fondo de ojo, ecocardiograma, ecografía renal y estudio dirigido de HTA secundaria.'),
        ],
      ),
    ));

    sections.add(add(
      number: '6',
      title: 'Complicaciones',
      icon: Icons.warning_amber_rounded,
      color: red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('❤️ Corazón: HVI, cardiopatía isquémica, IAM, insuficiencia cardiaca y FA.'),
          _bullet('🧠 Cerebro: AIT, ictus isquémico/hemorrágico, enfermedad de pequeño vaso y deterioro cognitivo vascular.'),
          _bullet('🫘 Riñón: albuminuria/proteinuria → ↓ FG → ERC.'),
          _bullet('👁️ Retina: retinopatía; en formas graves hemorragias, exudados y edema de papila.'),
          _bullet('🩸 Vasos: aterosclerosis, enfermedad arterial periférica y mayor riesgo de enfermedad aórtica.'),
          const SizedBox(height: 6),
          const Text('HTA → daño vascular → corazón + cerebro + riñón + retina + vasos',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ));

    sections.add(add(
      number: '7',
      title: 'Objetivos de PA',
      icon: Icons.flag_outlined,
      color: green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('Objetivo inicial general: <140/90 mmHg.'),
          _bullet('Si se tolera, intentar alrededor de ≤130/80 mmHg para la mayoría.'),
          _bullet('≤65 años: PAS 120–129 mmHg si se tolera.'),
          _bullet('>65 años: PAS 130–139 mmHg y PAD <80 mmHg.'),
          _bullet('Individualizar en ERC, ancianos y pacientes frágiles.'),
          _bullet('Evitar generalmente PA <120/70 mmHg.'),
        ],
      ),
    ));

    sections.add(add(
      number: '8',
      title: 'Tratamiento no farmacológico',
      icon: Icons.directions_walk_outlined,
      color: green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('Reducir sal.'),
          _bullet('Pérdida de peso si procede.'),
          _bullet('Ejercicio regular.'),
          _bullet('Moderar alcohol.'),
          _bullet('Dieta saludable.'),
          _bullet('Abandono del tabaco.'),
        ],
      ),
    ));

    sections.add(add(
      number: '9',
      title: 'Tratamiento farmacológico',
      icon: Icons.medication_outlined,
      color: green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('Iniciar inmediatamente si PA ≥160/100 mmHg o PA ≥140/90 + RCV alto/muy alto.'),
          _bullet('Familias fundamentales: IECA, ARA-II, calcioantagonistas y diuréticos tiazídicos/tiazida-like.'),
          _bullet('Los betabloqueantes no son primera línea salvo indicación específica.'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'ALGORITMO\nIECA/ARA-II + calcioantagonista\n↓ no controla\nIECA/ARA-II + calcioantagonista + diurético\n↓ no controla\nAdherencia + AMPA/MAPA + sustancias presoras + causas secundarias\n↓\nHTA resistente confirmada\n↓\nConsiderar 4.º fármaco',
              style: TextStyle(fontWeight: FontWeight.w700, height: 1.5),
            ),
          ),
          const SizedBox(height: 14),
          _drugCard(
            name: 'Ramipril',
            brand: 'Acovil®',
            group: 'IECA',
            dose: 'Inicio habitual 2,5 mg/24 h; titular según respuesta hasta 10 mg/día.',
            role: 'Especialmente útil cuando existe indicación cardiovascular o renal/albuminuria.',
            adverse: 'Tos, hiperpotasemia, hipotensión, deterioro renal y raramente angioedema.',
            controls: 'PA + creatinina/FG + K.',
            warnings: 'No combinar IECA + ARA-II. Contraindicado en embarazo.',
            color: blue,
          ),
          _drugCard(
            name: 'Amlodipino',
            brand: 'Norvas®',
            group: 'Calcioantagonista dihidropiridínico',
            dose: '5 mg/24 h → 10 mg/24 h según respuesta.',
            role: 'Muy útil asociado a IECA/ARA-II.',
            adverse: 'Edema maleolar, cefalea, rubefacción, mareo y palpitaciones.',
            controls: 'PA y tolerancia clínica.',
            warnings: 'Valorar edema y síntomas de hipotensión.',
            color: orange,
          ),
          _drugCard(
            name: 'Indapamida',
            brand: 'Tertensif Retard®',
            group: 'Diurético tiazida-like',
            dose: '1,5 mg/24 h, habitualmente por la mañana.',
            role: 'Puede utilizarse como tercer componente: IECA/ARA-II + amlodipino + indapamida.',
            adverse: 'Hiponatremia, hipopotasemia, hipotensión e hiperuricemia.',
            controls: 'Na + K + función renal ± ácido úrico.',
            warnings: 'Especial precaución si alteraciones hidroelectrolíticas o renales.',
            color: green,
          ),
          const SizedBox(height: 8),
          _bullet('HTA resistente: el texto aportado sitúa espironolactona como 4.º fármaco si función renal y K lo permiten.', icon: Icons.star_outline, color: purple),
        ],
      ),
    ));

    sections.add(add(
      number: '10',
      title: 'Doxazosina / Carduran Neo®',
      icon: Icons.star_rounded,
      color: purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rich('Grupo', 'alfabloqueante α1.', color: purple),
          _rich('Pauta', 'Carduran Neo 4 mg cada 24 h; si es necesario y se tolera, 8 mg/24 h (máximo).', color: purple),
          _rich('Lugar', 'NO es tratamiento inicial habitual. Se reserva como tratamiento añadido en pacientes seleccionados.', color: purple),
          _rich('Especial interés', 'HTA de difícil control + HBP con síntomas urinarios.', color: purple),
          _rich('Combinaciones', 'puede asociarse a IECA/ARA-II, calcioantagonista, diurético o añadirse a una combinación previa.', color: purple),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: purple.withOpacity(0.07),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'IECA/ARA-II + calcioantagonista + diurético\n↓ sigue elevada\nConfirmar verdadera HTA resistente\n↓\nEspironolactona si función renal/K permiten\n↓\nSi no es apropiada/no se tolera o hay perfil favorable\n↓\nValorar doxazosina, especialmente HTA + HBP',
              style: TextStyle(fontWeight: FontWeight.w700, height: 1.5),
            ),
          ),
          const SizedBox(height: 10),
          _rich('RAM', 'hipotensión ortostática, mareo, debilidad ± síncope.', color: red),
          _rich('Interacción importante', 'doxazosina + inhibidores PDE-5 (sildenafilo/tadalafilo) → mayor riesgo de hipotensión sintomática.', color: red),
          _bullet('Perla AP: varón con HTA + síntomas de HBP → puede ser especialmente útil, pero no sustituye automáticamente el esquema antihipertensivo de primera línea.', icon: Icons.lightbulb_outline, color: orange),
        ],
      ),
    ));

    sections.add(add(
      number: '11',
      title: 'Precauciones farmacológicas',
      icon: Icons.shield_outlined,
      color: orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('IECA/ARA-II: controlar creatinina y K; evitar embarazo y combinación IECA + ARA-II.'),
          _bullet('Diuréticos: controlar Na/K, función renal y considerar ácido úrico.'),
          _bullet('AINE: disminuyen el efecto de muchos antihipertensivos.'),
          _bullet('IECA/ARA-II + diurético + AINE → ↑ riesgo de lesión renal aguda.', icon: Icons.warning_amber_rounded, color: red),
          _bullet('Betabloqueante + verapamilo/diltiazem → riesgo de bradicardia, bloqueo AV e IC.', icon: Icons.warning_amber_rounded, color: red),
        ],
      ),
    ));

    sections.add(add(
      number: '12',
      title: 'PA muy elevada en el centro de salud',
      icon: Icons.emergency_outlined,
      color: red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rich('Pseudourgencia', 'elevación relacionada con dolor, ansiedad u otro desencadenante → reposo, tratar causa y repetir PA.', color: red),
          _rich('Urgencia hipertensiva', 'elevación importante sin afectación grave aguda de órgano diana → tratamiento oral cuando corresponda, reducción gradual y seguimiento estrecho.', color: red),
          _bullet('No utilizar nifedipino de acción rápida.', icon: Icons.close, color: red),
          _rich('Emergencia hipertensiva', 'PA muy elevada + daño agudo de órgano diana/síntomas graves neurológicos o cardiovasculares → estabilización inicial + traslado hospitalario inmediato.', color: red),
        ],
      ),
    ));

    sections.add(add(
      number: '13',
      title: 'Derivación',
      icon: Icons.route_outlined,
      color: red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('Sospecha de HTA secundaria.'),
          _bullet('Deterioro renal importante/progresivo o proteinuria relevante.'),
          _bullet('HTA en embarazo.'),
          _bullet('HTA resistente confirmada.'),
          _bullet('Necesidad de estudios no disponibles en AP.'),
          _bullet('Emergencia hipertensiva → derivación hospitalaria urgente.', icon: Icons.emergency, color: red),
        ],
      ),
    ));

    sections.add(add(
      number: '14',
      title: 'Seguimiento',
      icon: Icons.calendar_month_outlined,
      color: blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('Tras diagnóstico/inicio/modificación: revisión aproximadamente en 15 días–1 mes.'),
          _bullet('Valorar PA, adherencia, RAM y función renal/electrolitos cuando corresponda.'),
          _bullet('Una vez controlado: enfermería cada 3–6 meses y revisión médica programada anual, individualizando según situación clínica.'),
        ],
      ),
    ));

    sections.add(add(
      number: '15',
      title: 'Errores frecuentes',
      icon: Icons.error_outline,
      color: orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bullet('Manguito incorrecto.'),
          _bullet('Técnica incorrecta de PA.'),
          _bullet('No intensificar pese a mal control.'),
          _bullet('No valorar el riesgo cardiovascular global.'),
          _bullet('No comprobar adherencia.'),
          _bullet('Diagnosticar HTA resistente sin confirmación adecuada.'),
        ],
      ),
    ));

    return sections;
  }

  Widget _accordionView() {
    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        const Text(
          'Pulsa cada apartado para abrirlo o cerrarlo.',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ..._topicSections(expandable: true),
      ],
    );
  }

  Widget _fullTopicView() {
    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: navy,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HIPERTENSIÓN ARTERIAL',
                style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Tema completo · Atención Primaria',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ..._topicSections(expandable: false),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Text(
              'SEGURIDAD: contenido educativo. Antes de prescribir, comprobar ficha técnica vigente, alergias, embarazo, función renal/hepática, interacciones y protocolos locales.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hipertensión arterial'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.bolt), text: 'Resumen rápido'),
            Tab(icon: Icon(Icons.touch_app_outlined), text: 'Por apartados'),
            Tab(icon: Icon(Icons.menu_book_outlined), text: 'Tema completo'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _quickSummary(),
          _accordionView(),
          _fullTopicView(),
        ],
      ),
    );
  }
}


class DiabetesInteractivePage extends StatefulWidget {
  const DiabetesInteractivePage({super.key});
  @override
  State<DiabetesInteractivePage> createState() => _DiabetesInteractivePageState();
}

class _DiabetesInteractivePageState extends State<DiabetesInteractivePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  static const navy = Color(0xFF0C356A);
  static const green = Color(0xFF147A72);
  static const blue = Color(0xFF0C56A0);
  static const orange = Color(0xFFC77700);
  static const red = Color(0xFFB52C2C);
  static const purple = Color(0xFF67469A);

  @override
  void initState() { super.initState(); _tabs = TabController(length: 3, vsync: this); }
  @override
  void dispose() { _tabs.dispose(); super.dispose(); }

  Widget bullet(String t, {Color color = navy}) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(Icons.circle, size: 7, color: color), const SizedBox(width: 9),
      Expanded(child: Text(t, style: const TextStyle(height: 1.4))),
    ]),
  );

  Widget rich(String a, String b, {Color color = navy}) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: RichText(text: TextSpan(style: const TextStyle(color: Colors.black87, height: 1.4), children: [
      TextSpan(text: '$a: ', style: TextStyle(fontWeight: FontWeight.bold, color: color)),
      TextSpan(text: b),
    ])),
  );

  Widget section(String n, String title, IconData icon, Color color, List<Widget> children,
      {bool expandable = true}) {
    final body = Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
    if (!expandable) return Card(
      margin: const EdgeInsets.only(bottom: 12), elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: color.withOpacity(.35))),
      child: Column(children: [
        ListTile(leading: CircleAvatar(backgroundColor: color, foregroundColor: Colors.white, child: Text(n)),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)), leadingAndTrailingTextStyle: const TextStyle()),
        body,
      ]),
    );
    return Card(
      margin: const EdgeInsets.only(bottom: 10), elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: color.withOpacity(.35))),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: color, foregroundColor: Colors.white, child: Text(n)),
        title: Row(children: [Icon(icon, color: color), const SizedBox(width: 8), Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)))]),
        children: [body],
      ),
    );
  }

  Widget drug(String name, String brand, String dose, String use, String ram, String caution) => Container(
    margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: green.withOpacity(.05), borderRadius: BorderRadius.circular(14), border: Border.all(color: green.withOpacity(.4))),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('$name — $brand', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: green)),
      const Divider(), rich('Pauta', dose, color: green), rich('Perfil útil', use, color: green),
      rich('RAM', ram, color: orange), rich('Precauciones', caution, color: red),
    ]),
  );

  List<Widget> content({required bool expandable}) => [
    section('1','Diagnóstico',Icons.biotech_outlined,blue,[
      bullet('Diabetes: HbA1c ≥6,5%, glucemia basal ≥126 mg/dL, glucemia a las 2 h de SOG ≥200 mg/dL o glucemia al azar ≥200 mg/dL con síntomas clásicos.'),
      bullet('En ausencia de hiperglucemia inequívoca, confirmar el diagnóstico con una segunda determinación.'),
      rich('Prediabetes','identificarla como oportunidad para intervenir sobre peso, alimentación, ejercicio y riesgo cardiovascular.'),
      bullet('Si presentación atípica, pérdida ponderal marcada, cetosis o rápida necesidad de insulina: reconsiderar DM1/LADA u otros tipos.'),
    ], expandable: expandable),
    section('2','Evaluación inicial en AP',Icons.person_search_outlined,purple,[
      bullet('Peso, IMC, cintura, PA, tabaquismo, alimentación, actividad física, síntomas de hiper/hipoglucemia y tratamiento previo.'),
      bullet('HbA1c, perfil lipídico, creatinina/FGe y cociente albúmina/creatinina; valorar función hepática y ECG según contexto.'),
      bullet('Explorar pies y pulsos; cribado de retinopatía desde el diagnóstico de DM2.'),
      bullet('Buscar ECV aterosclerótica, insuficiencia cardiaca, ERC, obesidad y fragilidad: cambian la elección farmacológica.'),
    ], expandable: expandable),
    section('3','Objetivos',Icons.flag_outlined,green,[
      bullet('HbA1c <7% es un objetivo razonable para muchos adultos, siempre individualizado.'),
      bullet('Puede plantearse <6,5% en personas seleccionadas, jóvenes y sin hipoglucemia significativa.'),
      bullet('Objetivos menos estrictos (p. ej. 7,5–8,5%) pueden ser apropiados en fragilidad, comorbilidad importante, hipoglucemias o expectativa de vida limitada.'),
      bullet('El objetivo no es solo glucémico: controlar PA, lípidos, tabaco, peso y riesgo cardiorrenal.'),
    ], expandable: expandable),
    section('4','¿Qué le pongo a este paciente?',Icons.alt_route_outlined,orange,[
      rich('DM2 + insuficiencia cardiaca','priorizar iSGLT2 con beneficio demostrado.'),
      rich('DM2 + ERC','priorizar iSGLT2 si está indicado por FGe; considerar arGLP-1 según perfil y necesidad adicional.'),
      rich('DM2 + ECV/alto riesgo','priorizar iSGLT2 y/o arGLP-1 con beneficio cardiovascular demostrado.'),
      rich('DM2 + obesidad','priorizar fármacos con pérdida ponderal relevante, especialmente arGLP-1 o agonismo GIP/GLP-1 cuando estén indicados.'),
      rich('Fragilidad/alto riesgo de hipoglucemia','simplificar y priorizar fármacos con bajo riesgo de hipoglucemia; evitar sobretratamiento.'),
      rich('Hiperglucemia muy marcada + síntomas/catabolismo/cetosis','valorar insulinización desde el inicio y descartar descompensación aguda.'),
    ], expandable: expandable),
    section('5','Tratamiento farmacológico',Icons.medication_outlined,green,[
      drug('Metformina','Dianben®','Empezar bajo (p. ej. 500–850 mg con comida) y titular progresivamente; dosis según tolerancia y función renal.','Base frecuente si se tolera; bajo riesgo de hipoglucemia y neutra en peso.','Digestivas; posible déficit de B12 a largo plazo.','No usar con FGe <30. Revisar función renal y situaciones de hipoxia/deshidratación grave; manejo del contraste según FGe y protocolo actual.'),
      drug('Empagliflozina','Jardiance®','10 mg/24 h; en control glucémico puede aumentarse según ficha técnica.','Especial interés en IC/ERC y determinados perfiles cardiovasculares.','Micosis genital, poliuria, depleción de volumen; rara cetoacidosis euglucémica.','Educar en sick-day rules; suspender temporalmente ante ayuno/cirugía/enfermedad aguda de riesgo. Vigilar volemia y FGe.'),
      drug('Dapagliflozina','Forxiga®','10 mg/24 h.','Protección cardiorrenal; especialmente útil en IC/ERC cuando esté indicada.','Micosis genital, depleción de volumen; rara cetoacidosis.','Precaución en deshidratación, ayuno prolongado y cirugía; revisar FGe/ficha técnica.'),
      drug('Semaglutida','Ozempic®','0,25 mg/semana 4 semanas → 0,5 mg/semana; escalado posterior según ficha técnica.','Alta eficacia glucémica y pérdida de peso; beneficio CV en perfiles indicados.','Náuseas, vómitos, diarrea/estreñimiento; litiasis biliar.','Escalado lento; precaución si gastroparesia o antecedentes relevantes. No combinar con iDPP-4.'),
      drug('Tirzepatida','Mounjaro®','Inicio habitual 2,5 mg SC semanal; después 5 mg y escalado gradual según respuesta, tolerancia y ficha técnica.','Muy alta eficacia glucémica y ponderal cuando esté indicada.','Náuseas, diarrea, vómitos y otros efectos gastrointestinales.','Escalado gradual; revisar indicación, financiación y ficha técnica vigente. Ajustar secretagogos/insulina si riesgo de hipoglucemia.'),
      drug('Gliclazida MR','Diamicron® MR','Inicio y titulación según presentación/ficha técnica, habitualmente una toma con desayuno.','Alternativa de bajo coste cuando se necesita potencia glucémica y el riesgo de hipoglucemia es aceptable.','Hipoglucemia y aumento de peso.','Especial precaución en mayores, ingestas irregulares y ERC. Reducir/retirar al iniciar insulina si procede.'),
      drug('Linagliptina','Trajenta®','5 mg/24 h.','Opción sencilla con bajo riesgo de hipoglucemia; útil cuando se busca neutralidad ponderal.','Generalmente bien tolerada; raramente pancreatitis/artralgia intensa.','No precisa ajuste renal; no combinar con arGLP-1.'),
    ], expandable: expandable),
    section('6','Insulinización práctica',Icons.vaccines_outlined,blue,[
      bullet('Considerar insulina si hiperglucemia sintomática/catabolismo, cetosis, descompensación o control muy insuficiente pese a tratamiento adecuado.'),
      rich('Inicio basal','10 U/día o aproximadamente 0,1–0,2 U/kg/día; individualizar.'),
      rich('Titulación práctica','ajustar cada 3–4 días según glucemia basal y protocolo local; evitar la inercia y reducir dosis si aparecen hipoglucemias.'),
      bullet('Mantener habitualmente metformina y fármacos con beneficio cardiorrenal si siguen indicados/tolerados; revisar sulfonilureas y glinidas por hipoglucemia.'),
      rich('Si HbA1c sigue alta con basal en objetivo','buscar hiperglucemia posprandial; valorar arGLP-1/agonismo incretínico o añadir insulina prandial según perfil.'),
      rich('Basal-plus','puede iniciarse un bolo de rápida en la comida de mayor excursión glucémica y titular progresivamente.'),
    ], expandable: expandable),
    section('7','Hipoglucemia',Icons.warning_amber_rounded,red,[
      bullet('Glucosa <70 mg/dL: tratar de inmediato si el paciente está consciente y puede tragar.'),
      rich('Regla 15-15','15 g de hidrato de carbono de absorción rápida → repetir glucemia a los 15 min → repetir si continúa <70 mg/dL.'),
      bullet('Después, identificar la causa y ajustar insulina/secretagogos si corresponde.'),
      bullet('Alteración de conciencia o imposibilidad para vía oral: glucagón si disponible y activar asistencia urgente; no administrar alimentos por boca.'),
    ], expandable: expandable),
    section('8','Descompensación y urgencias',Icons.emergency_outlined,red,[
      bullet('Sospechar cetoacidosis ante náuseas/vómitos, dolor abdominal, deshidratación, respiración anormal, cetonas o deterioro general; puede existir cetoacidosis con glucosa no muy elevada en iSGLT2.'),
      bullet('Estado hiperosmolar: hiperglucemia marcada + deshidratación + alteración neurológica, habitualmente en DM2.'),
      bullet('Cetoacidosis o estado hiperosmolar = derivación hospitalaria urgente. En AP: ABC, constantes, glucemia, cetonas si disponibles, vía venosa y fluidoterapia inicial si está indicada mientras se coordina traslado.'),
      bullet('No improvisar perfusiones IV de insulina en un centro sin monitorización/protocolo y capacidad de control de potasio.'),
    ], expandable: expandable),
    section('9','Seguimiento y complicaciones',Icons.fact_check_outlined,purple,[
      bullet('HbA1c cada ~3 meses si cambios terapéuticos o fuera de objetivo; espaciar cuando estable según situación clínica.'),
      bullet('Al menos anualmente: FGe y albuminuria; más frecuente si ERC/albuminuria.'),
      bullet('Revisión periódica de pies, riesgo de úlcera, pulsos y neuropatía; educación diaria de autocuidado en pacientes de riesgo.'),
      bullet('Cribado de retinopatía desde el diagnóstico de DM2 y periodicidad según hallazgos/programa autonómico.'),
      bullet('Revisar vacunación, salud bucodental, tabaquismo, PA, lípidos, peso, adherencia y técnica de inyección si usa insulina.'),
    ], expandable: expandable),
    section('10','Cuándo derivar',Icons.local_hospital_outlined,red,[
      rich('Urgente','cetoacidosis/estado hiperosmolar, hipoglucemia grave persistente, deterioro neurológico, deshidratación grave o sospecha de DM1 con descompensación.'),
      rich('Especializada','duda diagnóstica DM1/LADA/MODY, embarazo, control persistentemente complejo, complicaciones avanzadas o necesidad de tecnología/insulinización compleja según circuito local.'),
    ], expandable: expandable),
  ];

  Widget quick() => ListView(padding: const EdgeInsets.all(14), children: [
    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(18)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('DM2 · RESUMEN RÁPIDO', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
      SizedBox(height: 5), Text('Consulta rápida · tratamiento por perfil · insulinización · urgencias', style: TextStyle(color: Colors.white70)),
    ])), const SizedBox(height: 12),
    section('1','Diagnóstico',Icons.biotech_outlined,blue,[bullet('HbA1c ≥6,5% o glucemia basal ≥126 mg/dL; confirmar si no hay hiperglucemia inequívoca.'), bullet('Glucemia al azar ≥200 mg/dL + síntomas clásicos permite diagnóstico.')], expandable:false),
    section('2','Elección rápida',Icons.alt_route_outlined,orange,[rich('IC','iSGLT2.'),rich('ERC','iSGLT2 prioritario según FGe/indicación.'),rich('ECV/alto RCV','iSGLT2 y/o arGLP-1 con beneficio demostrado.'),rich('Obesidad','arGLP-1 o agonismo GIP/GLP-1 según indicación.'),rich('Fragilidad','seguridad, simplificación y evitar hipoglucemia.')], expandable:false),
    section('3','Insulina',Icons.vaccines_outlined,green,[bullet('Si síntomas/catabolismo/cetosis o hiperglucemia muy marcada: valorar insulina.'),bullet('Basal: 10 U/día o 0,1–0,2 U/kg/día; titular según glucemia basal y protocolo.')], expandable:false),
    section('4','Urgencias',Icons.emergency_outlined,red,[bullet('Cetoacidosis/estado hiperosmolar/hipoglucemia grave → actuación inicial + derivación urgente.'),bullet('Con iSGLT2, recordar posible cetoacidosis euglucémica.')], expandable:false),
  ]);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Diabetes mellitus tipo 2'), bottom: TabBar(controller: _tabs, tabs: const [
      Tab(icon: Icon(Icons.flash_on), text: 'Resumen'), Tab(icon: Icon(Icons.touch_app), text: 'Apartados'), Tab(icon: Icon(Icons.menu_book), text: 'Tema completo'),
    ])),
    body: TabBarView(controller: _tabs, children: [
      quick(), ListView(padding: const EdgeInsets.all(14), children: content(expandable:true)), ListView(padding: const EdgeInsets.all(14), children: content(expandable:false)),
    ]),
  );
}


class AnxietyInteractivePage extends StatefulWidget {
  const AnxietyInteractivePage({super.key});
  @override
  State<AnxietyInteractivePage> createState() => _AnxietyInteractivePageState();
}

class _AnxietyInteractivePageState extends State<AnxietyInteractivePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  static const navy = Color(0xFF0C356A);
  static const blue = Color(0xFF0C56A0);
  static const green = Color(0xFF147A72);
  static const orange = Color(0xFFC77700);
  static const red = Color(0xFFB52C2C);
  static const purple = Color(0xFF67469A);
  final List<int> _gad7 = List<int>.filled(7, 0);

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  int get _gadTotal => _gad7.fold(0, (a, b) => a + b);
  String get _gadSeverity {
    final s = _gadTotal;
    if (s <= 4) return 'Ansiedad mínima';
    if (s <= 9) return 'Ansiedad leve';
    if (s <= 14) return 'Ansiedad moderada';
    return 'Ansiedad grave';
  }

  Widget bullet(String text, {Color color = navy, IconData icon = Icons.circle}) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, size: icon == Icons.circle ? 7 : 18, color: color),
      const SizedBox(width: 9),
      Expanded(child: Text(text, style: const TextStyle(height: 1.4))),
    ]),
  );

  Widget rich(String label, String text, {Color color = navy}) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: RichText(text: TextSpan(
      style: const TextStyle(color: Colors.black87, height: 1.4),
      children: [
        TextSpan(text: '$label: ', style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        TextSpan(text: text),
      ],
    )),
  );

  Widget section(String n, String title, IconData icon, Color color, List<Widget> children,
      {bool expandable = true}) {
    final body = Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
    if (!expandable) {
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: color.withOpacity(.35)),
        ),
        child: Column(children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: color, foregroundColor: Colors.white, child: Text(n)),
            title: Row(children: [
              Icon(icon, color: color), const SizedBox(width: 8),
              Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color))),
            ]),
          ),
          body,
        ]),
      );
    }
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withOpacity(.35)),
      ),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: color, foregroundColor: Colors.white, child: Text(n)),
        title: Row(children: [
          Icon(icon, color: color), const SizedBox(width: 8),
          Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color))),
        ]),
        children: [body],
      ),
    );
  }

  Widget drug(String name, String brand, String dose, String role, String adverse, String cautions,
      {Color color = green}) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: color.withOpacity(.05),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: color.withOpacity(.4)),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('$name — $brand', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: color)),
      const Divider(),
      rich('Pauta', dose, color: color),
      rich('Cuándo usarlo', role, color: color),
      rich('RAM', adverse, color: orange),
      rich('Precauciones', cautions, color: red),
    ]),
  );

  List<Widget> content({required bool expandable}) => [
    section('1', 'Concepto y tipos', Icons.psychology_alt_outlined, purple, [
      bullet('La ansiedad puede ser fisiológica. Es patológica cuando es desproporcionada, persistente y provoca deterioro funcional o malestar significativo.'),
      rich('TAG', 'preocupación excesiva y difícil de controlar durante ≥6 meses, habitualmente sobre múltiples áreas de la vida.'),
      rich('Pánico', 'ataques súbitos de miedo intenso que alcanzan máxima intensidad en minutos.'),
      bullet('También valorar agorafobia, fobia específica, ansiedad social, ansiedad inducida por sustancias/fármacos y ansiedad secundaria a enfermedad médica.'),
    ], expandable: expandable),
    section('2', 'Evaluación en consulta', Icons.person_search_outlined, blue, [
      bullet('Preguntar qué síntomas tiene, desde cuándo, desencadenantes, frecuencia, duración e interferencia en trabajo, familia, sueño y actividades.'),
      bullet('Buscar siempre depresión, consumo de alcohol/drogas, medicación potencialmente causal y otros trastornos psiquiátricos.'),
      bullet('Valorar riesgo autolítico cuando exista depresión, desesperanza, ideación de muerte, impulsividad o clínica intensa.'),
      rich('Constantes/exploración', 'TA, FC, SatO₂ y exploración cardiopulmonar/neurológica dirigida según síntomas.'),
    ], expandable: expandable),
    section('3', 'Antes de etiquetar como ansiedad', Icons.health_and_safety_outlined, red, [
      bullet('No atribuir automáticamente dolor torácico, disnea, palpitaciones, síncope o mareo a ansiedad.'),
      bullet('Considerar arritmia/SCA, asma-EPOC/hipoxia, hipertiroidismo, hipoglucemia, alteraciones electrolíticas, anemia y patología neurológica según contexto.'),
      bullet('Revisar cafeína/energéticas, cocaína/anfetaminas, alcohol y abstinencia, corticoides, hormona tiroidea, β2-agonistas y otros estimulantes.'),
      rich('Pruebas', 'no son obligatorias en todos. Solicitar hemograma, glucemia, función renal/electrolitos, TSH ± T4L, ECG u otras pruebas solo si la historia/exploración lo justifican.'),
    ], expandable: expandable),
    section('4', 'Tratamiento no farmacológico', Icons.self_improvement_outlined, green, [
      bullet('Psicoeducación: explicar el cuadro sin banalizarlo y acordar objetivos funcionales.'),
      bullet('Ejercicio regular, higiene del sueño, reducir cafeína/energéticas, evitar alcohol/drogas, apoyo social y técnicas de manejo del estrés.'),
      rich('Respiración lenta', 'inspirar 4 s → mantener 2 s → espirar 6 s; evitar respiración rápida y profunda durante hiperventilación.'),
      rich('TCC', 'tratamiento fundamental cuando está disponible; puede incluir exposición, reestructuración cognitiva, respiración/relajación y resolución de problemas.'),
    ], expandable: expandable),
    section('5', 'Tratamiento farmacológico', Icons.medication_outlined, green, [
      bullet('Si TAG moderado-grave, persistente o con deterioro funcional y se precisa medicación: los ISRS son una opción farmacológica de primera línea.'),
      bullet('En pacientes muy ansiosos: START LOW – GO SLOW. Explicar que el beneficio tarda varias semanas y que puede existir activación inicial transitoria.'),
      drug('Sertralina', 'Besitran®', 'Inicio práctico 25 mg/día → 50 mg/día; titular según respuesta hasta 200 mg/día.', 'ISRS de uso frecuente en AP.', 'Náuseas/diarrea, cefalea, insomnio o somnolencia, activación inicial y disfunción sexual.', 'Vigilar ideación suicida al inicio/cambios de dosis, hiponatremia, sangrado y síndrome serotoninérgico.'),
      drug('Escitalopram', 'Cipralex®', 'Inicio 5 mg/día → habitualmente 10 mg/día; máximo habitual 20 mg/día.', 'ISRS útil en TAG/pánico según indicación.', 'Náuseas, cefalea, alteraciones del sueño y disfunción sexual.', 'Precaución con QT prolongado, hiponatremia, bipolaridad y fármacos serotoninérgicos.'),
      drug('Venlafaxina retard', 'Vandral Retard®', 'Inicio 37,5 mg/día → habitualmente 75 mg/día; titular según respuesta.', 'Alternativa ISRSN si intolerancia o respuesta insuficiente a ISRS.', 'Náuseas, insomnio, sudoración, disfunción sexual y síntomas de retirada.', 'Controlar PA; retirada gradual. Precaución en riesgo cardiovascular y con otros serotoninérgicos.'),
      drug('Duloxetina', 'Cymbalta®', 'Inicio habitual 30 mg/día → 60 mg/día.', 'ISRSN; puede resultar útil cuando coexisten determinados síndromes dolorosos.', 'Náuseas, sequedad de boca, somnolencia/insomnio y disfunción sexual.', 'Precaución en hepatopatía, consumo importante de alcohol y función renal reducida; retirada gradual.'),
    ], expandable: expandable),
    section('6', 'Benzodiacepinas: uso excepcional', Icons.warning_amber_rounded, red, [
      bullet('No utilizarlas rutinariamente como tratamiento crónico del TAG.'),
      bullet('Pueden considerarse de forma puntual en crisis intensa o necesidad de control rápido, con la dosis mínima y durante el menor tiempo posible.'),
      drug('Lorazepam', 'Orfidal®', 'Crisis intensa seleccionada: 0,5–1 mg VO, individualizando.', 'Rescate puntual cuando las medidas no farmacológicas no son suficientes y no hay contraindicaciones.', 'Sedación, alteración psicomotora, amnesia, caídas, tolerancia y dependencia.', 'Evitar/usar con especial cautela en mayores, SAOS/insuficiencia respiratoria, embarazo, antecedentes de dependencia, alcohol, opioides y conducción.' , color: red),
      bullet('Si se ha usado de forma mantenida, no retirar bruscamente: planificar descenso gradual.'),
    ], expandable: expandable),
    section('7', 'Crisis de ansiedad/pánico en AP', Icons.emergency_outlined, orange, [
      bullet('Primero descartar urgencia orgánica según clínica: SCA, arritmia, TEP, hipoxia, crisis asmática, hipoglucemia, intoxicación o abstinencia.'),
      bullet('Si el cuadro es compatible con pánico: ambiente tranquilo, acompañamiento, explicación breve y respiración lenta.'),
      bullet('Si persiste una crisis muy intensa, puede valorarse benzodiacepina oral puntual en paciente seleccionado; evitar convertirla en pauta crónica.'),
    ], expandable: expandable),
    section('8', 'Seguimiento', Icons.fact_check_outlined, blue, [
      bullet('Tras iniciar fármaco: revisión aproximada en 1–2 semanas; antes si riesgo clínico.'),
      bullet('Valorar adherencia, empeoramiento inicial, RAM, funcionamiento, consumo de alcohol/BZD e ideación autolítica.'),
      bullet('Si no hay respuesta tras ensayo adecuado: revisar diagnóstico, adherencia, sustancias/comorbilidad, optimizar dosis, cambiar estrategia y valorar Salud Mental.'),
      bullet('Utilizar GAD-7 como apoyo para cuantificar evolución; no sustituye la entrevista clínica.'),
    ], expandable: expandable),
    section('9', 'Derivación', Icons.local_hospital_outlined, red, [
      rich('Urgente', 'ideación suicida con riesgo significativo, intento autolítico, psicosis, agitación grave, incapacidad importante para autocuidado, intoxicación/abstinencia grave o sospecha orgánica grave.'),
      rich('Salud Mental', 'síntomas graves/incapacitantes, diagnóstico incierto, comorbilidad psiquiátrica compleja, necesidad de psicoterapia especializada o falta de respuesta a tratamiento correcto.'),
    ], expandable: expandable),
  ];

  Widget quick() => ListView(
    padding: const EdgeInsets.all(14),
    children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(18)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('ANSIEDAD · RESUMEN RÁPIDO', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Descartar organicidad · tratamiento · crisis · alarmas', style: TextStyle(color: Colors.white70)),
        ]),
      ),
      const SizedBox(height: 12),
      section('1', 'Primero descarta urgencia', Icons.health_and_safety_outlined, red, [
        bullet('Dolor torácico, disnea, síncope, hipoxia, arritmia, hipoglucemia o presentación atípica → valorar causa orgánica antes de etiquetar ansiedad.'),
      ], expandable: false),
      section('2', 'Tratamiento', Icons.medication_outlined, green, [
        bullet('Leve/situacional: educación + ejercicio + sueño + reducción de cafeína + TCC/intervención psicológica.'),
        bullet('Persistente/moderada-grave: TCC ± ISRS. Empezar bajo y titular lentamente.'),
        bullet('BZD: solo puntual si es necesaria; evitar cronificación.'),
      ], expandable: false),
      section('3', 'Seguimiento y alarmas', Icons.warning_amber_rounded, orange, [
        bullet('Revisar en 1–2 semanas tras iniciar fármaco.'),
        bullet('Siempre valorar depresión, alcohol/drogas e ideación suicida.'),
        bullet('Riesgo suicida significativo, psicosis o agitación grave → Urgencias.'),
      ], expandable: false),
    ],
  );

  Widget gad7() {
    const questions = [
      'Sentirse nervioso/a, ansioso/a o con los nervios de punta',
      'No poder parar o controlar la preocupación',
      'Preocuparse demasiado por diferentes cosas',
      'Dificultad para relajarse',
      'Estar tan inquieto/a que cuesta quedarse quieto/a',
      'Molestarse o irritarse fácilmente',
      'Sentir miedo como si algo terrible pudiera pasar',
    ];
    const labels = ['Nunca', 'Varios días', 'Más de la mitad', 'Casi cada día'];
    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(18)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('GAD-7', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('En las últimas 2 semanas, ¿con qué frecuencia le han molestado estos problemas?', style: TextStyle(color: Colors.white70)),
          ]),
        ),
        const SizedBox(height: 12),
        for (int i = 0; i < questions.length; i++)
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${i + 1}. ${questions[i]}', style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: List.generate(4, (score) => ChoiceChip(
                    label: Text('$score · ${labels[score]}'),
                    selected: _gad7[i] == score,
                    onSelected: (_) => setState(() => _gad7[i] = score),
                  )),
                ),
              ]),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF3EEFA),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: purple.withOpacity(.4)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Puntuación total: $_gadTotal / 21', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: purple)),
            const SizedBox(height: 6),
            Text(_gadSeverity, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('Orientación: 0–4 mínima · 5–9 leve · 10–14 moderada · 15–21 grave. La escala apoya el seguimiento, pero no establece por sí sola el diagnóstico.', style: TextStyle(height: 1.4)),
          ]),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => setState(() { for (var i = 0; i < _gad7.length; i++) _gad7[i] = 0; }),
          icon: const Icon(Icons.restart_alt),
          label: const Text('Reiniciar GAD-7'),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Ansiedad'),
      bottom: TabBar(
        controller: _tabs,
        isScrollable: true,
        tabs: const [
          Tab(icon: Icon(Icons.flash_on), text: 'Resumen'),
          Tab(icon: Icon(Icons.touch_app), text: 'Apartados'),
          Tab(icon: Icon(Icons.menu_book), text: 'Tema completo'),
          Tab(icon: Icon(Icons.calculate_outlined), text: 'GAD-7'),
        ],
      ),
    ),
    body: TabBarView(
      controller: _tabs,
      children: [
        quick(),
        ListView(padding: const EdgeInsets.all(14), children: content(expandable: true)),
        ListView(padding: const EdgeInsets.all(14), children: content(expandable: false)),
        gad7(),
      ],
    ),
  );
}

class TopicDetailPage extends StatelessWidget {
  final ClinicalTopic topic;
  const TopicDetailPage({super.key, required this.topic});

  Widget infoCard(String title, IconData icon, Color color, String body) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(backgroundColor: color.withValues(alpha: 0.12), child: Icon(icon, color: color)),
            const SizedBox(width: 9),
            Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 17))),
          ]),
          const SizedBox(height: 12),
          Text(body, style: const TextStyle(height: 1.4)),
        ],
      ),
    );
  }

  Widget drugCard(DrugOption d, int index) {
    const colors = [Color(0xFF15805A), Color(0xFFD87A00), Color(0xFF6546A6)];
    final c = colors[index % colors.length];
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.withValues(alpha: 0.55), width: 1.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(backgroundColor: c.withValues(alpha: 0.12), child: Icon(Icons.medication, color: c)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${index + 1}. ${d.generic}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: c)),
                Text('${d.brand} · ${d.presentation}', style: const TextStyle(fontWeight: FontWeight.w600)),
              ]),
            ),
          ]),
          const Divider(height: 22),
          _row('POSOLOGÍA', d.dose),
          _row('DURACIÓN', d.duration),
          _row('CONTRAINDICACIONES', d.contraindications),
          _row('INTERACCIONES', d.interactions),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, height: 1.4),
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0C356A))),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF0C356A);
    return Scaffold(
      appBar: AppBar(title: Text(topic.title)),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Text('ALGORITMO DE MANEJO EN ATENCIÓN PRIMARIA',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(topic.title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26)),
                const SizedBox(height: 8),
                const Text('Guías clínicas + fichas técnicas AEMPS/CIMA',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 12),

          LayoutBuilder(builder: (context, constraints) {
            final twoCols = constraints.maxWidth > 700;
            final cards = [
              infoCard('DEFINICIÓN', Icons.menu_book, const Color(0xFF0C56A0), topic.definition),
              infoCard('CLASIFICACIÓN', Icons.fact_check, const Color(0xFF2C7D59), topic.classification),
              infoCard('ETIOLOGÍA Y CAUSAS', Icons.hub, const Color(0xFFD98A00), topic.causes),
              infoCard('CLÍNICA', Icons.person, const Color(0xFF6950A1), topic.symptoms),
            ];
            if (!twoCols) {
              return Column(children: [
                for (final c in cards) ...[c, const SizedBox(height: 10)]
              ]);
            }
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.2,
              children: cards,
            );
          }),

          const SizedBox(height: 4),
          infoCard('DIAGNÓSTICO EN ATENCIÓN PRIMARIA', Icons.medical_services_outlined, const Color(0xFF0C56A0), topic.diagnosis),
          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F6FF),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF9BC1ED)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(children: [
                  CircleAvatar(backgroundColor: navy, child: Text('6', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  SizedBox(width: 10),
                  Text('TRATAMIENTO', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy)),
                ]),
                const SizedBox(height: 8),
                const Text('Opciones frecuentes orientativas según perfil clínico. No son intercambiables automáticamente.',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 14),
                infoCard('MEDIDAS GENERALES Y ESTILO DE VIDA', Icons.directions_walk, const Color(0xFF2C7D59), topic.generalMeasures),
                const SizedBox(height: 14),
                for (int i = 0; i < topic.treatments.length; i++) drugCard(topic.treatments[i], i),
              ],
            ),
          ),

          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4F2),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE7A19B)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                CircleAvatar(backgroundColor: Color(0xFFB52C2C), child: Text('7', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                SizedBox(width: 10),
                Expanded(child: Text('CRITERIOS DE DERIVACIÓN', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFF8F2020)))),
              ]),
              const SizedBox(height: 10),
              Text(topic.referral, style: const TextStyle(height: 1.45)),
            ]),
          ),
          const SizedBox(height: 12),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'SEGURIDAD: contenido educativo para profesionales. Antes de prescribir, verificar ficha técnica AEMPS/CIMA, alergias, embarazo, función renal/hepática, interacciones, resistencias locales y protocolos del área sanitaria.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
