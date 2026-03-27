Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2635F30AACB;
	Fri, 27 Mar 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627643; cv=none; b=XlpsgAg+liIrfSg0MlV/+wip08SowsAVQJGPEa3HP+l3uzWAbYY6dmnuldsJDTliNxoeVf5Cx6udEmf2ztD1ddmjVhEFaFTqrHwLRxfOJrQU5f3OIOLTCbWPhTX7LdrjlWLRbgQdZcO4wJtxSxEPlllxCjJTaJbEMK+x8bv1F7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627643; c=relaxed/simple;
	bh=jC+qjtyvOKNhOkXqAUVF9LEdYKJqioeMUZsW91IPHSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9PUGv3voxZnFuAXh+0QxlI3lyf6adD7TX/l2GS14VOeGO4O76+bxRt8JL5SqSMP6UZ4fLRL1KjrlGWrrLkI52XppzkX9V3Bd6Naavr9V2tbOMS6jUQpGl3rNwG2oddOFSp5H8W/yJRAYlOivBLzasbGzU4sXSNEUO/sX4xFyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=aaXw1kpB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="aaXw1kpB"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 494DF266E7;
	Fri, 27 Mar 2026 17:07:13 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2u7hCyCmTeIq; Fri, 27 Mar 2026 17:07:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774627632; bh=jC+qjtyvOKNhOkXqAUVF9LEdYKJqioeMUZsW91IPHSc=;
	h=From:To:Cc:Subject:Date;
	b=aaXw1kpB3wepjnrovKFK3BIXcuXFMNrSeK6py4vWiO3JfNDxv9ixj4B8oy8YWLLew
	 Vgoo7Y1tjPBJwAnyh+XuKwr4cZyTsF+zX8UZ1U86mxcXqvwQrxZ7wZ4C0NZro9Jy4q
	 vMehVNSHtBtp500fLH6TK1KF8eZtVECZdOO5PVJGzD7HAXGtgT20dczXcJmS/luf9e
	 2S9z4HOSlgwz8oKq282JYym8ZBb16x0GgIk3FqzZJlA4JMFHoghVa7sIOsTBRMCnNX
	 pSw2gSOnC4c76DQ6w+9qHPmTZEpuoMDHinaQNOAXQBqs11Q9IJHW0s7iRx92nmVH4g
	 6edXVoGBxWI0A==
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
Subject: [PATCH v2 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
Date: Fri, 27 Mar 2026 21:06:32 +0500
Message-ID: <20260327160638.15134-1-adilov@disroot.org>
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
  phy: realtek: usb2: Make configs available for MACH_REALTEK_RTL

 .../bindings/phy/realtek,usb2phy.yaml         |  25 ++-
 drivers/phy/realtek/Kconfig                   |   2 +-
 drivers/phy/realtek/phy-rtk-usb2.c            | 189 ++++++++++++++++--
 3 files changed, 196 insertions(+), 20 deletions(-)

-- 
2.53.0

