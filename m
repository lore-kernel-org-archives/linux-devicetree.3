Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2496F4E56FA
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787596; cv=none; b=LkKrIXhUCP/wp7Z4wIYZFC4EHwoI1ZsgJmMhts6pDLHsHzeNkRnG85RicEfM1URVWzmtgVXWUIUAWRBcqCsC+Sxckzpw2NWV1nFTcoRSI2iCBF+UosojQP93Ti9PT4Czk/DvD1oThDsVH0y3LYP/2IucfvbwISjEVMNp4ch9Ngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787596; c=relaxed/simple;
	bh=dHwT++cYO2vjpch/eavOet3q9OwenZlSdGnjWkH32QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ciBrpv8eV2fr+BfmsuZJFhUzeX1/btbKlfJKtQGD6xE3ZN1aqN2g5Szdy5mIiHEeZd+S5RHtAzNdCauuv/0j41prlxY+fgy104JOtfYImXOdiDsATeSwPAviqhuXBKIxEJkWyftquPuKsGMCp7mbEOBppRjW+lyee412Dh3nORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=BOy3HlKC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="BOy3HlKC"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c250f28f1cdso555583666b.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787589; x=1789392389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=flXIHxP55T3td3EAF+4UDOtvTJ+j4gzcSAMkRD2rGz8=;
        b=BOy3HlKCC/hVeNbesC3MhHYY77h/pe0TfAJekPkzccE4imx01JrueVKf18syXuEKXO
         d7soXQl9WTlXt3aYZDnlCkDK0pbfC+rZ8sCN2aMtwdtq6ZCOThe4RkEB94beN6XLEvZ6
         2g26FoN7Pb4Ih1cuUqXI9u619fA+s+OCtW6KOLu0uPf2oSAqRFBkhsWXyCwat/WIUF+e
         04BnzYbYZNNqrXblbh0qaAHCOb23n4babZ3yp2Z9RCV4cMWG0o/TXmay2t5bG5NJiwyW
         gNSTIPfVzhKcSdZML35FFPMEqHOBdxvq4lvNgp2zN67mUf7IKXtQX7sKqT06RWQ0uQY+
         i4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787589; x=1789392389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flXIHxP55T3td3EAF+4UDOtvTJ+j4gzcSAMkRD2rGz8=;
        b=Ja4+2qTaSReRD7bZcs+SrAan0NjJ5UDpv7Sy+F36VdKrbEeckhycrxHn9sRjpeGfBX
         HkC2Vl/hx7TvtEvm9gb2zliybLVFLNTdwiwYbJdByz3YlEqoJKvibJdS2cwGLaPbRG99
         C6jiWudSuMBZx+8Acw2Uqzdz35/+HmyRtMcZyV9UPY2q6nvmmXSkSpSjLB9HVACq1vkE
         h0U5LgSk/n4i1rcRZb3BxuDtW6QrhQ5W7fJkelkwoz+mTDkrlpHrR2Euee3MyO1yQPvO
         c+aI5eCtTf53mlVG2p7ZL1cfa1J3NMf5NStvZf5n8CLmlonxaOrRRLiaHFuCjP0Dy08a
         bb+A==
X-Forwarded-Encrypted: i=1; AKwUvBzWjpePcwcGpBQlvf7+IRgFqZ/ZoI+SQSsNPYcvU9jDIp5ybPTWIN01ET+mt4dHYkucDxoKRLt71tcB@vger.kernel.org
X-Gm-Message-State: AFuF++n+qHJdZYopsQrBBXLsIpqbZcVD2JVrxW9sB2P8Nsv5qiCej/Yg
	py8rJWn0MwOJoXkZ/RRTF23JwrMEmO5bsAWHjGsNExzZEXi736W345dUDjD2qQhgGaI=
X-Gm-Gg: AYBFou03WSWREcu2eBznfWKvKwVfliELy9BBcEtRFTDIOO1O2C3z7XrlnAqwar71XtU
	QYARQl+iSM3H896rjOzxhVEwQOVIUDj+utAZEsRE5T19EVeXU2A5i7ih2XKeFFDqomjxXRI6KFY
	9Fs5EVC8mh6SdvQ6mlbEakukBHEjXTzgU2tIOVqvRJYixq6phJTJnUBXDsmNwv0dsVwzXaMnei2
	cndE9u2ywKrsqHFexyKo59zQ5fo1bRST+6NIxE2edYgCS+w9GvUj+Tg2KOX71B6PGjkP8Ax0xQk
	dfT0yI0bXIAuBJzQMAy61oOLw+Nx+QSYjanbkJvbaqLCxWth/GeAh8625cdlZrreVoNHSQ+ly9z
	1WB7vyH6GjJ+heAHYw0+5IdA0waRgbftiXbHAncAQy/2hQ6i8Ea9F77eSYqBm472f1ktsNVPIzU
	UxHY4dyJt2lMyqNPsMZ6F6ozjBIuvTMVr+lVnf3cL1ikVBx8HETCQmm1LUVMf3S8s1R0PMWBMJs
	86gcV+ECKe6t6t8XjJjmiGW/AtpQ6srsgbjCFh2FsVDv1rzVHzZxa6zZT3uN3AGYhY7Ha34cRKF
	wZZwNq/M2BatblrMLv1pg49AY7eVG38jKLdfpw==
X-Received: by 2002:a17:907:198d:b0:c29:5b1:d530 with SMTP id a640c23a62f3a-c2905b24a92mr30863966b.15.1788787589057;
        Mon, 07 Sep 2026 06:26:29 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:28 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 0/6] mmc: sdhci-of-at91: add LAN969x support
Date: Mon,  7 Sep 2026 15:25:28 +0200
Message-ID: <20260907132617.1198548-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the two SDMMC controllers in the Microchip
LAN969x family. It also enables the onboard QSPI NOR and eMMC storage on
the EV23X71A evaluation board.

The LAN969x SDMMC controller uses the same internally generated base clock
layout as SAM9X60. However, gating its clocks during runtime suspend leaves
the controller unable to complete software resets or stabilise its internal
clock. Add a generic SoC data option for keeping clocks enabled, while
keeping capability and preset restoration independent from clock
enablement. LAN969x then selects this option through its match data.

Describe both controllers using the fabric clock for the bus interface and
their respective generated clocks for the controller core. Use clock rates
suitable for the supported SD and eMMC modes, including 8-bit eMMC DDR on
the EV23X71A.

The QSPI enablement is retained from v1 so both onboard non-volatile
storage devices are described by this series.

Tested on LAN969x hardware with an 8-bit eMMC operating in DDR mode.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Changes in v2:
* Add driver support for the LAN969x SDMMC controller.
* Add a preparatory option for controllers that must keep clocks enabled.
* Restore capabilities and presets without unbalancing clock enable counts.
* Use the fabric clock for the SDMMC bus interface clock.
* Configure SDMMC1 with an exact 50 MHz generated clock.
* Keep the SDMMC nodes ordered by unit address.
* Remove the unnecessary maximum-frequency property.
* Retain Conor Dooley's Acked-by on the binding patch.
* Rebase onto next-20260904.

Robert Marko (6):
  dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
  mmc: sdhci-of-at91: add option to keep clocks enabled
  mmc: sdhci-of-at91: add LAN969x support
  arm64: dts: microchip: lan969x: add SDMMC nodes
  arm64: dts: microchip: ev23x71a: enable QSPI
  arm64: dts: microchip: ev23x71a: enable eMMC

 .../bindings/mmc/atmel,sama5d2-sdhci.yaml     |  1 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 24 ++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 25 ++++++++++
 drivers/mmc/host/sdhci-of-at91.c              | 47 ++++++++++++-------
 4 files changed, 81 insertions(+), 16 deletions(-)

-- 
2.55.0
