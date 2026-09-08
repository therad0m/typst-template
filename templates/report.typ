#import "../core/theme.typ": make-theme

#let image-counter = counter("report-image")
#let table-counter = counter("report-table")

#let report-image(body, caption: none) = {
    context {
        image-counter.step()
        let chapter = counter(heading).at(here()).first()
        let number = image-counter.get().first()
        figure(
            body,
            caption: caption,
            numbering: (..) => numbering("1.1", chapter, number),
        )
    }
}

#let report-table(body, caption: none) = {
    context {
        table-counter.step()
        let chapter = counter(heading).at(here()).first()
        let number = table-counter.get().first()
        figure(
            body,
            caption: caption,
            numbering: (..) => numbering("1.1", chapter, number),
        )
    }
}

#let report(
    title: "",
    author: "",
    theme: "academic",
    accent: auto,
    draft: false,
    body,
) = {
    let t = make-theme(
        preset: theme,
        overrides: if accent != auto { (primary: accent, secondary: accent) } else { (:) },
    )

    set page(
        paper: t.page-paper,
        margin: t.page-margin,
        numbering: none,
        background: if draft {
            align(center + horizon)[#image("../assets/LOGO_UIT_FADED.PNG", width: 30%)]
        },
    )
    set text(font: t.font-body, size: t.size-body, fill: t.text, lang: "vi")
    set par(
        leading: t.line-height,
        first-line-indent: (amount: t.par-indent, all: true),
        justify: true,
    )
    set heading(numbering: "1.1")
    show heading: set text(font: "Times New Roman")

    show heading.where(level: 1): it => {
        image-counter.update(0)
        table-counter.update(0)
        v(18pt, weak: true)
        block(width: 100%, sticky: true)[
            #set text(size: 15pt, weight: "bold")
            #set par(first-line-indent: 0pt)
            #if it.numbering != none [
                Chương #counter(heading).display(it.numbering)
                #h(1em)
                #upper(it.body)
            ] else [#it.body]
        ]
        v(14pt, weak: true)
    }

    show heading.where(level: 2): it => {
        v(14pt, weak: true)
        block(width: 100%, sticky: true)[
            #set text(size: 14pt, weight: "bold")
            #set par(first-line-indent: 0pt)
            #if it.numbering != none {
                counter(heading).display(it.numbering)
                h(0.8em)
            }
            #it.body
        ]
        v(10pt, weak: true)
    }

    show heading.where(level: 3): it => {
        v(12pt, weak: true)
        block(width: 100%, sticky: true)[
            #set text(size: 13pt, weight: "bold")
            #set par(first-line-indent: 0pt)
            #if it.numbering != none {
                counter(heading).display(it.numbering)
                h(0.8em)
            }
            #it.body
        ]
        v(8pt, weak: true)
    }

    show link: it => if type(it.dest) == str {
        underline(text(fill: t.secondary, it))
    } else { it }

    show outline.entry.where(level: 1): it => context {
        v(0.5cm)
        let location = it.element.location()
        let heading-number = counter(heading).at(location)
        link(location, block(width: 100%)[
            #v(12pt, weak: true)
            #if it.element.func() == figure [
                #grid(
                    columns: 1fr,
                    strong[
                        #let figure-counter = if it.element.body.func() == table { table-counter } else { image-counter }
                        #numbering("1.1", counter(heading).at(location).first(), figure-counter.at(location).first())
                        #h(0.5em)
                        #if it.element.caption != none [
                            #it.element.caption.body
                        ]
                    ],
                )
            ] else if it.element.numbering != none [
                #grid(
                    columns: (auto, 1fr),
                    column-gutter: 1em,
                    strong[Chương #numbering(it.element.numbering, ..heading-number)],
                    strong[#upper(it.element.body) #h(1fr) #it.page()],
                )
            ] else [
                #grid(columns: 1fr, strong[#it.element.body])
            ]
        ])
    }

    show outline.entry.where(level: 2): it => context {
        v(0.2cm)
        let num = counter(heading).at(it.element.location())
        link(it.element.location(), block(width: 100%)[
            #pad(left: 1.5em)[
                #grid(
                    columns: (auto, 1fr),
                    column-gutter: 1em,
                    if it.element.numbering != none { numbering(it.element.numbering, ..num) } else { none },
                    [#it.element.body #h(0.5em) #box(width: 1fr, repeat[. #h(4pt)]) #h(0.1cm) #if it.element.func() != figure [#it.page()]],
                )
            ]
        ])
    }

    show outline.entry.where(level: 3): it => context {
        v(0.2cm)
        let num = counter(heading).at(it.element.location())
        link(it.element.location(), block(width: 100%)[
            #v(6pt)
            #pad(left: 3.85em)[
                #grid(
                    columns: (auto, 1fr),
                    column-gutter: 1em,
                    if it.element.numbering != none { numbering(it.element.numbering, ..num) } else { none },
                    [#it.element.body #h(0.5em) #box(width: 1fr, repeat[. #h(4pt)]) #h(0.1cm) #if it.element.func() != figure [#it.page()]],
                )
            ]
        ])
    }

    body
}
