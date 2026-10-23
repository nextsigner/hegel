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
        item.des="????"
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

        app.json=j

        app.loadDataAudios()
        app.loadData(0)
    }
}
