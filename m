Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65F274652
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247719; cv=none; b=EvjcyOs9WuQHsuWNA5Vw9xo1BsrFsVUnvpfICULxF92yPJ8xV4tdSe20xmoSDdSspVKznHqRN65J8ZeYrRdD0mV0Nvf1ozwQwR1LeS7t4BO4sFD9d7zGPJUOSdC2ay1Pzs42FJoYEBpJGAGcoQFvzNdJ/YUf4CmnQjByD6QdgsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247719; c=relaxed/simple;
	bh=JO+qHD5fj0WouneCV14Ifbg+BmtRQDIQUKCwXRyHI9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdddRzb+ZargcHJ6M3JvU/7H8sRgjlzKQqdX8vOtus1Dtc/niPrDLUS9flKfvzRvx9PxFapcL5O3VtdYjx0CqV1//mbyN7XDVUh7h01mrb9rLGfrW23t6RLhnGmxrNtDx3qyYEv9caTew8TnVwIaGDna7yk64LiVgn3cisPNC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0rdU5RH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0rdU5RH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so2834005e9.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247716; x=1782852516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQf/A4ruU9gIb5FvsawDggEwo1Hergfzti0vWW30RV8=;
        b=H0rdU5RHo5SPJZdchSSMkhq1Xo+ScMJ/w/cDN4FYna1j71PxLK/Z2kxWnTG8auRgVa
         6tuPjtSKgujHKqV0Z6MmxY3yb2iBtA2EO+WkkVficc2uCKw6oq6xoN2+V20zCv6yRbM2
         O8k+0/CTOtxXoXSpQ5NHef7TJSEfkcw+jKOIlBV60+S2Rqh2FgYZ9WUH8ymToYzHopKp
         jylf1p0vzPVVN9KCUVz+eOgg9A0SHhWegxRFlwBK+LS8SzViftOFzXrc3SJi0SHCnDSP
         5HMEvhIFwzMh0OLlEmukCRQu/HpW2cTkdIXV94IsZp30nZE/E25DjLKQKs5N++8ZWiBN
         S1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247716; x=1782852516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQf/A4ruU9gIb5FvsawDggEwo1Hergfzti0vWW30RV8=;
        b=YogxiNgImRx3b7IbfqhIQmCUv/CQZ80oGYQqMW9FQNjiMVqBwXhYedCL+h3LB1HJ9v
         9FEqRXYEMXbmGGhvQD839SSQbt1M5f5nkvp2ArZgn5e3Il2FkK33rDObT13N0yqfUIHu
         x0sm4rKpJoQE268OnwYGs3suRMyv5VFxnWu8wmt5FO6pqdX1YWJ7mm5K6KCWuOZLbK9Z
         ZXziMYpZ4GoKcfvZ9OqfItl1B6Z6fHx8j+BCI88QNEItgcxx2tB1jQpNFTqjtMzsnw9O
         ZB3yrsZeGdDGrcqom9Y6+YuPe2qE4bJRnuKcVP4BjnKOPbnMYctKEgXowaL54DQDk9Pb
         xtVA==
X-Forwarded-Encrypted: i=1; AFNElJ+u2mwd8ekyghrlk7/Fjv0udPl8PnRwXvdjodbt/I0XzcKhPL8koqyw1uTq2s+C6aJsMXi2368fVfdt@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwq9hVUNxHFxax8tXW/MB5ILq5KIC+NxSiEyY4Xwzoc5yZMsW
	RNstb1ZJSZwqU9w+jCatE5CewBlZ3FiTNbpq6DLaVPI3iidyibeYXTNE
X-Gm-Gg: AfdE7cnmCZhpcIuSeN0iSsJD64ag1T4vnvRW/UQeNWJN7SPBbgl2fOihuBDWmvo9Ile
	N65yAViQoWGgtm1ltgI5bwxZJ1k1eN+OoGMCTY4i0rlXAqULMBUXXnIR0+MhEEDbgEeCzqK7AU9
	ySlkzLZDnYrfNaldNJVZLnS1cicUYkz/OQi6+ADlyMZUMmV8xqIDgXDuC1fZfr7mdF+ZH3gG3ET
	4EAr6YCJ0aEypmsxr/iooLDCTDdjsrKmCpw9bY3Pa2lofiWDjLE83Z5X9Ukqu64SE5pDSUvxbnR
	Rov3rG4dbW9Zw+mWrZW3BxqF8i0/lHaYAn9Kdv7qmwAANl9mYqe77Evp+ZsHoFOxQ2lcsjIq/p2
	pZ6TBkbJbieGi6roittmWAmB922f1J35WHPF+fOs06Hj+NpKJE0vcT1eijXeuKsAUuXUz7dIukq
	xmkN10OvTfLw2TQ5Cdf7nIcAfGzpmNjRsZU8WFFABYvQ==
X-Received: by 2002:a05:600c:8208:b0:492:5030:5e7b with SMTP id 5b1f17b1804b1-4925b3533bemr68648165e9.10.1782247716007;
        Tue, 23 Jun 2026 13:48:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:34 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 0/6] Add support for Baijie Helper A133 board
Date: Tue, 23 Jun 2026 22:48:12 +0200
Message-ID: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
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
v5:
- sun50i-a100.dtsi: reflowed "compatible" property of lradc node
- dropped "reserve RAM for ATF" patch [v4 6/7]
v4:
- reserve RAM for ATF
- sun4i-lradc-keys: Add A100/A133 compatible
- dt-bindings: renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- dt-bindings: renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
- dt-bindings: introduced allwinner,sun50i-a100-lradc
- reserve RAM for ATF
- renamed "sun50i-a133-baijie-helper.dtb" -> "sun50i-a133-helperboard.dtb"
- added "model" property into root of sun50i-a133-helperboard-core.dtsi
- added "cap-mmc-highspeed" and "max-frequency" into &mmc2
- added "x-powers,drive-vbus-en" and "*-supply" into &axp803
- dropped all "regulator-enable-ramp-delay" properties
- replaced &reg_dcdc3 with a "polyphased" comment
- exact DRAM voltage in &reg_dcdc5
- disabled &reg_dcdc6 to avoid "[   31.710641] dcdc6: disabling"
- added &reg_vdd5v "root" regulator
- added "disable-wp" into &mmc0
- commented &usb_otg
- assigned usb1_vbus-supply in &usbphy
- https://lore.kernel.org/all/20260605070923.3045073-1-alexander.sverdlin@gmail.com/
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
- https://lore.kernel.org/all/20260517234134.2737320-1-alexander.sverdlin@gmail.com/
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
- https://lore.kernel.org/all/20260510201644.4143710-1-alexander.sverdlin@gmail.com/
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (6):
  arm64: defconfig: Enable Allwinner LRADC input driver
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  10 +
 .../sun50i-a133-helperboard-core.dtsi         | 197 ++++++++++++++++++
 .../dts/allwinner/sun50i-a133-helperboard.dts | 148 +++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 8 files changed, 366 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts

-- 
2.54.0

