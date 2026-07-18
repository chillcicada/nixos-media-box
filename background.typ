#set page(margin: 0mm, height: 230mm, width: 153mm)

#let background = it => {
  import "bundle.typ": border-svg, covers-svg, license-svg, logo-svg

  let length = 6mm

  // background
  place(center + horizon, image(bytes(covers-svg.text), width: 100%, height: 100%))

  // white lines
  curve(stroke: white + .2mm, ..for i in range(-34, 21) {
    let dy = i * 2.5mm
    (
      curve.move((32mm, 168.15mm + dy)),
      curve.cubic((44.42mm, 165.70mm + dy), (81.41mm, 161.11mm + dy), (94.77mm, 160.45mm + dy)),
    )
  })

  // logo
  place(center + horizon, dx: -11.5mm, dy: -47mm, image(bytes(logo-svg.text), width: 50mm))

  // crosshair
  {
    set line(length: length, stroke: .2mm + black)

    place(top + left, line(start: (0mm, length / 2)))
    place(top + left, line(start: (length / 2, 0mm), angle: 90deg))

    place(top + right, line(start: (-length / 2, 0mm), angle: 90deg))
    place(top + right, line(start: (0mm, length / 2)))

    place(bottom + left, line(start: (0mm, -length / 2)))
    place(bottom + left, line(start: (length / 2, 0mm), angle: 90deg))

    place(bottom + right, line(start: (0mm, -length / 2)))
    place(bottom + right, line(start: (-length / 2, 0mm), angle: 90deg))

    place(top + right, dx: -length * 2, dy: length * 3.1, line(start: (0mm, length / 2)))
    place(top + right, dx: -length * 2, dy: length * 18.7 - length / 2, line(start: (0mm, length / 2)))
    place(bottom + left, dx: length * 2, dy: -length * 2.0, line(start: (0mm, -length / 2)))
    place(bottom + left, dx: length * 2, dy: -length * 17.6 + length / 2, line(start: (0mm, -length / 2)))

    set line(length: length / 2)

    place(top + right, dx: -length * 2, dy: length * 3.1, line(start: (-length / 2, 0mm), angle: 90deg))
    place(top + right, dx: -length * 2, dy: length * 18.7, line(start: (-length / 2, 0mm), angle: 90deg))
    place(bottom + left, dx: length * 2, dy: -length * 2.0, line(start: (length / 2, 0mm), angle: 90deg))
    place(bottom + left, dx: length * 2, dy: -length * 17.6, line(start: (length / 2, 0mm), angle: 90deg))
  }

  // CMYK markers
  {
    set rect(width: length, height: length, stroke: none)

    place(top + left, dy: length * 2, rect(fill: rgb("#000000"))) // K
    place(top + left, dy: length * 3, rect(fill: rgb("#00ffff"))) // C
    place(top + left, dy: length * 4, rect(fill: rgb("#ff00ff"))) // M
    place(top + left, dy: length * 5, rect(fill: rgb("#ffff00"))) // Y

    place(bottom + right, dy: -length * 2, rect(fill: rgb("#000000"))) // K
    place(bottom + right, dy: -length * 3, rect(fill: rgb("#00ffff"))) // C
    place(bottom + right, dy: -length * 4, rect(fill: rgb("#ff00ff"))) // M
    place(bottom + right, dy: -length * 5, rect(fill: rgb("#ffff00"))) // Y
  }

  // border
  place(center + horizon, image(bytes(border-svg.text), width: 100%, height: 100%))

  // separator line
  place(center + horizon, dx: 18.3mm, line(stroke: .2mm + black, angle: 90deg, length: 100% - 8mm))

  // back content
  place(center + bottom, dy: -10mm, block(width: 86mm, height: 105mm, {
    set align(top)
    block(height: 10mm, width: 100%, {})
  }))

  // logo
  place(center + horizon, dx: -11.5mm, dy: 35mm, image(
    bytes(logo-svg.text.replace(regex("#[0-9a-fA-F]{6,8}"), "#b5c5df")),
    width: 30mm,
  ))

  // license
  place(center + bottom, dx: -29.55mm, dy: -9.5mm, image(bytes(license-svg.text), width: 18mm))

  // content
  place(top + left, it)
}
