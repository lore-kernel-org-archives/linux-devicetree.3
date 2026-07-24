Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9844C518
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917829; cv=none; b=fpTfzy6pIZOf6aaEHGRHUkgLDud82XZw5Et9SSjdkWf9c6I0Qeo2VVHZ65mLL3rEgLfUKIJWlz0vl/9GeH9mqDVO9nzyI8VdEq2W2im85YKDv8GeP4N2YD0wktOBB8b9RA7w47GdUyKHc4jKFek6b1/wc67ov1bt6viO56jIX5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917829; c=relaxed/simple;
	bh=+tGnmHr26ETDSifpxlePoovzP2J48zzq7M+52vH8Kl0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sl/kFjl6NV9iVIA0bgH0y/pDV/CoGc38VNzFeiBFyScWBuL/mEPKlN596whxsClubtONy03lBIAovhThJaHFVuVw31+hBvDwPOuoT+b/Ao0ty5YI8FaWp2ErCaidin6UxGGsgGmtxB0EgzWxT7GeGF60UHTv1CvY/H7DgOJ8Edg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDn8pGab; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDn8pGab"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49557167508so7383055e9.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784917826; x=1785522626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NJL6x74eEVKmt3YHJ/9otYcrQmRJ7W+YFWJ36/O20yw=;
        b=SDn8pGabmBWiQDxDwhVtYgxifxwlHRGY8HwrAonrHzBmQZiNwDw6XwlIVL/lDZ4ejq
         8+qCu3y4pOwwGy3JgGOL7qx/l/w3c1ckS+RAPAPC5CfC21VfGZKJYMa6oR/0aMrff2uh
         8rnUETX7RfC79T02qp51qrxRR/RgsjN//RXXYKjE3HEPBO5U6lv8Nw+3HfbdEg+MeYUG
         IIjfLMOurQMB8KLiNev7zqkj+ufvoYZ/RzdZdy3OwNjkemNnasErJ0Ji0BbcFqj+A9kY
         OID7SA82F4I7Rvb/GYYrmF3GxBqq9CCzp+bXVDGT+R/d0sLMR5quKl8NEGb2mHswN1v/
         HKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917826; x=1785522626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NJL6x74eEVKmt3YHJ/9otYcrQmRJ7W+YFWJ36/O20yw=;
        b=C3zFejd/nCH+qgAEPT8hAOry2PZqLR2tudLMyfJVbxIcFTAXcPrDTW4HYlYnKiV/Kw
         6U6b+cSGHtQ7nhJ4D6ow+56MkcyGVgnrkhuRR7QfhQFdAqEzqDgh+kDQqtKblvL07QO2
         MJZSWn9GwCOyK/0uojdLuHyUkcxE6OOOHkKNB80HrPe7pWugAABog+aUWFjv+9c3pJ/q
         avRiKl6y2R5b9R+icqkDr52BhaxhdlRN885BspgMZG3KjpuVUEilqQ/47PaAo1wbQg+A
         qYlFHCpJoxruXAM6esggpiYmTZnDx2RZOG5LEJObiEyY9esraB3cI78EGO+TwUNV7WZh
         Hezw==
X-Forwarded-Encrypted: i=1; AHgh+RrJCoCIknLSQRRqxnTBGU0sAHHDZsKG4Ln47LnDF0lccISlBKJtEiekUE3vU9dbBEZRXHiwfmc/c1V/@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvhBPalSwTGdhKGmcn2cuvDzGy9kuF/8jRMdLcSUW4wFSzvGA
	XE3DXnP9zb5ULWHJHu3hMu3wAgjpNmNa0D5DAHtQm69zDquy8pgTN9WE
X-Gm-Gg: AR+sD11n4kzsVhoKxar0PM0/3FLncP0byx5/+F3mAZxMEHmyVk8JhS6HvwhQ5SLrJDb
	X/syo3tAjkgrk15kvwtb/xoXkAMoQs8BC3j1Imln2rys9DFcQkjF3RI4E2FilOl3P+rWcmll0hO
	dml1yAIORzU/H/BTTEq3GDzMJQD0WIABOg+yDiBBfcjzdq5P7qSXFZcKvFxr1rSNXOL85O3+YmC
	WQzjdCH48xW5J90Cc/UnaYkjrhiVOEGv3npUWJlZ5F09yzJTT9vGddXehroZ5Omc3FQzCezqL7S
	3D0L79GpSK+XkQ2I5LXhqIrFkZzyS5pAdT7m11D18fROhcVHYbkJCXOTJtZOX/O2OkPOsiISf8O
	5Z8rmifU47V5mLEnJlS1gNw4TrSVN7oWjrKRi2GCV5761GFp+X+Ru4/BABlYkZTms6DGzgFO7NQ
	EEiLlKqD7bhwQLnWkJ8iHiYaVgfbHHP28GLsTy+63WqAjvVxqRs9liShSW140ImdJ2
X-Received: by 2002:a05:600c:5492:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-49573ccd92amr97045065e9.10.1784917825509;
        Fri, 24 Jul 2026 11:30:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm26396571f8f.24.2026.07.24.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:30:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Jacques Nilo <jnilo@free.fr>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Gerhard Engleder <eg@keba.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 2/2] serial: 8250: Add Airoha SoC UART and HSUART support
Date: Fri, 24 Jul 2026 20:30:06 +0200
Message-ID: <20260724183007.188172-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724183007.188172-1-ansuelsmth@gmail.com>
References: <20260724183007.188172-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha AN7523 UART and AN7581 HSUART.

These implement a standard 16550 UART with only some custom logic
for baud rate handling.

Co-developed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/tty/serial/8250/8250.h        |   6 +
 drivers/tty/serial/8250/8250_airoha.c | 190 ++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c   |  16 +++
 drivers/tty/serial/8250/Kconfig       |  11 ++
 drivers/tty/serial/8250/Makefile      |   1 +
 5 files changed, 224 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_airoha.c

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 77fe0588fd6b..e6b2b9431229 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,12 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+enum uart_port_type {
+	/* Internal 8250 only */
+	UART_PORT_AIROHA		= 124,
+	UART_PORT_AIROHA_HS		= 125,
+};
+
 #define UART_CAP_FIFO	BIT(8)	/* UART has FIFO */
 #define UART_CAP_EFR	BIT(9)	/* UART has EFR */
 #define UART_CAP_SLEEP	BIT(10)	/* UART has IER sleep */
diff --git a/drivers/tty/serial/8250/8250_airoha.c b/drivers/tty/serial/8250/8250_airoha.c
new file mode 100644
index 000000000000..5d6d998bebd6
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_airoha.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Airoha UART driver
+ *
+ * Copyright (c) 2025 Genexis Sweden AB
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ *	   Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/math64.h>
+#include <linux/property.h>
+#include <linux/serial_reg.h>
+#include <linux/serial_8250.h>
+
+#include "8250.h"
+
+#define UART_AIROHA_BRDL	0
+#define UART_AIROHA_BRDH	1
+#define UART_AIROHA_XINCLKDR	10
+#define UART_AIROHA_XYD		11
+#define   UART_AIROHA_XYD_X	GENMASK(31, 16)
+#define   UART_AIROHA_XYD_Y	GENMASK(15, 0)
+
+struct airoha_8250_priv {
+	int line;
+};
+
+struct airoha_8250_clk_div_info {
+	unsigned int div;
+	u32 mask;
+};
+
+#define UART_BRDL_20M		0x01
+#define UART_BRDH_20M		0x00
+
+#define XINDIV_CLOCK		20000000
+#define XYD_Y			65000
+
+static const struct airoha_8250_clk_div_info airoha_clk_div_info[] = {
+	{ .div = 10, .mask = BIT(2) },
+	{ .div = 4, .mask = BIT(1) },
+	{ .div = 2, .mask = BIT(0) },
+};
+
+static unsigned int airoha_get_divisor(struct uart_port *port,
+				       unsigned int baud,
+				       unsigned int *frac)
+{
+	/* Hardware always uses BRDIV = 1. */
+	*frac = 0;
+
+	return 1;
+}
+
+/*
+ * Airoha UART baud rate calculation logic
+ *
+ * crystal_clock = 20 MHz (fixed frequency)
+ * xindiv_clock = crystal_clock / clock_div
+ * (x/y) = XYD, 32 bit register with 16 bits of x and then 16 bits of y
+ * clock_div = XINCLK_DIVCNT (default set to 10 (0x4)),
+ *           - 3 bit register [ 1, 2, 4, 8, 10, 12, 16, 20 ]
+ *
+ * baud_rate = ((xindiv_clock) * (x/y)) / ([BRDH,BRDL] * 16)
+ *
+ * Selecting divider needs to fulfill
+ * 1.8432 MHz <= xindiv_clk <= APB clock / 2
+ * The clocks are unknown but a divider of value 1 did not result in a valid
+ * waveform.
+ *
+ * XYD_y seems to need to be larger then XYD_x for proper waveform generation.
+ * Setting [BRDH,BRDL] to [0,1] and XYD_y to 65000 gives even values
+ * for usual baud rates.
+ */
+static void airoha_set_divisor(struct uart_port *port, unsigned int baud,
+			       unsigned int quot, unsigned int quot_frac)
+{
+	const struct airoha_8250_clk_div_info *clk_div_info;
+	struct uart_8250_port *up = up_to_u8250p(port);
+	u32 xindiv_clk;
+	u64 xyd_x, nom;
+	int i;
+
+	/* Set DLAB to access the baud rate divider registers (BRDH, BRDL) */
+	serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);
+
+	/* Set baud rate calculation defaults (BRDIV ([BRDH,BRDL]) to 1) */
+	serial_port_out(port, UART_AIROHA_BRDL, UART_BRDL_20M);
+	serial_port_out(port, UART_AIROHA_BRDH, UART_BRDH_20M);
+
+	/*
+	 * Calculate XYD_x and XINCLKDR register by searching
+	 * through a table of crystal_clock divisors.
+	 */
+	nom = baud * XYD_Y;
+	for (i = 0 ; i < ARRAY_SIZE(airoha_clk_div_info) ; i++) {
+		clk_div_info = &airoha_clk_div_info[i];
+
+		xindiv_clk = XINDIV_CLOCK / clk_div_info->div;
+		xyd_x = div_u64(nom, xindiv_clk) * 16;
+
+		/* For the HSUART xyd_x needs to be scaled by a factor of 2 */
+		if (port->type == UART_PORT_AIROHA_HS)
+			xyd_x /= 2;
+
+		if (xyd_x < XYD_Y)
+			break;
+	}
+
+	serial_port_out(port, UART_AIROHA_XINCLKDR, clk_div_info->mask);
+	serial_port_out(port, UART_AIROHA_XYD,
+			FIELD_PREP(UART_AIROHA_XYD_X, xyd_x) |
+			FIELD_PREP(UART_AIROHA_XYD_Y, XYD_Y));
+
+	/* Restore normal register access. */
+	serial_port_out(port, UART_LCR, up->lcr);
+}
+
+static int airoha_8250_probe(struct platform_device *pdev)
+{
+	struct uart_8250_port uart = { };
+	struct device *dev = &pdev->dev;
+	struct airoha_8250_priv *priv;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return dev_err_probe(dev, -EINVAL, "invalid address\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	uart.port.dev = dev;
+	if (device_is_compatible(dev, "airoha,an7581-hsuart"))
+		uart.port.type = UART_PORT_AIROHA_HS;
+	else
+		uart.port.type = UART_PORT_AIROHA;
+	uart.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
+			  UPF_FIXED_TYPE | UPF_IOREMAP;
+	uart.port.set_divisor = airoha_set_divisor;
+	uart.port.get_divisor = airoha_get_divisor;
+	uart.port.mapbase = res->start;
+	uart.port.mapsize = resource_size(res);
+
+	ret = uart_read_and_validate_port_properties(&uart.port);
+	if (ret)
+		return ret;
+
+	ret = serial8250_register_8250_port(&uart);
+	if (ret < 0)
+		return ret;
+
+	priv->line = ret;
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static void airoha_8250_remove(struct platform_device *ofdev)
+{
+	struct airoha_8250_priv *priv = platform_get_drvdata(ofdev);
+
+	serial8250_unregister_port(priv->line);
+}
+
+static const struct of_device_id airoha_8250_dt_ids[] = {
+	{ .compatible = "airoha,en7523-uart" },
+	{ .compatible = "airoha,an7581-hsuart" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, airoha_8250_dt_ids);
+
+static struct platform_driver airoha_8250_driver = {
+	.driver = {
+		.name = "8250_airoha",
+		.of_match_table = airoha_8250_dt_ids,
+	},
+	.probe = airoha_8250_probe,
+	.remove = airoha_8250_remove,
+};
+
+module_platform_driver(airoha_8250_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Airoha UART driver");
+MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 630deb7dd344..22dd114256b3 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -311,6 +311,22 @@ static const struct serial8250_config uart_config[] = {
 		.rxtrig_bytes	= {1, 8, 16, 30},
 		.flags		= UART_CAP_FIFO | UART_CAP_AFE,
 	},
+	[UART_PORT_AIROHA] = {
+		.name		= "Airoha UART",
+		.fifo_size	= 8,
+		.tx_loadsz	= 1,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01 | UART_FCR_CLEAR_RCVR,
+		.rxtrig_bytes	= {1, 4},
+		.flags		= UART_CAP_FIFO,
+	},
+	[UART_PORT_AIROHA_HS] = {
+		.name		= "Airoha HSUART",
+		.fifo_size	= 128,
+		.tx_loadsz	= 128,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01 | UART_FCR_CLEAR_RCVR,
+		.rxtrig_bytes	= {1, 4},
+		.flags		= UART_CAP_FIFO,
+	},
 };
 
 /* Uart divisor latch read */
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index fc3e58d62233..310da7af7a49 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -337,6 +337,17 @@ config SERIAL_8250_ACORN
 	  system, say Y to this option.  The driver can handle 1, 2, or 3 port
 	  cards.  If unsure, say N.
 
+config SERIAL_8250_AIROHA
+	tristate "Airoha UART support"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on SERIAL_8250
+	help
+	  Selecting this option enables an Airoha SoC specific baud rate
+	  calculation routine on an otherwise 16550 compatible UART hardware.
+
+	  If you have an Airoha based board and want to use the serial port,
+	  say Y to this option. If unsure, say N.
+
 config SERIAL_8250_BCM2835AUX
 	tristate "BCM2835 auxiliar mini UART support"
 	depends on ARCH_BCM2835 || COMPILE_TEST
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 6d21402b4435..83257696ea8a 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SERIAL_8250_CONSOLE)	+= 8250_early.o
 
 obj-$(CONFIG_SERIAL_8250_ACCENT)	+= 8250_accent.o
 obj-$(CONFIG_SERIAL_8250_ACORN)		+= 8250_acorn.o
+obj-$(CONFIG_SERIAL_8250_AIROHA)	+= 8250_airoha.o
 obj-$(CONFIG_SERIAL_8250_ASPEED_VUART)	+= 8250_aspeed_vuart.o
 obj-$(CONFIG_SERIAL_8250_BCM2835AUX)	+= 8250_bcm2835aux.o
 obj-$(CONFIG_SERIAL_8250_BCM7271)	+= 8250_bcm7271.o
-- 
2.53.0

