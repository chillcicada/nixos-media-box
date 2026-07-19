#set page(margin: 0mm, height: 230mm, width: 153mm)

#let background = it => {
  import "bundle.typ": border-svg, covers-svg, license-svg, logo-svg

  let length = 6mm

  // background
  place(center + horizon, image(bytes(covers-svg.text), width: 100%, height: 100%))

  // white lines
  place(top + left, curve(stroke: white + .2mm, ..for i in range(-34, 21) {
    let dy = i * 2.5mm
    (
      curve.move((32mm, 168.15mm + dy)),
      curve.cubic((44.42mm, 165.70mm + dy), (81.41mm, 161.11mm + dy), (94.77mm, 160.45mm + dy)),
    )
  }))

  // logo
  place(center + horizon, dx: -11.7mm, dy: -47mm, image(bytes(logo-svg.text), width: 50mm))

  // crosshair
  {
    set line(length: length, stroke: .2mm + black)

    place(top + left, line(start: (0mm, length / 2)))
    place(top + right, line(start: (0mm, length / 2)))
    place(bottom + left, line(start: (0mm, -length / 2)))
    place(bottom + right, line(start: (0mm, -length / 2)))

    place(top + right, dx: -length * 2, dy: length * 3.1, line(start: (0mm, length / 2)))
    place(top + right, dx: -length * 2, dy: length * 18.2, line(start: (0mm, length / 2)))
    place(bottom + left, dx: length * 2, dy: -length * 2.0, line(start: (0mm, -length / 2)))
    place(bottom + left, dx: length * 2, dy: -length * 17.1, line(start: (0mm, -length / 2)))

    set line(angle: 90deg)

    place(top + left, line(start: (length / 2, 0mm)))
    place(top + right, line(start: (-length / 2, 0mm)))
    place(bottom + left, line(start: (length / 2, 0mm)))
    place(bottom + right, line(start: (-length / 2, 0mm)))

    set line(length: length / 2)

    place(top + right, dx: -length * 2, dy: length * 3.1, line(start: (-length / 2, 0mm)))
    place(top + right, dx: -length * 2, dy: length * 18.7, line(start: (-length / 2, 0mm)))
    place(bottom + left, dx: length * 2, dy: -length * 2.0, line(start: (length / 2, 0mm)))
    place(bottom + left, dx: length * 2, dy: -length * 17.6, line(start: (length / 2, 0mm)))
  }

  // CMYK markers
  {
    set rect(width: length, height: length, stroke: none)

    // K C M Y
    for (i, c) in ("#000000", "#00ffff", "#ff00ff", "#ffff00").enumerate() {
      place(top + left, dy: length * (i + 2), rect(fill: rgb(c)))
      place(bottom + right, dy: -length * (i + 2), rect(fill: rgb(c)))
    }
  }

  // border
  place(center + horizon, image(bytes(border-svg.text), width: 100%, height: 100%))

  // separator line
  place(center + horizon, dx: 18.3mm, line(stroke: .2mm + black, angle: 90deg, length: 100% - 8mm))

  // logo
  place(center + horizon, dx: -11.7mm, dy: 40mm, image(
    bytes(logo-svg.text.replace(regex("#[0-9a-fA-F]{6,8}"), "#b5c5df")),
    width: 30mm,
  ))

  // license
  place(center + bottom, dx: -29.55mm, dy: -9.5mm, image(bytes(license-svg.text), width: 18mm))

  // content
  it
}
