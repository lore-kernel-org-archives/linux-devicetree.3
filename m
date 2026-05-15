Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BBC46AF0B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842158; cv=none; b=L7YHHylAaHCpR0jGMAhcziDF/n+ypCgFqiax0a4hLwv5X/uOvsrkVgvYTTqHix7wbIR7FIBtps2HeI9VfYRUnZPer8ia6ZEgqNr6lqXcT4rtPKmyPKc3ONllwzv0eRD3QCsu5j1k/e21cgRS2M8OaIf3VBWMiutsb4CBrev1lTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842158; c=relaxed/simple;
	bh=U8bjnA87rmqpadtTUWEsBkvQ9Nn/kDqkyLTFA6dlfug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iP4/LOVhU+PNjsLZdZYfa6fR3YEEDWhHqPgUWe+5ildsQnBs3tUnQnm1Rxks4yXKpRaRPxsmmATIUKEodW/i7HNsFsj3J8dXNXyGoBxJe1NCycWOOSdSbxKv/+CY4ft5PYM7uwt4g2sLKFXaudk6sijp7aJs8RBrQpS8P0xx1g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhfPrZXu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhfPrZXu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e82c23840so49193215e9.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842154; x=1779446954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lI9llgwcEiFHiimnjzhCjJeVRvky6huxpMCMaGCs2E=;
        b=IhfPrZXugpKiMtcXsspqfrCNYl4L5jkEQ9dnO6HGwBB+CIQMeYrMsjKDtOpna5VUWW
         e1WEVALSYr0iAZM2NiOyXYY31kew11Mxk2VgksN6mKTz71gNot6UG0gFjnuNqF/PxzIt
         c7FubuqqZAWPHHgIcVYpBi7srU2OE8rcTZlIKeCNSavMyN8QIBSDeuyFehBuNg4UurS4
         XMcVgwn9D9BNpfFXXD3GwgD79u9TVvWOJby5KSfKLgX7/OMvyc8WUjOvaWAzLBl5FfV1
         0il0T1r0fmrDW7ALETYD6b861M3eMi+BiuCgj5K8Xp5hK/rduHJIxuAels88OKBtLynJ
         FGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842154; x=1779446954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lI9llgwcEiFHiimnjzhCjJeVRvky6huxpMCMaGCs2E=;
        b=jOyHSf2MhJlj7lKz63RWFIvnwoJD/1ZL1FGWPk1VkQT7f0GNKLm/pnVEOjs3CM4mMw
         0zgAnv6+YpVGg+3HCNwWEgNmwjlrOVDBAl2JDweJGDcEtdk1Szaqx7n2aYuWOr4oRgKQ
         H2b7ucE40E4V7gG04yTtMWNxTMMkEc2CXwlMs5KX78D9Vd2n5DTO0gH8776M+AEnJ/jX
         /d0UnX5V5Ll6Y757Fl0HWVGX9m8Bx91uZmA1pVFbd1WR+wwZgwpG2aZCpTHF8yF74Kow
         qXfKoc/qOJR1FT7VbyfgNf8vYJGFPrJ1qyn0DE3yeVK7ayRAgLNLo2fMNtKiQxVpYnz6
         77Cg==
X-Forwarded-Encrypted: i=1; AFNElJ8OhjXpIu9oi6DevKdQ1qirI+AyRgBYG2CCZuUAmt3ebYLBaOHC7+RRk1jwi7IE/GjUZuPoA6ydT+YK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FVcCQ2JyY44HYyi3nDEWsbKECqpd+B8KS5Njx1ZAiUVjVBRW
	vNLuiP+N+4CHkF8uNAR708/kFg0gY09QDXgx0GL/j6hkNZ5oN71kr7Q9
X-Gm-Gg: Acq92OFQO4lPKHj7c0bfOaAHl73mh5cFgUJIZUV9Ogsont0Y934tDeQB9Hhz9b4ETJW
	VIbeG2MHcISYZ96TcDff7/HGpE5DR3MnxkxaNZ+QT+2IvtAV2NRgO+3Nsczh1eu2b9R2yUVq2kK
	/m0qZ3JEwQqxlQtuO+TOqJTVRVdbDL1fGbqcKAGZfAQSIp/Nno0lkoAyjXfYxnzg0lgccteDovS
	yUL6sTQrmIjy8EK+Oikrq6SEpWKZEPhSgCSEbFfyolqdOjrXAiOC2hOtTELkH0fC9F6NIqSp+sX
	dngrNux9ozUfYr8jhTW6jI5Ex2aSNO4cRAilC209VZfyIFruLQwwAsS57X3CyHiqtChAiWqUNR9
	o2lX+EOCEOKGzmRL/zzwfNA6amzNHrEuuOZegZ+XyhVJvNtLsPA7Nmi9LQCqW9ypyeFfGbjNB6D
	pFAGPb7xpv13dfsV7XBkypOn55IwRdzohxTuPOlxlB0MTe7+N/AwopJJ/pT/28oB7KnOZ40JFOX
	m37
X-Received: by 2002:a05:600c:6211:b0:48f:e230:72fc with SMTP id 5b1f17b1804b1-48fe663152cmr45349395e9.33.1778842153410;
        Fri, 15 May 2026 03:49:13 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:12 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v10 0/4] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Fri, 15 May 2026 12:48:58 +0200
Message-Id: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRzU7DMAwH8FeZcibIcb458R6IQ+OkWyS2TilUo
 KnvTloOK4UcbSm/2H/f2JhKTiN7OtxYSVMe83CphYCHA6NTdzkmnmNtMAQ0gGj4UJbuNfMxcup
 K5B+nkUOiANpJH4BYfXotqc+fq/vyWutTHt+H8rV+M4ml+wNKwP/BSXDgzhMK760koOfjuctvj
 zSc2QJOuEV8A8GK6BAwaKtir+MekRtENFabZEW61EcZrJMY+z2iNgjKBqKWSYwlb63uI6Q9oje
 IhAaiKxKi09KAkoh/1jF3RIFtIGZBdHCdqLn05PaI2yCitY6rSL0NqXp4YSLsEX9HtBANxK/BK
 kdQJ0H6Few8z99PBUZknAIAAA==
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>, 
 Margherita Milani <margherita.milani@amarulasolutions.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Andre Heider <a.heider@gmail.com>
X-Mailer: b4 0.14.3

This series enables complete SD card support for the Spacemit K1-based
OrangePi RV2 board, including UHS (Ultra High Speed) modes for
high-performance SD card operation.

Background

The Spacemit K1 SoC includes an SDHCI controller capable of supporting
SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
currently lacks basic SD controller configuration, SDHCI driver
enhancements for voltage switching and tuning, and power management
infrastructure.

Implementation

The series enables SD card support through coordinated layers:

- Hardware infrastructure (patches 1-2): Device tree bindings for voltage
switching hardware and essential clock infrastructure.
- SDHCI driver enhancements (patches 3-7): Regulator framework
integration, pinctrl state switching for voltage domains, AIB register
programming, and comprehensive SDR tuning support for reliable UHS
operation.
- SoC and board integration (patches 8-10): Complete K1 SoC controller
definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
with full UHS support.

This transforms the OrangePi RV2 from having no SD card support to full
UHS-I capability, enabling high-performance storage up to 208MHz.

Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Changes in v10:
- Rebased on ulf-mmc/next (patches 1-4 from v9 already applied by Ulf
  Hansson).
- Device tree node ordering. Fixed k1.dtsi to order sdhci0 before emmc
  per device tree conventions.
- Added stable mmc device aliases in all boards:
  * mmc0 = &emmc (eMMC controller)
  * mmc1 = &sdhci0 (SD card controller)
- Card detect logic simplification. Replaced "GPIO_ACTIVE_HIGH +         
  cd-inverted" with direct GPIO_ACTIVE_LOW for OrangePi RV2 to eliminate 
  double-inversion.
- Use minimal PMIC supply configuration in MusePi Pro.
- Remove unused reg_dc_in regulator in MusePi Pro.
- Card detect GPIO properly configured with GPIO_PULL_UP in MusePi Pro.
- Update PMIC to use per-regulator supply properties in MusePi Pro.
- Link to v9: https://lore.kernel.org/r/20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com

Changes in v9:
- Rebased on top of "for-next" to include required infrastructure:
  * P1 PMIC regulator definitions (commit c02c047b925c).
  * GPIO pull-up/pull-down configuration support.
- Updated BananaPi F3 SD card detect configuration to use GPIO pull-up
  instead of "broken-cd" workaround:
  * cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
- Link to v8: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com

Changes in v8:
- Resending the series as v8. The v7 submission failed due to an SMTP
  error during transit, which resulted in a broken thread on the mailing 
  list.
- No functional changes from v7.
- Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v7-1-16650f49c022@gmail.com

Changes in v7:
- Remove sdhci-common.yaml reference from DT binding.
- Link to v6: https://lore.kernel.org/r/20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com

Changes in v6:
- Add pinctrl support for voltage switching. Document optional
  pinctrl-names property supporting "default" and "uhs" pinctrl states
  for coordinating pin configuration changes during UHS-I voltage
  switching.
- Update pinctrl state naming from "state_uhs" to "uhs" to match DT
  binding naming convention.
- Fix MMC drive strength values based on vendor kernel investigation.
  Correct 3.3V operation from 7mA to 19mA and 1.8V UHS operation from
  13mA to 42mA to match proven vendor implementation.
- Link to v5: https://lore.kernel.org/r/20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com

Changes in v5:
- Document optional pinctrl-names property supporting "default" and
  "state_uhs" pinctrl states for coordinating pin configuration changes
  during UHS-I voltage switching.
- Link to v4: https://lore.kernel.org/r/20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com

Changes in v4:
- Revert to start_signal_voltage_switch() approach for bidirectional
  voltage switching: replace voltage_switch() callback with 
  start_signal_voltage_switch() to properly handle both 3.3V and 1.8V
  signal voltage directions.   
- Fix DC input voltage specification: corrected the main power supply
  from 12V to 5V to match the OrangePi RV2 board specifications. The
  board uses a 5V USB-C input connector, not a 12V rail as previously
  specified in the device tree.
- k1-bananapi-f3.dts: add `broken-cd` property to work around card
  detection. Using `broken-cd` disables hotplug detection but keeps SD
  card functionality working without additional dependencies.
- Add SD card support for Muse Pi Pro board (contributed by Trevor
  Gamblin): enable SD card support with UHS-I capabilities following the
  same pattern as OrangePi RV2, including dual pinctrl states, PMIC
  power supplies, and card detection.
- Link to v3: https://lore.kernel.org/r/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com

Changes in v3:
- Rebase on mmc.git/next to resolve conflicts with "mmc: sdhci-of-k1:
  add reset support" patch.
- Squash tuning infrastructure and implementation patches (3 and 4)      
  together to form complete functionality and avoid unused function      
  warnings.
- Reduce code nesting: implemented an early return sanity check in
  spacemit_sdhci_voltage_switch() to reduce indentation and improve
  logic flow.
- Refactor pinctrl initialization: moved pinctrl resource acquisition    
  and state lookup into a dedicated helper function,                     
  spacemit_sdhci_get_pins().
- Use generic regulator node names (buck4, aldo1) instead of             
  device-specific aliases (sd_vmmc, sd_vqmmc) to better reflect that     
  these PMIC outputs serve multiple devices.
- Remove dead code handling 3.3V voltage switching from
  spacemit_sdhci_voltage_switch().
- Optimize tuning algorithm to use single-pass window detection instead
  of storing results in array, reducing memory usage and complexity.
- Remove unnecessary card detect check in execute_tuning() - rely on MMC
  core.
- Clarify commit message to mention both SD (UHS-I) and eMMC (HS200)
  tuning support.
- Add SD card support for Banana Pi BPI-F3 board with UHS-I capabilities
  following the same pattern as OrangePi RV2.
- Link to v2: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com

Changes in v2:
- Removed custom AIB voltage switching code per maintainer feedback. The
  existing pinctrl driver already handles AIB voltage switching
  automatically via power-source property changes during UHS mode
  transitions. This eliminates code duplication.
- Squashed regulator and pinctrl commits into single voltage switching
  implementation.
- Moved voltage switching callback from dynamic probe assignment to
  static sdhci_ops declaration. Removed redundant SDHCI core call since
  the framework handles standard voltage switching automatically.
- Made clock override (SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON)
  conditional for SD/SDIO cards only. This follows vendor driver pattern
  of differentiating SD and eMMC card handling.
- Include no-mmc property for SD card.
- Link to v1: https://lore.kernel.org/r/20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com

---
Iker Pedrosa (3):
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  | 24 +++++++++-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts   | 60 ++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 22 ++++++++-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     | 40 ++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             | 13 +++++
 5 files changed, 156 insertions(+), 3 deletions(-)
---
base-commit: effc0aace34218afcf080cdc5fac518410709619
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

