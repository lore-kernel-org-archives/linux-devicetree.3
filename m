Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DDE36CDEF;
	Fri, 17 Apr 2026 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776451491; cv=none; b=AF2h7sVr0qS4gPGzKzZD58nHk9ghmC2IXsJIlOgLTcT0/0hoGMQvvHObG3FMZVVtc0ksOMl8M74BP7rkJ8KKXf1ullwPFXYsarMuH7OEJH6/sc8CoP3I9SLPgQwvHLG+U+RagzVNZwB7vxTF+ijHlTM/EGPJk6XQk0GnJRWKb9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776451491; c=relaxed/simple;
	bh=Ayvwm5UM4uzpT7NIEKa3LIVdPgPzJnRd/omMmNThpPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJZD0a1u+MAF/3PNS5UJKaKo8/j5H8EPP30tm68mt8SUFrt3l/kIMzazHP3yIx2V80pYHO6PnNjgx2VEHVPPS3Du0gqQ1n2OfExt+Wy3yD8bT09w6ulOXUMyZ9/VUfknAEgYjcO6/B0mjkVP7MGpvnJczzhu9lKj6lW59hM0IUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBlRYWZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBlRYWZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DFC19425;
	Fri, 17 Apr 2026 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776451490;
	bh=Ayvwm5UM4uzpT7NIEKa3LIVdPgPzJnRd/omMmNThpPo=;
	h=Date:From:To:Cc:Subject:From;
	b=ZBlRYWZUw0QbV8kohP7wy53OmZtaqBNXmq45Lo8QRLvsdOScM4tYt2r4meoMY7SMa
	 jq6guXRoUPVyHfHCWYl3Ec6v5Vd0UO2FySUs7/tXOF3JECJo9MlqVRxRDXOViNqdoE
	 gjSJ3YN9tFlSK3cgD2NGnzyzDrRCXcsxlwn9wg4yITCknx3NY16YqIMXPFNTnpPNWj
	 dtglZXcFfXG8ICkCwhW5sBg6Q0P5S1XUTcRmsFpC9z653Jikk4wxTHwmpvZ/jczL93
	 E8ZK5LWtzshgs3OqXhLotKa2rfrXutGNhcVi11KwhEHHpo5qCj0m2BSZ5LSfPPmvn3
	 d0iMdKEzg3NUg==
Date: Fri, 17 Apr 2026 13:44:48 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree updates for v7.1
Message-ID: <20260417184448.GA1533367-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull DT updates for 7.1.

There's a couple of conflicts now with your current tree. linux-next has 
the correct resolutions.

Rob


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.1

for you to fetch changes up to a74c2e55ab66519ffa2069ac9ae83cd937bff4c4:

  dt-bindings: display: panel: panel-simple: Add lg,sw49410 compatible (2026-04-16 08:57:47 -0500)

----------------------------------------------------------------
Devicetree updates for v7.1:

DT core:
- Cleanup of the reserved memory code to keep CMA specifics in CMA code

- Add and convert several users to new of_machine_get_match() helper

- Validate nul termination in string properties

- Update dtc to upstream v1.7.2-69-g53373d135579

- Limit matching reserved memory devices to /reserved-memory nodes

- Fix some UAF in unittests

- Remove Baikal SoC bus driver

- Fix false DT_SPLIT_BINDING_PATCH checkpatch warning

- Allow fw_devlink device-tree on x86

- Fix kerneldoc return description for of_property_count_elems_of_size()

DT bindings:
- Add fsl,imx25-aips, fsl,imx25-tcq, qcom,eliza-pdc,
  qcom,eliza-spmi-pmic-arb, qcom,hawi-imem, qcom,milos-imem,
  qcom,hawi-pdc, and lg,sw49410 bindings

- Convert arm,vexpress-scc to DT schema

- Deprecate Qualcomm generic CPU compatibles. Add Apple M3 CPU cores.

- Move some dual-link display panels to the dual-link schema

- Drop mux controller node name constraints

- Remove Baikal SoC bus bindings

- Fix a false warning in the thermal trip node binding

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: qcom,pdc: document the Eliza Power Domain Controller
      dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb: Document Eliza compatible

Andy Shevchenko (2):
      bus: Remove not-going-to-be-supported code for Baikal SoC
      dt-bindings: bus: Remove unused bindings

Frank Li (2):
      dt-bindings: fsl: add compatible string fsl,imx25-aips
      dt-bindings: input: touchscreen: convert fsl-mx25-tcq.txt to yaml

Geert Uytterhoeven (7):
      dt-bindings: interrupt-controller: arm,gic-v3: Fix EPPI range
      of: Add of_machine_get_match() helper
      of: Convert to of_machine_get_match()
      cpufreq: airoha: Convert to of_machine_get_match()
      cpufreq: qcom-nvmem: Convert to of_machine_get_match()
      cpufreq: ti-cpufreq: Convert to of_machine_get_match()
      soc: qcom: pd-mapper: Convert to of_machine_get_match()

Herve Codina (1):
      of: property: Allow fw_devlink device-tree on x86

Janne Grunau (1):
      dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles

Kenny Cheng (1):
      of: fix incorrect device creation for reserved memory nodes

Khushal Chitturi (1):
      dt-bindings: ARM: arm,vexpress-scc: convert to DT schema

Konrad Dybcio (1):
      dt-bindings: sram: Allow multiple-word prefixes to sram subnode

Krzysztof Kozlowski (2):
      dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles
      dt-bindings: display: lt8912b: Drop redundant endpoint properties

Luca Weiss (1):
      dt-bindings: sram: Document qcom,milos-imem

Marek Szyprowski (7):
      of: reserved_mem: remove fdt node from the structure
      of: reserved_mem: use -ENODEV instead of -ENOENT
      of: reserved_mem: switch to ops based OF_DECLARE()
      of: reserved_mem: replace CMA quirks by generic methods
      of: reserved_mem: rearrange code a bit
      of: reserved_mem: clarify fdt_scan_reserved_mem*() functions
      of: reserved_mem: rework fdt_init_reserved_mem_node()

Marek Vasut (2):
      dt-bindings: display: simple: Move AUO 21.5" FHD to dual-link
      dt-bindings: display: simple: Move Innolux G156HCE-L01 panel to dual-link

Markus Heidelberg (1):
      docs: dt: unittest: update to current unittest filenames

Mukesh Ojha (2):
      dt-bindings: sram: Document qcom,hawi-imem compatible
      dt-bindings: qcom,pdc: document the Hawi Power Domain Controller

Paul Sajna (1):
      dt-bindings: display: panel: panel-simple: Add lg,sw49410 compatible

Pengpeng Hou (2):
      drivers/of: fdt: validate stdout-path properties before parsing them
      drivers/of: fdt: validate flat DT string properties before string use

Rob Herring (Arm) (4):
      checkpatch: Fix false DT_SPLIT_BINDING_PATCH warnings
      Merge branch 'dt-reserved-mem-cleanups' into dt/next
      scripts/dtc: Update to upstream version v1.7.2-69-g53373d135579
      dt-bindings: thermal: Fix false warning with 'phandle' in trips nodes

Song Hongyi (1):
      of: property: fix typo in kernel-doc return description

Swamil Jain (1):
      dt-bindings: display: ti, am65x-dss: Fix AM62L DSS reg and clock constraints

Tommaso Merciai (1):
      dt-bindings: mux: Remove nodename pattern constraints

Vivian Wang (1):
      dt-bindings: opp-v2: Fix example 3 CPU reg value

Wentao Liang (2):
      of: unittest: fix use-after-free in of_unittest_changeset()
      of: unittest: fix use-after-free in testdrv_probe()

Xu Yang (1):
      dt-bindings: connector: add pd-disable dependency

 .../devicetree/bindings/arm/arm,vexpress-scc.yaml  |  53 +++
 Documentation/devicetree/bindings/arm/cpus.yaml    | 292 +++++++--------
 .../bindings/arm/freescale/fsl,imx51-m4if.yaml     |   1 +
 .../devicetree/bindings/arm/vexpress-scc.txt       |  33 --
 .../devicetree/bindings/bus/baikal,bt1-apb.yaml    |  90 -----
 .../devicetree/bindings/bus/baikal,bt1-axi.yaml    | 107 ------
 .../bindings/connector/usb-connector.yaml          |   1 +
 .../bindings/display/bridge/lontium,lt8912b.yaml   |   3 -
 .../panel/panel-simple-lvds-dual-ports.yaml        |   4 +
 .../bindings/display/panel/panel-simple.yaml       |   6 +-
 .../bindings/display/ti/ti,am65x-dss.yaml          |  70 +++-
 .../bindings/input/touchscreen/fsl,imx25-tcq.yaml  |  69 ++++
 .../bindings/input/touchscreen/fsl-mx25-tcq.txt    |  34 --
 .../bindings/interrupt-controller/arm,gic-v3.yaml  |   2 +-
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   2 +
 .../devicetree/bindings/mux/mux-controller.yaml    |   6 -
 Documentation/devicetree/bindings/opp/opp-v2.yaml  |   8 +-
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml |   4 +-
 Documentation/devicetree/bindings/sram/sram.yaml   |   4 +-
 .../devicetree/bindings/thermal/thermal-zones.yaml | 111 +++---
 Documentation/devicetree/of_unittest.rst           |  20 +-
 .../translations/zh_CN/devicetree/of_unittest.rst  |  21 +-
 drivers/bus/Kconfig                                |  30 --
 drivers/bus/Makefile                               |   2 -
 drivers/bus/bt1-apb.c                              | 396 ---------------------
 drivers/bus/bt1-axi.c                              | 292 ---------------
 drivers/cpufreq/airoha-cpufreq.c                   |   7 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c               |  16 +-
 drivers/cpufreq/ti-cpufreq.c                       |  12 +-
 drivers/memory/tegra/tegra210-emc-table.c          |  19 +-
 drivers/of/base.c                                  |  20 +-
 drivers/of/fdt.c                                   |  44 +--
 drivers/of/of_private.h                            |   2 +-
 drivers/of/of_reserved_mem.c                       | 320 ++++++++++-------
 drivers/of/platform.c                              |  12 +-
 drivers/of/property.c                              |  28 +-
 drivers/of/unittest.c                              |   4 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   8 +-
 include/linux/cma.h                                |  10 -
 include/linux/dma-map-ops.h                        |   3 -
 include/linux/of.h                                 |  11 +-
 include/linux/of_reserved_mem.h                    |  16 +-
 kernel/dma/coherent.c                              |  19 +-
 kernel/dma/contiguous.c                            |  86 +++--
 kernel/dma/swiotlb.c                               |  19 +-
 scripts/checkpatch.pl                              |   2 +-
 scripts/dtc/checks.c                               |   2 +-
 scripts/dtc/dtc-lexer.l                            |   3 -
 scripts/dtc/dtc.h                                  |   2 +-
 scripts/dtc/libfdt/fdt.c                           |   8 +
 scripts/dtc/libfdt/fdt_rw.c                        |   9 +-
 scripts/dtc/version_gen.h                          |   2 +-
 52 files changed, 795 insertions(+), 1550 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/vexpress-scc.txt
 delete mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml
 delete mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/fsl,imx25-tcq.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/fsl-mx25-tcq.txt
 delete mode 100644 drivers/bus/bt1-apb.c
 delete mode 100644 drivers/bus/bt1-axi.c
