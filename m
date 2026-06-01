Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28F32BEC34
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329985; cv=none; b=Nkp0QJPn2kwGs2Dw6yZzuNcIpb+caSEXD7Og8Cad4MWY9znEuNee2gY4yztJYP8NJN9XYbxLBd+PnyE2LRFct4UjNQF/OLd4tLJYUg5Tte0IoHRl26haNjd8VUG6QHwr4OblzBWbx3hk4ZbLfK3fwThRyXWIW0dNS8/T9NvoiVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329985; c=relaxed/simple;
	bh=EqPRWYRbW+5NmsiADfzLRBs1bcFAEqtSjGxiXNa1OZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l52oVqrESPhyWI/9+C7DCaVifGXZkTpJiPRx8F599wK0W6xepDXydgb0o9XZ4w295uhdlhv/58k9bq2+GVjfKyLBSsN9SIuuqsx4R3T0i5nAxSS2gRiEXoQTybbuPUjV74eF3uxPQITbEdCOdjRuK4hGn/yuVhCxrwF/f/XAzAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZeDyfMg; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZeDyfMg"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso1485310a91.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780329984; x=1780934784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOW9HKlKoTKY1oUKJi7UP051gVLaLxiL0BRWcGTFTec=;
        b=GZeDyfMgpQfjYGFvJ23h0gImHoDA7adD85OcqnxoExDeytZqjGp2uoq+bHN3GFOAuO
         tqeFiuQJeme/arEUNltUjyJE+QqtIuRG/Iv8rHXuhQrg/PN0wl/BrM4mWZi6kbHsWC3b
         Ar/Egv48WVt0NjCWjWoIyxh4A3HiDWuQToIRCbjGUWCQLfv0laVrLXJpRnIJdM1tAlWd
         fppxN9BlmIujDrckGAmPdIi+RvWubcyl6g81jdwBs4+sYphqMHFoK9IaCgv7FP/d5KS5
         skn7EP+RrxxHj1GIpi8M4Yb1mLvXZuqILZGLDfEOjp0V9q7mUiQr1GjO0p9ltvVI2DWk
         3k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329984; x=1780934784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOW9HKlKoTKY1oUKJi7UP051gVLaLxiL0BRWcGTFTec=;
        b=L50Gtz9MUkAdaTDqbRpBzST801cK0SE2J90y4lO7xjPLhPOzF+Yxzq4LBdca7YUg6N
         chq1FstgIOHn7XHs+ERncVysTsY/KhxelQvoiPTLjCteRGKtIR98HVgtj6ANnb/F7LPx
         6DRoca5GpK3NDp4Qf/F97oN8M1B9uJK334HTVancVNn89bC2p0K/LmXYzvohchYR5Zvj
         ebItwk/ZDQdGYQGjuuFWS6xgP/LaQFXuuPvLGf2LMWJrJnCdGxLEnpnZFHVepPWgMrDx
         u9K+juAlGXZkIBpuCdxY5JRhKy0+ZuwodqMIYEtQQMXIZPDJIAefuPLAGm69nHFqGe4k
         +9yw==
X-Forwarded-Encrypted: i=1; AFNElJ/g/p/8NVop63iKpqhkVX7CbLdKmBN+P/bZ8w+t7oGGUOwMFS3keHn2fkVPaEsbsOO51wNkNh273I07@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1VEa2VntbjUZE/a//BAhifYvJKvi20PaYVRpm7W2Epdn8mjBS
	xMHii2Zfb/i88D0wAY+Ebc8iYmLQIzhLSEIt0Bv+tsNV5FavUHxKDUwyItTGBAclC2Q=
X-Gm-Gg: Acq92OEbdDLDOWx7DDu5XIKjEafXn4lxXptS4+R4nPlRwFWzxQGhsst81WVHzFIhoTf
	hKpQd63BFc8uegnrbKos9zRuGAZf/f4Y3hODVtLF2zcrmGHUaoPXUBMO9zJkOYr4oE25csz1AXd
	4mc+UQE6mzzfpPiC4HuuNCxNif8PeJz/UQwHkCOfN92Wd/e3o/J055hT9Ei3D98xmpBwX520o2O
	QNeJS9itv/++JDCVLNbMEUDYihCoxlEjv9zvcEEOrMDGuFNmO0MSjAMOj+s3+6ZlLrAFhY7ix4r
	IOAum/PXUbU0osUu6WQwpT5m7nmckC5THK2W7um4VUu4Lgpen0hLiP4tET0glqZcUb+GJ05wMoi
	V6cDf5SwDxzcQyrEhO5iXBnaZqr0ZEIHkZ2IDFeEviyokFtt3aaJCo0aIq3Fat//ry/OiskeWrJ
	W8vvNj1n2oZ8fVlD2PPo1vcmE6JvlpHdXmGpI4SQiP
X-Received: by 2002:a17:90b:4cc8:b0:366:1172:597e with SMTP id 98e67ed59e1d1-36c4ff6496dmr11193976a91.9.1780329983689;
        Mon, 01 Jun 2026 09:06:23 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9205ddasm64218a91.14.2026.06.01.09.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:06:23 -0700 (PDT)
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
Subject: [PATCH v5 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 21:36:00 +0530
Message-ID: <20260601160603.167706-1-hrushirajg23@gmail.com>
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

Changes since v4:
- Re-enabled `combphy2_psu` which is a required PHY for `pcie2x1l1`. (It was incorrectly removed in v4 during the unused PHY cleanup).
- Fixed alphabetical sorting of `rk3588-vicharak-axon.dtb` in the Makefile.

Changes since v3:
- Completely removed `sdio_pwrseq` and `wireless-wlan` pinctrl nodes as Wi-Fi/SDIO was already removed.
- Removed unused `u2phy0`, `u2phy0_otg`, `u2phy1`, `u2phy1_otg` nodes to fix orphaned PHY warnings, since the USB 2.0 host ports utilize `u2phy2` and `u2phy3`.

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
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 983 ++++++++++++++++++
 4 files changed, 991 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3

