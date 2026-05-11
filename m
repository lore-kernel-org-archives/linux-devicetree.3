Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F693C3434;
	Mon, 11 May 2026 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494447; cv=none; b=Y9rqTLTK9pRw+Wy9I/+xejB8wSXxBo8ew7rk15U5bgwOc+/1aLY9fexRf+/33Et7fznpeTux370aOQihU/41fS2VvZM1G4s6EsuCrAL2s5EWcigvQE3y/TDn9dYlu93E7PTQ96pSVy+wCfv2/dWylJjYAQqgM8yXr0eewQIl5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494447; c=relaxed/simple;
	bh=/PlaQ7cS0BeHBxDGzzjS+4oQig9OLGYADxgY8jZb4CM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W2o4+7Rf57tnhRN4gaEIsXAVl1Hu9m40PmmCoLZnBdnU2dEVBP/qZ2sOpuBeL7figvL6KBfUQJWFG+8SSXuNmRB/DiUYVJxVAEKlGmrn3x4SOMMeWCG8JY+N0jNRJps6krXyB2+fT4g+uhDE/xzqaaJ+KJwP0GJL8vGZGuQBN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i4SCHt2n; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i4SCHt2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778494444;
	bh=/PlaQ7cS0BeHBxDGzzjS+4oQig9OLGYADxgY8jZb4CM=;
	h=From:To:Cc:Subject:Date:From;
	b=i4SCHt2nyiki9aHIby1nsrdtbMFV1RgquD+/StlZ7UQpgkoPayFFGs0SeYHNdPDk8
	 0EDVBwi/hyRqgFZkORa0OhnWYc8udCiMns92pvDx3VgCbMO74KsBUyYpCWfN0jrfM8
	 bwvroqxYAz5K390fFJzaTTMF8OXnah+0Ak8wrzTxLaHlyyDj7SnMzNI03n+lIyab9s
	 4ixIABH+8YTt5boAHvS1zR85C9dgmt+TRN6Zm3uoNb5AE7vZI/KKbhIBUdxDQ9UHoN
	 mHge1jVmcCmllYq84SQxDUDjDSWH2Xj56WXICqdKeEX/PUSsoHDeCAT9+eJm8PPOKj
	 rUOQt5O7anB4g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E812617E0F7B;
	Mon, 11 May 2026 12:14:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373 PMICs regulators and MFD
Date: Mon, 11 May 2026 12:13:50 +0200
Message-ID: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v12:
 - This is a partial resend. MT6373 regulators and MFD patches were not picked.
 - Rebased over next-20260508

Changes in v11:
 - Removed unnecessary #address-cells in all mt6316 bindings

Changes in v10:
 - Added "struct" prefix to structs kerneldoc
 - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
 - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
 - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
 - Some rewording of comments as suggested, addition of more comments
 - Refactored IRQ domain handling due to deprecation of function
   irq_domain_add_tree() to use the new irq_domain_create_tree()
 - Fixed to use generic_handle_domain_irq_safe() to avoid races
 - Added support for two interrupt cells in translation
 - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
 - Added support for handling PMICs without IRQ Group register for
   upcoming MT6685 implementation

Changes in v9:
 - Applied more bindings fixes as pointed out by Rob
 - Changed irq fwspec to have 3 cells as the mfd driver handles 3
 - Using intsize instead of fwspec.param_count in xlate (thanks Nicolas!)

Changes in v8:
 - Added REGMAP_SPMI selection in Kconfig for all of MT6316/6363/6373
   to satisfy __devm_regmap_init_spmi_ext() dependency in case they
   are built with COMPILE_TEST (+randconfig) configuration
 - Fixed indentation in Kconfig on help lines (some were using spaces
   instead of tab + 2 spaces, don't know how that happened)
 - Removed forgotten final blank line on mt63{6,7}3-regulator.h header
 - Fixed error checks in mt6363-regulator, mt6373-regulator for call
   to mt63{6,7}e_spmi_register_regmap()
 - Tested again on MT8196 Chromebook.

Changes in v7:
 - Removed unintentionally added, useless Link tags from all patches
 - #size-cells is now required in mfd mt6363 binding
 - Further fixes in mt6363/73 regulator bindings
 - Mentioned weird 9-bits BE format and usage of undocumented set/clr
   registers in commit description for the MT6316 regulator driver
 - Refactored bindings for MT6316 PMIC (regulators):
   - Added reg, #address-cells as required properties
   - Added regulator-allowed-modes and its description
   - Changed mt6316b/mt6316c to use patternProperties instead, as it
     now makes sense to avoid duplication while keeping documentation
     for the regulator-allowed-modes property in all vbuck entries
   - Added decent examples that correctly describes the MT6316 PMICs

Changes in v6:
 - Added missing bitfield.h header inclusion in mt6363-regulator.c
 - Added commit "dt-bindings: iio: adc: mt6359: Allow reg for SPMI PMICs AuxADC"
   to fix warnings on specifying reg property in adc node
 - Added $ref in mt6363/73 regulator bindings to reduce duplication on LDOs
 - Moved MT6363 regulators example to MFD binding
 - Rebased on next-20250929

Changes in v5:
 - This time the dt-bindings commits are the right ones... sorry again :-)
 - Removed accidentally added Link: tags in all patches.

Changes in v4:
 - Rewritten all register definitions for both MT6363 and MT6373
   regulators to be register offsets instead
 - Added the appropriate supply_name to all vregs in 6363 and 6373
 - Simplified the macro parameters for all vregs in 6363 and 6373
   - Added common definitions pattern in macros to avoid plain writing
     register definitions in every macro call
 - Added registration of SPMI sub-device in MT6363/73 and setup of
   regmap reg_base based on `reg` parsed from devicetree
 - Removed interrupts parsing from devicetree
   - Moved (pmic-internal) IRQs to macros
 - mtk-spmi-pmic: Added parsing if irqspec with param_count=2 for
   easier irqs registration from regulator drivers

Changes in v3:
 - Added buck and ldo supplies to mt6363 and mt6373 drivers and bindings;
 - Removed interrupts from mt6363 and mt6373 bindings;
 - Added registering interrupts in mt6363/73 drivers instead:
   this avoids big arrays in the mfd driver, which will grow
   uncontrollably (as it already happened in multiple MediaTek
   drivers) and with each new(future) supported PMIC;
 - Removed "ldo-" and "buck-" prefixes from mt6363 regulators
   - Renamed "vbX" to "vbuckX", reflecting datasheet name
 - Changed all LDOs in MT6363 and MT6373 to add VOCAL usage, both
   increasing the number of voltage steps (2.5 or 10mV increments
   depending on the LDO) and the accuracy of the reported voltages
 - Tested again on MT8196 board

Changes in v2:
 - Merged MFD and regulator in one series
 - Split mediatek,mt6316-regulator.yaml in three files as
   suggested by krzk
 - Added interrupt-names list in MT6363/MT6373 bindings as
   suggested by krzk
 - Documented regulator modes in MT6363/73 as suggested by krzk
 - Fixed interrupt and interrupt-names maxItems in both 6363/73
   because, well... I miscounted them in v1 :-)
 - Removed keys from mt6363 binding: the compatible was not yet
   added to the keys binding and doing that will take quite a
   while, as I have to find a way to test the code before that
   as unfortunately my HW does not provide any way to test the
   PMIC keys (thought it did, but then turns out it doesn't...)
 - Completed the mt6363 MFD example with ADC as suggested by Rob
 - Avoided applying regulator schemas multiple times as pointed
   out by Rob (in mfd binding)
 - Fixed MT6363/73 issues pointed out by lkp (eh, sorry, that
   happened during a last minute cleanup... ugh!).
 - Brewed some more coffee :-)


This series adds support for three new MediaTek PMICs: MT6316, MT6363
and MT6373 and their variants - used in board designs featuring the
MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400 Smartphone
SoC.

In particular, MT6316 is a regulator, but the MT6363 and MT6373 PMICs
are multi-function devices, as they have and expose multiple sub-devices;
moreover, some of those also contain an interrupt controller, managing
internal IPs interrupts: for those, a chained interrupt handler is
registered, which parent is the SPMI controller itself.

This series adds support for all of the MT6316 regulator variants and
for MT6363, MT6373 SPMI PMICs and their interrupt controller.

AngeloGioacchino Del Regno (5):
  dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
  regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators
  dt-bindings: iio: adc: mt6359: Allow reg for SPMI PMICs AuxADC
  dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
  mfd: Add support for MediaTek SPMI PMICs and MT6363/73

 .../iio/adc/mediatek,mt6359-auxadc.yaml       |  17 +
 .../bindings/mfd/mediatek,mt6363.yaml         | 109 +++
 .../regulator/mediatek,mt6373-regulator.yaml  | 137 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/mtk-spmi-pmic.c                   | 427 ++++++++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6373-regulator.c          | 772 ++++++++++++++++++
 include/linux/mfd/mt63x3_spmi/registers.h     |  34 +
 include/linux/regulator/mt6373-regulator.h    | 161 ++++
 11 files changed, 1685 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
 create mode 100644 drivers/mfd/mtk-spmi-pmic.c
 create mode 100644 drivers/regulator/mt6373-regulator.c
 create mode 100644 include/linux/mfd/mt63x3_spmi/registers.h
 create mode 100644 include/linux/regulator/mt6373-regulator.h

-- 
2.53.0

