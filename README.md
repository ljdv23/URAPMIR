# MIR · Atención Primaria · Urgencias — Flutter v0.3

Una única base Flutter para Android e iOS.

## Incluido en v0.3
- Módulo MIR preparado para banco de preguntas, simulacros y estadísticas.
- 30 temas de Atención Primaria en catálogo.
- Primeros 10 temas de AP con ficha clínica resumida:
  1. Hipertensión arterial
  2. Diabetes mellitus tipo 2
  3. Dislipemia / prevención cardiovascular
  4. Obesidad
  5. Hipotiroidismo
  6. Asma
  7. EPOC
  8. Apnea obstructiva del sueño
  9. Neumonía adquirida en la comunidad
  10. Infección urinaria
- Urgencias: SCA, ictus, sepsis y politrauma (desde v0.2).
- Motor reutilizable de escalas.
- qSOFA, Glasgow, CRB-65, mMRC, CHA2DS2-VASc, HAS-BLED, STOP-BANG, NYHA.
- Estructuras preparadas para instrumentos que requieren integrar una versión validada/licenciada.
- Módulo farmacológico independiente con dosis, duración, ajustes renal/hepático, contraindicaciones, efectos adversos, interacciones y monitorización.
- Ejemplos de marcas en España y campo de fuente/fecha de actualización.

## Diseño de seguridad
El contenido clínico está separado de la interfaz para poder actualizar recomendaciones sin rehacer la app. Antes de producción, las dosis y marcas deben validarse contra la ficha técnica vigente de AEMPS-CIMA y las guías aplicables.

## Fuentes base de esta fase
- semFYC. Guía Terapéutica en Atención Primaria, 9.ª edición (noviembre de 2025).
- GEMA 5.5 para asma.
- GesEPOC para EPOC.
- SEMERGEN para contenido específico de Atención Primaria.
- AEMPS-CIMA para fichas técnicas y presentaciones en España.

## Próxima fase sugerida
- Completar los siguientes 10 temas de AP.
- Ampliar fármacos y presentaciones españolas.
- Completar urgencias con tratamiento operativo del centro de salud.
- Crear banco MIR persistente y simulacro de 200 preguntas.
- Añadir base local SQLite/Drift o Isar para actualizaciones de contenido.
