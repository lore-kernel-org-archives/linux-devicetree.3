Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6A4E4C43
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562291; cv=none; b=Izj5iME2V425O7DSA1M59j0yfD3HZuICRC2C1i8TU0m8aCgrceN5KK/xS/TCZffklzglpk0Bj5NyW5C0wxudBE6lv4iPKdKpu5BEhcXhOyXRRk000W267ip3tSHr/SQ8xYarSJMRzRoe/DJZ6AuiVr15mbEHsfIJGVtsB/GcsfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562291; c=relaxed/simple;
	bh=MfmS97tEUb10gYE/u3qgJEuKsvGjsyPjvMwC//JlJ+M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwuC6Ykj0P/us2Szj4m5p4ZSRJQjdB4Tlp0BomwmOGQJl5+kd+mQ1i5hgXoZHdPaejYlS+tDyk3fzXHLf4vJImuubQ8HL9G846Ac2tlXwCF7Mafej/RPddvgAnR4iAdXT7q0Y7w/5xnw8Gh5VoYUkxpOfQUbSgzcR0jQ3AcupQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4N+vy7G; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4N+vy7G"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487048857f6so3884132f8f.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 09:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562287; x=1792167087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Whz6EeGgKypqRBi5YrO/rCW1xhvllxiK3E64CG3XL+M=;
        b=i4N+vy7GLyIryAI8Y9pfE42eVz9YkNkc0dpE0wUdtZ8RgstiMbySlO5DMeLy+7vOGq
         sS7IapvgZ7yZfyfrb930TKByVW4Vq+19YN57r2JRMx25WuvdJaxVJy5QHUQhVoWs8UgK
         Flw0uMlOsiiOesiFPzZyrdMPZcp5MFHI9j1Mt0tGNJtQDRYrOsg5DkKU2JlrzMgy51nJ
         Dc4/sSLNCFfw17Tx1KLYYJ4x2UWzEZpOFz2dwahSYMjRjaK/R/ckQSn1DGV943RxDCvc
         nU3cV7eTv9RNF1Uj7k2tQlzyzvcGUUUH4Xp3kBld7L4/3T72vRAhtlfjQxkIn/CSpz+H
         k15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562287; x=1792167087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Whz6EeGgKypqRBi5YrO/rCW1xhvllxiK3E64CG3XL+M=;
        b=HGG8n1sjvLopWmovqOb/PzmcNpsqeUiPPyCJEW7Ye8aoDd0aUEzof8nEQwR632L5yW
         tEVw96IDDHnUuoAUqAZsJsTJlwh2bo6l4vEdNxdubViGub09gXYeYQgb4vy6fnKBRjc1
         wWnwy8UiDtzP8F/RwGE9CJOVOQ4oRox2ZD0uDbBbMPdfE+CeTqrS5cODrckZNZyN4cfn
         uPyEyRcBLnjVncd7SlOukuhYd4yWp0kcPSGNpVP428wbnz5AWbbBlzMAJsB1zsRENKhs
         kI6tE65fWmwm4tWFY1ETJ4hNVZlMi95JOzuid/AtEQFNFPBawXjhtfMn2Ip6DeIC72A2
         mU0w==
X-Forwarded-Encrypted: i=1; AKwUvByszxbrEED7Cbja3YxfKAPrpgUmhpEjKgpuouRPyR2umUhlLKpXYEu0BmJ5USAUIynoOb7CAHTMm8Vd@vger.kernel.org
X-Gm-Message-State: AFq9FYL1HTEWIzqS9KNKFrhhAUwn9A6RWE94cPSMppgah+V8mlyjjXdq
	7bbo+CloSUn8EJDIwxpQVucOt1XpmbLkGZ7HwZOcdYKhyOeY4AuZfHXw
X-Gm-Gg: AYBFou2UfAMi8mq9IwIaZnKLLRdthbbzchTx93ahkPWBHyIhlzQCb8VYeESr1XyiwZi
	1nutK5ooK2kHTIq+GS3EdkN0sCNclYX8R8/AhYVMzt3qcy3kVwYK8CAHtUVKh/qqC2mpMm8eQmh
	AkWfcEGDvGYNkJeGNVUvKAHBnD0PDK/zqqIfiiWOHWkgtREKgdm8TgZsK4jDGxqisAdodEXEQ+P
	umfjXdhBIcKe7B4Vnii91aY8FFNt/eKICJBQqwj9ER33uOWoR5TdDTZ/47rVO/skFClBl5CdyFn
	Wq6sBku8AyrjihAVptWbn4xGgEssJZExvlbetngSaHbrjLyAZR4yDXPY/HyULtBa4yTGSAUQA9c
	1LDPymRzd0rRoLGpp+w+HslGBnekLZkbzm44jRNYq/lM0CE+M190gFx29QYbASa7vAT6BU2y1hE
	mOYHd0CktD7ce08+uKsH7YbHNatiIBQmF7FnnnnNL3Tp4z4bvad5Ao6eogvReAHLjtfr/tsqhs7
	hSpevg/+FyJGCkZoOAdb+9t6ceO7+/JDBLPeXSE6zTrdOnXTdJFPgnUUiHkWlmWcGLqlVUV/Z1M
	X8P6MhHBuqgxCYKGfgx2stmOAHXb
X-Received: by 2002:a05:6000:46da:b0:48b:1276:72e7 with SMTP id ffacd0b85a97d-48dba9db139mr3567737f8f.13.1791562287342;
        Fri, 09 Oct 2026 09:11:27 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 08/10] net: dsa: move mediatek DSA driver in dedicated directory
Date: Fri,  9 Oct 2026 18:10:53 +0200
Message-ID: <20261009161102.38961-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To tidy things up and better organize DSA drivers, move the Mediatek
related driver to the dedicated Vendor directory.

MAINTAINERS file is updated accordingly to reference the new location.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                  |  6 +--
 drivers/net/dsa/Kconfig                      | 45 +-------------------
 drivers/net/dsa/Makefile                     |  5 +--
 drivers/net/dsa/mediatek/Kconfig             | 45 ++++++++++++++++++++
 drivers/net/dsa/mediatek/Makefile            |  5 +++
 drivers/net/dsa/{ => mediatek}/mt7530-mdio.c |  0
 drivers/net/dsa/{ => mediatek}/mt7530-mmio.c |  0
 drivers/net/dsa/{ => mediatek}/mt7530.c      |  0
 drivers/net/dsa/{ => mediatek}/mt7530.h      |  0
 drivers/net/dsa/{ => mediatek}/mt7628.c      |  0
 10 files changed, 55 insertions(+), 51 deletions(-)
 create mode 100644 drivers/net/dsa/mediatek/Kconfig
 create mode 100644 drivers/net/dsa/mediatek/Makefile
 rename drivers/net/dsa/{ => mediatek}/mt7530-mdio.c (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7530-mmio.c (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7530.c (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7530.h (100%)
 rename drivers/net/dsa/{ => mediatek}/mt7628.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53dcff93f896..e16c14ea38a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16841,9 +16841,9 @@ M:	Chester A. Unal <chester.a.unal@arinc9.com>
 M:	Daniel Golle <daniel@makrotopia.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	drivers/net/dsa/mt7530-mdio.c
-F:	drivers/net/dsa/mt7530-mmio.c
-F:	drivers/net/dsa/mt7530.*
+F:	drivers/net/dsa/mediatek/mt7530-mdio.c
+F:	drivers/net/dsa/mediatek/mt7530-mmio.c
+F:	drivers/net/dsa/mediatek/mt7530.*
 F:	net/dsa/tag_mtk.c
 
 MEDIATEK T7XX 5G WWAN MODEM DRIVER
diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index fe8cd5338fda..ffc26eb3e899 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -28,50 +28,7 @@ source "drivers/net/dsa/hirschmann/Kconfig"
 
 source "drivers/net/dsa/lantiq/Kconfig"
 
-config NET_DSA_MT7530
-	tristate "MediaTek MT7530 and MT7531 Ethernet switch support"
-	select NET_DSA_TAG_MTK
-	select REGMAP_IRQ
-	imply NET_DSA_MT7530_MDIO
-	imply NET_DSA_MT7530_MMIO
-	help
-	  This enables support for the MediaTek MT7530 and MT7531 Ethernet
-	  switch chips. Multi-chip module MT7530 in MT7621AT, MT7621DAT,
-	  MT7621ST and MT7623AI SoCs, and built-in switch in MT7988 SoC are
-	  supported as well.
-
-config NET_DSA_MT7530_MDIO
-	tristate "MediaTek MT7530 MDIO interface driver"
-	depends on NET_DSA_MT7530
-	select MEDIATEK_GE_PHY
-	select PCS_MTK_LYNXI
-	help
-	  This enables support for the MediaTek MT7530 and MT7531 switch
-	  chips which are connected via MDIO, as well as multi-chip
-	  module MT7530 which can be found in the MT7621AT, MT7621DAT,
-	  MT7621ST and MT7623AI SoCs.
-
-config NET_DSA_MT7530_MMIO
-	tristate "MediaTek MT7530 MMIO interface driver"
-	depends on NET_DSA_MT7530
-	depends on HAS_IOMEM
-	imply MEDIATEK_GE_SOC_PHY
-	help
-	  This enables support for the built-in Ethernet switch found
-	  in the MediaTek MT7988 SoC.
-	  The switch is a similar design as MT7531, but the switch registers
-	  are directly mapped into the SoCs register space rather than being
-	  accessible via MDIO.
-
-config NET_DSA_MT7628
-	tristate "MediaTek MT7628 Embedded Ethernet switch support"
-	depends on HAS_IOMEM && (SOC_MT7620 || COMPILE_TEST)
-	select NET_DSA_TAG_MT7628
-	select MEDIATEK_FE_SOC_PHY
-	select REGMAP_MMIO
-	help
-	  This enables support for the built-in Ethernet switch found
-	  in the MT7628 SoC.
+source "drivers/net/dsa/mediatek/Kconfig"
 
 config NET_DSA_MV88E6060
 	tristate "Marvell 88E6060 ethernet switch chip support"
diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index 7e637d56b35c..ee4784a9839b 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -2,10 +2,6 @@
 obj-$(CONFIG_NET_DSA_BCM_SF2)	+= bcm-sf2.o
 bcm-sf2-objs			:= bcm_sf2.o bcm_sf2_cfp.o
 obj-$(CONFIG_NET_DSA_LOOP)	+= dsa_loop.o
-obj-$(CONFIG_NET_DSA_MT7530)	+= mt7530.o
-obj-$(CONFIG_NET_DSA_MT7530_MDIO) += mt7530-mdio.o
-obj-$(CONFIG_NET_DSA_MT7530_MMIO) += mt7530-mmio.o
-obj-$(CONFIG_NET_DSA_MT7628) += mt7628.o
 obj-$(CONFIG_NET_DSA_MV88E6060) += mv88e6060.o
 obj-$(CONFIG_NET_DSA_RZN1_A5PSW) += rzn1_a5psw.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303) += lan9303-core.o
@@ -17,6 +13,7 @@ obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_SPI) += vitesse-vsc73xx-spi.o
 obj-y				+= b53/
 obj-y				+= hirschmann/
 obj-y				+= lantiq/
+obj-y				+= mediatek/
 obj-y				+= microchip/
 obj-y				+= motorcomm/
 obj-y				+= mv88e6xxx/
diff --git a/drivers/net/dsa/mediatek/Kconfig b/drivers/net/dsa/mediatek/Kconfig
new file mode 100644
index 000000000000..ef62481662fd
--- /dev/null
+++ b/drivers/net/dsa/mediatek/Kconfig
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config NET_DSA_MT7530
+	tristate "MediaTek MT7530 and MT7531 Ethernet switch support"
+	select NET_DSA_TAG_MTK
+	select REGMAP_IRQ
+	imply NET_DSA_MT7530_MDIO
+	imply NET_DSA_MT7530_MMIO
+	help
+	  This enables support for the MediaTek MT7530 and MT7531 Ethernet
+	  switch chips. Multi-chip module MT7530 in MT7621AT, MT7621DAT,
+	  MT7621ST and MT7623AI SoCs, and built-in switch in MT7988 SoC are
+	  supported as well.
+
+config NET_DSA_MT7530_MDIO
+	tristate "MediaTek MT7530 MDIO interface driver"
+	depends on NET_DSA_MT7530
+	select MEDIATEK_GE_PHY
+	select PCS_MTK_LYNXI
+	help
+	  This enables support for the MediaTek MT7530 and MT7531 switch
+	  chips which are connected via MDIO, as well as multi-chip
+	  module MT7530 which can be found in the MT7621AT, MT7621DAT,
+	  MT7621ST and MT7623AI SoCs.
+
+config NET_DSA_MT7530_MMIO
+	tristate "MediaTek MT7530 MMIO interface driver"
+	depends on NET_DSA_MT7530
+	depends on HAS_IOMEM
+	imply MEDIATEK_GE_SOC_PHY
+	help
+	  This enables support for the built-in Ethernet switch found
+	  in the MediaTek MT7988 SoC.
+	  The switch is a similar design as MT7531, but the switch registers
+	  are directly mapped into the SoCs register space rather than being
+	  accessible via MDIO.
+
+config NET_DSA_MT7628
+	tristate "MediaTek MT7628 Embedded Ethernet switch support"
+	depends on HAS_IOMEM && (SOC_MT7620 || COMPILE_TEST)
+	select NET_DSA_TAG_MT7628
+	select MEDIATEK_FE_SOC_PHY
+	select REGMAP_MMIO
+	help
+	  This enables support for the built-in Ethernet switch found
+	  in the MT7628 SoC.
diff --git a/drivers/net/dsa/mediatek/Makefile b/drivers/net/dsa/mediatek/Makefile
new file mode 100644
index 000000000000..0ed6e11f292e
--- /dev/null
+++ b/drivers/net/dsa/mediatek/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_NET_DSA_MT7530)	+= mt7530.o
+obj-$(CONFIG_NET_DSA_MT7530_MDIO) += mt7530-mdio.o
+obj-$(CONFIG_NET_DSA_MT7530_MMIO) += mt7530-mmio.o
+obj-$(CONFIG_NET_DSA_MT7628) += mt7628.o
diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mediatek/mt7530-mdio.c
similarity index 100%
rename from drivers/net/dsa/mt7530-mdio.c
rename to drivers/net/dsa/mediatek/mt7530-mdio.c
diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mediatek/mt7530-mmio.c
similarity index 100%
rename from drivers/net/dsa/mt7530-mmio.c
rename to drivers/net/dsa/mediatek/mt7530-mmio.c
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mediatek/mt7530.c
similarity index 100%
rename from drivers/net/dsa/mt7530.c
rename to drivers/net/dsa/mediatek/mt7530.c
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mediatek/mt7530.h
similarity index 100%
rename from drivers/net/dsa/mt7530.h
rename to drivers/net/dsa/mediatek/mt7530.h
diff --git a/drivers/net/dsa/mt7628.c b/drivers/net/dsa/mediatek/mt7628.c
similarity index 100%
rename from drivers/net/dsa/mt7628.c
rename to drivers/net/dsa/mediatek/mt7628.c
-- 
2.55.0

