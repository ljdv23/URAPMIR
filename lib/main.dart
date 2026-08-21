import 'package:flutter/material.dart';

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
];

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
      appBar: AppBar(title: const Text('URAPMIR'), centerTitle: true),
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
  @override
  Widget build(BuildContext context) {
    const options = [
      'Preguntas aleatorias',
      'Simulacro de 200 preguntas',
      'Por especialidad',
      'Por tema',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('EXAMEN MIR')),
      body: ListView.separated(
        padding: const EdgeInsets.all(18),
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: const Icon(Icons.quiz_outlined),
            title: Text(options[i]),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${options[i]}: banco MIR pendiente de incorporar.')),
            ),
          ),
        ),
      ),
    );
  }
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
            subtitle: const Text('Algoritmo de actuación en Atención Primaria'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${names[i]}: contenido clínico pendiente de incorporar.')),
            ),
          ),
        ),
      ),
    );
  }
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
            Text('ATENCIÓN PRIMARIA · v1.3', style: TextStyle(fontSize: 12)),
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
