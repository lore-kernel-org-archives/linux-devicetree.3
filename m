Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685264;
	b=D9bWaMvx4SL2TbS7NwwRX/u93MPUm2CXCdLrxbXRVlg0eIhVyq1jeJwzmzZAvjAG1LuC
	 JWzlC8ADvaE+KDkBunJdeGSmzwNKA+ysQijISnjqme38Gm75fq8Do+cY1iQHSzoRuWA8H
	 pZ+AH4DX49itpFGNMp9XWdXbSrg3gZH6SbDIyXaE5CU6EvD/SzA6STd94LewAJWZeUllN
	 MeHWHTb0lWv4f07hTMy8FW/rOyobiaG8hCCCHUW8uXITvQXrUZl0g7l941XjV+8WJwdhg
	 Ppg14TrAX/VSHuWhXgEYdHDrxreXTCVFX6QmDQUBLnMkKQmvShyNgdH1Qsv9F4z+kgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685264;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=am0ROc6r8BsZYquFQbd7nrwOHyrEFJmw+pqzNaShdIM=;
	b=AyIDMlEb8eNtJfkGhPj2kfyazAWccp06qA+hMWN3mgIPOTjTLyKa1NLh9sFKXcEZ6Tyu
	 P8gWQBVUSMcb4LpoHSyEHe+NYOtkEw/YsntIS43gVNlrBQjSPuO44V6pTtVEOAITcRt9c
	 +n/casmOtRGVsH9v3LLiBaEm/ZXxNk3XHxFKc5hHlTvma3DStKkGGowz/WenEZdBdoOkj
	 bGU/AU9yiLC2Gm9kX/N9WPEm5PKQ5gT/QuYSR5XyBW8Y/XrGYvgHqa+KeugRX75oUB8jm
	 nY1PZ5PixuraTkAmqrQ4i6U5qcKLGDdykSdljDkgVOgFqI6GRF676V6Jp4Rb/qMNnzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Su7L0V/F";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31F606A31E;
	Thu, 26 Nov 2026 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Su7L0V/F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685264;
	b=PRVsnIvLQ63XhFJJAOOMwLrYvtvZXue/NTea3ZCHChPNlp0OheocUaldLhgEKfvhQwKc
	 HK+a9/FmxchMTJ1ZdzvzU3En5J8C9xGJOP9Q7NI573ErQauLSz/upYV9G3uYKWFNFdasb
	 6tkN5Ms2kLpDSg+won32ZGT4FIKk6CCUseNkiPv2AbzrFmCO++kd10RydXf2zwRYY03Gg
	 cHhz7lk+5fMYZ1+zFJTsDewE4obF1rB8Ya9b9vUW1OTxU/WTLBQb7kx+r6sTS4T64HO2H
	 R7SQfXTlQPH+OLFacAHKWLoeMucRXa3i6On2RRgyfNGz5Cg78RTlVN3eXXqrb3RgnxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685264;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=am0ROc6r8BsZYquFQbd7nrwOHyrEFJmw+pqzNaShdIM=;
	b=yhDxXTSKYpVJM11mxalaPItO0gFLTym4YkAi7ClOg+to8ee+4ZZ/KUn22ajtIezfWt4l
	 Ig5OSscKK6nI4JqWqlYIhXZQCzkLardSa7IoP/5DF6Mjl474pst9qHOzqfCe9u1uTicIF
	 gvJ5zfWsgGaHWT8uYzB3b2UBxrDa3eFn3DC41sbjfx29FDNxH2mKGnHzqHPcmjEE5nF2V
	 wvNAM+JnahuGyLy9PmtKW51BkekXOm8rQJt9Wgw4x8Pb3xyxV6mt7aPshQ7de3sSv5tn3
	 31btVZum+bRO6RoBBZidw+Kbd946P7GlmVy0xBDk/lkt60kwGTgUirdskoElUPNZpgw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 987B71F000C0;
	Thu, 26 Nov 2026 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685264;
	bh=am0ROc6r8BsZYquFQbd7nrwOHyrEFJmw+pqzNaShdIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Su7L0V/F39ZX4Yk5evxtSep1A4O/CsRoEi2YI49PbLTTy5AGrgerDd93jAYcAuvLJ
	 nl/sZCYPO+eb53Y+MCB56on/yBIeHAYIdkZ53XrOUwHwgszWlJJBw0ukL3a0hn40Gf
	 EN5SCUt/aNi058y9/zAnjvfNIvecN40dS1o/HrZU25R0pJrG7sp0okW2oNyL88wiuQ
	 q0wsitup8Uu6AI5+f7Cx0e/ebU7ah84oJlOf2/fq6f3w5eDrNcJQyMwHlWQ2zz5sK9
	 ztp/87tAcqpphLOtu+kXqmn+xmSrAzgRRcRUWZ15p3nm3GXLpCDxy7APoxJ+1GYWzQ
	 gxLexNojR3GhA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 28BDF4D367;
	Thu, 26 Nov 2026 09:27:35 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 12:27:34 +0300
Subject: [PATCH net-next v3 2/3] net: mdio: Add Cortina CS7542 bus
 controller
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
Message-Id: <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
In-Reply-To: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685252; l=5653;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=ZvQfrK0apFbQ0/Ko/RXtpF0oKvJzMku3Vs45F5mOnMI=;
 b=9PqradiyxMAIb4nxJLrD6ZteABQZt03vRdsJvGYX9tspmd09IIMAAYecf4oy3+4IDbRfGbOOQ
 3frl5DXqBBGCF9x94KhMylfzuF2v/LYhkUNVHFtPpTLY6r5h4k7k1As
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Support Clause 22 reads and writes through the CS7542 management
interface. Retain the firmware-configured prescaler and unrelated
configuration bits while enabling manual operation.

Use sleepable polling for the bounded wait in the MDIO bus callbacks.
Report timeout errors directly without tracking a pending transaction.
Use managed bus allocation and registration to cover probe failures
and removal.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/net/mdio/Kconfig       |  12 +++++
 drivers/net/mdio/Makefile      |   1 +
 drivers/net/mdio/mdio-cs75xx.c | 116 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index d44278f26..6714c68ca 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -87,6 +87,18 @@ config MDIO_BCM_UNIMAC
 config MDIO_CAVIUM
 	tristate
 
+config MDIO_CS75XX
+	tristate "Cortina Systems CS7542 MDIO controller"
+	depends on OF_MDIO && HAS_IOMEM
+	help
+	  Support Clause 22 PHY register access through the CS7542 MDIO
+	  controller, retaining the prescaler configured by platform firmware.
+	  Transactions use bounded polling.
+	  Device Tree describes the PHYs sharing this management bus.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mdio-cs75xx.
+
 config MDIO_GPIO
 	tristate "GPIO lib-based bitbanged MDIO buses"
 	depends on MDIO_BITBANG
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 048586746..f0880c9f1 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_MDIO_BCM_IPROC)		+= mdio-bcm-iproc.o
 obj-$(CONFIG_MDIO_BCM_UNIMAC)		+= mdio-bcm-unimac.o
 obj-$(CONFIG_MDIO_BITBANG)		+= mdio-bitbang.o
 obj-$(CONFIG_MDIO_CAVIUM)		+= mdio-cavium.o
+obj-$(CONFIG_MDIO_CS75XX)		+= mdio-cs75xx.o
 obj-$(CONFIG_MDIO_GPIO)			+= mdio-gpio.o
 obj-$(CONFIG_MDIO_HISI_FEMAC)		+= mdio-hisi-femac.o
 obj-$(CONFIG_MDIO_I2C)			+= mdio-i2c.o
diff --git a/drivers/net/mdio/mdio-cs75xx.c b/drivers/net/mdio/mdio-cs75xx.c
new file mode 100644
index 000000000..c3d80a983
--- /dev/null
+++ b/drivers/net/mdio/mdio-cs75xx.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#define PER_MDIO_CFG			0x00
+#define   MDIO_CFG_MANUAL		BIT(0)
+#define PER_MDIO_ADDR			0x04
+#define   MDIO_ADDR_PHY			GENMASK(4, 0)
+#define   MDIO_ADDR_REG			GENMASK(12, 8)
+#define   MDIO_ADDR_READ		BIT(15)
+#define PER_MDIO_WRDATA			0x08
+#define PER_MDIO_RDDATA			0x0c
+#define PER_MDIO_CTRL			0x10
+#define   MDIO_CTRL_DONE		BIT(0)
+#define   MDIO_CTRL_START		BIT(7)
+
+#define CS75XX_MDIO_TIMEOUT_US		10000
+
+struct cs75xx_mdio {
+	void __iomem *base;
+};
+
+static int cs75xx_mdio_wait(struct cs75xx_mdio *priv)
+{
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout(priv->base + PER_MDIO_CTRL, val,
+				 val & MDIO_CTRL_DONE, 1, CS75XX_MDIO_TIMEOUT_US);
+	if (!ret)
+		writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
+	return ret;
+}
+
+static int cs75xx_mdio_read(struct mii_bus *bus, int phy, int reg)
+{
+	struct cs75xx_mdio *priv = bus->priv;
+	int ret;
+
+	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
+	writel(MDIO_ADDR_READ | FIELD_PREP(MDIO_ADDR_REG, reg) |
+	       FIELD_PREP(MDIO_ADDR_PHY, phy), priv->base + PER_MDIO_ADDR);
+	writel(MDIO_CTRL_START, priv->base + PER_MDIO_CTRL);
+	ret = cs75xx_mdio_wait(priv);
+	if (ret)
+		return ret;
+	return readl(priv->base + PER_MDIO_RDDATA) & 0xffff;
+}
+
+static int cs75xx_mdio_write(struct mii_bus *bus, int phy, int reg, u16 val)
+{
+	struct cs75xx_mdio *priv = bus->priv;
+
+	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
+	writel(FIELD_PREP(MDIO_ADDR_REG, reg) | FIELD_PREP(MDIO_ADDR_PHY, phy),
+	       priv->base + PER_MDIO_ADDR);
+	writel(val, priv->base + PER_MDIO_WRDATA);
+	writel(MDIO_CTRL_START, priv->base + PER_MDIO_CTRL);
+	return cs75xx_mdio_wait(priv);
+}
+
+static int cs75xx_mdio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs75xx_mdio *priv;
+	struct mii_bus *bus;
+	u32 cfg;
+
+	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
+	if (!bus)
+		return -ENOMEM;
+
+	priv = bus->priv;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	cfg = readl(priv->base + PER_MDIO_CFG);
+	/* The firmware configures the MDC rate; retain its prescaler. */
+	cfg |= MDIO_CFG_MANUAL;
+	writel(cfg, priv->base + PER_MDIO_CFG);
+	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
+
+	bus->name = "cs75xx-mdio";
+	bus->read = cs75xx_mdio_read;
+	bus->write = cs75xx_mdio_write;
+	bus->parent = dev;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
+
+	return devm_of_mdiobus_register(dev, bus, dev->of_node);
+}
+
+static const struct of_device_id cs75xx_mdio_of_match[] = {
+	{ .compatible = "cortina,cs7542-mdio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs75xx_mdio_of_match);
+
+static struct platform_driver cs75xx_mdio_driver = {
+	.probe = cs75xx_mdio_probe,
+	.driver = {
+		.name = "cs75xx-mdio",
+		.of_match_table = cs75xx_mdio_of_match,
+	},
+};
+module_platform_driver(cs75xx_mdio_driver);
+
+MODULE_DESCRIPTION("Cortina CS75xx MDIO bus driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0


