Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F455355F36
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061284; cv=none; b=ejbry/SmE7TeBvY0boT7MC1Mk6ysJ9EWyvvrIDquLQ8vbLp9tBKPrFjqIgqwt4/zoKXfO0aQVQ3c6ILgA08GeqjW4Ic9aTQsEm67nsKiio3HGfC+CiOub4E4q9DLAfYCLmdUvG04Q/Hdfp4P5KyTpc7WwPRlgGxV7gm1qF68Ceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061284; c=relaxed/simple;
	bh=FlwlRdiPsdotnda3euc5BVRVjmtCHnYbDG20q6ghTio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clcVXJJtE50phC8Lc1UABZXjHkNI3TflchoVuad2UjveYWvdgE9RMR0HuWXZFJNz0MBme1q3R/3Ah8E+EAJzmvkme47nrspqvwaU2n7WQH/qY3/vMNv9cAbqkWlfHSgf/Xit/qhU4qLbnZbg2kaP6PYJ0hfPj6jPZZfEs5PoMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sENKMEGN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sENKMEGN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso1376892f8f.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061281; x=1779666081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cV5K+hC6U/LO0fJpISy/X05UeT2K9Cbw0OM6/rSxBSo=;
        b=sENKMEGNHjCKq7++5uGFRAMoCZbZQoB+ryrFNbvI6cpEVsLJNIscXen3cuYBjxP51F
         HvpzIqSch3R1oGrDTCeI2yWhlUtCHsvaN0znAm4qbETHVkM0Bt+Upi8j+YII34VYChp1
         gLXrAvx3x0qZLtlYNVzghv6FUnfrRVZcJPJf1GMEjmMXpdNyseIHLVHNc+j4vsGJSoGR
         KCEClZ5/jfqFZQORkkH0nzPeB1EblKkG0jADhjEGX23644vR3lFWXRK3hG4zutj4Ft/m
         51Uz8EhwNvUd8I588qnTaQu4HxM1gIwtzRC0rEF+8xTQuSnYqUaaSAMfzxegAc3tuApP
         J8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061281; x=1779666081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV5K+hC6U/LO0fJpISy/X05UeT2K9Cbw0OM6/rSxBSo=;
        b=eS2nW3MMHz0tB6TzqU1O9wIZoFtn0RwvfZpq0lzic1yjPGlVMAS1F5Yrk1DPPJtEv4
         uRG8jnvTcS7SeMaNTTxdB3wXJc2UuUEaNv6ogUcG2hEg67/kJbaUFZ2SgVGRyGPRS8O6
         AAPNR4VVoQwnuLS1wqR2g1Q+0bm6p/TAQv2ujyKh1Lq4znrIlsOgbDQJH28i29lKbL2w
         L/tUMW5yYMBWd2Qm3guwtqGkyONpaiwhWI4Upspcb7I114mSh5C1Zww9EI9zyQwwAKZG
         IBlYpDd0bO62ZpAxtFsZIKOG81wD91wxWiOmyHP4HMT8wLvpLt3jFyW1PN4EEOuiPgeD
         NYMw==
X-Forwarded-Encrypted: i=1; AFNElJ+LcA01SebLfxdT4FIydb/M5PPvTmPHIkXuU6CXmVbxtMdxPeKoSMrT4URJXulkzVGErbznmknE61nH@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1GaxJ98up1da1K3Rr/RAiy3eN5JWeRi13FM4dCYiTCR+L1F5
	BxWNZ4I5phaLbDPaRdZL6sIzSeB0bmwI9SRzLcjm8zPPsvb3xw0/yWAL
X-Gm-Gg: Acq92OHdcXqFNURV1sFEpL0TQli/VcnQDKZYRFno2HmHbWPkPiqKUmx1937mdXWW07U
	9wx6wtOLSOtLLRSCsolhxGg9PHNukvXfKeJuLdOR+Xdw1Vp+frHDOdE7muynFXI0RfL+u4E7tP9
	e540UC5VTyzXJfPvwJmT1p0uwq8tz6y/vUp4bNCpsB9kHSKsNh7t9XmOW6g4sgZQnVWCbJS4KCe
	bpaUPBC7RRCbZrgZ/ysQAuz1bVFUi+toicIGmRh5iQKAkji/JWwfIUfwAewZbV0vPeSeh03CiZk
	fCXbvGdr8OBd/OkKQq61JeTTl6qF2d6YgIDchPRjWOeAl/06E3u6hsGWajU4YFu1geRfpi8AIjp
	tB3k3I35i0RH34HVosV5/qvvZTEbl841BQakooZMWJw3bLY6hKE2l44PYRwEnK1LMTIJaLdAgk4
	fjZ6HKv0R586GPqbBz95F9cxo0UIw+291nGbi38ZZvT95NV4nrwnIOYaUFRfivHnaKb3wLXY9ch
	YDo8aQEmdo=
X-Received: by 2002:a05:6000:25c6:b0:446:189c:ac4e with SMTP id ffacd0b85a97d-45e5c59f684mr18961084f8f.34.1779061280824;
        Sun, 17 May 2026 16:41:20 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:19 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Add support for Baijie Helper A133 board
Date: Mon, 18 May 2026 01:41:26 +0200
Message-ID: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- USB-C OTG port in peripheral mode (via onboard hub)
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet, LRADC-connected buttons.

UART1 can only be used for Bluetooth module, but BT-WiFi combo Allwinner
AW869A chip has not mainline driver currently.

Link: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Changelog:
v3:
- added lradc node to sun50i-a100.dtsi
- enabled LRADC driver in arm64 defconfig
- added my copyrights into the newly introduced DTs
- all DT nodes sorted alphabetically
- all always-on regulators commented/propetly named
- all regulators got proper voltages (not default ranges)
- ADC-sensed buttons K1..K5 added
- re-labelled "eth_phy" -> "rgmii_phy"
- usbphy 0 switched from host into peripheral mode (downstream from an
  onboard hub)
- typo sun50i-a133-baije-core.dtsi -> sun50i-a133-baijie-core.dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
- https://lore.kernel.org/all/20260510201644.4143710-1-alexander.sverdlin@gmail.com/
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/


Alexander Sverdlin (5):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
  arm64: defconfig: Enable Allwinner LRADC input driver

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |   9 +
 .../allwinner/sun50i-a133-baijie-core.dtsi    | 190 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   | 133 ++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 342 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.54.0

