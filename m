Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD84A8421
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637231; cv=none; b=WMT3MCq667iYoAhNRjk9SL1IspgRkOcZX3ZGxT7jO94gpA2nuUCXgUe6VjjTCotcvEJ4uyF+rhmFXGl4fSOMyTMiXMJlYxs/LLBaQ7SUcH/YuKfm+pNRE0o7aR1biksgzcYX1Lt+urjRdUmfo5pj+INDDCIUuh+e5X5WkfuuODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637231; c=relaxed/simple;
	bh=dgqUaEmx2qFVqQHr8iIY/QquUIxsuVaw/Oun3mFKFC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GztCj/wTm1SRCsbV6OD08OKtEjmaOpxC8QCIfcW4fLFs8gxNOCw6TyvB0734ejgfquHsXOkej/2S/q8TV2OEOin/ec3agLMXE5zGW/Ve+3RegdNdiCWYRjOBEz0sXjL1kLNVRzIaI/AzHf6eA9nTTsWmEaNAn6i0RsWkvBIk0CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/dsxs8Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/dsxs8Q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso8144025e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637228; x=1792242028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOgD4VxzO60T/LHhiSuyZpQbpRAgnZVorMhxAcup42k=;
        b=X/dsxs8QSCjjOEbXLPX1HDkiaWcwWRHF6fuaF4qz9ofsqIjuaoEfRBl1lfGqeHkX2x
         gZ//ZWS5o6igE1E9t3OL4AvQrSFWU1kqBYUlKs4UA6amfmcPz3m+yrsXyvOCU/NlTX3w
         3SmvxqNf7gAaaRp9ruzjHgcSCczqZP1fQlk8EFdE/LLkf7dNjfol1omov1RWtYdXan23
         Z/7SnGFHnW+dnJYQELauIVSDpgu7DhUhJZJaHFOeVt1lgefFw0aY4Jx2UMeCYfkzZnGr
         BWNA0aJ6WJUnDAHAxRnmnoUYaDQJqOZkPZptPwImW2jZU+AqO2+gfviNTqFbYtgLv7n2
         1R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637228; x=1792242028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOgD4VxzO60T/LHhiSuyZpQbpRAgnZVorMhxAcup42k=;
        b=OaWuNlsc34Yg8KMk/0ZOw/OGhJ6zbRCxBghjZhCbFKdIVZDra9SRfdTW3+A+x8pAfR
         HR5WszhCB3/YsMv+Qrb7Q16BTdifHSLe6wplg4S4oRTQrmqz/LRLi31Cpxk9OboBTIuL
         mqpYbRyjDQlRslT7Jgdgi/zoAiFbjMWe2aAOei+LLewdbIOTkatgnw3oQX+GESHv4hMw
         m3nHuqMXKdnPuUHPuhrM+ZbDXl0JHMJeUTNOpIhfwdquf9Vet/Nbx4Hhs/P6SDoFoEa1
         NUPw3jwm3NEWEnUswKpavrOo/Bq2ftxXypyj6Wai4xNOnnZVLUq2KGhPhPo+uHAu8rze
         N+AQ==
X-Gm-Message-State: AFq9FYLXQsYjfoxFeJZWfwZzffZ3b8LR1oWtoP3l2e3i+C53wawsmdkY
	jERp+NA2TPTu4SzBRj49GByECWvsfKT9s3RW3q+cgJ/UUaZXWlWjD0k6
X-Gm-Gg: AYBFou3CLelwCzEBLLqeTQ42F2LSowe6k/+sSIu1s35rIBnUFFo4hKbvLYO0JqRTSjb
	kzaNstbnBWyOi1+hkYw0viJ5Suv4ULZv8kSmVrGtplZLdC2xGobvBv1wNypipnU3oTlSAZLT7t/
	e6O8FUwmdda4oGrgzKlAAfQPJ/4lQCNos4FgIi8Jk31Kuj3bKwyEJ46jzvAmMr6hCspoMmaCYe8
	TWUjxSt/mlgukHwkYUbtFzv8CRybCk3yq7f5UgQs9FhmKB/zSIOIxr9WoqYuK/Pnz78C4BPLhRc
	9y9LOTmK9IaULTAwTB9t4PISdJ13TY97lBmM3wvRxSq/gnRt1G4g0jFhmb3xsfcQvBTGRCNVXHd
	RJmxPjjRUy/Nn9CFJiHSAg6Zj7wa/YB+1Ldbgs7Av1Joaw7jV8XNfVWUnwUYtE0mqf6AJpI+v2r
	PMNDPhLr4WH5WF5t5bcUgbsslsIqjiScST6cuLmOIY1uDdH5FvQiLWHeo4nd9cKq6TvNxRLNx1c
	m2CcNpFUAn9K8F0qG2JOh9lxTAQR1o2e6nPD1Re2+FZQ+ar3uCGGdHIGDVpu5num6yeFLhnKhgW
	bt0pQF9D9iaVVkTwsd1QS3Uf8yVil79bG8SruzkFOFzmsSfuR7b84WXHz8HM0Q==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr82960825e9.8.1791637227678;
        Sat, 10 Oct 2026 06:00:27 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:26 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Sat, 10 Oct 2026 13:59:38 +0100
Message-ID: <20261010130024.177503-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces mainline Linux support for the Sanechips (ZTE)
ZX279128S SoC and the ZTE ZXHN H3600 Wi-Fi 6 router.

The ZX279128S is a dual-core ARM Cortex-A9 network SoC with an ARM PL310 /
L2C-310 outer cache controller, dual PCIe interfaces, a 5-port Gigabit
Ethernet switch with hardware packet classification and flow offload,
SPI-NAND flash controller, and DWC3 USB 2.0 host.

This submission establishes Navid Ghahremani as the maintainer for
ARM/ZTE ZX279128S SOC SUPPORT in MAINTAINERS.

Series breakdown:
- Patches 01-03: Outer cache read serialization mechanism to prevent
  bus deadlock between outstanding PCIe device reads and L2C-310 cache
  sync operations.
- Patches 04-05: SoC platform integration, SMP CPU hotplug trampoline,
  and MAINTAINERS entry.
- Patches 06-11: Core peripheral drivers: CRM clock/reset controller,
  GPIO, pinctrl-single bindings, and syscon.
- Patches 12-13: DesignWare PCIe host controller driver for the dual
  MT7915 Wi-Fi links with shared reset sequencing.
- Patches 14-18: Networking: MDIO bus controller, ZX5201 Gigabit PHY,
  and Gigabit Ethernet switch driver with switchdev and hardware flow
  offload integration.
- Patches 19-20: SPI flash controller driver using the Linux SPI-MEM
  framework.
- Patches 21-22: Synopsys DWC3 USB platform glue binding and enablement.
- Patches 23-24: Device tree descriptions for the ZX279128S SoC and
  ZTE ZXHN H3600 board.

Hardware testing:
- Validated on physical ZTE ZXHN H3600 hardware via U-Boot TFTP boot.
- Dual-core SMP, CPU hotplug, and thermal sensors operational.
- Dual-band MT7915 2.4/5 GHz Wi-Fi links initialized and stable.
- Gigabit Ethernet switch verified at line-rate 1 Gbps forwarding.
- SPI-NAND flash persistence and USB 2.0 host verified.

Independent prerequisites sent separately:
- MTD: heyangtek bad block marker reserve byte fix.
- NVMEM: fixed-layout mac-base consumer offset support.

Navid Ghahremani (24):
  dt-bindings: cache: l2c2x0: Describe ZTE device-read serialization
  ARM: l2c: Serialize device reads with cache maintenance when requested
  wifi: mt76: Serialize MMIO reads with outer cache maintenance
  dt-bindings: arm: Add ZTE ZX279128S platform descriptions
  ARM: zte: Add ZX279128S platform and CPU hotplug support
  dt-bindings: clock: Add ZTE ZX279128S CRM clocks and resets
  clk: zte: Add ZX279128S CRM clock and reset driver
  dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
  gpio: Add ZTE ZX279128S GPIO driver
  dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
  dt-bindings: mfd: syscon: Add ZX279128S system controller
  dt-bindings: PCI: Add ZTE ZX279128S host controller
  PCI: dwc: Add ZTE ZX279128S host controller driver
  dt-bindings: net: Add ZTE ZX279128S MDIO controller
  net: mdio: Add ZTE ZX279128S MDIO controller
  net: phy: Add Sanechips ZX5201 PHY support
  dt-bindings: net: Add ZTE ZX279128S Ethernet switch
  net: ethernet: zte: Add ZX279128S Ethernet switch driver
  dt-bindings: spi: Add ZTE ZX279128S SPI flash controller
  spi: Add ZTE ZX279128S SPI flash controller
  dt-bindings: usb: Add ZTE ZX279128S DWC3 controller
  usb: dwc3: generic-plat: Add ZTE ZX279128S
  ARM: dts: zte: Add ZX279128S SoC description
  ARM: dts: zte: Add ZTE ZXHN H3600 board

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../devicetree/bindings/arm/zte.yaml          |    8 +-
 .../devicetree/bindings/cache/l2c2x0.yaml     |    9 +
 .../bindings/clock/zte,zx279128s-crm.yaml     |  141 ++
 .../bindings/gpio/zte,zx279128s-gpio.yaml     |   53 +
 .../devicetree/bindings/mfd/syscon.yaml       |    1 +
 .../bindings/net/zte,zx279128s-gmac.yaml      |  108 ++
 .../bindings/net/zte,zx279128s-mdio.yaml      |   67 +
 .../bindings/pci/zte,zx279128s-pcie.yaml      |   97 ++
 .../bindings/pinctrl/pinctrl-single.yaml      |    1 +
 .../bindings/spi/zte,zx279128s-spifc.yaml     |   69 +
 .../devicetree/bindings/sram/sram.yaml        |    1 +
 .../bindings/usb/zte,zx279128s-dwc3.yaml      |   76 +
 MAINTAINERS                                   |   22 +
 arch/arm/boot/dts/zte/Makefile                |    2 +
 .../boot/dts/zte/zx279128s-zte-zxhn-h3600.dts |  361 ++++
 arch/arm/boot/dts/zte/zx279128s.dtsi          |  397 +++++
 arch/arm/include/asm/outercache.h             |   22 +
 arch/arm/mach-zte/Kconfig                     |   17 +
 arch/arm/mach-zte/Makefile                    |    4 +
 arch/arm/mach-zte/platsmp-zx279128s.c         |  173 ++
 arch/arm/mach-zte/zx279128s.c                 |   19 +
 arch/arm/mm/Kconfig                           |   14 +
 arch/arm/mm/cache-l2x0.c                      |   81 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/zte/Kconfig                       |   14 +
 drivers/clk/zte/Makefile                      |    2 +
 drivers/clk/zte/clk-zx279128s.c               |  460 +++++
 drivers/gpio/Kconfig                          |   12 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-zx279128s.c                 |   78 +
 drivers/net/ethernet/zte/Kconfig              |   13 +
 drivers/net/ethernet/zte/Makefile             |    3 +
 drivers/net/ethernet/zte/zx279128s-eth.h      |  385 +++++
 drivers/net/ethernet/zte/zx279128s-main.c     | 1485 +++++++++++++++++
 drivers/net/ethernet/zte/zx279128s-ppe.c      |  803 +++++++++
 drivers/net/ethernet/zte/zx279128s-switch.c   |  339 ++++
 drivers/net/mdio/Kconfig                      |   11 +
 drivers/net/mdio/Makefile                     |    1 +
 drivers/net/mdio/mdio-zx279128s.c             |  158 ++
 drivers/net/phy/Kconfig                       |    8 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/sanechips.c                   |  153 ++
 drivers/net/wireless/mediatek/mt76/dma.h      |    2 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     |    6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   23 +
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |    2 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |    2 +-
 drivers/pci/controller/dwc/Kconfig            |   12 +
 drivers/pci/controller/dwc/Makefile           |    1 +
 drivers/pci/controller/dwc/pcie-zx279128s.c   |  322 ++++
 drivers/spi/Kconfig                           |   13 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-zx279128s-spifc.c             |  353 ++++
 drivers/usb/dwc3/Kconfig                      |    2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |    1 +
 include/dt-bindings/clock/zte,zx279128s-crm.h |   55 +
 58 files changed, 6460 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
 create mode 100644 arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
 create mode 100644 arch/arm/boot/dts/zte/zx279128s.dtsi
 create mode 100644 arch/arm/mach-zte/platsmp-zx279128s.c
 create mode 100644 arch/arm/mach-zte/zx279128s.c
 create mode 100644 drivers/clk/zte/Kconfig
 create mode 100644 drivers/clk/zte/Makefile
 create mode 100644 drivers/clk/zte/clk-zx279128s.c
 create mode 100644 drivers/gpio/gpio-zx279128s.c
 create mode 100644 drivers/net/ethernet/zte/zx279128s-eth.h
 create mode 100644 drivers/net/ethernet/zte/zx279128s-main.c
 create mode 100644 drivers/net/ethernet/zte/zx279128s-ppe.c
 create mode 100644 drivers/net/ethernet/zte/zx279128s-switch.c
 create mode 100644 drivers/net/mdio/mdio-zx279128s.c
 create mode 100644 drivers/net/phy/sanechips.c
 create mode 100644 drivers/pci/controller/dwc/pcie-zx279128s.c
 create mode 100644 drivers/spi/spi-zx279128s-spifc.c
 create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h

-- 
2.55.0

