#import "@preview/tiaoma:0.3.0"

#set page(margin: 0mm, height: 230mm, width: 153mm)

#import "background.typ": background

#show: background

#set text(font: ("Vegur", (name: "Noto Sans CJK SC", covers: "latin-in-cjk")), size: 7pt)

#let logo = text(size: 15pt)[NixOS® GNU/Linux™]

#let title = {
  logo
  v(-1.5em)
  text(size: 18pt, [盒装安装媒介])
}

// header
#place(left + top, dx: 37mm, dy: 9mm, {
  logo
  v(-2em)
  tiaoma.hibc-128("979-32-8", height: 7mm, width: 55mm, options: (show-hrt: false))
})

// front
#place(left + top, dx: 37mm, dy: 27mm, {
  text(weight: 150, [请仔细阅读安装说明并在管理员指导下使用 \ 谨慎用于生产环境安装])

  v(-1em)

  title
})

// middle
#place(left + top, dx: 37mm, dy: 117mm, logo)

// back
#place(left + top, dx: 37mm, dy: 131mm, block(width: 55mm, height: 78mm, {
  title

  text(size: 6pt)[
    #set par(justify: true, spacing: 1.8em)

    #v(2em)

    NixOS 是一个自由的操作系统（OS），提供您安装在计算机上使用。操作系统就是能让您的计算机工作的一系列基本程序和实用工具。

    NixOS 是一个基于 Nix 包管理器的自由开源 Linux 发行版。NixOS 采用不可变设计和原子更新模型，它使用声明式的配置系统，允许您以可重现和可移植的方式管理系统配置。

    #par(hanging-indent: 8.5em, [
      硬件要求（桌面）：Intel/AMD/ARM 64 位处理器
      \ 4 GB 内存（推荐 8 GB）
      \ 15 GB 硬盘可用空间（推荐 30 GB）
      \ （可选）Internet 连接
    ])

    #v(-1.1em)

    安装前备份所有数据，谨慎分区。
    \ 安装方法、发行说明、注意事项等详见说明书。
    \ 许可协议：MIT，内含软件的许可协议可能有所不同。
    \ 网站主页：https://nixos.org/

  ]

  align(right + bottom, text(size: 12pt, [Nix & NixOS 基金会]))
}))

// left
#place(left + top, dx: 21mm, dy: 131mm, rotate(90deg, reflow: true, text(weight: 150, [
  #let format = date => text(tracking: 5pt, { h(5.6em) + date })

  \ 产品批号 #format[26·05]
  \ 生产日期 #format[2026-05-30]
  \ 有效期至 #format[2027-05]
])))

#place(left + horizon, dx: 25mm, dy: 3mm, rotate(-90deg, reflow: true, text(size: 6pt, align(center)[
  NixOS \ GNU/Linux
])))

#place(left + top, dx: 1mm, dy: 166mm, rotate(90deg, tiaoma.ean("0", width: 18mm, height: 10mm, options: (
  show-hrt: false,
))))

// specification
#for dy in (15mm, 101mm, 118mm, 204mm) {
  place(left + top, dx: 96mm, dy: dy, list(marker: [---])[Flash Drive][64-bit])
}

// right
#for dy in (23mm, 126mm) {
  place(left + top, dx: 91mm, dy: dy, image("nixos-logo.svg", width: 30mm))
}

#place(left + bottom, dx: 122mm, dy: -127mm, rotate(-90deg, reflow: true, [
  码上放心 · SHA-256 \ 网站查询：nixos.org
]))

#place(left + top, dx: 134mm, dy: 63mm, rotate(90deg, tiaoma.ean("0", width: 18mm, height: 10mm, options: (
  show-hrt: false,
))))

// footer
#place(left + top, dx: 57mm, dy: 215mm, {
  text(size: 10pt)[CC BY-SA 4.0]
  v(-1.3em)
  text(size: 6pt, weight: 150)[Based on arch-media-box-typst]
})

#place(left + top, dx: 96mm, dy: 215mm, {
  text(size: 6pt, weight: 150)[Maded by]
  v(-1em)
  text(size: 9pt)[ChillCicada]
})
