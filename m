Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB121AF4E9;
	Mon, 17 Aug 2026 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787007093; cv=none; b=EnE101xKLMsp4wcY8OXE4vbn3ceFkcSZiWbIGyeoXk6RuTE3c2jf0usFpG7r1YMAUgWmxdkBYDn/TDQSJwAec+gRVS9rfWD3mo0RVTKmKtTmvJVKFP6G7xHne2VYuhV1lYJh2yJ1umM+kSp8Nb1MQF/OcoJ4kRQ6Ggbl13bPMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787007093; c=relaxed/simple;
	bh=Rhw0MB9vjSa5c95S/P1FQF4MwCxvmkf7i6IJTaRq4fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqcxRLRYEwc9ZxW19oKnryf9Fy8BMCvdFUO4O9Lp553IY8vCJQHY/w5i/m8FdRk+BbtehtXggoPTGTRJYuVGdSMTgBSVfAydyWTmBY/eW3rw6rA8MI49CPOEzmx1QOhF9a1bFjupU+resOS23dVsR89yny/YjDlHY6XSw0x1yVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvpa2uy1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvpa2uy1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E441F000E9;
	Mon, 17 Aug 2026 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787007091;
	bh=LMZydfam8QQUAHlhfACJvXhAn7X3NEKkir+12fGaH84=;
	h=Date:From:To:Cc:Subject;
	b=mvpa2uy1woWnBA7Maj5yZUWgUk5Z5A+fNQIDvlqYnEY0hCVBwuacgRl4Ur9mtE/Yn
	 QM4EmRpqUH10y5Pxa+5scnjC4gtIYu6MabfcSGGaGDynDaGZh06Fc0dT8Y+EJLYFp1
	 Abw0oavAFhZ7UBZmvQO8UzWnllVnw2I9K5i0GXBMA2itMC/heqfi8hfmYO3zmhERCg
	 ydPE8fnody59NUlN6oJ7xZsFMhtnXxSz7VDxoDMQmh84t9e3UwEzI1rJ90n/V62/LB
	 TPyPbsbft+b0JxzwPfhDgUytBUuM5u1U65IVTZAxzfVNffiIct8Ryvp6wfaZ3LxBJ1
	 8/af1WVnavOaw==
Date: Mon, 17 Aug 2026 17:51:30 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree updates for v7.3
Message-ID: <20260817225130.GA2508968-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull Devicetree updates for v7.3.

Rob


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.3

for you to fetch changes up to e1c13aed4a1641550e8c9518c96f016e1d52d09b:

  dt-bindings: interconnect: qcom-bwmon: Add Maili cpu-bwmon compatible (2026-08-15 15:46:52 -0500)

----------------------------------------------------------------
Devicetree updates for v7.3:

- Add a DT maintainer profile document

- Various dt-check-style improvements

- Add a devres managed reserved memory region init function

- Print node name on any skipped reserved memory regions

- Correctly handle optional argument in of_parse_phandle_with_args_map()

- Convert ti,keystone-reset, ti,da850-vpif, TI L4 interconnect, TI
  SmartReflex, microchip,pic32mzda-dmt, microchip,pic32mzda-wdt, TI
  DA8XX MSTPRI bus, and Xen VM bindings to DT schema format

- Add bindings for StarFive JHB100 plic, Allwinner A733 NMI controller,
  MediaTek MT8173 GPU, QCom Shikra, Eliza, and Maili cpu-bwmon, and QCom
  Shikra SCM firmware

- A couple of syntax fixes found using PoC Rust implementation of
  dtschema tools

- Clean-ups for typos, brackets, incorrect "::" usages, and
  white-space style

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: interconnect: qcom-bwmon: Document Eliza BWMONs compatible

Bhargav Joshi (2):
      media: dt-bindings: ti,da850-vpif: Convert to dt-schema
      dt-bindings: power: reset: ti,keystone-reset: Convert to DT schema

Chen-Yu Tsai (1):
      dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU

Eduard Bostina (3):
      dt-bindings: bus: Convert DA8XX MSTPRI to DT schema
      dt-bindings: power: Convert TI SmartReflex to DT schema
      dt-bindings: arm: omap: Convert L4 interconnect to DT schema

Icenowy Zheng (1):
      dt-bindings: display: verisilicon,dc: make resets non-optional

Jerome Brunet (1):
      dt-bindings: irq: sun7i-nmi: Document the Allwinner A733 NMI controller

Komal Bajaj (1):
      dt-bindings: firmware: qcom,scm: Document SCM on Shikra SoC

Konrad Dybcio (1):
      of: reserved_mem: Introduce devres-managed initialization function

Krzysztof Kozlowski (16):
      dt-bindings: clock: Drop incorrect usage of double '::'
      dt-bindings: Drop incorrect usage of double '::'
      dt-bindings: sram: qcom,imem: Narrow allowed reboot modes
      dtc: dt-check-style: Narrow disallowing of tab in DTS only to YAML
      dtc: dt-check-style: Allow space-aligning indentation in DTS
      dtc: dt-check-style: Rework handling YAML/DTS in rules
      dtc: dt-check-style: Expect first device_type
      dtc: dt-check-style: Handle properly DTC-style includes
      dtc: dt-check-style: Print proper line number of indentation detection place
      dtc: dt-check-style: Add more DTS test cases
      docs: dt: writing-schema: Extend expectations about example part of binding
      docs: dt: maintainer: Add Devicetree and OF maintainer profile document
      docs: dt: submitting-patches: Mention expectation about dt-check-style
      dt-bindings: Correct white-space style
      dtc: dt-check-style: Add missing /dts-v1/ to few test cases
      dtc: dt-check-style: Simplify setting depth of DtsLine

Laszlo Ersek (1):
      dt-bindings: update Sudeep Holla's email address

Ley Foon Tan (1):
      dt-bindings: interrupt-controller: Add StarFive JHB100 plic

Manuel Ebner (1):
      dt-bindings: fix typos and brackets

Miquel Raynal (Schneider Electric) (1):
      of: base: Handle optional argument in of_parse_phandle_with_args_map()

Rob Herring (Arm) (3):
      dt-bindings: power: maxim,max17042: Fix temp types to signed
      dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: Drop invalid JSON pointer
      dt-bindings: devfreq: samsung,exynos-ppmu: Use standard regex syntax

Sang-Heon Jeon (1):
      of: reserved_mem: print skipped node name when too many regions are defined

Sayantan Chakraborty (1):
      dt-bindings: interconnect: qcom-bwmon: Add Shikra cpu-bwmon compatible

Tejas Mutalikdesai (1):
      dt-bindings: arm: xen: Convert to DT schema

Udaya Kiran Challa (2):
      dt-bindings: watchdog: microchip,pic32mzda-wdt: Convert to DT schema
      dt-bindings: watchdog: microchip,pic32mzda-dmt: Convert to DT schema

Yijie Yang (1):
      dt-bindings: interconnect: qcom-bwmon: Add Maili cpu-bwmon compatible

 .../bindings/arm/arm,juno-fpga-apb-regs.yaml       |   2 +-
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml |   2 +-
 .../devicetree/bindings/arm/arm,vexpress-scc.yaml  |   2 +-
 .../bindings/arm/firmware/linaro,optee-tz.yaml     |   8 +-
 .../devicetree/bindings/arm/mediatek.yaml          |   2 +-
 Documentation/devicetree/bindings/arm/omap/l4.txt  |  37 -----
 Documentation/devicetree/bindings/arm/psci.yaml    |  18 +--
 .../bindings/arm/qcom,coresight-tnoc.yaml          |   2 +-
 .../bindings/arm/qcom,coresight-tpdm.yaml          |   2 +-
 .../devicetree/bindings/arm/qcom-soc.yaml          |   4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   4 +-
 .../bindings/arm/samsung/samsung-soc.yaml          |   4 +-
 Documentation/devicetree/bindings/arm/xen.txt      |  62 --------
 Documentation/devicetree/bindings/arm/xen.yaml     | 110 ++++++++++++++
 Documentation/devicetree/bindings/ata/st,ahci.yaml |  22 +--
 .../devicetree/bindings/bus/ti,da850-mstpri.txt    |  20 ---
 .../devicetree/bindings/bus/ti,da850-mstpri.yaml   |  37 +++++
 .../devicetree/bindings/bus/ti,omap-l4.yaml        | 140 +++++++++++++++++
 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |   2 +-
 .../bindings/clock/qcom,gcc-apq8064.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-apq8084.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-ipq6018.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-ipq8064.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-mdm9607.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-mdm9615.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-msm8660.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-msm8909.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-msm8916.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-msm8953.yaml           |   2 +-
 .../bindings/clock/qcom,gcc-msm8974.yaml           |   2 +-
 .../devicetree/bindings/clock/qcom,gcc-sdm660.yaml |   2 +-
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   2 +-
 .../bindings/clock/qcom,ipq5018-gcc.yaml           |   2 +-
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |   2 +-
 .../bindings/clock/qcom,qca8k-nsscc.yaml           |   2 +-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |   2 +-
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   2 +-
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |   2 +-
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      |   2 +-
 .../bindings/clock/qcom,sm6115-lpasscc.yaml        |   2 +-
 .../bindings/clock/qcom,sm8350-videocc.yaml        |   2 +-
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   2 +-
 .../clock/renesas,rcar-usb2-clock-sel.yaml         |   4 +-
 .../bindings/clock/samsung,exynos5260-clock.yaml   |   6 +-
 .../bindings/clock/samsung,exynos5410-clock.yaml   |   2 +-
 .../bindings/clock/samsung,exynos5433-clock.yaml   |   2 +-
 .../bindings/clock/samsung,exynos7-clock.yaml      |   2 +-
 .../bindings/clock/samsung,exynos850-clock.yaml    |   2 +-
 .../bindings/clock/samsung,exynosautov9-clock.yaml |   2 +-
 .../clock/samsung,exynosautov920-clock.yaml        |   2 +-
 .../bindings/clock/samsung,s5pv210-clock.yaml      |   2 +-
 .../devfreq/event/samsung,exynos-ppmu.yaml         |   2 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |  20 +--
 .../bindings/display/samsung/samsung,fimd.yaml     |   4 +-
 .../bindings/display/ti/ti,am65x-dss.yaml          |  12 +-
 .../bindings/display/ti/ti,j721e-dss.yaml          |  98 ++++++------
 .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |  42 +++---
 .../bindings/display/verisilicon,dc.yaml           |   2 +
 .../bindings/dsp/mediatek,mt8195-dsp.yaml          |   2 +-
 .../devicetree/bindings/dts-coding-style.rst       |  15 +-
 .../bindings/dvfs/performance-domain.yaml          |   2 +-
 .../devicetree/bindings/firmware/arm,scmi.yaml     |   2 +-
 .../devicetree/bindings/firmware/arm,scpi.yaml     |   2 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 .../devicetree/bindings/gpio/st,nomadik-gpio.yaml  |   2 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   1 +
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   2 +-
 .../devicetree/bindings/i2c/st,sti-i2c.yaml        |   2 +-
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   6 +-
 .../bindings/interconnect/samsung,exynos-bus.yaml  |  14 +-
 .../allwinner,sun7i-a20-sc-nmi.yaml                |   3 +
 .../mediatek,mt6577-sysirq.yaml                    |   3 +-
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../devicetree/bindings/leds/qcom,pm8058-led.yaml  |   4 +-
 .../devicetree/bindings/leds/skyworks,aat1290.yaml |   6 +-
 .../devicetree/bindings/mailbox/arm,mhuv3.yaml     |   2 +-
 .../bindings/mailbox/st,sti-mailbox.yaml           |   2 +-
 .../devicetree/bindings/media/cec/cec-gpio.yaml    |   2 +-
 .../devicetree/bindings/media/ti,da850-vpif.txt    | 106 -------------
 .../devicetree/bindings/media/ti,da850-vpif.yaml   | 168 +++++++++++++++++++++
 .../bindings/memory-controllers/renesas,dbsc.yaml  |   2 +-
 .../devicetree/bindings/mfd/maxim,max77620.yaml    |   2 +-
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |   2 +-
 .../bindings/net/wireless/qcom,ath10k.yaml         |  34 ++---
 Documentation/devicetree/bindings/opp/opp-v2.yaml  |  28 ++--
 .../bindings/phy/samsung,mipi-video-phy.yaml       |   4 +-
 .../devicetree/bindings/phy/samsung,usb2-phy.yaml  |   2 +-
 .../bindings/phy/samsung,usb3-drd-phy.yaml         |   2 +-
 .../bindings/pinctrl/mediatek,mt7988-pinctrl.yaml  |   2 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   2 +-
 .../bindings/power/renesas,rcar-sysc.yaml          |   2 +-
 .../bindings/power/reset/keystone-reset.txt        |  67 --------
 .../bindings/power/reset/restart-handler.yaml      |   8 +-
 .../bindings/power/reset/ti,keystone-reset.yaml    |  81 ++++++++++
 .../bindings/power/supply/maxim,max17042.yaml      |   4 +-
 .../devicetree/bindings/power/ti,smartreflex.yaml  |  50 ++++++
 .../devicetree/bindings/power/ti-smartreflex.txt   |  47 ------
 Documentation/devicetree/bindings/ptp/fsl,ptp.yaml |  12 +-
 .../devicetree/bindings/pwm/pwm-sifive.yaml        |   2 +-
 .../bindings/regulator/maxim,max77802.yaml         |   4 +-
 .../regulator/mediatek,mt6358-regulator.yaml       |   2 +-
 .../bindings/regulator/richtek,rtq2208.yaml        |   2 +-
 .../bindings/regulator/rohm,bd71837-regulator.yaml |   4 +-
 .../bindings/regulator/rohm,bd71847-regulator.yaml |   4 +-
 .../bindings/serial/qcom,msm-uartdm.yaml           |   2 +-
 .../devicetree/bindings/slimbus/slimbus.yaml       |   4 +-
 .../bindings/soc/qcom/qcom,apr-services.yaml       |   2 +-
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |   8 +-
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |   2 +-
 .../bindings/soc/renesas/renesas-soc.yaml          |   4 +-
 .../devicetree/bindings/sound/qcom,q6asm-dais.yaml |   2 +-
 .../devicetree/bindings/sram/qcom,imem.yaml        |  20 +++
 .../devicetree/bindings/submitting-patches.rst     |   3 +
 .../bindings/thermal/samsung,exynos-thermal.yaml   |   4 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  12 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  12 +-
 .../devicetree/bindings/usb/ti,twl4030-usb.yaml    |   2 +-
 .../bindings/watchdog/microchip,pic32-dmt.txt      |  19 ---
 .../bindings/watchdog/microchip,pic32-wdt.txt      |  18 ---
 .../bindings/watchdog/microchip,pic32mzda-dmt.yaml |  45 ++++++
 .../bindings/watchdog/microchip,pic32mzda-wdt.yaml |  44 ++++++
 .../devicetree/bindings/writing-schema.rst         |  13 +-
 Documentation/process/maintainer-devicetree.rst    |  72 +++++++++
 MAINTAINERS                                        |   3 +
 drivers/of/base.c                                  |  12 +-
 drivers/of/of_reserved_mem.c                       |  47 +++++-
 include/linux/of_reserved_mem.h                    |   7 +
 scripts/dtc/dt-check-style                         | 149 +++++++++---------
 .../dt-style-selftest/bad/dts-child-name-order.dts |  32 ++++
 .../bad/dts-extend-node-child-name-order.dts       |  25 +++
 .../bad/dts-extend-node-digit-node-order.dts       |  33 ++++
 .../dtc/dt-style-selftest/bad/dts-mixed-indent.dts |  21 +++
 .../dt-style-selftest/bad/dts-property-order.dts   |  43 ++++++
 .../bad/yaml-prop-order-device-type.yaml           |  31 ++++
 .../expected/dts-child-name-order.dts.txt          |   2 +
 .../dts-extend-node-child-name-order.dts.txt       |   2 +
 .../dts-extend-node-digit-node-order.dts.txt       |   2 +
 .../expected/dts-mixed-indent.dts.txt              |   9 ++
 .../expected/dts-property-order.dts.txt            |   6 +
 .../dt-style-selftest/expected/dts-spaces.dts.txt  |   2 +-
 .../expected/yaml-indent-strict.yaml.txt           |   2 +-
 .../expected/yaml-mixed-indent.yaml.txt            |   3 +-
 .../expected/yaml-prop-order-device-type.yaml.txt  |   2 +
 .../dt-style-selftest/expected/yaml-tab.yaml.txt   |   2 +-
 .../good/dts-child-name-order.dts                  |  32 ++++
 .../good/dts-digit-node-order.dts                  |  43 ++++++
 scripts/dtc/dt-style-selftest/good/dts-dtc.dts     |  21 +++
 .../good/dts-extend-node-child-name-order.dts      |  25 +++
 .../good/dts-extend-node-digit-node-order.dts      |  33 ++++
 .../dt-style-selftest/good/dts-preprocessor.dts    |  21 +++
 .../dt-style-selftest/good/dts-property-order.dts  |  41 +++++
 scripts/dtc/dt-style-selftest/good/soc.dtsi        |  49 ++++++
 152 files changed, 1699 insertions(+), 738 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/l4.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/xen.txt
 create mode 100644 Documentation/devicetree/bindings/arm/xen.yaml
 delete mode 100644 Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
 create mode 100644 Documentation/devicetree/bindings/bus/ti,da850-mstpri.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/ti,omap-l4.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti,da850-vpif.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,da850-vpif.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/keystone-reset.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/ti,keystone-reset.yaml
 create mode 100644 Documentation/devicetree/bindings/power/ti,smartreflex.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/ti-smartreflex.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-wdt.yaml
 create mode 100644 Documentation/process/maintainer-devicetree.rst
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-order-device-type.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-dtc.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-preprocessor.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-property-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/soc.dtsi
