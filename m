Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3803DB33A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327114; cv=none; b=usU85wSpOBoUwBjEPBR90p4Tb0Ae/JmUnA25D9QUM3Vrc+AAKEh7lSHAcUjUIzzW/HBIICxzihwfNBq6ZIniRDLy3fiXwoOdyFOfxtnWm3sbYGTLMOHny15cm22MEiKofyphq66eE3ATwQVNhTMZTwHyBgCp0/aaGo3ivpncSyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327114; c=relaxed/simple;
	bh=9qKvvf4Fs6jFPNxE2QAK3hO5otEdyh3JzosPFyW2xW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oytXdpiiobWbRY+XHqHeLZKxveB2W2KCVfILR3yYclFaB+vUjnUTgn+IUy1TQK+CHuv6BJnnfWPlyvBYkWdypdv6oWqh6wu6sZyp55pHkjUXr/JcuoMdgrSCZrVgDEls7g+Nc26a4ojWA08MLRG+DSoTZAy4YqHIvubDRZSEv4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebdhJIe5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebdhJIe5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso14976085ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327110; x=1780931910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGKsQJW7L7doA6HjoCHUuBeZbYA6DEbQw5AcqdHiYtk=;
        b=ebdhJIe5PVA4kp7+4xOe166/TfjFhj8fq0pe0CELLIRpzGo8+T2W6OmzWthp6lo8Kz
         JvuwU3RhHqq6PAt6qpi4vozPB4aoL9kFpILo2m8awWEkK1H69scibO5jK1Ea/QslIzth
         btE8fGodu9mQj7akVZeocojsdJKtqKgE/iYcR1wjL1XYdKBx7C6dsM9nBYcghPy9GNtL
         tlcpeq34yTGFCOp4cbpCqHigmKr/XUZ5Hh0wWfsicNzGb4XUDh8yAZOuPyGSEYJoPgq2
         2sLrysGrSjxi9wDhr+f+ezMeprS0+pwX3Q8KnLQAnMgXB4BKemj17t5E3PobNORgx+3d
         aJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327110; x=1780931910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGKsQJW7L7doA6HjoCHUuBeZbYA6DEbQw5AcqdHiYtk=;
        b=FWU5NCryBUvPMjacC3bmC+5hfgMx2vOIj9u923OeWrc2E+Q6g7FyBhsZyX250GiL9N
         sV4aiuIaLIGKJHaIJ9v0B1dpoWvlJvqVGaYcGoRCtyjqy14UcptWjjveZ/chmRTjhzhd
         +6cKzxSXY0s0Vrz1zlVZyEeGikA6Oz4pncc9uZZXtALWFYdq8FLbl3Vvnw8C9/Gk7AKQ
         RASVb6GiPH8b4zZRKhIoruHraLM95iGgmX2oDx2T+YAwbksSRytB2n5ujOCcTav9tpL3
         tNWH9hbHQFzp0VZI9eRVbUaLqllFv0yL2T5cbq2rzw0qOjUy0oUvHysdR2wFaAl65Ih8
         8LmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9retZ6IBlNbPni1HgQMjr5TMAufJdq+NGpJWTsojGCo1jqP8M2R9598uggnqXMHErdnOzHZVMGBgL7@vger.kernel.org
X-Gm-Message-State: AOJu0YxAmUx/5pSFuDHeb7b6gbKj44HGvqLLY/V995NWVIcAaz+nTzWD
	rxiJzQR8nPLngACruli3+BQKimztuKooaJO+I7RvBy2Hit+FCI8H1lp/
X-Gm-Gg: Acq92OHfZT/22CMXCgpFibGfUY0MC/HJch3l8Pi+oshuSEEjqvOEN0gph9a9oMQbnQz
	Ed0LEmCBcm5107U5KK5mvZvkhGG4MpP5DNkjrStcoG0rlTwhnqi6xXd+FRnxvvIFn2F2eiJZeSM
	6DeRjuj8R+wBp0k0dJR5jd3PmohR+ZFe29Ghb9tLnW7/aMvLKShpnThTlOr+g29tP73IkbivMIv
	nbxBS9S/wObXJTt3gOGn9bn2I4uSmLIut2mqpFLp/G7joZdzPPaYRP1xHser6sHFx26RXfezxkB
	1aR15s+kHeA1t2xPkzziZEEY4P99IuvtuPUBNIRHVF52qspG60ckHODk4vqyiuiFvX9Ib/JTkJ6
	GFUFDwFOb0Z/cq4tJAHIlJvK1LQJ4lxosYCdO/xp7kzCchStgWnuQigy/kZh02Jly7cY8mxmoqK
	qZzIkCvPsz09ByJUpR7csDksM4vRtZrhCRSMVyN4HU
X-Received: by 2002:a17:902:e88c:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bf368859d8mr120253145ad.35.1780327109695;
        Mon, 01 Jun 2026 08:18:29 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0d727sm106633925ad.59.2026.06.01.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:18:29 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 20:48:07 +0530
Message-ID: <20260601151810.162173-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial device tree support for the Vicharak Axon
single-board computer, which is based on the Rockchip RK3588 SoC.

The Vicharak Axon is a feature-rich SBC targeting developer and embedded
use cases. It ships with:

  - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
  - RK806 PMIC providing all SoC power domains
  - eMMC 5.1 (on-board) and microSD slot
  - Gigabit Ethernet via RGMII (RTL8211F)
  - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
  - PCIe 3.0 x4 and two PCIe 2.0 slots
  - SATA 3.0
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

Changes since v3:
- Completely removed `sdio_pwrseq` and `wireless-wlan` pinctrl nodes as Wi-Fi/SDIO was already removed.
- Removed unused `u2phy0`, `u2phy0_otg`, `u2phy1`, `u2phy1_otg` nodes to fix orphaned PHY warnings, since the USB 2.0 host ports utilize `u2phy2` and `u2phy3`.
- (The pcie2x1l0 / sata0 conflict warning by Sashiko AI is a false positive: sata0 is on combphy0 and pcie2x1l0 is on combphy1, matching rk3588-base.dtsi).

Changes since v2:
- Split the dt-bindings patch into two separate patches: one for the vendor prefix and one for the board binding as requested by Heiko.
- Removed invalid `enable-gpios` property from HDMI nodes (ignored by dw-hdmi-qp binding)
- Fixed copy-paste error in `rk806_dvs1_null` pinctrl node (gpio_pwrctrl2 -> gpio_pwrctrl1)

Changes since v1:
- Renamed the dts file from rk3588-axon.dts to rk3588-vicharak-axon.dts
- Added binding patches for the board (rockchip.yaml) and vendor (vendor-prefixes.yaml)
- Renamed regulator nodes to the standard `regulator-name` pattern
- Removed `mem-supply` properties and phandles from cpu nodes (vendor-kernel specific)
- Fixed pcie20_avdd0v85 vin-supply mismatch
- Removed obsolete `regulator-compatible` property
- Removed invalid `regulator-init-microvolt` property
- Removed dangling `enable-active-high` properties from fixed regulators
- Cleaned up unneeded i2c3 / es8388 nodes
- Added missing `vpcie3v3-supply` properties to PCIe nodes

Hrushiraj Gandhi (3):
  dt-bindings: vendor-prefixes: add vicharak
  dt-bindings: arm: rockchip: add Vicharak Axon board
  arm64: dts: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 979 ++++++++++++++++++
 4 files changed, 987 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3

