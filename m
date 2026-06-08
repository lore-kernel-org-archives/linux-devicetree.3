Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8912429C33F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899008; cv=none; b=txvkmS0Sk50E4iBWWB2Yy6E+2q0/ulHguijH0G9S16tbSIUJz2gzUJUy/CumQWqJGbYTJyS7Sppqd+9DR3jxL/4IvGruq3RQUvK3/1/LkvzDJbuzwtfaLLFqtan5xBrSRrEbj9Bcq+VgC/XLMEYb2ME7EPQcUnM+y5EhqwV8/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899008; c=relaxed/simple;
	bh=mzbWGnH7KY/jH9feaUs5cfVErGP1G7HEFLEoI8Kt/L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=seU052+rWwPq/J5bDSJGtiUyXFRNC3nYYwc2YzNVKxfWOejbop4HwQSWaMm1xsXOcEPhglHGP3tZUpMgHMj0bXQMVrjhnCDiFlzsi+mTeLB8GIWRVi7qaQbeLlTpdzAnlR2BLSBFYGB1oYnPYp7FuvDARY4m3UquK+zZdbtOh5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFcoOlZV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFcoOlZV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36d8b644473so3917982a91.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899007; x=1781503807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trzFQSB2Wm8IfEtKAHfvmXUeOQsaaBc4Q94uE4SJiL4=;
        b=aFcoOlZVJ9UQdaFZL8dxfgCD7INz8g/N0qH1Otx44Mc2JjUe5ZWQNijU3unv2w4txy
         70at5M3m1rYohbAyfw82JyCkfUUpfBHy/wVOb98P+esM1izfqCz3PVwrdejmDkYcCTID
         nU4w5Xqq8/ynxDUDHOe9QWKGvKASO+OgKzJyhQ7MAqqgGZzaI5VyIxiSU8we+kPhajWH
         507vXmbiDOqsG6vy0YD8fGYjK67eLNLBe1D4rkRg4udwGSLjmKTpAl2pp3Hus3F6Q+Vz
         Er6GSWkJuukbHkJ59u+z8GdRw+NmLqVXvX2SrUacRODqAFDrhue60aH2DZg9LNosRB/Y
         y/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899007; x=1781503807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trzFQSB2Wm8IfEtKAHfvmXUeOQsaaBc4Q94uE4SJiL4=;
        b=QdX2OD+4XOAs/bGP7B/iye2zVAB8+/iqbM4OGfNTiRWxpbx763BPc0oxxATDxgRjdx
         nQ+y6iN9f5gI0lUnoXUrhIS9JNw0sJ+VSNBcm9RC2Ul1KwPszWwRKf2tg9gZyVma7N3d
         AKtHWG+DVt0M8ib7fcS/848dhfiT4PqYOp0yyOYpbnpTWjqvbzTMzey0OQIHR3WVvoQO
         O2HAnl5BHPy5LaQNnEk8ckyKDFkUJXld1TODSeasVBW7X+jluPY1ObgIFTm975Qyibqk
         K5L5x48pgPFTP8kt0mZSthp0Liln6c844MUPWl7LISqsYefw231QSjzUFUethDFm0xd7
         g8gw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZAjE1uvyPVCpAsIxXGhGYeqolmo2gjHGEKMCxtZ3/OAm1w8MKSCWjrle7GPXM36O3MfWwI5Y09wLn@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJ2iEW9CdjjBlDAfhuY+Q44SNkaCkREnznKnhMh2tEVq1qbBg
	1pinu+G9ZhmVThQGVlU/K9erbeqEeipFYXBgKzwrPJlnWmIbH7tH53nw
X-Gm-Gg: Acq92OE47hFR6DXD7S2rpTVZRXKlp9HtM5k/4AgpPVtQzoEzForAxq8dm7QbNW3BfJa
	clwizy/x3NYtJ9Ivo+SHSbJBOFVwB+eKTjn2+uc72fVIaIEXXePkXaW4QuWaJvehy4UNM/7KhjP
	hBlZR29VMMRRArDbtqJW6WVXeF6QJpup6Ops1rI3fKgXbrWwQBcrAptd0qfMPtXzwEnuan5EEs+
	eB7ItF0beYNfHM+OzYUqO7OSZkhqHJSTF8EuVrBBNzJ+d0ZoBvmvYsVVImDq/N/Wv7XQm/pGSSs
	sDu6V61g14XdiJUxjZE8X48xrXlPNYmOeGljL20BYInIAXD6H+CIb/BEaCeVQAHRqfX90P5tD1Y
	zSJrOwlGOyK1WGi3G/OScsizxvbwuAuIEhJkzS9vgyqJgF2/CH1t8eRI+eVZM5rIsR5ypTMzq01
	Fg8ZwmBMLdXDM7f94TJ9slRFpdikpXokEC50Dub2njZnsUZN7fXEE=
X-Received: by 2002:a17:90b:1ccd:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-370eedfff8dmr15054026a91.7.1780899006793;
        Sun, 07 Jun 2026 23:10:06 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668e98sm15065026a91.5.2026.06.07.23.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:10:06 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  8 Jun 2026 11:39:38 +0530
Message-ID: <20260608060940.52549-1-hrushirajg23@gmail.com>
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

Changes since v6:
- Dropped vendor-prefixes patch; the vicharak prefix was already
  submitted upstream by another contributor.
- Added Acked-by from Krzysztof Kozlowski to the binding patch.
- Removed redundant status = okay from newly-defined nodes (leds,
  hym8563, pca9554) as noted by Krzysztof Kozlowski.
- Removed stale mmc2 = &sdio alias (sdio was removed in v4).
- Removed leftover #include <dt-bindings/usb/pd.h> (TypeC removed).
- Removed unused fixed regulators: pcie20_avdd0v85, pcie20_avdd1v8,
  pcie30_avdd0v75, pcie30_avdd1v8, sata_vcc_5v0, vcc0_4v0/vcc4v0_sys.

Changes since v5:
- Enabled i2s5_8ch and i2s6_8ch CPU DAIs to resolve probe deferral
  for hdmi0_sound and hdmi1_sound.

Changes since v4:
- Re-enabled combphy2_psu, required PHY for pcie2x1l1.
- Fixed alphabetical sorting of rk3588-vicharak-axon.dtb in Makefile.

Changes since v3:
- Removed sdio_pwrseq and wireless-wlan pinctrl nodes (Wi-Fi removed).
- Removed unused u2phy0, u2phy0_otg, u2phy1, u2phy1_otg nodes.

Changes since v2:
- Split the dt-bindings patch into separate patches as requested.
- Removed invalid enable-gpios from HDMI nodes.
- Fixed copy-paste error in rk806_dvs1_null pinctrl node.

Changes since v1:
- Renamed rk3588-axon.dts to rk3588-vicharak-axon.dts.
- Added binding patch for board (rockchip.yaml).
- Renamed regulator nodes to the standard regulator-name pattern.
- Removed mem-supply properties from cpu nodes.
- Fixed pcie20_avdd0v85 vin-supply mismatch.
- Removed obsolete regulator-compatible property.
- Removed invalid regulator-init-microvolt property.
- Removed dangling enable-active-high from fixed regulators.
- Cleaned up unneeded i2c3 / es8388 nodes.
- Added missing vpcie3v3-supply properties to PCIe nodes.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: add Vicharak Axon board
  arm64: dts: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 926 ++++++++++++++++++
 3 files changed, 932 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3

