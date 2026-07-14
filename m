Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69017418A30
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056435; cv=none; b=aHGheuZthovcM0FM0j6+l224/40HpRkg8+Cfd8PVyLT8nspbxmlg445UXB7iwg3ZSsicHtmdTqrw61pL6iAp/hTIXoMtbZN3DzIWJxRIRBKhXZxChINKLIu/g9LrbjcCX+q4Thdgoz4iZAB5wAea2OZZbcQ8rMGwaVuKIZs6tWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056435; c=relaxed/simple;
	bh=OnzeXub9pWgszEs+eJAfiDhXWiRA2b94Y2FtZMmT++0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aRlYFVI95SUnC2LXjYKkTKdodJjfSofRbNPnbl0erqYcbXepXsdTtxU5tXvYFsHYNYNlXEFWtDhYJdo2MejN2cdIYNCr4gB/BwCx5JAUDd+tlysJMb5CGXUq//YFG1MLG+njJ8ynqNMhRklaPkCzlEr6HbcravEnSwC8/VkHrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG6Xj81F; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG6Xj81F"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cc6207127aso23282575ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056434; x=1784661234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvralJAhtjQC0agihnqVt6yZC+MGkbFen1qSIili9Nc=;
        b=VG6Xj81F5S/ZRaj0v2iVgPjJ2r14ha6lo1wSa5w+l2PWo1XW/IDkwyzUbv9MMGQs+I
         I3CADMXKTKcTJ2NESpni75slX3bt3A4J/ZUfIIxH/GN+QLoyTHWxiuuGyTOmcWsl0Qfu
         QLW+1jE3CVV/OJLobPl1QhgRXme8o1qVJHARIGzKZcqyd46YEA0SJ1vN8hv5IhJyu1g2
         gTLzpJO5YLFF2BHjXBHmzpOyCflb15wDrjn7XqdSn0y+My8p8kLBTcowoZJjK9bEIFAZ
         cjhrW1NvT0oJKsyLgpB1wLk8dBlDBJPIW76BuHMIqUybLLxPXQVHTg3IE5fu+cmnsNyh
         mcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056434; x=1784661234;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZvralJAhtjQC0agihnqVt6yZC+MGkbFen1qSIili9Nc=;
        b=R1V8GAPYwsQuNmASsuKPht1Ag7L+DrNp31STNJ5GVF5OSg44ZnnYkVvLI5xplHKVql
         MzM/PfqGC2seFglc2VLa6LLRHlAKiI93RxUlUMzd8EccMePCdmrqPjle2k+LZxnwGJw6
         QExJy5HoKfWvJpJP8WD79j9bGffFta4eRE5L4UQ7nIIIfp20LFaa5XCv0PGfe8akarLV
         74hPNVKVTVRVgwGS8J2SZrObHLSiJbzePN4MWgAgAg9cpTON6W9cI3jkrh+Ne8NdXsLf
         sNz8C6N4Vn6yyp+SekxhwLLanI3ZApjVcC5+q1Nu7uxqAB+69B1MhK0yJvAa9oHgxQhV
         FCdg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc3FiGfWYW7FgScD25ikTi2PpqSLV/ItmilkRRva5ynY5DrjCYYmzCAssxm4dqRlCyIBTv49Qv6l8M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jxDX/l3K07wWf1sCtR/SXTxSR9dwmC0kZyvXxVQOGmW94DAB
	2BtQnkg5rb456BVRlIVPxrAbkaIRBzWwnnmbtQoD5ekfAEx6BdcXGE5u
X-Gm-Gg: AfdE7cm+5JVccelLP2cQxKykDNFoZJ2yWUQGxnJWxxvvjnszYC7XhJg7CyUzwwnt+ZI
	ZxurFZb7jRQW9gJ6g9Sbq5P13zJ5hTWxba4hRfqRk39BaFwn90JDHdfrsHX9XJ5AJG1TiVCqRlq
	cjNNEGozFGZwk5TzwAS7HoglZOjMzflsOadAB+7YzOiNwBrGIGBw3otDeRPYKggSm6mFc1oyrLw
	5JCNSHcBRnFHeov9TVzykLM86CZfASncfu1+zp2nZwGJuwLQiaZ8vwQWERNJJsAPtiYK2mz+d65
	64IMKsAFFG+Y9wmSb6n4uL29vt4MPbp4rjZa7YSeXzS8u9uZHIxNTTCoZKTcppM2d4WLfTghNMr
	BWfiNugeeRNljwd0rovCS+oj3AaviP7PaIYCgIJNEgbL31GS6i6TxrtQ6Xi+iaOCwAyWtGCiuGP
	5KqwAdR3evkpU=
X-Received: by 2002:a17:903:2f0f:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2ceed597127mr47465305ad.30.1784056433646;
        Tue, 14 Jul 2026 12:13:53 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:13:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 00/10] net-next: add basic support for RK3568 XPCS
Date: Wed, 15 Jul 2026 03:08:28 +0800
Message-ID: <20260714191341.690906-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds proper SGMII support for the Rockchip RK3568 SoC
using the integrated Synopsys DesignWare XPCS, along with necessary
fixes and refactoring in the stmmac core and XPCS driver.

Motivation
==========
The RK3568 integrates a DW XPCS accessed via APB3 and connected to
a Naneng Combo SerDes PHY.  Several boards (e.g., Ariaboard
Photonicat) use this interface for Gigabit Ethernet.  However, the
current upstream stmmac driver does not support this configuration,
and the XPCS driver has issues in SGMII poll mode that cause the
link to be reported incorrectly.

This series addresses these issues by:
- Fixing the XPCS driver's SGMII AN state handling
- Refactoring stmmac PCS lifetime management to allow platform drivers
  full control over PCS creation/destruction
- Adding a Rockchip XPCS platform glue driver and wiring it up in
  dwmac-rk

Series overview
===============

Generic:
  Patch 1: move XPCS lifetime management to platform drivers
           (introduces pcs_init/pcs_exit callbacks)

PHY:
  Patch 2: DT binding for Naneng Combo PHY SGMII MAC selection
  Patch 3: implement the PHY SGMII MAC selection in driver

RK3568 XPCS/SGMII:
  Patch 4: DT binding for Rockchip RK3568 XPCS
  Patch 5: add XPCS and fixed-clock nodes to rk3568.dtsi
  Patch 6: improve SGMII AN state handling (fixes link-down recovery)
  Patch 7: implement the Rockchip XPCS platform glue driver
  Patch 8: wire up SGMII support in dwmac-rk
  Patch 10: update MAINTAINERS

Board enablement:
  Patch 9: enable SGMII LAN port on Photonicat board

Key design decisions
====================
- The stmmac core now delegates XPCS creation entirely to platform
  drivers via pcs_init/pcs_exit.  This is necessary because the
  generic XPCS creation logic would override any XPCS set up by the
  platform driver.

- The Rockchip XPCS driver creates a virtual MDIO bus over the APB3
  registers and implements address remapping.  The generic XPCS core
  handles all PCS configuration via phylink_pcs_ops.

- On RK3568 in SGMII mode, the MAC clock is fixed at 125 MHz and
  cannot be dynamically changed.  In-band mode is used, and the
  generic stmmac set_clk_tx_rate callback is disabled to prevent
  incorrect clock updates that would break RX.

- The SerDes and power domain are attached to the XPCS device tree
  node rather than the MAC node. This reflects the actual hardware
  topology and simplifies the dwmac-rk driver by keeping all PCS-related
  resources self-contained. It also prepares for possible future QSGMII
  support, where a single SerDes serves multiple MACs and would be
  more naturally managed under the XPCS node.

Testing
=======
Board: Ariaboard Photonicat (RK3568)
OS: Armbian (trixie)
Kernel: 6.18 (backports)
Result: The SGMII interface obtains an IP address, SSH works, and
        ping traffic passes without loss.

Notes
=====
- When testing out-band mode with set_clk_tx_rate, only 1000Mbps
  works on both TX/RX; 10/100Mbps only works on TX side.
- I also noticed that the PHY (YT8521) reports 100Mbps/Half in out-band
  tesing while the PCS reports 100Mbps/Full if using in-band.
  This looks like a separate PHY driver bug.
  I will address/report it independently after this series lands
  (or if a maintainer points me to the right list).

Dependencies
============
None. All patches apply cleanly on top of torvalds master tree (v7.2).

Questions
=========
1. Patch 6 (SGMII AN state handling) touches generic pcs-xpcs code and
   may affect Wangxun NICs.  I don't have Wangxun hardware to test.
   The original Wangxun-specific path is kept unchanged, so I believe
   there is no regression risk.

2. Would Heiko Stuebner be willing to be listed as a co-maintainer
   for the Rockchip XPCS driver?  I've added myself in MAINTAINERS,
   but having a more experienced Rockchip maintainer on board would
   be ideal.

Related discussion
==================
Previous attempt at SGMII support on RK3568 by others:
https://lore.kernel.org/all/20221129072714.22880-2-amadeus@jmu.edu.cn/

Also related (runtime PM fix for xpcs-plat, sent separately):
https://lore.kernel.org/all/20260704214808.1566710-1-coiaprant@gmail.com/

Acknowledgments
===============
This work was inspired by and builds upon the excellent work of others:
- Serge Semin's Synopsys DesignWare XPCS platform driver (pcs-xpcs-plat.c)
- Clément Léger's Renesas MIIC driver (pcs-rzn1-miic.c)
- The Rockchip TRM and downstream OEM drivers

This is my first kernel driver series.  I've spent many nights
debugging the hardware quirks on this board.  I hope this can finally
replace the out-of-tree OEM code with a clean upstream solution.
Any guidance during review is greatly appreciated.

Thanks in advance,
Coia Prant
---
Coia Prant (10):
  net: stmmac: move XPCS lifetime management to platform drivers
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  net: pcs: xpcs: improve SGMII AN state handling for Rockchip RK3568
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 126 +++++
 .../phy/phy-rockchip-naneng-combphy.yaml      |   7 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  77 ++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  45 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  44 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  87 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   7 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  37 +-
 drivers/net/pcs/Kconfig                       |  22 +
 drivers/net/pcs/Makefile                      |   7 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 526 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  31 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 18 files changed, 1008 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3

