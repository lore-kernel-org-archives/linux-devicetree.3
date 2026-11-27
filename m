Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774482;
	b=IERIdJNeWVdwCkDE8c599AZHYmYxgrNXO6tTS7eHg2lo8jVFoR0zLOjVDke2C5g25oIq
	 PQ7FYVak5RGJMhMFFQ0hiWD3RiZjf5W/bS0n3RfcZPZqDvHVb/lYaXdVeyMCXNPyJK7Kj
	 IQ1eNuWGHkH0jfY3knq5O2/7fOvqOMPpL1HPaXtbFKKtPdQ3S1BpxaSHqKOoa6LbBU/eN
	 rl1MtWHr+fRYL9ZyIT0JFgteUWhvxl1nzLaPlkiRT7e9UbSpWOcr29BNSJ35/qrFm+q8V
	 3b/2cDtGg7FzAmMbFI+VgWTsJmBjoDYkLcZqvtMn1ZfuBddRKhUFhlBuGggGLhMicNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774482;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=n6jz0fcKhhMw++goqMhMJ71h94wff1ox/PXdr0KAvu4=;
	b=G102+WIUZptFIBI1EWRV+75o82PRxYeHZVfjl0Egdsn2uqID/i6KSUV6CUyn590KdV3U
	 BBunB5ZbwKjEOOjgPO5xsoS2fUZovF2JA0OpTt5HT8XtlDZu5iDJa7tNLjc5oamq2d72o
	 iafQFsIvM4SMFKlstMCNq3DuH3y7mNQgYsOYZoi04frXExUBMx4GGrh5umCwylQsk8emO
	 xFg5I6sfW4oCn+1mtApN5rZl8AgkGZ48PtOjaN27ymMYqOwIV9B38q8IwQiX4Du58cHU7
	 vGGalWQZ66XWp83W+G2N3IDQiw3XpdJHpGifKC7P3xZKSh17LrE/+VsSrA2g8WNi7mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FX8B2tAp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C78606A68E;
	Fri, 27 Nov 2026 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FX8B2tAp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795774482;
	b=emD2E6ez5vNahi9rGZuqhDi0IZUbq9G4EX2YKUiIZ+Xc6HFhM2lfV0Is8gil4Q3Q1oE3
	 l5pvYMx0c2r31DKpNzjL4i7z1SPTQM+Fds8T0uON5z9vozjWiSpXrysoUvPDb1TwI0Hn4
	 t2opmACLFK8ef38LA3hj1GJKSZRYcnMYrPNd0aPuvDAH8ZdjefwaNBi1b+PbTzu8oUmCv
	 mdtj5BCzvwS8p5XVmMlF1xKhSbPwVsCEhzyoOJI4aiANlA3sKPndfjGs8kGF1Fq7BjD/H
	 GIXeNKX+Gw9ngfZ8+9cCVluyMpSHFR3Nd7+Rm1JnVGW33kLcjcgOioKtTosOsji6oWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795774482;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=n6jz0fcKhhMw++goqMhMJ71h94wff1ox/PXdr0KAvu4=;
	b=EnX0LwOK4CK0sVFHFfndCIFCJ9KopwMCwJgdu7XwrNldXbpPkU+MhSDDCecuj6Tld7Mg
	 jVZoIQ8WmI5PzmgzeSIGn77ACzM82qHFh0GXRWHJXU4Ss58Pru8EpJYJNscTQoP3QolMa
	 VCUJkR5OIYil404JamGDM5SHcSTVE4m1N+vX6Tt0/XDVQHQ19iXVGEs0KI2CDD7MOz7PB
	 eyjntnbfb1Q0XP7n9OlNJ7G5C6cRhI/RDVIhBhLeBYejAWMT+Xbo+tXrIJx7/h/Q5T1Hz
	 KD4SMIis+r0cpyTxqCMwzvi6jWECQTBbl/pZ0/Ws0zKTbH5G+ZRmhAr/eGok3kdzwnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 057FC1F00A1C;
	Fri, 27 Nov 2026 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774482;
	bh=n6jz0fcKhhMw++goqMhMJ71h94wff1ox/PXdr0KAvu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FX8B2tApBs108qR/wPUZpf+8i4yaDUeJG1SQv74zqf0ppDCmq7aTpACWgcRKlxjM1
	 pI5Rb3gte3sFhvHU23vvZnVwTg8j/hsYqc+0SJmZa/qdbLSreUBo0PEwa4YNeTCg6G
	 eil2jDk/XOmjrvbXcVlh4KGYoBeujaiDPLnP7cyuMp0KK/pVzqsbjRiwghUILshqhE
	 USlYBTdXAGVheZV6M7qCmJxVfxGmWwEVDwcrhJ8hYqxklovLtagEnXHkaxTYv6EVwx
	 IRJPgBOSOsHPglRjZZDpQIBtx3VD09CKaHPPJWQ1ULCMGQMmYVdSoWt+oeUHsqXte1
	 ovW3GQuH3EWAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D55C4B6FB;
	Fri, 27 Nov 2026 10:14:22 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 13:14:23 +0300
Subject: [PATCH net-next v4 2/3] net: mdio: Add Cortina CS7542 bus
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
Message-Id: <20261127-b4-cs7542-mdio-v4-2-0e37fc0c47d5@gmail.com>
References: <20261127-b4-cs7542-mdio-v4-0-0e37fc0c47d5@gmail.com>
In-Reply-To: <20261127-b4-cs7542-mdio-v4-0-0e37fc0c47d5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795774461; l=6232;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=yoxgWpCTcLOyuyepNGOaAaPRdAAEuMVmf1EWIuaC4pA=;
 b=M4GRu3Lb3sHPWcJeh2zNgsYNrJXyDa7Bj82z9PFS6hyuETiQdujnLZ79vVI5sY2B4rlM6szCb
 gZSjkcP9/wECli00sjEAcwusHDEpbu1zeqUdSM3tDQQ/Kza3dfU3OgC
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

Acquire and enable the required APB input before accessing registers,
and retain it for the lifetime of the registered bus. Managed bus teardown
runs before the managed clock is disabled. The firmware MDC prescaler is
preserved; no clock-rate or divisor programming is introduced.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/net/mdio/Kconfig       |  12 ++++
 drivers/net/mdio/Makefile      |   1 +
 drivers/net/mdio/mdio-cs75xx.c | 126 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)

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
index 000000000..0405723eb
--- /dev/null
+++ b/drivers/net/mdio/mdio-cs75xx.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
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
+	struct clk *clk;
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
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable APB clock\n");
+
+	/*
+	 * Select software-initiated accesses instead of automatic PHY polling.
+	 * Read-modify-write preserves the firmware MDC prescaler in bits 31:16.
+	 */
+	cfg = readl(priv->base + PER_MDIO_CFG);
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


