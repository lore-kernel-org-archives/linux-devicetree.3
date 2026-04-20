Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390B3A5E80
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706810; cv=none; b=m4tASy2w9TrS0cwKeWhYaC5TKES+pLIZ1SrxzlLWsw3w8a2CCX7lnuNwdX1LYAfgXgqYCOOt/7HfLcx5TSldNRpG3/X6oo0sklAgzLkue0YKMQPic0ILAzMxMnQvSJshIcHh3DeX+hmzZGN4IM0DmfwihGOMFhLaJoXeUBSlbuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706810; c=relaxed/simple;
	bh=EdQP2Wruo5Doe8ztaHk+aq6I88bm/VqlU7qINEfTGPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WbnnjKtAZLvhovQutNs9ROBPleqYoGFbNZeCOXPHWGtFGVwf23MPGbXFQcnrzBaMLVOixB9b5HNSSgA3hZKOd2U+h1yT7bVR7Ookk+UNbCCLlCK42h05vW/qartAdSsyHS8nURf2hlKt3/5NwAryZmVpYb9UFQCM+Jizwl5md3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yki/cRcw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yki/cRcw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488d2079582so39198295e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706806; x=1777311606; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDJkImIgICmlNFiRXajnn8mAXyhcbIrPtW7+EmIu9WU=;
        b=yki/cRcwzKF+tHLij9xHWzWO5jz3kdFcUrzww76gfDFLWJ9HiARuvLWHaAoyN20xeU
         5en/0ADvO/z0VBpS/cVK2E6+ilvjBjqCnoBLU4jXYCskDfd0XmO60M7iGBTA87I2nuWb
         mZBrFBUkPqqie/c2zFGt0oHH/n5DMzBl8NyaoQpppHAaERQcXMpnkDLGAJbfvUIq2lpF
         dOIibhygKNq/VYqFnrS8p7btKwDBGuYRaP7HSIJgdwe36glu0FTsxCxPJIDXxM+9m7yy
         a28j7A4Mw/SsOMT0C1YXDt0rGb7YXPG2J3cVU2qKmZSycEdZzYMcH+8WabLwX8Aa3LQg
         eJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706806; x=1777311606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDJkImIgICmlNFiRXajnn8mAXyhcbIrPtW7+EmIu9WU=;
        b=OyCk7It0C4cU5j1ScpmXe/yiCBmEetP4AcbteYdptllm5t0lcXLkDh901xvQcLFUXK
         Xs4sSl6alF4vYbzxDiNbg2LI3C/keh2IjsVA+KpU2dVUSycubKIiyHla5bAoMVnpR2Qr
         nd8dldr9wiN9Y1WXFynFppbIllF71iDF0Hcchm/ncnr68qiezsflrxBnWCjxpu2hVDf9
         7Y/uJTNj0RxrkbzTDnYYC0VuzlvU9e2pMAkmtP0Ayvk4nY3O4A0zocMu+iTh9ntRH8bN
         rH+hO1I/u7UiRRCuTHXQqUnEzcy8K33IHYM5XOtgQKk89fBiO+i7Oimo1UG3fPuFaGPX
         cfNA==
X-Forwarded-Encrypted: i=1; AFNElJ8Eq9T28zMOPNlM/DM/5zEuA4Jojuz8hMHRsg2Fe4Ax8nGleG84m+ZZqWrYiip51SBN0mFXeUgT//uo@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8MDaSJDDA70+KJvIzvuAPU0Ei9doA5clKM/Kd12Ozl7qvwaI
	65c5CuARcuSGPVe9XAppdmnJYfn6vuDop1bDMbanlKwpODIHStlQDKAj27HXY7uZ5E0=
X-Gm-Gg: AeBDiesZJWfTdNpGN83YKCz0ZWsq3W6ewlmxXohvLY4DOTXLOCTDEIIlKFC8LVU6iBs
	Z7bqdSWshn1po7HJAWWoOnQTOpduVQtpMMeosqOf/8AcfCpczpO0IzURd6QN4EqR7fPH0KvJ0dM
	n8/wrrFb23bYEmqqf9zKDutQojHRThWwCjSGSLUrO4yKGDCbmsDHqGWzddT5nHe3uN5pGKghG+S
	RcIWk+4B3imRlq7TRO47fPCRSgXpwCO4X5gzn9ajN8TGIi34nIqZLvj33oo/5M+JkD7/wtOquOU
	SHO04YgcJknZ52BDxt+f7yDhUYuEXrCeRATXkv6IosPyu622Dcu4Ai3xF5OA4bVZ0usOE7YkC/Y
	+e0WgonaMG7ihvi34noh6X1wRZC6IAqs17h8hWD28nfRQcmjhPOm3j2dKqXUaA9kh7DDL1O/bhh
	JUC6mYyd5JKequ+ylBxvRNzdO9sDspYIGEWXCdSx8IRCvA7klNud27K4olcSQbcxvriMiPGdF+X
	PCeCfDftlKOCporrw==
X-Received: by 2002:a05:600c:1e28:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488fb77fbf3mr202675855e9.20.1776706805576;
        Mon, 20 Apr 2026 10:40:05 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:04 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 00/10] thermal: samsung: Add support for Google GS101
 TMU
Date: Mon, 20 Apr 2026 17:39:46 +0000
Message-Id: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJk5mkC/1WMwQ6CMBAFf4Xs2Zp2W1E8+R/GQy1baCKUtNhoC
 P9uITHicV7ezASRgqMI52KCQMlF5/sMcleAaXXfEHN1ZkCOJRdCMm2Gjo3dk+GRUFhOaOQd8n0
 IZN1rTV1vmVsXRx/eazmJZf1G1C+SBOPMWDqUdSWp4vbycL0Ofu9DA0sl4dasNiZmkzjqk1SWK
 1P+mfM8fwBnhRPK2wAAAA==
X-Change-ID: 20260113-acpm-tmu-27e21f0e2c3b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=5994;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=EdQP2Wruo5Doe8ztaHk+aq6I88bm/VqlU7qINEfTGPY=;
 b=RTb0XIdv247dsRhBC3h8MnErBTOzM84fAn+wrWqFb+Sk/42POLptqjS7s0rmp9lB+F9T83ayW
 E8wKEuoDdq4A9Awl1GFDy068zmsA/53CebiUKTVPyJCwlmCPSnbyq98
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add support for the Thermal Management Unit (TMU) on the Google GS101
SoC.

The GS101 TMU implementation utilizes a hybrid architecture where
management is shared between the kernel and the Alive Clock and
Power Manager (ACPM) firmware. This hybrid ACPM TMU architecture is 
also present on other Samsung Exynos SoCs (e.g., AutoV920, Exynos850).

Dependencies
============

- firmware patches 2, 3, 4, 5, 6: required by the thermal driver
  (patch 7).
- bindings (patch 1): required for DTS validation.
- thermal driver patch 7: required by defconfig (patch 10) - logical
dependency. 

Given the thermal driver is a new addition, I suggest everything to go
through the Samsung SoC tree, with ACKs from the Thermal maintainers.
The MFD and clk maintainers are included because of the cleanup patches
(3 and 4). ACPM updated some structures that the mfd and clk client
drivers are using, so these patches shall naturally go via the Samsung
SoC tree.

If the Thermal maintainers prefer to take the bindings and the thermal
driver patches via their tree we'll need:
- an immutable branch containing the firmware patches (2, 3, 4, 5, 6)
  from the Samsung SoC tree to serve as a base for the thermal driver.
- an immutable branch containing the bindings and the thermal driver
  from the thermal tree to serve as a base for the dts and defconfig.

Architecture Overview
=====================

The hardware supports two parallel control paths. For this
implementation, responsibilities are split as follows:

1. Kernel Responsibility:
- maintain direct memory-mapped access to the interrupt pending
  (INTPEND) registers to identify thermal events.
- map physical hardware interrupts to logical thermal zones.
- coordinate functional operations through the ACPM IPC protocol.

2. Firmware Responsibility (ACPM):
- handle sensor initialization.
- manage thermal thresholds configuration.
- perform temperature acquisition and expose data via IPC.

Sensor Mapping (One-to-Many)
============================

The SoC contains multiple physical temperature sensors, but the ACPM
firmware abstracts these into logical groups (Clusters) for reporting:

- ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
- ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
- ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.

The driver maps physical interrupt bits back to these logical parents.
When an interrupt fires, the driver checks the bitmask in the INTPEND
registers and updates the corresponding logical thermal zone.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v3:
- thermal driver: use .set_trips() instead of .set_trip_point()
- new cleaning/prerequisite patches for firmware/acpm:
  - firmware: samsung: acpm: Make acpm_ops const and access via pointer
  - firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
  - firmware: samsung: acpm: Consolidate transfer initialization helper
- firmware: acpm: TMU helpers - check return value from the firmware
- overall change: emphasize that the ACPM TMU hibrid approach applies to
  other Samsung SoCs as well (Exynos850, AutoV920).
- dts: drop active trip points, update trip point values
- collect R-b tags
- Link to v2: https://lore.kernel.org/r/20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org

Changes in v2:
- architecture: switch from a syscon/MFD approach to a thermal-sensor
  node with a phandle to the ACPM interface
- bindings: address Krzysztof's feedback, drop redundencies,
  interrupts description.
- firmware: introduce devm_acpm_get_by_phandle() to standardize IPC
  handle acquisition.
- thermal driver: drop compatible's data and use the static data from
  the driver directly.
- defconfig, make EXYNOS_ACPM_THERMAL a module
- Link to v1: https://lore.kernel.org/r/20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org

---
Tudor Ambarus (10):
      dt-bindings: thermal: Add Google GS101 TMU
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
      thermal: samsung: Add Exynos ACPM TMU driver GS101
      MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
      arm64: dts: exynos: gs101: Add thermal management unit
      arm64: defconfig: enable Exynos ACPM thermal support

 .../bindings/thermal/google,gs101-tmu-top.yaml     |  68 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 136 ++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  17 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 240 +++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 ++
 drivers/firmware/samsung/exynos-acpm.c             |  94 +++-
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 drivers/thermal/samsung/Kconfig                    |  17 +
 drivers/thermal/samsung/Makefile                   |   2 +
 drivers/thermal/samsung/acpm-tmu.c                 | 539 +++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 +-
 18 files changed, 1176 insertions(+), 61 deletions(-)
---
base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

