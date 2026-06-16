Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10A2BE655;
	Tue, 16 Jun 2026 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781645554; cv=none; b=i2icoxGYK3BZ1FulkM9nFDnwVtj/LVOUARTVPPTtU4S1lpn1lEQPTKIPwTl98RGndIVV6Oa6k7XaF77LER5asbNWhV5GZ4u2nOUlOyPIC6jjTorOaZtB8w946N5KkTuhjcgOgANbNMGF2a/jiiZQK1TZc6HNkRZOva+K83KKox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781645554; c=relaxed/simple;
	bh=792KCJxMe0S7F3GqjIQLfcGWGDlUXJ/SB7xaYd0FquA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbKBGvmQIJGqEkFhrQqZz7a3HG2SYq+raoHoVL75XwyV9OUCXR57tmTwb9mVWb/NDCDesqMqUi4aISBttalHGe3B+42BMxy8neHdD2dirT+M7fwKUeYnVtCBSEYJ2ULz2SDzPv6zGiADsLsRDukwRFN8+op+ws+vC38Z2y+2108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBJxBnV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBJxBnV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537551F000E9;
	Tue, 16 Jun 2026 21:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781645552;
	bh=YRFz0cljPIOnPqiF3oGhYgdoGGo6ODTK9jghRS2747g=;
	h=Date:From:To:Cc:Subject;
	b=gBJxBnV0VLneJxUJ+XvNSwAjlONO1lNAeZJQ07XmrD8gg5iv+FwxjmTcheo6EDsux
	 m6GJQjrMHpxnLnIg9gMpjUo2KYdYTdEH9jbGVqLy60D120AGqgnANiN8AtHRQuSOpy
	 SQr8qrpTkN1ksaMmVrJi0NWOFlnJZ0f0mYQbgEfD0U8DSNoivNUFjG3Qwy7jyEXhnc
	 ebkaU2HwXM++WywiUYYaTr1Vs85h4XxSW9VhK6EJN4CuHn+SJ2VYI8D9waBao18fc/
	 2Qaxj50zPdFPkbP41KGh+nvTSx5ye89KHcHsphkv292gC4tkR4yy/+9RaLU0GLh+2G
	 G0cdhfhsbxgkA==
Date: Tue, 16 Jun 2026 16:32:29 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree updates for v7.2
Message-ID: <20260616213229.GA2761475-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull DT updates for 7.2.

Rob


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.2

for you to fetch changes up to faa25db0892135c97a0bfd48d79173db0dd25ab2:

  dt-bindings: interrupt-controller: qcom,pdc: Add Maili compatible string (2026-06-16 08:53:12 -0500)

----------------------------------------------------------------
Devicetree updates for v7.2:

DT core:
- Add support for handling multiple cells in "iommu-map" entries.

- Support only 1 entry in /reserved-memory "reg" entries. Support for
  more than 1 entry has been broken.

- Fix a UAF on alloc_reserved_mem_array() failure

- Make "ibm,phandle" handling logic specific to PPC

- Use memcpy() instead of strcpy() for known length strings

- Ensure __of_find_n_match_cpu_property() handles malformed "reg"
  entries

- Add various checks that expected strings are strings before accessing
  them

- Drop redundant memset() when unflattening DT

DT bindings:
- Add a DTS style checker. Currently hooked up to dt_binding_check to
  check examples.

- Convert st,nomadik platform, ti,omap-dmm, and ti,irq-crossbar
  bindings to DT schema

- Add Apple System Management Controller hwmon, Qualcomm Hamoa Embedded
  Controller, Qualcomm IPQ6018 PWM controller, fsl,mc1323, Samsung
  SOFEF01-M DDIC panel, Freescale i.MX53 Television Encoder, Samsung S2M
  series PMIC extcon, and MT6365 PMIC AuxADC schemas

- Extend bindings for QCom Maili and Nord PDC, QCom Hali fastrpc,
  qcom,eliza-imem, qcom,oryon-1-5 CPU, and MT6365 Keys

- Consolidate "sram" property definitions

- Fix constraints on "nvmem" properties which only contain phandles and
  no arg cells

- Another pass of fixing "phandle-array" constraints

- Add Gira vendor prefix

----------------------------------------------------------------
Alexander Koskovich (1):
      dt-bindings: sram: Document qcom,eliza-imem

Andrew Rembrandt (1):
      dt-bindings: arm: st,nomadik: Convert to DT schema

Bhargav Joshi (2):
      dt-bindings: soc: ti,omap-dmm: Convert to DT schema
      dt-bindings: interrupt-controller: ti,irq-crossbar: Convert to DT schema

Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Daniel Golle (6):
      dt-bindings: misc: fsl,qoriq-mc: drop trailing whitespace
      dt-bindings: drop tab characters from DTS examples
      dt-bindings: add DTS style checker
      scripts/jobserver-exec: propagate child exit status
      dt-bindings: wire style checker into dt_binding_check
      dt-bindings: add self-test fixtures for style checker

Daniel Palmer (1):
      drivers/of: fdt: Make ibm,phandle logic only happen on pseries

David Laight (1):
      drivers/of/overlay: Use memcpy() to copy known length strings

Devi Priya (1):
      dt-bindings: pwm: add IPQ6018 binding

Frank Li (3):
      dt-bindings: display: imx: add deprecated property 'port' and 'display-timings'
      dt-bindings: display: imx: Add television encoder (TVE) for imx53
      dt-bindings: trivial-devices: add fsl,mc1323

Geert Uytterhoeven (2):
      dt-bindings: interrupt-controller: renesas,r9a09g077-icu: Fix reg size in example
      dt-bindings: cache: l2c2x0: Add missing power-domains

James Calligeros (1):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema

Kaustabh Chakraborty (1):
      dt-bindings: extcon: document Samsung S2M series PMIC extcon device

Konrad Dybcio (1):
      dt-bindings: nvmem: consumer: Make 'nvmem' an array of one-item entries

Krzysztof Kozlowski (4):
      docs: dt: writing-bindings: Extend compatible fallbacks guideline
      docs: dt: submitting-patches: Remove possible confusion of combining DTS
      media: dt-bindings: mediatek: Constrain iommus
      docs: dt: writing-schema: Clarify what is required in a schema

Louis-Alexis Eyraud (2):
      dt-bindings: input: mediatek,pmic-keys: Add MT6365 support
      dt-bindings: iio: adc: mt6359: Add MT6365 PMIC AuxADC

Lucas Stach (1):
      dt-bindings: vendor-prefixes: add Gira

Marijn Suijten (1):
      dt-bindings: display: panel: Describe Samsung SOFEF01-M DDIC

Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add Qualcomm reference device EC description

Mukesh Ojha (1):
      dt-bindings: misc: qcom,fastrpc: Add compatible for Hawi SoC

Pengpeng Hou (2):
      drivers/of: validate live-tree string properties before string use
      drivers/of: validate status properties in reconfig state changes

Rob Herring (Arm) (2):
      dt-bindings: Fix phandle-array constraints, again
      dt-bindings: Consolidate "sram" property definition

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

Sang-Heon Jeon (1):
      of/fdt: remove redundant memset in __unflatten_device_tree()

Sergey Shtylyov (1):
      of: cpu: add check in __of_find_n_match_cpu_property()

Shawn Guo (2):
      dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
      dt-bindings: interrupt-controller: Document PDC for Qualcomm Nord SoC

Svyatoslav Ryhel (2):
      dt-bindings: display: bridge: ssd2825: inherit dsi-controller properties
      dt-bindings: media: mt9m114: document common video device properties

Wandun Chen (4):
      of: reserved_mem: only support one <base size> entry in reg property
      of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array() fails
      of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
      of: reserved_mem: zero total_reserved_mem_cnt if no valid /reserved-memory entry

Yijie Yang (1):
      dt-bindings: interrupt-controller: qcom,pdc: Add Maili compatible string

bui duc phuc (1):
      dt-bindings: Remove the redundant 'type: boolean'

 Documentation/devicetree/bindings/Makefile         |   19 +-
 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 .../devicetree/bindings/arm/omap/crossbar.txt      |   55 -
 Documentation/devicetree/bindings/arm/omap/dmm.txt |   22 -
 .../devicetree/bindings/arm/st,nomadik.yaml        |   23 +
 .../devicetree/bindings/arm/ste-nomadik.txt        |   38 -
 .../devicetree/bindings/cache/l2c2x0.yaml          |    3 +
 .../bindings/display/bridge/solomon,ssd2825.yaml   |    3 +-
 .../display/imx/fsl,imx-parallel-display.yaml      |   11 +
 .../bindings/display/imx/fsl,imx53-tve.yaml        |  104 ++
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml      |    2 +-
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |    5 +-
 .../bindings/display/mediatek/mediatek,ovl.yaml    |    5 +-
 .../bindings/display/mediatek/mediatek,rdma.yaml   |    4 +-
 .../bindings/display/mediatek/mediatek,wdma.yaml   |    4 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |    6 +-
 .../bindings/display/panel/samsung,sofef01-m.yaml  |   94 ++
 .../display/rockchip/rockchip,rk3399-cdn-dp.yaml   |    2 +
 .../devicetree/bindings/dma/stericsson,dma40.yaml  |    8 +-
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |   56 +
 .../bindings/extcon/samsung,s2mu005-muic.yaml      |   40 +
 .../devicetree/bindings/hwmon/apple,smc-hwmon.yaml |   85 ++
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.yaml |    1 +
 .../bindings/i2c/opencores,i2c-ocores.yaml         |    8 +-
 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   17 +-
 .../bindings/iio/adc/st,spear600-adc.yaml          |    2 +-
 .../devicetree/bindings/input/atmel,maxtouch.yaml  |    3 +-
 .../devicetree/bindings/input/imx-keypad.yaml      |   32 +-
 .../bindings/input/mediatek,pmic-keys.yaml         |   21 +-
 .../bindings/input/microchip,cap11xx.yaml          |   12 +-
 .../bindings/input/touchscreen/ti,ads7843.yaml     |    4 +-
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    2 +
 .../renesas,r9a09g077-icu.yaml                     |    2 +-
 .../interrupt-controller/ti,irq-crossbar.yaml      |   96 ++
 .../devicetree/bindings/leds/leds-lp55xx.yaml      |    2 +-
 .../devicetree/bindings/media/cnm,wave521c.yaml    |    2 +-
 .../bindings/media/i2c/onnn,mt9m114.yaml           |    5 +-
 .../bindings/media/mediatek,vcodec-encoder.yaml    |    2 +-
 .../media/mediatek,vcodec-subdev-decoder.yaml      |    2 +-
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |    6 +-
 .../devicetree/bindings/media/rockchip,vdec.yaml   |    5 +-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |    6 +-
 .../memory-controllers/nvidia,tegra20-mc.yaml      |    4 +-
 .../memory-controllers/samsung,exynos5422-dmc.yaml |    2 +-
 .../devicetree/bindings/mfd/apple,smc.yaml         |   36 +
 .../devicetree/bindings/mfd/rockchip,rk816.yaml    |    3 +-
 .../devicetree/bindings/misc/fsl,qoriq-mc.yaml     |    2 +-
 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |    1 +
 .../mmc/hisilicon,hi3798cv200-dw-mshc.yaml         |    7 +-
 .../devicetree/bindings/net/mediatek,net.yaml      |    3 +-
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     |   12 +
 .../devicetree/bindings/net/qcom,ipa.yaml          |   12 +
 .../devicetree/bindings/net/ti,icssg-prueth.yaml   |    2 +-
 .../devicetree/bindings/net/ti,icssm-prueth.yaml   |    2 +-
 .../bindings/net/wireless/qcom,ath10k.yaml         |    8 +-
 .../bindings/net/wireless/qcom,ath11k.yaml         |    8 +-
 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |   18 +
 .../devicetree/bindings/nvmem/nvmem-consumer.yaml  |    2 +
 .../bindings/pci/mediatek-pcie-mt7623.yaml         |    4 +-
 .../bindings/pci/samsung,exynos-pcie.yaml          |    2 +-
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |    5 +-
 .../devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml  |   51 +
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml        |    7 +-
 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |    6 +
 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |    7 +
 .../bindings/remoteproc/qcom,pas-common.yaml       |    6 +
 .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml  |    6 +
 .../bindings/remoteproc/qcom,sc7180-mss-pil.yaml   |    6 +
 .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  |    6 +
 .../bindings/remoteproc/qcom,sc7280-mss-pil.yaml   |    6 +
 .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  |    6 +
 .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml  |    6 +
 .../bindings/remoteproc/qcom,wcnss-pil.yaml        |    6 +
 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml       |    8 -
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       |    8 -
 .../bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     |    9 +-
 .../devicetree/bindings/soc/ti/ti,omap-dmm.yaml    |   53 +
 .../bindings/sound/davinci-mcasp-audio.yaml        |    4 +-
 .../devicetree/bindings/sound/samsung,tm2.yaml     |    8 +-
 .../devicetree/bindings/sound/simple-card.yaml     |    6 +-
 .../devicetree/bindings/spi/st,stm32-spi.yaml      |   10 +-
 .../devicetree/bindings/spi/st,stm32mp25-ospi.yaml |    5 +-
 .../devicetree/bindings/sram/sram-consumer.yaml    |   26 +
 Documentation/devicetree/bindings/sram/sram.yaml   |    1 +
 .../devicetree/bindings/submitting-patches.rst     |    7 +-
 .../devicetree/bindings/trivial-devices.yaml       |    2 +
 .../bindings/usb/chipidea,usb2-common.yaml         |    2 +
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |    7 +-
 .../devicetree/bindings/usb/richtek,rt1711h.yaml   |    3 +-
 .../devicetree/bindings/usb/ti,j721e-usb.yaml      |    8 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 .../devicetree/bindings/writing-bindings.rst       |   12 +-
 .../devicetree/bindings/writing-schema.rst         |    2 +-
 MAINTAINERS                                        |    8 +-
 Makefile                                           |    6 +
 drivers/cdx/cdx_msi.c                              |   10 +-
 drivers/iommu/of_iommu.c                           |    6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c           |   10 +-
 drivers/of/base.c                                  |  270 ++++-
 drivers/of/cpu.c                                   |    2 +-
 drivers/of/dynamic.c                               |   20 +-
 drivers/of/fdt.c                                   |    4 +-
 drivers/of/irq.c                                   |   32 +-
 drivers/of/of_reserved_mem.c                       |   79 +-
 drivers/of/overlay.c                               |    4 +-
 drivers/of/property.c                              |   27 +-
 drivers/of/unittest.c                              |   32 +
 drivers/pci/controller/dwc/pci-imx6.c              |   55 +-
 drivers/pci/controller/pcie-apple.c                |    6 +-
 drivers/xen/grant-dma-ops.c                        |    5 +-
 include/linux/of.h                                 |   32 +-
 scripts/dtc/dt-check-style                         | 1192 ++++++++++++++++++++
 scripts/dtc/dt-style-selftest/bad/dts-spaces.dts   |   12 +
 .../bad/yaml-child-addr-order.yaml                 |   41 +
 .../bad/yaml-child-name-order.yaml                 |   37 +
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   30 +
 .../bad/yaml-digit-node-order.yaml                 |   37 +
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   29 +
 .../dt-style-selftest/bad/yaml-indent-strict.yaml  |   29 +
 .../bad/yaml-label-in-string.yaml                  |   30 +
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   29 +
 .../dt-style-selftest/bad/yaml-mixed-indent.yaml   |   29 +
 .../dt-style-selftest/bad/yaml-multi-close.yaml    |   35 +
 .../dtc/dt-style-selftest/bad/yaml-node-close.yaml |   31 +
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   29 +
 .../dt-style-selftest/bad/yaml-prop-pairing.yaml   |   33 +
 .../dt-style-selftest/bad/yaml-required-blank.yaml |   33 +
 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml    |   29 +
 .../bad/yaml-trailing-comment.yaml                 |   26 +
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   29 +
 .../bad/yaml-unclosed-comment.yaml                 |   30 +
 .../bad/yaml-unit-addr-prefix.yaml                 |   29 +
 .../dtc/dt-style-selftest/bad/yaml-unit-addr.yaml  |   29 +
 .../dt-style-selftest/bad/yaml-unused-label.yaml   |   29 +
 .../bad/yaml-value-ws-multiline.yaml               |   27 +
 .../dtc/dt-style-selftest/bad/yaml-value-ws.yaml   |   29 +
 .../dt-style-selftest/expected/dts-spaces.dts.txt  |    2 +
 .../expected/yaml-child-addr-order.yaml.txt        |    2 +
 .../expected/yaml-child-name-order.yaml.txt        |    2 +
 .../expected/yaml-cont-align.yaml.txt              |    2 +
 .../expected/yaml-digit-node-order.yaml.txt        |    2 +
 .../expected/yaml-hex-case.yaml.txt                |    2 +
 .../expected/yaml-indent-strict.yaml.txt           |    2 +
 .../expected/yaml-label-in-string.yaml.txt         |    2 +
 .../expected/yaml-line-length.yaml.txt             |    2 +
 .../expected/yaml-mixed-indent.yaml.txt            |    3 +
 .../expected/yaml-multi-close.yaml.txt             |    3 +
 .../expected/yaml-node-close.yaml.txt              |    2 +
 .../expected/yaml-prop-order.yaml.txt              |    2 +
 .../expected/yaml-prop-pairing.yaml.txt            |    3 +
 .../expected/yaml-required-blank.yaml.txt          |    3 +
 .../dt-style-selftest/expected/yaml-tab.yaml.txt   |    2 +
 .../expected/yaml-trailing-comment.yaml.txt        |    2 +
 .../expected/yaml-trailing-ws.yaml.txt             |    2 +
 .../expected/yaml-unclosed-comment.yaml.txt        |    2 +
 .../expected/yaml-unit-addr-prefix.yaml.txt        |    2 +
 .../expected/yaml-unit-addr.yaml.txt               |    2 +
 .../expected/yaml-unused-label.yaml.txt            |    2 +
 .../expected/yaml-value-ws-multiline.yaml.txt      |    2 +
 .../expected/yaml-value-ws.yaml.txt                |    2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |   26 +
 scripts/dtc/dt-style-selftest/good/dts-tab.dts     |   29 +
 .../dtc/dt-style-selftest/good/yaml-4space.yaml    |   41 +
 .../good/yaml-tricky-parsing.yaml                  |   57 +
 scripts/dtc/dt-style-selftest/run.sh               |   71 ++
 scripts/jobserver-exec                             |    4 +-
 166 files changed, 3608 insertions(+), 448 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/crossbar.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/dmm.txt
 create mode 100644 Documentation/devicetree/bindings/arm/st,nomadik.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/ste-nomadik.txt
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
 create mode 100644 Documentation/devicetree/bindings/extcon/samsung,s2mu005-muic.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,irq-crossbar.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,omap-dmm.yaml
 create mode 100644 Documentation/devicetree/bindings/sram/sram-consumer.yaml
 create mode 100755 scripts/dtc/dt-check-style
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-digit-node-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-label-in-string.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-comment.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unclosed-comment.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr-prefix.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-tab.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
 create mode 100755 scripts/dtc/dt-style-selftest/run.sh
