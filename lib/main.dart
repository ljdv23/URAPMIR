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
      home: const TopicListPage(),
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
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TopicDetailPage(topic: t))),
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
          infoCard('DIAGNÓSTICO EN ATENCIÓN PRIMARIA', Icons.stethoscope, const Color(0xFF0C56A0), topic.diagnosis),
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
