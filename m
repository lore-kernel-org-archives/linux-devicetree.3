Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459328;
	b=MhRoTdiQ+Hgqdafx4Ob6w5tVmkjUfyycp8p8Vta7M8dsvvZhPc7unZM1x0Xv/lo01MAa
	 Ek0BmcP1D/2albhh2t8zIHRMf1c6wg9zHLWZLWwJa4nTbuKfQ5vyuxZm/CFWfqaare5SU
	 bGjFroETfYKuu5ADHOHBFYLYtrF3DN20i7RHiDOS4Oqsdj5qJiQwVvfg4oQrvf0p4+Zqa
	 39aDdyvoK0WqSFkNZBO5ni/dq9AmtrlCwoiFunx0sW0TxOiTSntI6pDTrHQvHiIxGFMj1
	 G8LLQuWHLmhVVUJy/nrYeR8z5QfgYhUZpmt92ptFUMTMbnJb7fzJf/1GN4ak0gaKihw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459328;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZdNq6lAzgClGgqAFoM53TspEHeE7nLUWeGd16KM0xa0=;
	b=IVOMQZ8taoUunDNWBWsLH9/2U0O4eZ7frucnl2zYLSWxFYmn3JMQvWUdafPWmCq5h2fz
	 3bXHLzMP5Xa0yAcZmJUpZVFN0c5oGhw2zkW586RU+lwmFIQp8OqN5NxXovdGsnBbCF+1r
	 uq2gykcyC7IYwis4t8DcrerhmvzurK/jUIblO0yVd5c7cmNwshN5pyDClIBEHxwwf7z74
	 cUc+UghvFw/Lm3zFXfddnO4HxFqZsPfeUzBm5Hz+6WLgaibNKC/5vYr4hdDkqEIHtY+2i
	 1djjN7HMa3lO9G2cOi81aX8qpt0btvGprKdStYgfx0AJlcFnLlSIXMc9swsKD35GlSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICbij8cJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E1D606A6BA;
	Mon, 23 Nov 2026 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICbij8cJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459327;
	b=BKfNu9fEK3Qkt/SjN7DYH2yyEL1OrEtFGOZqfzKwvQg0gNsIDl6MVl3jVJaollHM3ZnP
	 kWuCAVfqWBfOsjgSqzXn00G0gT+v7AUqfZN4m9g7+tPDCBA4c/3cb+umn+Q1e23ahXiBl
	 HgzlkcvilFTqL541bZTbFbhYYiM25701N/u0Z86n7LlZJPDnp0oAi45KAMiqXldAR+wCO
	 zfyFGY9QPH3Gf543iFvP+m0Rw4GAhXPQ2BCa9Em4vvQXmRqVq3U4RI4GPONzI0U4j6hK1
	 A4+VuYbGIBscoW1xxxnTCrF/5tmmoNN+4OqqrBcYamr2h1AgAo7SxPD9m7wcWT8QGoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459327;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZdNq6lAzgClGgqAFoM53TspEHeE7nLUWeGd16KM0xa0=;
	b=1864l6z1+u5Odb0WgMpUodeGd3X8kWFQYiqAXUSQg2w4wSBEC8YikODE9DK2+3BDWN3b
	 yZeHFfWR1gmV3g6FFgtQzSr9mYE2vGLkF5lOI8ZEM0TZh1hhYDpzGvE8FCQQqjFRBnauD
	 aKW7dCtpZ8OxvKe+u3IupppJhyDNA+ElZTav1ktRV7k6TeiL6az0kpVbjLdjNB+as+4fQ
	 ZDuu/ueD9anaAxY49z0Lw9QkAhwiwFO18VvDL+n6q0/KImvZjB/X2GNvwrZn/gtG6wRib
	 RIZ7MtVSqyEmZmXbPE2iZGOl/RlzINbKdgLzzZjYqr/sAcox8Lsy7+tPPUXWpcwXN5g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C82B91F0156B;
	Mon, 23 Nov 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459327;
	bh=ZdNq6lAzgClGgqAFoM53TspEHeE7nLUWeGd16KM0xa0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ICbij8cJ3bUrOxalM9ziNWQ1OQQGvlznAP7BdmVTwy88R/ji/pIpRwrNnf0NHRJKk
	 dOTD/3Szs5shodVKkd0UoaRmVMHkhwHja5RNl5TtaTmBRU1qmSbzq9ORtPQ4C1V5Da
	 XiQUhAcqjn6TLb0z4ohe8w4izvEUkBmvICOtZvNeoVdwLlwS5XaGHncXLxilaBbAlL
	 Z+nJ8tFnCIr84P4+heP5PO38bLgu3JshENUew/tHvtQBzXEYyCaHNU5wcomrmDPnCv
	 WtGnJFk62CXkAvR7hOkoeJtHl0fPy7jX8qNaXoUDXHtX5BbvLzU78NMUbz/iHV67C6
	 gX2H5aLPe5YTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ED0E34C5F5;
	Mon, 23 Nov 2026 18:41:42 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:43 +0300
Subject: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus controller
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
Message-Id: <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
In-Reply-To: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459301; l=6021;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=QTUeghqAlQjkR5dMjvBPawoC6AvZAXiYJDZ4pQ7PTHY=;
 b=uUm8vweAlSelipYq3Pfl/Wsa0mjElU5AAfjujs8BRC5T0pJBEwpphNYRJyQxhtN36wjQgRs4g
 NFSgFVopVarDjXjbpuzEVKfYsI5ngeFlNRpxD0N7O07CAejwzGGhzUx
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

Poll short transactions with microsecond delays and a bounded timeout.
After a timeout, wait for the outstanding frame before programming
another address so a late completion cannot be mistaken for the next
transaction. Use managed bus allocation and registration to cover probe
failures and removal.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/net/mdio/Kconfig       |  13 ++++
 drivers/net/mdio/Makefile      |   1 +
 drivers/net/mdio/mdio-cs75xx.c | 136 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index d44278f26..a20fec805 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -291,3 +291,16 @@ config MDIO_BUS_MUX_MMIOREG
 
 endmenu
 endmenu
+
+config MDIO_CS75XX
+	tristate "Cortina Systems CS7542 MDIO controller"
+	depends on OF_MDIO && HAS_IOMEM
+	help
+	  Support Clause 22 PHY register access through the CS7542 MDIO
+	  controller, retaining the prescaler configured by platform firmware.
+	  Transactions use bounded polling and recover from late completion.
+	  Device Tree describes the PHYs sharing this management bus.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mdio-cs75xx.
+
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 048586746..2afa6066f 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -35,3 +35,4 @@ obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+= mdio-mux-meson-g12a.o
 obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+= mdio-mux-meson-gxl.o
 obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+= mdio-mux-mmioreg.o
 obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+= mdio-mux-multiplexer.o
+obj-$(CONFIG_MDIO_CS75XX) += mdio-cs75xx.o
diff --git a/drivers/net/mdio/mdio-cs75xx.c b/drivers/net/mdio/mdio-cs75xx.c
new file mode 100644
index 000000000..0761d3cef
--- /dev/null
+++ b/drivers/net/mdio/mdio-cs75xx.c
@@ -0,0 +1,136 @@
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
+	struct mii_bus *bus;
+	bool pending;
+};
+
+static int cs75xx_mdio_wait(struct cs75xx_mdio *priv)
+{
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout_atomic(priv->base + PER_MDIO_CTRL, val,
+					val & MDIO_CTRL_DONE, 1,
+				       CS75XX_MDIO_TIMEOUT_US);
+	if (!ret) {
+		writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
+		priv->pending = false;
+	}
+	return ret;
+}
+
+static int cs75xx_mdio_read(struct mii_bus *bus, int phy, int reg)
+{
+	struct cs75xx_mdio *priv = bus->priv;
+	int ret;
+
+	/* A timed-out frame must finish before programming another address. */
+	if (priv->pending) {
+		ret = cs75xx_mdio_wait(priv);
+		if (ret)
+			return ret;
+	}
+	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
+	writel(MDIO_ADDR_READ | FIELD_PREP(MDIO_ADDR_REG, reg) |
+	       FIELD_PREP(MDIO_ADDR_PHY, phy), priv->base + PER_MDIO_ADDR);
+	priv->pending = true;
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
+	int ret;
+
+	if (priv->pending) {
+		ret = cs75xx_mdio_wait(priv);
+		if (ret)
+			return ret;
+	}
+	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
+	writel(FIELD_PREP(MDIO_ADDR_REG, reg) | FIELD_PREP(MDIO_ADDR_PHY, phy),
+	       priv->base + PER_MDIO_ADDR);
+	writel(val, priv->base + PER_MDIO_WRDATA);
+	priv->pending = true;
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
+	priv->bus = bus;
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


