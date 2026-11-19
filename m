Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080770;
	b=pWG+7mbcLHhV5lLgFI8jACn2nS67DTb+5/88Ulf5fBYi7qgT7SOlHVoHKE/AmyqrWyFM
	 f2BWcJpOqoDA6531d5SzlnsHpMFXvvFhKunNAsbFzplcIxeYe5I0u4pnLvDOIMd/KnFVK
	 4Rp4gGc9IzwOCOrSwj1LBJvl1U+NZMQT6QlHZwxBLIu8QyZpGqaBq4GfVHY07G5zhyjaP
	 UWrmHqecH+R/OrP9PxPyde5WFRV1+WnalxybYq6ZghfoRvrDlf0THWOnTXZaOwP97MDgC
	 R9eia1d81sFm5+Ls8VrgrlGY850Csc4S6HXE4AWp4sLh+URVoK9CnAOez/1/XNNEwWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080770;
	h=DMARC-Filter:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Akaj9GbEeGWllyBNX65CbCshfGoOEBSw7hCqXMACpIY=;
	b=l2YWBKYiNKw6B1VDX3VdF43+Zs+3ClevHDQunwdztDnhzHjwkAxAx0N6PnEn78e4JBsc
	 c58d4owpqnsTiqFtWvgIgr37XRVXraxInR9ozuQGgZQUQLAdwRUcV8mr2XfONFtO3RDuz
	 5eYOQzISF9aYmALHRDjxvg4801m9syPhi+TdWcHb68KyUMMC50rTqj8SBgEqIIxVm8OHQ
	 YF77jyjon90+NG8ZC4j15IZLB6R2wDClgOp/JVmdbPmnXs/pA9XTkWN6YFWSDAN6cSts+
	 P49OZYEJ8+BsFvWKS8lrnIRKdLmxOjYgfbAQNP9aX3Y4piWeE5NxNorMipUEIu0cEDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2817606A320;
	Thu, 19 Nov 2026 09:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2817606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Nov
 2026 17:32:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Nov 2026 17:32:40 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH net-next v7 0/7] net: ftgmac100: Add AST2700 support
Date: Thu, 19 Nov 2026 17:32:33 +0800
Message-ID: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHC/moC/23OzU7FIBAF4Fe5YS1mGGAod+V7GGNafrwsbJuCz
 TU3fXexC21Clycn8515sByWFDK7Xh5sCWvKaRprME8X5m79+BF48jUzBCQglDx/zfO0lPc+FzQ
 AnLo4CFK+V9qxejUvIab7Lr6yMRQ+hnthb7W5pVym5XufWsXe76pF06ir4MBtBBnRenQdvvR5D
 sGX4G7PbvrcwRX/EAFALYIVkeSDFnHogOgUkQdE6BaRFem8sdYKI3qnThF1QBBaRFVEeUmDAiv
 tIE8R/Y8IUC2ifxEF2kTlfTD6FKEDIrBFqCIou/rlEBW52CDbtv0AlQIQwxYCAAA=
X-Change-ID: 20260623-support_ast2700-68fb164da45c
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Po-Yu Chuang
	<ratbert@faraday-tech.com>, Eric Dumazet <edumazet@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "Eric
 Dumazet" <edumazet@kernel.org>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>,
	"Conor Dooley" <conor.dooley@microchip.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795080760; l=8562;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=GnkuWWtCV/+UBiCfJUgOpSbbXyvnVC4S4fstWYTU1MI=;
 b=wKrBINSrbE0s+2gMNpXH8gQBAYC7DH1NOh9nRkTTD1bnkeYAsoefSAJ2dt7tKk5ef87QpsFYw
 3ESC3HgUnsaCewBgWSB1D31zwZCjUE6CwnB5hSHbWjvWsehmyhtsYPh
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Add the pieces needed for the FTGMAC100 driver to run on Aspeed AST2700
systems.

AST2700 keeps using the FTGMAC100 MAC IP, but the enablement is not
limited to a new compatible string. The SoC can boot with the MAC on
ARM64, needs the Aspeed-specific RMII mode bit programmed when a port is
wired for RMII, and requires the driver to use the upper DMA address
fields in the ring base registers and packet descriptors. Those fields
expose a 35-bit DMA address range on AST2700, so the driver must request
a mask that matches the address bits the hardware can encode.

The series first documents and wires up the aspeed,ast2700-mac
compatible. It then treats AST2700 as an Aspeed MAC in the driver,
enables the RMII mode programming, writes the AST2700 high descriptor-ring
base registers, carries the RX/TX descriptor high address bits, rebuilds
full DMA addresses before unmapping buffers, and requests a 35-bit DMA
mask. The high ring base registers are only touched for AST2700 so older
Aspeed device tree register windows remain unchanged. With that in place,
the FTGMAC100 Kconfig entry can be made available on ARM64 while keeping
the existing Aspeed MDIO dependency for AST2600 and newer ARCH_ASPEED
systems.

RGMII delay is configured at the bootloader stage, the same way it is
handled for AST2600, not by this driver. Aspeed's SDK bootloader
configures both AST2600 and AST2700 boards with the RGMII delay
disabled and advertises "phy-mode = rgmii-id" to match, mirroring the
OpenBMC bootloader change that stopped inserting delays on AST2600 so
its device trees could use the correct "rgmii-id" setting. On AST2700,
every on-chip MAC is likewise configured by the bootloader with RGMII
delay disabled and "rgmii-id" phy-mode. Because the delay is already
resolved before Linux boots, the ftgmac100 driver does not need to
program any RGMII delay for either AST2600 or AST2700.

This series has been validated on AST2700 EVB and AST2600 EVB.

Patch layout:
- patch 1 makes the existing aspeed,ast2400-mac, aspeed,ast2500-mac,
  and aspeed,ast2600-mac compatibles standalone, dropping the
  requirement to pair them with the generic "faraday,ftgmac100"
  fallback compatible, and constrains the clocks/clock-names properties
  per compatible instead of leaving them generically optional.
- patch 2 adds the aspeed,ast2700-mac compatible to the binding, with
  its RMII RCLK gate, reset support, the "phy-mode" requirement, and
  extends the clocks/clock-names validation to cover it as well.
- patch 3 adds the AST2700 match data and OF compatible.
- patch 4 programs the AST2700 RMII enable bit and documents why
  netdev->phydev can never be NULL at that point for AST2700.
- patch 5 makes "phy-mode" a required device tree property for AST2700
  and fails probe if it is missing.
- patch 6 adds AST2700 upper DMA address handling for rings and
  descriptors.
- patch 7 enables the Faraday/FTGMAC100 Kconfig options on ARM64 and
  selects MDIO_ASPEED for ARCH_ASPEED.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v7:
- Require exactly one of "phy-mode" or "use-ncsi" for the AST2700
  compatible in the devicetree binding, instead of unconditionally
  requiring "phy-mode". The driver's use-ncsi path never reaches the
  phy-mode check, and the binding's own first example (use-ncsi, no
  phy-mode) was valid but failed the previous schema.
- Link to v6: https://lore.kernel.org/r/20261112-support_ast2700-v6-0-238020bf46cf@aspeedtech.com

Changes in v6:
- Constrain the clocks and clock-names properties per compatible in the
  devicetree binding instead of leaving them generically optional:
  aspeed,ast2400-mac takes exactly one clock, aspeed,ast2500-mac/
  aspeed,ast2600-mac/aspeed,ast2700-mac take one or two, and the plain
  faraday,ftgmac100 compatible takes none. Require clock-names whenever
  two clocks are listed. Split across patch 1 (base rule) and patch 2
  (extended to AST2700), matching how the compatible additions
  themselves are already split.
- Simplify the compatible schema from oneOf: [const: faraday,ftgmac100,
  enum: [...]] to a single flat enum, since neither branch needs
  multi-string matching.
- Drop Reviewed-by from Rob Herring on patch 2 since its content
  changed again.
- Link to v5: https://lore.kernel.org/r/20261104-support_ast2700-v5-0-44057f4dde75@aspeedtech.com

Changes in v5:
- Pick up Reviewed-by from Rob Herring on the AST2700 binding
  patch.
- Link to v4: https://lore.kernel.org/r/20261020-support_ast2700-v4-0-4d36b40939b3@aspeedtech.com

Changes in v4:
- Split the dt-bindings patch into two: one making the existing
  aspeed,ast2400-mac, aspeed,ast2500-mac, and aspeed,ast2600-mac
  compatibles standalone, and a second adding the new
  aspeed,ast2700-mac compatible, per review feedback that these are
  two separate concerns.
- Link to v3: https://lore.kernel.org/r/20261015-support_ast2700-v3-0-8d7999171ac4@aspeedtech.com

Changes in v3:
- Require "phy-mode" in the devicetree binding when the AST2700
  compatible is used, matching the driver's probe-time requirement
  added in v2.
- Drop the "faraday,ftgmac100" fallback compatible requirement for
  AST2700; "aspeed,ast2700-mac" now stands on its own in the binding,
  matching how the driver already matches it independently.
- Drop the same "faraday,ftgmac100" fallback requirement for
  aspeed,ast2400-mac, aspeed,ast2500-mac, and aspeed,ast2600-mac as
  well, per review feedback. The same EDORR/EDOTR bit mismatch applies
  to all of them if a node ever bound through the generic
  faraday,ftgmac100 entry alone; there is no evidence this has ever
  happened in practice since ftgmac100_of_match[] has had dedicated
  entries for these SoCs since commit 03a2aba50b2c, but keeping the
  binding correct avoids leaving the same landmine in place. Folded
  into this series rather than sent as a follow-up, to avoid
  self-conflicting with a later series touching the same "compatible"
  block. Note this makes `make dtbs_check` warn against
  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi, aspeed-g5.dtsi, and
  aspeed-g6.dtsi, which still declare the two-string compatible; that
  .dtsi change will be sent separately through the Aspeed/arm-soc tree,
  since dt-bindings changes don't go through that tree.
- Document in the RMII-enable patch why netdev->phydev is always
  non-NULL by the time ftgmac100_start_hw() checks phydev->interface
  for AST2700: ftgmac100_probe_dt() always attaches a phy_device
  before register_netdev() can succeed, via a discrete PHY
  (phy-handle), a fixed-link node, or NC-SI's internal fixed 100Mbit
  PHY, and any failure in that setup aborts probe first.
- Drop Reviewed-by from Krzysztof Kozlowski on the dt-bindings patch
  since its content changed.
- Link to v2: https://lore.kernel.org/r/20261006-support_ast2700-v2-0-36de51fb8066@aspeedtech.com

Changes in v2:
- Make "phy-mode" a required device tree property for AST2700 and fail
  probe if it is missing, instead of silently defaulting to RGMII.
- Document in the cover letter how RGMII delay is configured at the
  bootloader stage for AST2600 and AST2700.
- Simplify the MDIO_ASPEED Kconfig select to ARCH_ASPEED only, dropping
  the redundant MACH_ASPEED_G6 condition, and update its help text to
  mention AST2700.
- Pick up Reviewed-by from Krzysztof Kozlowski on the dt-bindings patch.
- Link to v1: https://lore.kernel.org/r/20260927-support_ast2700-v1-0-9f03f29d2c82@aspeedtech.com

---
Jacky Chou (7):
      dt-bindings: net: ftgmac100: Make Aspeed compatibles standalone
      dt-bindings: net: ftgmac100: Add AST2700 compatible
      net: ftgmac100: Add AST2700 compatible support
      net: ftgmac100: Enable AST2700 RMII support
      net: ftgmac100: Require phy-mode for AST2700
      net: ftgmac100: Add AST2700 upper DMA address support
      net: ftgmac100: Allow building on ARM64

 .../devicetree/bindings/net/faraday,ftgmac100.yaml | 88 ++++++++++++++++---
 drivers/net/ethernet/faraday/Kconfig               |  7 +-
 drivers/net/ethernet/faraday/ftgmac100.c           | 98 +++++++++++++++++++---
 drivers/net/ethernet/faraday/ftgmac100.h           |  7 ++
 drivers/net/mdio/Kconfig                           | 16 ++--
 5 files changed, 183 insertions(+), 33 deletions(-)
---
base-commit: 66726ba54a01a2951688a56f5eb4d13d063acbea
change-id: 20260623-support_ast2700-68fb164da45c

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>

