Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17077082D;
	Thu,  2 Apr 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144691; cv=none; b=aJ6zzCfX1wWbp8QsqEoMqMrhmB/IB7WOfNo4dAI1C5gpJisnWdC7fYqcsggna0J+RrCp7uhIbtGKavHSLaUcsadWViHmSAh6LniSFrfhdOpuh/W/iexnffuDwgNYzdTEcRvJUHGJ6QPxCNcH9l+ZDhSUVrnaqW9PrymSkfrcx6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144691; c=relaxed/simple;
	bh=ehukUNKCQJJS36gvIjnDSkX0muBe2NdLvE10oXemFaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2wk+FhGswwS4/HN/T7UQnBb8B1LDIJZdr7lDQKkA+x1h0HPvOR4Fut5sr1gjB+dPfsjOycEYHpvFOe975xHEtfbqCBEqlyg6UMrd0CoyOcdG4dQ/lgE/7MwTkpxWpIH45nJ2kLonl7epg7+sdnAhijf0pvVq9MGHmjBfuoL0U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=C6nkODbK; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="C6nkODbK"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 867FF26EBC;
	Thu,  2 Apr 2026 17:44:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuyV9FzdCJHh; Thu,  2 Apr 2026 17:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775144685; bh=ehukUNKCQJJS36gvIjnDSkX0muBe2NdLvE10oXemFaQ=;
	h=From:To:Cc:Subject:Date;
	b=C6nkODbKOMKve9s5HPGrE7wCA1yq5h0eCyzorJV6dSwLQYP0Huce2Y1jJd4sDnsGf
	 HI7u+rGoF01n6biGCJLdqegAWjlyBwc/janTJgtY1HHW0SkgeUyJu2G4TyhGNF8QuY
	 HOQUfiU2aMTuh59SzkY03Mna0fhDocEyZ75PjB8rnWXcOAuv5dfhkd4FEj6/VKzEt5
	 pYzRsMx3NXKZIdPJXPbFd0Y8LryML5WhzVn1zXM743CK2NNQGyrPbEB9CHxFnMJwbK
	 eFsnNdYRKdFAPLyyCXf9MBrqyMXncYC/Pq59AzDIt9POViAw5b9xOdkV0LJdVdUtil
	 L/nVaQ04QCqBA==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v3 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
Date: Thu,  2 Apr 2026 20:44:08 +0500
Message-ID: <20260402154414.196012-1-adilov@disroot.org>
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

[1] - https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/arch/mips/rtl9607c/usb.c

---
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
- Patch 5
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
 drivers/phy/realtek/phy-rtk-usb2.c            | 183 ++++++++++++++++--
 3 files changed, 191 insertions(+), 21 deletions(-)

-- 
2.53.0

