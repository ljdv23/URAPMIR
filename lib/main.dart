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
            subtitle: Text(
              i == 0
                  ? 'Actuación rápida · ECG · medicación · traslado'
                  : 'Algoritmo de actuación en Atención Primaria',
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
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${names[i]}: contenido clínico pendiente de incorporar.')),
                );
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
            Text('URGENCIAS · ATENCIÓN PRIMARIA',
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

enum StrokeCtPattern {
  earlyIschemia,
  establishedIschemia,
  hyperdenseMca,
  intraparenchymalHemorrhage,
  subarachnoidHemorrhage,
}

class StrokeCtIllustration extends StatelessWidget {
  final StrokeCtPattern pattern;
  const StrokeCtIllustration({super.key, required this.pattern});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.28,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF05070A),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFBFC6CE)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: CustomPaint(
            painter: _StrokeCtPainter(pattern),
          ),
        ),
      ),
    );
  }
}

class _StrokeCtPainter extends CustomPainter {
  final StrokeCtPattern pattern;
  _StrokeCtPainter(this.pattern);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.shortestSide * 0.41;

    final skull = Paint()
      ..color = const Color(0xFFE6E8EB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;
    final brain = Paint()..color = const Color(0xFF7A7F86);
    final ventricle = Paint()..color = const Color(0xFF252A30);
    final sulcus = Paint()
      ..color = const Color(0xFF50555C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawOval(
      Rect.fromCenter(center: c, width: r * 2.03, height: r * 1.72),
      brain,
    );
    canvas.drawOval(
      Rect.fromCenter(center: c, width: r * 2.10, height: r * 1.80),
      skull,
    );

    final leftV = Path()
      ..moveTo(c.dx - 8, c.dy - 5)
      ..quadraticBezierTo(c.dx - 34, c.dy - 18, c.dx - 43, c.dy + 4)
      ..quadraticBezierTo(c.dx - 27, c.dy + 14, c.dx - 8, c.dy + 6)
      ..close();
    final rightV = Path()
      ..moveTo(c.dx + 8, c.dy - 5)
      ..quadraticBezierTo(c.dx + 34, c.dy - 18, c.dx + 43, c.dy + 4)
      ..quadraticBezierTo(c.dx + 27, c.dy + 14, c.dx + 8, c.dy + 6)
      ..close();
    canvas.drawPath(leftV, ventricle);
    canvas.drawPath(rightV, ventricle);

    for (int i = -2; i <= 2; i++) {
      final y = c.dy + i * r * .22;
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(c.dx - r * .48, y),
          width: r * .63,
          height: r * .23,
        ),
        3.4,
        2.1,
        false,
        sulcus,
      );
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(c.dx + r * .48, y),
          width: r * .63,
          height: r * .23,
        ),
        -2.3,
        2.1,
        false,
        sulcus,
      );
    }

    switch (pattern) {
      case StrokeCtPattern.earlyIschemia:
        final lesion = Paint()..color = const Color(0xFF676B70).withOpacity(.82);
        final p = Path()
          ..moveTo(c.dx - r * .92, c.dy - r * .18)
          ..quadraticBezierTo(
              c.dx - r * .56, c.dy - r * .58, c.dx - r * .20, c.dy - r * .30)
          ..quadraticBezierTo(
              c.dx - r * .35, c.dy + r * .05, c.dx - r * .82, c.dy + r * .24)
          ..close();
        canvas.drawPath(p, lesion);
        break;

      case StrokeCtPattern.establishedIschemia:
        final lesion = Paint()..color = const Color(0xFF363A3F);
        final p = Path()
          ..moveTo(c.dx - r * .96, c.dy - r * .30)
          ..quadraticBezierTo(
              c.dx - r * .57, c.dy - r * .69, c.dx - r * .08, c.dy - r * .33)
          ..quadraticBezierTo(
              c.dx - r * .25, c.dy + r * .31, c.dx - r * .88, c.dy + r * .45)
          ..close();
        canvas.drawPath(p, lesion);
        break;

      case StrokeCtPattern.hyperdenseMca:
        final vessel = Paint()
          ..color = const Color(0xFFF1F3F5)
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round;
        canvas.drawLine(
          Offset(c.dx - r * .18, c.dy + r * .02),
          Offset(c.dx - r * .62, c.dy + r * .22),
          vessel,
        );
        break;

      case StrokeCtPattern.intraparenchymalHemorrhage:
        final blood = Paint()..color = const Color(0xFFF5F6F7);
        final edema = Paint()..color = const Color(0xFF4B4F55).withOpacity(.85);
        canvas.drawOval(
          Rect.fromCenter(
              center: Offset(c.dx + r * .43, c.dy + r * .08),
              width: r * .60,
              height: r * .48),
          edema,
        );
        canvas.drawOval(
          Rect.fromCenter(
              center: Offset(c.dx + r * .43, c.dy + r * .08),
              width: r * .43,
              height: r * .34),
          blood,
        );
        break;

      case StrokeCtPattern.subarachnoidHemorrhage:
        final blood = Paint()
          ..color = const Color(0xFFF3F5F6)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round;
        canvas.drawLine(
          Offset(c.dx, c.dy - r * .05),
          Offset(c.dx, c.dy - r * .55),
          blood,
        );
        canvas.drawLine(
          Offset(c.dx, c.dy - r * .05),
          Offset(c.dx - r * .42, c.dy + r * .22),
          blood,
        );
        canvas.drawLine(
          Offset(c.dx, c.dy - r * .05),
          Offset(c.dx + r * .42, c.dy + r * .22),
          blood,
        );
        canvas.drawArc(
          Rect.fromCenter(center: c, width: r * .72, height: r * .34),
          3.35,
          2.75,
          false,
          blood,
        );
        break;
    }

    final marker = Paint()..color = Colors.white.withOpacity(.85);
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'R',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(canvas, Offset(size.width - 24, 8));
    canvas.drawCircle(Offset(12, 12), 2.5, marker);
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
    _tabs = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Widget bullet(
    String text, {
    Color color = navy,
    IconData icon = Icons.circle,
  }) =>
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

  Widget header(String title, String subtitle, {Color color = red}) => Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
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

  Widget examCard({
    required String title,
    required String how,
    required String abnormal,
    required IconData icon,
  }) =>
      section(
        title: title,
        icon: icon,
        color: blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rich('Cómo explorarlo', how, color: blue),
            rich('Qué buscar', abnormal, color: orange),
          ],
        ),
      );

  Widget ctCard({
    required String title,
    required StrokeCtPattern pattern,
    required String findings,
    required String key,
    Color color = blue,
  }) =>
      section(
        title: title,
        icon: Icons.image_search_outlined,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StrokeCtIllustration(pattern: pattern),
            const SizedBox(height: 10),
            rich('Qué buscar', findings, color: color),
            rich('Clave', key, color: red),
            const Text(
              'Esquema educativo de TC sin contraste. No sustituye la interpretación de una TC real por Radiología/Neurología.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      );

  Widget quickPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'ICTUS · PRIMEROS 10 MIN EN AP',
            'Reconocer → hora de última vez bien → glucemia → ABCDE → Código Ictus/112 → traslado sin demoras evitables.',
          ),
          section(
            title: '1. Sospecha clínica: BE-FAST',
            icon: Icons.bolt_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('B · Balance', 'pérdida brusca de equilibrio o coordinación.', color: red),
                rich('E · Eyes', 'pérdida visual, diplopía o defecto campimétrico súbito.', color: red),
                rich('F · Face', 'asimetría facial o caída de una comisura.', color: red),
                rich('A · Arm', 'debilidad o pérdida sensitiva unilateral.', color: red),
                rich('S · Speech', 'afasia, lenguaje extraño o disartria.', color: red),
                rich('T · Time', 'anotar la última vez que estaba normal y activar el circuito.', color: red),
              ],
            ),
          ),
          section(
            title: '2. Lo primero que tienes que preguntar',
            icon: Icons.schedule_outlined,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Hora exacta de inicio si fue presenciado.'),
                bullet('Si no se conoce: ¿a qué hora fue visto normal por última vez? (last known well).'),
                bullet('Tratamiento anticoagulante/antiagregante y hora de última dosis.'),
                bullet('Situación funcional previa y antecedentes relevantes.'),
                bullet('Convulsión al inicio, traumatismo, cirugía reciente o sangrado reciente.'),
              ],
            ),
          ),
          section(
            title: '3. ABCDE + constantes + glucemia',
            icon: Icons.monitor_heart_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('A', 'vía aérea. Aspirar secreciones si precisa; si no protege vía aérea, pedir SVA y ventilar con bolsa-mascarilla si fuera necesario.', color: red),
                rich('B', 'SatO₂. Oxígeno si existe hipoxemia; no administrarlo rutinariamente al paciente normoxémico.', color: red),
                rich('C', 'TA, FC, ritmo, perfusión. Canalizar vía IV sin retrasar traslado. Evitar soluciones hipotónicas.', color: red),
                rich('D', 'Glasgow + focalidad neurológica + glucemia capilar inmediata.', color: red),
                rich('E', 'temperatura, traumatismos, signos de infección y revisión rápida general.', color: red),
                bullet('La hipoglucemia puede simular un ictus: corregirla de inmediato y reevaluar focalidad.', color: orange),
              ],
            ),
          ),
          section(
            title: '4. Activar Código Ictus / 112',
            icon: Icons.phone_in_talk_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('No esperar analítica ni pruebas no disponibles en AP para solicitar traslado.', color: red),
                bullet('Comunicar: edad, última vez bien, déficit, Glasgow, TA, glucemia, SatO₂, anticoagulantes y situación funcional previa.', color: red),
                bullet('Un ictus del despertar o de varias horas de evolución también requiere traslado urgente: algunos pacientes pueden beneficiarse de neuroimagen avanzada/trombectomía.', color: red),
              ],
            ),
          ),
          section(
            title: '5. TA: no normalizarla bruscamente',
            icon: Icons.speed_outlined,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('La PA elevada es frecuente en el ictus agudo. Evita descensos rápidos y no administres captopril/nifedipino de forma automática.', color: orange),
                bullet('Si va a recibir trombólisis IV, el objetivo hospitalario previo es <185/110 mmHg; el manejo concreto debe coordinarse con Código Ictus.', color: orange),
                bullet('Trata hipotensión/hipovolemia y otras emergencias concomitantes. Individualiza si existe disección aórtica, edema pulmonar u otra emergencia hipertensiva.', color: orange),
              ],
            ),
          ),
          section(
            title: '6. Antes de la TC: NO hacer',
            icon: Icons.block_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('NO administrar AAS ni clopidogrel antes de excluir hemorragia intracraneal.', color: red),
                bullet('NO administrar heparina/anticoagulación empírica.', color: red),
                bullet('NO bajar agresivamente la TA solo por estar elevada.', color: red),
                bullet('NO dar comida, bebida ni medicación oral si existe riesgo de disfagia.', color: red),
                bullet('NO retrasar el traslado para completar una NIHSS perfecta.', color: red),
              ],
            ),
          ),
          section(
            title: 'Stroke mimics que debes recordar',
            icon: Icons.alt_route_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Hipoglucemia/alteraciones metabólicas.'),
                bullet('Crisis epiléptica con parálisis de Todd.'),
                bullet('Migraña con aura.'),
                bullet('Parálisis facial periférica.'),
                bullet('Intoxicación/fármacos, síncope, infección/sepsis, trastorno funcional y encefalopatía hipertensiva.'),
              ],
            ),
          ),
        ],
      );

  Widget neuroPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'EXAMEN NEUROLÓGICO RÁPIDO',
            'Exploración estructurada para detectar focalidad y comunicarla. No debe retrasar la activación del Código Ictus.',
            color: blue,
          ),
          examCard(
            title: '1. Conciencia y Glasgow',
            icon: Icons.psychology_outlined,
            how: '¿Está alerta? Pregunta nombre, lugar/mes y observa respuesta a voz y órdenes. Si hay alteración, completa Glasgow.',
            abnormal: 'Somnolencia, desorientación o disminución de conciencia. Puede aparecer en ictus extenso, tronco/basilar, hemorragia o edema.',
          ),
          examCard(
            title: '2. Pupilas',
            icon: Icons.remove_red_eye_outlined,
            how: 'Compara tamaño y simetría; valora respuesta directa/consensual a la luz.',
            abnormal: 'Anisocoria nueva o pupila poco reactiva, especialmente con deterioro de conciencia, es signo de alarma.',
          ),
          examCard(
            title: '3. Mirada y motilidad ocular',
            icon: Icons.visibility_outlined,
            how: 'Pide seguir tu dedo horizontal y verticalmente sin mover la cabeza.',
            abnormal: 'Desviación conjugada, oftalmoparesia, diplopía o nistagmo. Una desviación conjugada puede indicar lesión hemisférica extensa.',
          ),
          examCard(
            title: '4. Campos visuales',
            icon: Icons.center_focus_strong_outlined,
            how: 'Confrontación: paciente fija tu nariz y comparas detección de dedos/movimiento en cuadrantes de ambos hemicampos.',
            abnormal: 'Hemianopsia o cuadrantanopsia. Pérdida visual monocular súbita también puede ser vascular.',
          ),
          examCard(
            title: '5. Cara',
            icon: Icons.face_outlined,
            how: 'Pide sonreír/mostrar dientes, cerrar fuerte los ojos y elevar cejas.',
            abnormal: 'Paresia facial central: debilidad predominante en mitad inferior contralateral con frente relativamente conservada. Si se afecta toda la hemicara, considerar lesión periférica, aunque el contexto manda.',
          ),
          examCard(
            title: '6. Fuerza de brazos',
            icon: Icons.front_hand_outlined,
            how: 'Brazos extendidos al frente, palmas arriba, 10 segundos. Observa pronación o caída. Después fuerza contra resistencia.',
            abnormal: 'Pronación, claudicación, paresia o plejía. Registra 0/5 a 5/5.',
          ),
          examCard(
            title: '7. Fuerza de piernas',
            icon: Icons.accessibility_new_outlined,
            how: 'En decúbito, eleva cada pierna y pide mantenerla. Compara ambos lados y completa fuerza contra resistencia.',
            abnormal: 'Caída precoz, paresia o plejía. Describe lado y grado (0/5–5/5).',
          ),
          examCard(
            title: '8. Sensibilidad',
            icon: Icons.touch_app_outlined,
            how: 'Tacto ligero simétrico en cara, brazos y piernas; compara ambos lados.',
            abnormal: 'Hipoestesia/anestesia hemicorporal. Realiza estímulo bilateral simultáneo si sospechas extinción.',
          ),
          examCard(
            title: '9. Lenguaje (afasia)',
            icon: Icons.record_voice_over_outlined,
            how: 'Conversación espontánea + denominar un objeto + cumplir una orden de dos pasos.',
            abnormal: 'Afasia expresiva, receptiva o global. Afasia ≠ disartria: en la afasia se altera el lenguaje.',
          ),
          examCard(
            title: '10. Disartria',
            icon: Icons.chat_bubble_outline,
            how: 'Pide repetir una frase sencilla y escucha articulación/claridad.',
            abnormal: 'El paciente sabe qué quiere decir pero articula mal. Puede coexistir con paresia facial o bulbar.',
          ),
          examCard(
            title: '11. Negligencia / extinción',
            icon: Icons.compare_arrows_outlined,
            how: 'Toca ambos lados por separado y luego simultáneamente; también observa si ignora personas/objetos de un hemiespacio.',
            abnormal: 'Percibe cada lado aislado pero extingue uno cuando estimulas ambos; sugiere inatención hemisférica.',
          ),
          examCard(
            title: '12. Coordinación',
            icon: Icons.control_camera_outlined,
            how: 'Dedo-nariz y talón-rodilla si la fuerza lo permite.',
            abnormal: 'Dismetría/ataxia. No interpretes como ataxia una mala prueba explicable por paresia intensa.',
          ),
          section(
            title: 'Marcha y signos meníngeos',
            icon: Icons.directions_walk_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Marcha solo si es seguro. Busca ataxia, lateropulsión o base aumentada. No fuerces la marcha en hemiparesia/inestabilidad.'),
                bullet('Rigidez de nuca no se busca de rutina en todo ictus. Cefalea en trueno + vómitos/fotofobia/rigidez cervical → sospechar HSA.', color: red),
              ],
            ),
          ),
          section(
            title: 'Ejemplo de reporte NORMAL',
            icon: Icons.description_outlined,
            color: green,
            child: const SelectableText(
              'Neurológico: consciente, alerta y orientado en persona, lugar y tiempo. Glasgow 15/15. Pupilas isocóricas y normorreactivas. Movimientos oculares extrínsecos conservados, sin desviación conjugada. Campos visuales por confrontación sin alteraciones groseras. Facies simétrica. Lenguaje fluido y coherente, comprensión conservada, sin afasia ni disartria. Fuerza 5/5 en cuatro extremidades, sin pronación ni claudicación. Sensibilidad superficial conservada y simétrica. Coordinación dedo-nariz y talón-rodilla normal. Sin negligencia. Marcha estable si procede.',
              style: TextStyle(height: 1.48),
            ),
          ),
          section(
            title: 'Ejemplo de reporte PATOLÓGICO',
            icon: Icons.description_outlined,
            color: red,
            child: const SelectableText(
              'Neurológico: consciente, Glasgow 14/15, parcialmente desorientado en tiempo. Pupilas isocóricas y normorreactivas. Desviación conjugada de la mirada hacia la derecha. Hemianopsia homónima izquierda por confrontación. Paresia facial central izquierda. Disartria leve, sin afasia evidente. Fuerza MSD 5/5, MID 5/5, MSI 2/5, MII 3/5. Hipoestesia hemicorporal izquierda. Extinción sensitiva izquierda a estímulo bilateral simultáneo. Coordinación no valorable adecuadamente en extremidades izquierdas por paresia. Focalidad neurológica aguda compatible con lesión hemisférica derecha. Se activa Código Ictus.',
              style: TextStyle(height: 1.48),
            ),
          ),
          section(
            title: 'Reporte corto para AP',
            icon: Icons.edit_note_outlined,
            color: orange,
            child: const SelectableText(
              'Neurológico: Glasgow 15. Pupilas isocóricas reactivas. Paresia facial central izquierda. Afasia motora. Hemiparesia derecha 3/5 braquiocrural, sensibilidad disminuida derecha. Sin rigidez de nuca. Inicio súbito 09:20 h. Glucemia 112 mg/dL. Se activa Código Ictus y traslado medicalizado.',
              style: TextStyle(height: 1.48),
            ),
          ),
        ],
      );

  Widget ctPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'TC CRANEAL SIN CONTRASTE',
            'Primera pregunta urgente: ¿hay hemorragia? Un TC inicialmente normal NO excluye un ictus isquémico hiperagudo.',
            color: navy,
          ),
          ctCard(
            title: 'Ictus isquémico · cambios precoces',
            pattern: StrokeCtPattern.earlyIschemia,
            findings: 'Pérdida de diferenciación sustancia gris-blanca, borramiento de la cinta insular y discreto borramiento de surcos.',
            key: 'En las primeras horas los cambios pueden ser muy sutiles o el TC puede parecer normal.',
          ),
          ctCard(
            title: 'Ictus isquémico · hipodensidad establecida',
            pattern: StrokeCtPattern.establishedIschemia,
            findings: 'Área hipodensa en un territorio vascular, con edema/borramiento de surcos según evolución.',
            key: 'ISQUEMIA establecida suele verse más OSCURA (hipodensa).',
          ),
          ctCard(
            title: 'Signo de ACM hiperdensa',
            pattern: StrokeCtPattern.hyperdenseMca,
            findings: 'Trayecto arterial focalmente hiperdenso, compatible con trombo en la arteria cerebral media en el contexto adecuado.',
            key: 'Es un signo indirecto de oclusión; requiere correlación con angio-TC/neuroimagen.',
          ),
          ctCard(
            title: 'Hemorragia intraparenquimatosa',
            pattern: StrokeCtPattern.intraparenchymalHemorrhage,
            findings: 'Colección espontáneamente hiperdensa (blanca) dentro del parénquima, a veces con edema periférico y efecto masa.',
            key: 'HEMORRAGIA AGUDA suele verse BLANCA (hiperdensa).',
            color: red,
          ),
          ctCard(
            title: 'Hemorragia subaracnoidea',
            pattern: StrokeCtPattern.subarachnoidHemorrhage,
            findings: 'Hiperdensidad en cisternas basales, cisuras y/o surcos; la distribución depende del sangrado.',
            key: 'Cefalea en trueno ± vómitos, rigidez cervical o síncope → emergencia aunque no haya focalidad típica.',
            color: red,
          ),
          section(
            title: 'Lectura práctica para AP',
            icon: Icons.lightbulb_outline,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('No necesitas distinguir isquémico de hemorrágico clínicamente antes de trasladar.'),
                bullet('No administres antiagregantes/anticoagulantes hasta excluir hemorragia mediante neuroimagen.', color: red),
                bullet('La TC sin contraste descarta rápidamente una hemorragia relevante y permite buscar signos precoces de isquemia.'),
                bullet('Angio-TC/TC de perfusión ayudan a localizar oclusión de gran vaso y seleccionar trombectomía; se realizan en el circuito hospitalario según protocolo.'),
              ],
            ),
          ),
        ],
      );

  Widget ischemicPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'ICTUS ISQUÉMICO',
            'El objetivo definitivo es reperfundir tejido viable lo antes posible. Desde AP: reconocer y acelerar acceso a neuroimagen/unidad de ictus.',
            color: blue,
          ),
          section(
            title: 'Clínica orientativa',
            icon: Icons.psychology_alt_outlined,
            color: blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Déficit focal súbito: hemiparesia/hemihipoestesia, afasia, disartria, hemianopsia, desviación de mirada o negligencia.'),
                bullet('La ausencia de cefalea no descarta ictus; la clínica por sí sola no permite excluir hemorragia.'),
                bullet('Disminución de conciencia puede aparecer en ictus extenso, tronco o circulación posterior.'),
              ],
            ),
          ),
          section(
            title: 'Reperfusión hospitalaria',
            icon: Icons.bloodtype_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Trombólisis IV: requiere neuroimagen previa y valoración por equipo/unidad de ictus.'),
                bullet('Trombectomía mecánica: indicada en oclusiones de gran vaso seleccionadas; algunos pacientes se benefician incluso con tiempo de inicio desconocido o ventanas ampliadas según neuroimagen.'),
                bullet('Desde AP no descartes a un paciente por “haber pasado varias horas”: activa el circuito y deja la selección definitiva al centro de ictus.', color: red),
              ],
            ),
          ),
          section(
            title: 'Sospecha de oclusión de gran vaso',
            icon: Icons.warning_amber_rounded,
            color: orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Hemiplejia/paresia intensa.'),
                bullet('Afasia grave o mutismo.'),
                bullet('Desviación conjugada de mirada.'),
                bullet('Negligencia marcada.'),
                bullet('Déficit neurológico severo o combinación de signos corticales.'),
              ],
            ),
          ),
          section(
            title: 'Antitrombóticos',
            icon: Icons.medication_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('No iniciar AAS/clopidogrel en AP antes de excluir hemorragia.', color: red),
                bullet('La anticoagulación empírica en la fase hiperaguda no es tratamiento rutinario del ictus isquémico.', color: red),
                bullet('La antiagregación se decide tras neuroimagen y según si recibió trombólisis y el subtipo clínico.', color: red),
              ],
            ),
          ),
        ],
      );

  Widget hemorrhagicPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'ICTUS HEMORRÁGICO',
            'Sospecharlo especialmente si hay cefalea intensa, vómitos, convulsiones o disminución de conciencia, pero confirmarlo siempre con neuroimagen.',
            color: red,
          ),
          section(
            title: 'Hemorragia intraparenquimatosa',
            icon: Icons.warning_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('TC sin contraste: sangre aguda hiperdensa. Puede existir edema, efecto masa o extensión ventricular.'),
                bullet('En AP: ABCDE, glucemia, evitar hipotensión, monitorizar y traslado inmediato.'),
                bullet('Registrar anticoagulantes y hora de última dosis: condiciona la reversión urgente en hospital.'),
                bullet('No administrar antiagregantes ni anticoagulantes.', color: red),
              ],
            ),
          ),
          section(
            title: 'Hipertensión intracraneal / deterioro',
            icon: Icons.crisis_alert_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Deterioro de conciencia, vómitos repetidos, anisocoria, alteración respiratoria o postura anormal → emergencia vital.'),
                bullet('Si no protege vía aérea: solicitar SVA y soporte ventilatorio; la intubación debe realizarla personal entrenado cuando sea posible.'),
                bullet('Manitol/suero hipertónico y neurocirugía pertenecen al manejo hospitalario según situación; los corticoides no son tratamiento del edema por hemorragia intracerebral.'),
              ],
            ),
          ),
          section(
            title: 'Hemorragia subaracnoidea (HSA)',
            icon: Icons.flash_on_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('Clásico', 'cefalea en trueno, máxima desde el inicio, “peor cefalea de su vida”.', color: purple),
                bullet('Puede acompañarse de vómitos, rigidez de nuca, fotofobia, síncope, convulsiones o disminución de conciencia.'),
                bullet('TC sin contraste urgente. Si la sospecha sigue siendo alta con TC no diagnóstico, el estudio continúa en hospital según tiempo y protocolo.'),
              ],
            ),
          ),
        ],
      );

  Widget aitPage() => ListView(
        padding: const EdgeInsets.all(14),
        children: [
          header(
            'AIT · NO ES “ALGO LEVE”',
            'Déficit neurológico focal transitorio ya resuelto = riesgo precoz de ictus. Requiere valoración urgente y prevención secundaria.',
            color: orange,
          ),
          section(
            title: 'Qué hacer desde AP',
            icon: Icons.local_hospital_outlined,
            color: red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Confirmar que fue focal y de inicio brusco: paresia, trastorno del lenguaje, pérdida visual monocular, etc.'),
                bullet('Registrar duración, hora, anticoagulantes, antecedentes y realizar glucemia/ECG si está disponible sin retrasar derivación.'),
                bullet('Derivación urgente para neuroimagen y estudio vascular/cardiaco. Un examen normal ahora no descarta un AIT.', color: red),
                bullet('No usar una puntuación de riesgo baja como motivo para retrasar una evaluación urgente.', color: red),
              ],
            ),
          ),
          section(
            title: 'ABCD²: recordatorio educativo',
            icon: Icons.calculate_outlined,
            color: purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rich('A', 'Age ≥60 años = 1.'),
                rich('B', 'Blood pressure ≥140/90 = 1.'),
                rich('C', 'Clinical: debilidad unilateral = 2; alteración del habla sin debilidad = 1.'),
                rich('D', 'Duration ≥60 min = 2; 10–59 min = 1.'),
                rich('D', 'Diabetes = 1.'),
                bullet('Sirve para contextualizar riesgo, pero no sustituye la valoración clínica ni el estudio urgente.'),
              ],
            ),
          ),
          section(
            title: 'Prevención secundaria',
            icon: Icons.shield_outlined,
            color: green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('Antiagregación o anticoagulación se decide tras excluir hemorragia y según etiología (p. ej., fibrilación auricular).'),
                bullet('Control de HTA, diabetes, lípidos, tabaquismo y causa vascular/cardiaca.'),
                bullet('Doble antiagregación puede indicarse en pacientes seleccionados de alto riesgo/ictus menor durante un periodo corto, pero no debe iniciarse a ciegas antes de valoración/neuroimagen.'),
              ],
            ),
          ),
          section(
            title: 'Perlas de guardia',
            icon: Icons.lightbulb_outline,
            color: green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bullet('“Se le pasó” no significa que pueda irse a casa sin estudio.'),
                bullet('Déficit focal transitorio + FA = alto interés cardioembólico.'),
                bullet('Amaurosis fugaz también puede ser un AIT carotídeo.'),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ICTUS · URGENCIAS AP'),
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.timer_outlined), text: '0–10 min'),
            Tab(icon: Icon(Icons.psychology_outlined), text: 'Neurológico'),
            Tab(icon: Icon(Icons.image_search_outlined), text: 'TC'),
            Tab(icon: Icon(Icons.water_drop_outlined), text: 'Isquémico'),
            Tab(icon: Icon(Icons.emergency_outlined), text: 'Hemorrágico'),
            Tab(icon: Icon(Icons.hourglass_bottom_outlined), text: 'AIT'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          quickPage(),
          neuroPage(),
          ctPage(),
          ischemicPage(),
          hemorrhagicPage(),
          aitPage(),
        ],
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
