Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52A9223DCE;
	Sat, 15 Aug 2026 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785283; cv=none; b=q782RTdzBB2ZAVyGMpehzFm+Uz/W7DDNj7mGgYIlIN+WnUcWU7+kS2jgYYDZY1yj6ux8FvrYDTrD/0ktRNHDE4hzYCNgw8bt6HAIPgYxDiIpdKhsgoausYR+M8a5WuPk6yYj86545AZ6pKcpEvWWeLuwn2M2lKfDoH8NQSowdww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785283; c=relaxed/simple;
	bh=QnrLcrwDfl0jRdc/eWQyD6kyF+8BtWAK9WwjV/Eghv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/VkE6xTrVFqtjBptzD7YVm0ZPTMp4qp2uUgxcJXf8eKmnAU2m0FUjaHVW8U13d7oLMVdBQ0f7HrSZVqq0GlSmb5uq26ycNRa7NxHlpvTTVdHDlMnYg55AhgO54guR5QJUB+F3um0KoPL/55M5htSiLMmg91HusJ2KQTYpREr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NvcAsk8I; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NvcAsk8I"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 026F387D91;
	Sat, 15 Aug 2026 11:14:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wQqyPBpuV6V; Sat, 15 Aug 2026 11:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786785270; bh=QnrLcrwDfl0jRdc/eWQyD6kyF+8BtWAK9WwjV/Eghv4=;
	h=From:To:Cc:Subject:Date;
	b=NvcAsk8I0M79qz3TOG78D3zr+Uin9Hi+6QgV/Hsy3niYorBLkXHcbVKADfbNnLIe4
	 lJW2cxlBy6JOG/Rg+0SKpqeskazJS3p/jSvbO7Ztu5cCx8FNWI3e4O2rDPaTCFio9A
	 ZKz486St5o+8mDLc1e6RsMiU27/fX7qjGtIORpQa0HWE5HzQkI9D4AYOUmBXhOS5Su
	 spzlgwJPKup6+S0706TubJrsB1n4i5SBcsg7TC2l3TPbob8pf/dOjWwuLOHhdU735e
	 u0yekGBUD0NVFcPYXgncuiSqJ++7eHONOOei+ZvHAzs5xXDS8mDUzuvNHYkZ1awMus
	 GOwIqP8vgbLTQ==
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
Subject: [PATCH v7 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
Date: Sat, 15 Aug 2026 14:13:34 +0500
Message-ID: <20260815091340.26910-1-adilov@disroot.org>
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
Changelog in v7:
- Patch 1
 - created a phy_reg_desc struct to get rid of duplicated fields across phy_cfg and phy_reg.
 - added a default rtd_phy_reg_desc for all existing SoC phy configs.
- Patch 2
 - moved the read/write to a newly added phy_reg_desc struct.
- Patch 3
 - added an Acked-by tag from Manivannan Sadhasivam.
- Patch 4
 - replaced devm_reset_control_array_get*() with devm_reset_control_get*()
- Patch 5
 - added the read operation after write to FORCE_DISCONNECT_REG.
- Patch 6
 - added a Reviewed-by tag from Manivannan Sadhasivam.
- Link to v6: https://lore.kernel.org/linux-phy/20260520175728.720877-1-adilov@disroot.org/

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
  phy: realtek: usb2: introduce phy_reg_desc struct to the driver
  phy: realtek: usb2: introduce read and write functions to phy_reg_desc
    struct
  dt-bindings: phy: realtek,usb2phy.yaml: extend for resets and RTL9607C
    support
  phy: realtek: usb2: introduce reset controller struct
  phy: realtek: usb2: add support for RTL9607C USB2 PHY
  phy: realtek: Make configs available for MACH_REALTEK_RTL

 .../bindings/phy/realtek,usb2phy.yaml         |  25 ++-
 drivers/phy/realtek/Kconfig                   |   4 +-
 drivers/phy/realtek/phy-rtk-usb2.c            | 154 ++++++++++++++++--
 3 files changed, 165 insertions(+), 18 deletions(-)

-- 
2.55.0

