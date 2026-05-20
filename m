Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F813F86F4;
	Wed, 20 May 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299892; cv=none; b=GIfHDJxhgwhqlj/N1XT21bLhpru9vd0rxhh5mT8w9LzW2Fs2oAQkiYsN6n2NRwy/asmE6fdpu0+IZqMriLBOd9fUvyYo+mRmxFb1tiW5Uuz4V15OSxbBvqJhMJR0DtJ8MIJ1DYHpSMuC/s2E5Lk0l3Z6MlSDYJmupOcAF2JckPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299892; c=relaxed/simple;
	bh=2NkRc386fV0Tgt0p2m70A2/Us9y0xHQS2xgqPJg5ZGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdDhq0rU1sjoNZg66p8/KlupLMXMmH6j0vmx/4+EOS7Lj44oyOl1agbp243Rb7dkfrPNGpVXCHQ5PP4pTLEXXRV+DTmuXuG6K839LcYE4ZatwLZrQQob6ogL9+WyeK+Y/hORYhVHcL2lCOGsH91PPmkxtTa1/VjbBhexgDSJJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NqNpUJx0; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NqNpUJx0"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 739D8275C1;
	Wed, 20 May 2026 19:58:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A--ynDofJVxY; Wed, 20 May 2026 19:58:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779299881; bh=2NkRc386fV0Tgt0p2m70A2/Us9y0xHQS2xgqPJg5ZGo=;
	h=From:To:Cc:Subject:Date;
	b=NqNpUJx0xMWpt1b+Vz1gM2M3iqjOih+wqzH1Pyicrwx7+WwcYrTTxU5M5hDOt3aIm
	 SEmdvG41TZ1sKK/5AIEHPr6Ez/GJesa2362tvxiStbvz+DnjPaV3t+QC/ofxFPcoQ4
	 WxeqpEF1Qu3xCv2IMYehP3v+h4/cbc+VJSZBohVfryCfOXYjRhgTi6xV3P0Fg/FKwD
	 XspOzd3CKlDaSsOV9Og0DpigDwGfohi5HGgYgiD8yGH89E8Aei9Zr3SyyucExJK7bg
	 RF24Y5vPa1YfPKExWeRYvW6qo1gKmLvebdk8CcP/rckg9N5k56w5eyjZ4V9ODjmBlK
	 Zc1DUv7t8lktg==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v6 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
Date: Wed, 20 May 2026 22:57:22 +0500
Message-ID: <20260520175728.720877-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series for Realtek USB2 PHY driver adds support for RTL9607C
USB2 PHY.

RTL9607C is a big endian MIPS CPU which is quite far from RTD series SoCs
supported by realtek usb2 phy driver, but the phy initilization is found
to be very indentical in most areas.

Most of the code was based on the Realtek's usb driver from the GPL tarball
in [1] and adjusted to fit into the realtek usb2 phy driver code format.

The patch series was split into smaller patches that add/change something
in the driver that are not exactly related to RTL9607C and that also
helps for easier review. That also means, patch 5 depends on all the prior
patches that come before it.

USB2 PHY on RTL9607C is primarly used for its internal OHCI/EHCI controllers.

Tested on my RTL9607C based machine as a backport to 6.18 linux in OpenWrt.

[1] - https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/arch/mips/rtl9607c/usb.c

---
Changelog in v6:
Driver has been refactored with enabled SWAP_IO_SPACE config in mind.
- Patch 1
 - fixed one line exceeding 80 columns.
- Patch 2
 - changed to use the introduced read/write functions for reg_wrap_vstatus
   instead of reg_gusb2phyacc0.
- Patch 3
 - properly added the review tag from v4 of patch series.
- Patch 5
 - fixed the lines exceeding 80 columns.
 - changed msleep(10) to usleep_range(10000, 11000).
 - changed the read and write functions to use ioread32be instead of __le32 
   now that we are using them for reg_wrap_vstatus.
- Link to v5: https://lore.kernel.org/linux-phy/20260420191941.81834-1-adilov@disroot.org/

Changelog in v5:
Mostly addressing LLM review
- Patch 1
 - changed int to u32 type for new_reg_req and vstatus_busy data fields.
 - changed comments in rtk_phy_read/write from PHY_NEW_REG_REQ to phy_reg->new_reg_req.
- Patch 2
 - explained readl/writel native endianess issue in more detail.
 - explained why vstatus register doesn't need byte swapping.
- Patch 4
 - moved reset_control_deassert to rtk_phy_init function to keep it outside of for loop.
 - changed msleep(5) to usleep_range(5000, 6000).
 - explained why reset_control_assert is not needed.
- Patch 5
 - explained readl/writel native endianess issue here as well.
 - explained why FORCE_DISCONNECT_REG doesn't need byte swapping.
- Link to v4: https://lore.kernel.org/linux-phy/20260406181228.25892-1-adilov@disroot.org/

Changelog in v4:
- Patch 2
 - moved the le variations of read/write functions to Patch 5 where it is actually used because
   otherwise, it results in unused errors when only Patch 2 is applied.
 - updated the commit message to to point the reason for le32 wrappers around readl/writel.
- Patch 3
 - added "Reviewed by Krzysztof Kozlowski"
- Patch 5
 - updated the commit message to include the addition of little endian read/write functions from
   Patch 2.
- Link to v3: https://lore.kernel.org/linux-phy/20260402154414.196012-1-adilov@disroot.org/

Changelog in v3:
- Patch 2
 - renamed phy read and functions to "rtk_usb2phy" to not collide with networking API functions
 - fixed the sparse warnings by creating intermidiate "tmp" variable and then pass it to writel
 - sligtly adjusted commit message to instead use "default read" not "default phy_read"
- Patch 4
 - added the check for reset_control_deassert() just in case
 - changed mdelay(5) to msleep(5)
 - changed dev_err and return combo with one dev_err_probe for phy_rst
- Patch 5
 - changed mdelay(10) under force_host_disconnect to msleep(10)
 - removed struct fields with false like force_host_disconnect and more in rtl9607_phy_cfg
- Patch 6
 - updated the #endif commend to now include MACH_REALTEK_RTL to reflect if on top
- Link to v2: https://lore.kernel.org/linux-phy/20260327160638.15134-1-adilov@disroot.org/

Changelog in v2:
- Patch 3
 - removed the line about OHCI/EHCI controllers from description.
 - set the resets to false for RTD SoC devices and changed the
   commit message to reflect that.
- Link to v1: https://lore.kernel.org/linux-phy/20260326193419.48419-1-adilov@disroot.org/

Rustam Adilov (6):
  phy: realtek: usb2: introduce vstatus/new_reg_req variables to driver
    data
  phy: realtek: usb2: introduce read and write functions to driver data
  dt-bindings: phy: realtek,usb2phy.yaml: extend for resets and RTL9607C
    support
  phy: realtek: usb2: introduce reset controller struct
  phy: realtek: usb2: add support for RTL9607C USB2 PHY
  phy: realtek: Make configs available for MACH_REALTEK_RTL

 .../bindings/phy/realtek,usb2phy.yaml         |  25 ++-
 drivers/phy/realtek/Kconfig                   |   4 +-
 drivers/phy/realtek/phy-rtk-usb2.c            | 178 ++++++++++++++++--
 3 files changed, 189 insertions(+), 18 deletions(-)

-- 
2.54.0

