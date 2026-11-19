Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080774;
	b=Z78jfE/JN/mvlOzMXfxi3oVbsCP9lOskVhbFHjAIA2n8uZB4rRNNDJqiScSegrHN1B2q
	 4lPuTHNZ8Vyh85kxfJOlull2hiOyURr+d7xjrSFUP5kb1wziuRoeehrDpuscLvoiCei32
	 QIF8z294dqYtTXiFFuR7UUNgOKFrt9npeYdxYNP88wSOCX9eaR/Imt6NI/JFn8g8b/5u5
	 Db0ZYZlHmrM20KetOo3pSVQrzfp5KXPPQlLE++iKqYRoHFLPccG4Q3pR/u+DBSczbUaNk
	 dMAqaBbyx+JNKctsJeK3VUXVCQp4nDJrmY90V+dJTfHqIGVEuxOwES9dRfoy3v8cMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080774;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=u71YMcuXbYiqGww6VQynaVqgLkg0cuckwzFUuusIVsA=;
	b=jtmVY6bqE2UkqDM9pgvUW9FIA4iPCR+0sRp5nYr66LCK8/t1SuYv0gf5JFqB40fwkbCR
	 2oDq5mBLlA+JdJ/jWj3QzyLeA7eGapW5g8mUrcVcqBJhpbgCzvywHHRMPmmajOU6MgEzT
	 CpC9Numad7UrYTCZ4E3YbYkpOHATNFu6mjOgiiLZBIuKRlWlTZkLN0MtkzEGyuBaokBsH
	 WRvDwucOIWvpYL3vza4/AVlscilowL3h/wg/fuK75hJFjXFwRWAd1yoSfsh+6fMlaq5TD
	 6am9Lypv0Io+aECkQAIVJy57TcYqC5o4h1vCGUnAlp1ESRcS3Y/lljvQMb9uJ0IZKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD260A263D;
	Thu, 19 Nov 2026 09:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DFD260A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Nov
 2026 17:32:41 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Nov 2026 17:32:41 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Thu, 19 Nov 2026 17:32:40 +0800
Subject: [PATCH net-next v7 7/7] net: ftgmac100: Allow building on ARM64
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
Message-ID: <20261119-support_ast2700-v7-7-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
In-Reply-To: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Po-Yu Chuang
	<ratbert@faraday-tech.com>, Eric Dumazet <edumazet@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "Eric
 Dumazet" <edumazet@kernel.org>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>,
	Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795080760; l=3621;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=HafZf0aiUWmD0Fi5q+ou5M3phG1DMBwwH5tj0bJIQoA=;
 b=vqS25dGYE0aspLG1BUz6VLEQKhAEBwlRMf/r3YOc8/35IZO8XwpSWNQa28nUuakAa79X0yBWS
 dWIcfxhN4R3CIT/jMiCeG05pC05y1dR0mKpia4dRRHBAvHe/TKwTJjv
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Allow the Faraday vendor menu and FTGMAC100 driver to be selected on
ARM64 so AST2700 platforms can enable the MAC. The driver now programs
the upper DMA address fields, so it no longer needs to be marked BROKEN
for 64-bit builds.

AST2700 has no dedicated MACH_ASPEED_G7 symbol; unlike the 32-bit
generations it is only gated by the common ARCH_ASPEED symbol. On
32-bit Aspeed platforms, arch/arm/mach-aspeed/Kconfig nests
MACH_ASPEED_G4/G5/G6 under "if ARCH_ASPEED", so MACH_ASPEED_G6 already
implies ARCH_ASPEED and is redundant once ARCH_ASPEED is part of the
condition. Drop it and select MDIO_ASPEED directly on ARCH_ASPEED.

This does widen the MDIO_ASPEED select beyond AST2600: it is now also
selected for AST2400/AST2500, which keep driving their embedded MDIO
controller from FTGMAC100 itself and have no MDIO node for this driver
to bind to, so it is built but stays unused there. Update the
MDIO_ASPEED help text to describe this.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/ethernet/faraday/Kconfig |  7 +++----
 drivers/net/mdio/Kconfig             | 16 ++++++++++------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/faraday/Kconfig b/drivers/net/ethernet/faraday/Kconfig
index 474073c7f94d..9acc2d260c1f 100644
--- a/drivers/net/ethernet/faraday/Kconfig
+++ b/drivers/net/ethernet/faraday/Kconfig
@@ -6,7 +6,7 @@
 config NET_VENDOR_FARADAY
 	bool "Faraday devices"
 	default y
-	depends on ARM || COMPILE_TEST
+	depends on ARM || ARM64 || COMPILE_TEST
 	help
 	  If you have a network (Ethernet) card belonging to this class, say Y.
 
@@ -28,11 +28,10 @@ config FTMAC100
 
 config FTGMAC100
 	tristate "Faraday FTGMAC100 Gigabit Ethernet support"
-	depends on ARM || COMPILE_TEST
-	depends on !64BIT || BROKEN
+	depends on ARM || ARM64 || COMPILE_TEST
 	select PHYLIB
 	select FIXED_PHY
-	select MDIO_ASPEED if MACH_ASPEED_G6
+	select MDIO_ASPEED if ARCH_ASPEED
 	select CRC32
 	help
 	  This driver supports the FTGMAC100 Gigabit Ethernet controller
diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 6f272fae4bb5..ec1794cc64b0 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -50,12 +50,16 @@ config MDIO_ASPEED
 	depends on OF_MDIO && HAS_IOMEM
 	help
 	  This module provides a driver for the independent MDIO bus
-	  controllers found in the ASPEED AST2600 SoC. This is a driver for the
-	  third revision of the ASPEED MDIO register interface - the first two
-	  revisions are the "old" and "new" interfaces found in the AST2400 and
-	  AST2500, embedded in the MAC. For legacy reasons, FTGMAC100 driver
-	  continues to drive the embedded MDIO controller for the AST2400 and
-	  AST2500 SoCs, so say N if AST2600 support is not required.
+	  controllers found in the ASPEED AST2600 and AST2700 SoCs. This is a
+	  driver for the third revision of the ASPEED MDIO register interface -
+	  the first two revisions are the "old" and "new" interfaces found in
+	  the AST2400 and AST2500, embedded in the MAC. For legacy reasons,
+	  FTGMAC100 driver continues to drive the embedded MDIO controller for
+	  the AST2400 and AST2500 SoCs. AST2700 has no dedicated MACH_ASPEED_G7
+	  symbol and is only gated by ARCH_ASPEED, so FTGMAC100 now
+	  unconditionally selects this driver on every ARCH_ASPEED platform,
+	  including the older AST2400/AST2500 SoCs where it has no MDIO node to
+	  bind to.
 
 config MDIO_BITBANG
 	tristate "Bitbanged MDIO buses"

-- 
2.34.1

