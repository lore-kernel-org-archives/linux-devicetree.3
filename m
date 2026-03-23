Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A81738AC9F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261172; cv=none; b=GF697/td3L0aSF8riDacWZ8PT1aT2dePlRTsN+gw3Nvmkbn8DnaXkAfTVQBHBUUM9Cq05Qls8MvDm2PpKX6NH3nUphCtmegBnlLNhkc3pTYiuwZoX+kxtuyWeQ5LjwwsMu0JXf5lX9tY7a+++NEq8l57iQ9+EpUyPepYcFUBpzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261172; c=relaxed/simple;
	bh=BuXvsxX/mG7GgOqIVeReDJa3sf2TjR2wx24X7e5Ghzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PqcohY784Yx4FBU0wV4B6y/CYIczDRHVgxX14G0RwwWGVkWylBUMTrAdw8ND7zbKa46Z0p66eoFz1nXb77XlVK3Et9IHARmLJDTt56QVEo0PYtwgi/fp+OJxKT7iYKrBEMjQDnlJUh8xTgLyowV+RreUVjjNhy7vSzDN2Y6DARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHRPxHmi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHRPxHmi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so19249985e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261169; x=1774865969; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4ERGMp8NacLG5ZvKAIiOC6A4GgV4+Yn8pLmhG8k+VE=;
        b=bHRPxHmiQS2WVDJZVn3KtaqpiePdYgnMog/UM8yzshQeR4ujS1kHo67lsY0XsFhLS9
         7ylvrlUR8gOeC80umvSz7EJIDcHHF7Ndb/T/3wJ7/VFbG6K5xmt5hkOZWHJk1qpjPQQq
         Jc8uqMasMKolBSWb+i6+NSrUkV3JCPMhgFreRscicY7Zfln88XV/PZZESkoM9DMmddBI
         66Hk9+oTDCU1zZ2gbnM4xj22A2AoP8HB+jJ4BycGQ6QVR6NqTUT6Gj+quR+RRMPAVUio
         ZI4/7VVHK+RR0e0ZEp5GfVmbmXxdggQaFPvtYy6aEVeYj8fvM5ubndiqnVLONt6uVPlM
         +o1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261169; x=1774865969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4ERGMp8NacLG5ZvKAIiOC6A4GgV4+Yn8pLmhG8k+VE=;
        b=qWuHPhu1ZjCbli1Pi/QdwTV61VXZoJ0qZAdcIXMsQQDUhXX/gAMJLc0/3jcX5To0H5
         pNHE+b45MooxCcE/0YD50xC5O/Gh+U5euMP9DGwAtA7j0vh71c01yumqPtl9ougI3fAJ
         OX2/6hSjJgpbd0DSNS4Wc2vH7RwuA/md8SqgdOkD5nq4jhB3sF1bnnhvSbGJ6BF5O+88
         vBJVN8OHvpIoVDgYurQ4NydLLb0/zJuHX5btbo6R+/5yv7ZUTda7iJ0HSmgZA+O28WwO
         9KL3J+zCgXwUpEeDPM3m6iWzOdYOh3Z3z7jnNmczVTsFhk+DAtMGTE4dBitpKCdJKBH2
         1cUw==
X-Forwarded-Encrypted: i=1; AJvYcCVb1uRCotKp3PEHfHxWw87Mi2XYOIWQ9UgypdEcP8mfemBKjB/a7S6+fUnBF6eHf2LOiZTA6JLDbq6M@vger.kernel.org
X-Gm-Message-State: AOJu0YynNAMVF58mL3pyJOBGyXkKaCwdrJ4CPHdceOjfKNctHUXcTUvc
	/eMgc5E/qovy2kFGqbh54qL5dqGMtU/1aGPba18PRCa56w2+2F2kpMbkN9sSYw==
X-Gm-Gg: ATEYQzxyEuA3ZT26Znfxa3xOW2Uf4NSBmHyJVASCUhfktuUg1fDO/k04nN2Shgb5JN6
	G+gwEdijXvj+yItDj6a6b8cZqjBhfyDECzHa50jbDHJrS7otKLFArCoR1FzmNgoLmL/Geu3l8Pm
	h5o210gJbzY5QuEDKBuif8eTZdejIqtqCsXOXMabHfGd2B8On0vcIRwQqhmTGlBUrucYAGdEPPe
	IEAZ8BuL/mzzTfXwW9LDfOsXjtM7rmXrJwqz/Y2Cm+5GMfjqvTkTGkW/mtHoHSWqj6WiKkNNS7q
	nJWfFGg69VPPBEUfoSdIR0eV7/aBvMK0R+YfP705XoLApyOFcmWssejTa3qXcE0F6F3ke+1Qlzo
	0C/QiUWi82gIrEAcxVqLBofo3T4YTi/2naUaWWnDLlyyt+AQ7H2mBLCkZUALlEaL5mqi+GT/Tj7
	BgYqzhJHMBR0NcMK4Yt2mUFGK0x0U7w0ML24wjSmC7R8CmIruOAjbJJys/pCRq4PJ8
X-Received: by 2002:a05:600c:1d15:b0:485:2ce2:4c75 with SMTP id 5b1f17b1804b1-486febbc648mr160002825e9.1.1774261168302;
        Mon, 23 Mar 2026 03:19:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:27 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v4 0/8] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
Date: Mon, 23 Mar 2026 11:19:03 +0100
Message-Id: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTQ6CMBAF4KuYrq1ppxSoK+9hXPQPaCKUtNpoC
 He34IYYWb6XzPcyE4o2OBvR+TChYJOLzg85FMcD0p0cWoudyRkBgZIAlNiHpR0djgZrGQx+dhE
 TqxXhNROKaJRPx2Ab91rZ6y3nzsWHD+91JdGl/YKMwH8wUUxwLTRQISqmib60vXT3k/Y9WsAEW
 0TsIJARrhQoXhWm4eYXYRuE7ryWWEakbQxTVc3ANFtknucPUgTqIUIBAAA=
X-Change-ID: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

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

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
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
Iker Pedrosa (7):
      mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
      mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
      mmc: sdhci-of-k1: add comprehensive SDR tuning support
      riscv: dts: spacemit: k1: add SD card controller and pinctrl support
      riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
      riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
      riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes

Trevor Gamblin (1):
      riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts  |  24 ++-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts   |  66 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  67 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi     |  40 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             |  13 ++
 drivers/mmc/host/sdhci-of-k1.c                   | 257 +++++++++++++++++++++++
 6 files changed, 465 insertions(+), 2 deletions(-)
---
base-commit: ba0e286c944dea871f617bef1d733307b202de25
change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

