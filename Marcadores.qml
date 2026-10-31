import QtQuick

Item{
    Component.onCompleted: {
        let j={}
        j.items=[]
        let item
        let marcs
        let marc

        //app.positionMin=33*1000
        //Item 1
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_1_p1.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (1.1/1.3)/3"
        item.des="Realiad y Dialéctica"
        marcs=[]

        marc={}
        marc.titulo="Preámbulo introductorio"
        marc.des="Se explica en qué consistirán las siguientes explicaciones sobre Hegel en esta calse."
        marc.ms=getHmsToMs(0, 0, 33)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 1: LA REALIDAD"
        marc.des="¿Qué es la realidad? Es todo lo que hay. PRESENTE PERMANENTE (contínuo)."
        marc.ms=getHmsToMs(0, 3, 32)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 2: LA HISTÓRIA"
        marc.des="La história demuestra que la realidad no es fija. La realidad se transforma."
        marc.ms=getHmsToMs(0, 7, 19)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 3: NUEVA DEFINICIÓN DE REALIDAD"
        marc.des="La temporalirad. LA REALIDAD ES LO QUE HAY, LO QUE ES, LO QUE FUÉ Y LO QUE SERÁ. La realidad es TODO lo que ES sin importar cuándo."
        marc.ms=getHmsToMs(0, 10, 31)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 4: EL MOTOR (EL DESARROLLO DEL ESPÍRITU ABSOLUTO)"
        marc.des="El motor podría ser IRRACIONAL. Hegel afirma que es RACIONAL porque hay un ORDEN y SENTIDO. Busca EL DESARROLLO DE LA HISTÓRIA, LA RAZÓN y el ESPÍRITU ABSOLUTO."
        marc.ms=getHmsToMs(0, 13, 16)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 2
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_1_p2.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (1.2/1.3)/3"
        item.des="Desarrollo de la razón, abstracción..."
        marcs=[]

        marc={}
        marc.titulo="EL DESARROLLO DE LA RAZÓN"
        marc.des="¿Qué es?. Superando lo real, la razón al avanzar busca que a la REALIDAD QUE HAY LE PIDE CADA VEZ MÁS. Camino a la RACIONALIDAD ABSOLUTA."
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        marc={}
        marc.titulo="LA ABSTRACCIÓN"
        marc.des="Ejemplo de la moneda de metal y el papel moneda."
        marc.ms=getHmsToMs(0, 2, 45)
        marcs.push(marc)

        marc={}
        marc.titulo="LA AUTOCONSCIENCIA"
        marc.des="Una mayor abstracción lleva a una mayor AUTOCONSCIENCIA. La historia va comprendiéndose a sí mismo."
        marc.ms=getHmsToMs(0, 6, 9)
        marcs.push(marc)

        marc={}
        marc.titulo="LA DIALÉCTICA"
        marc.des="La dialéctica es lo que permite es DESARROLLO DE LA HISTORIA. El elemento clave es LA NEGACIÓN . La NEGATIVIDAD por encima del CAMBIO, lo DISTINTO y lo CONTRARIO."
        marc.ms=getHmsToMs(0, 7, 44)
        marcs.push(marc)

        marc={}
        marc.titulo="SUPERACIÓN DE LOS PRINCIPIOS"
        marc.des="LOS PRINCIPIOS DE IDENTIDAD Y LOS PRINCIPIOS DE NO SUPERACIÓN."
        marc.ms=getHmsToMs(0, 15, 30)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 3
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_1_p3.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (1.3/1.3)/3"
        item.des="Tésis, Antítesis y Síntesis. Idealismo Absoluto. Todo cambia por la razón."
        marcs=[]

        marc={}
        marc.titulo="TÉSIS, ANTÍTESIS Y SÍNTESIS"
        marc.des="Superación de la negatividad."
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        marc={}
        marc.titulo="IDEALISMO ABSOLUTO"
        marc.des="¿Qué es? Es un PROCESO DEL DESARROLLO DE LA RAZÓN. La RAZÓN DETERMINA LA REALIDAD."
        marc.ms=getHmsToMs(0, 3, 18)
        marcs.push(marc)

        marc={}
        marc.titulo="TODO CAMBIA POR LA RAZÓN"
        marc.des="NADA ESCAPA A LA RAZÓN. La razón determina el cambio/proceso de todo. La razón del Espítiru Absoluto que se encuentra a sí mismo."
        marc.ms=getHmsToMs(0, 5, 32)
        marcs.push(marc)

        marc={}
        marc.titulo="EL FINAL DE LA HISTÓRIA"
        marc.des="El final del proceso es, TODO LO REAL ES RACIONAL Y TODO LO RACIONAL ES LO REAL. La metáfora de la Lechuza de Minerva. Solo se conoce la realidad y la verdad al final."
        marc.ms=getHmsToMs(0, 8, 31)
        marcs.push(marc)

        marc={}
        marc.titulo="RESUMEN"
        marc.des="Se resume todo lo explicado hasta ahora."
        marc.ms=getHmsToMs(0, 12, 45)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 4
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_2_p1.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (2.1/2.3)/3"
        item.des="El conocimiento, la verdad, la primacía de la consciencia. La consciencia universal. IDEALISMO."
        marcs=[]

        item.marcs=marcs
        j.items.push(item)

        marc={}
        marc.titulo="Introducción a la °2 parte"
        marc.des="Se introduce al contexto de lo que se explicará a continuación."
        marc.ms=getHmsToMs(0, 0, 45)
        marcs.push(marc)

        marc={}
        marc.titulo="EL CONOCIMIENTO SEGÚN HEGEL"
        marc.des="Si el conocimiento fuera por correspodencia solo podríamos conocer este momento pero como la realidad está permanentemente cambiando no conoceriamos la UNA PARTE de la realidad."
        marc.ms=getHmsToMs(0, 0, 45)
        marcs.push(marc)

        marc={}
        marc.titulo="LA GRAN PREGUNTA KANTIANA"
        marc.des="¿Qué puedo conocer? Análisis del conocimiento y la realidad. Analizar CÓMO CONOZCO y CÓMO ES LA REALIDAD. Hegel afirma que la VERDAD NO ES DEL YO."
        marc.ms=getHmsToMs(0, 5, 16)
        marcs.push(marc)

        marc={}
        marc.titulo="LA CONSCIENCIA UNIVERSAL"
        marc.des="La verdad no puede ser algo individual, no puede ser algo PARCIAL, es UNIVERSAL Y ABSOLUTA. La verdad y la realidad se busca en la Consciencia Absoluta."
        marc.ms=getHmsToMs(0, 7, 23)
        marcs.push(marc)

        marc={}
        marc.titulo="BREVE RESUMEN"
        marc.des="Se explica en resumen los conceptos hasta ahora explicados."
        marc.ms=getHmsToMs(0, 10, 54)
        marcs.push(marc)

        marc={}
        marc.titulo="IDEALISMO: LA PRIMACÍA DE LA CONSCIENCIA"
        marc.des="La meta es la CORRESPONDENCIA entre EL SUJETO como OBJETO (lo que piensa) y el CONTEXTO. Relación de la CONSCIENCIA con algo DISTINTO."
        marc.ms=getHmsToMs(0, 12, 45)
        marcs.push(marc)

        marc={}
        marc.titulo="IDEALISMO ABSOLUTO"
        marc.des=""
        marc.ms=getHmsToMs(0, 18, 54)
        marcs.push(marc)

        //Item 5
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_2_p2.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (2.2/2.3)/3"
        item.des="Terminología Hegeliana. Pasos del conocimiento. En sí para sí. Tensión Dialéctica por Negatividad."
        marcs=[]

        marc={}
        marc.titulo="Los PASOS DEL CONOCIMIENTO"
        marc.des="Cómo conozco. Para conocer es necesario que la consciencia perciba algo distinto (OBJETO aparentemente real). El objeto será PARA SÍ y EN SÍ"
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        marc={}
        marc.titulo="¿Qué busca la consciencia?"
        marc.des="La consciencia universal busca EL CONCEPTO UNIVERSAL, la DEFINICIÓN UNIVERSAL que sirva para cualquier caso, ocación o elemento, la NEGACIÓN DEL PARTICULAR."
        marc.ms=getHmsToMs(0, 5, 50)
        marcs.push(marc)

        marc={}
        marc.titulo="¿Cómo superamos la NEGATIVIDAD?"
        marc.des="Se supera dominando al PARTICULAR. Siendo capaz de subsumirlo en el concepto y el PARTICULAR DEJA DE SER. Ahora el concepto es ahora EN SÍ Y PARA SÍ."
        marc.ms=getHmsToMs(0, 7, 12)
        marcs.push(marc)

        marc={}
        marc.titulo="ESPÍRiTU ABSOLUTO"
        marc.des="La realidad es movimiento y es dialéctica. El particular cambia y vuelve a ser un ENTE, un PARA SÍ, otra vez el esfuerso del CONCEPTO y así hasta la llegada del ESPÍRiTU ABSOLUTO."
        marc.ms=getHmsToMs(0, 8, 12)
        marcs.push(marc)

        marc={}
        marc.titulo="Resumen para continuar"
        marc.des="Se explican y repasan los conceptos para continuar para DAR UN PASO MÁS."
        marc.ms=getHmsToMs(0, 9, 45)
        marcs.push(marc)

        marc={}
        marc.titulo="IDEALISMO ABSOLUTO"
        marc.des="¿De donde sale el Idealismo Absoluto?. El objeto solo es objeto porque está en la consciencia. Son MOMENTOS de la consciencia. No existe NADA FUERA DE LA CONSCIENCIA DEL ESTPÍRITU ABSOLUTO que se desarrolla."
        marc.ms=getHmsToMs(0, 14, 16)
        marcs.push(marc)

        marc={}
        marc.titulo="La HISTORIA, EL DESPLIEGUE DEL ESPÍRITU ABSOLUTO"
        marc.des="La realidad está en la consciencia universal / absoluta. Objeto y Concepto ambos están en la misma realidad."
        marc.ms=getHmsToMs(0, 16, 2)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 6
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_2_p3.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (2.3/2.3)/3"
        item.des="Resumen general de los explicado en el video divulgativo 2 sobre Hegel."
        marcs=[]

        marc={}
        marc.titulo="Introducción antes de resumir"
        marc.des="Se explica qué y cómo se resumirá."
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        marc={}
        marc.titulo="Resumen"
        marc.des="Realidad y conocimiento. Buscamos conocer la realidad en SI, el NOUMENO KANTIANO negado pro SHOPENHOWER."
        marc.ms=getHmsToMs(0, 0, 56)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 7
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_3_p1.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (3.1/3.3)/3"
        item.des="Del Libro la Fenomenología del Espítitu"
        marcs=[]

        marc={}
        marc.titulo="Introducción al video 3"
        marc.des="Nos ponemos en contexto."
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        marc={}
        marc.titulo="3 Momentos del Espíritu"
        marc.des="Cuando esos 3 momentos se eencuentren en el despliegue del Espíritu Absoluto. Se desarrolla en el TIEMPO, EN LA HISTÓRIA a traves de 3 momentos en COLUMNAS PARALELAS."
        marc.ms=getHmsToMs(0, 2, 35)
        marcs.push(marc)

        marc={}
        marc.titulo="El ESPÍRITU SUBJETIVO"
        marc.des="Es el Desarrollo de la CONSCIENCIA/AUTOCONSCIENCIA del individuo sobre SÍ MISMO."
        marc.ms=getHmsToMs(0, 5, 55)
        marcs.push(marc)

        marc={}
        marc.titulo="El ESPÍRITU OBJETIVO"
        marc.des=""
        marc.ms=getHmsToMs(0, 5, 55)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 8
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_3_p2.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (3.2/3.3)/3"
        item.des=""
        marcs=[]

        marc={}
        marc.titulo="Parte 2 del video 3"
        marc.des="Continúa la clase 3"
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 9
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_3_p3.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (3.3/3.3)/3"
        item.des=""
        marcs=[]

        marc={}
        marc.titulo="Parte 3 del video 3"
        marc.des="Finaliza la clase 3"
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)


        app.json=j

        app.loadDataAudios()
        app.loadData(0)
    }
}
