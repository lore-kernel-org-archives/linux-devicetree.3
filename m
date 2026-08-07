Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7E46C825
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141262; cv=none; b=B5YbjSt4a4hcCKxBfaNn52wHOnfHEMDi4rfhESw2znbnrYH2XB8qLrojxXAE1i1nLj427Tb3h1TkiYmv2HHMWTeHjzml4Bl/RPoz9CglqeH5FV1U0LYgmf7C11i8c9rbFx6AgmDBpuOvUXTXYPXSrW/LSF9MygkAeo8p3CYRC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141262; c=relaxed/simple;
	bh=KQrtHeINLb2Msww1dxf9l3/ZDHyxWjxCju6rMQa0zuA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+C5LvCaieUiYJw+bKejINcmXkutQl2rdB41EWA5wMNt56IfbHPEa1awl1FUNR5rUpbst61WUd7GU8yFP3aZchsbOYObXM/cXGwqdJevmt1aXBMkW1eJFOPoIEvez0TR2zhylTbvZc+q1tQChUJaao05PM1vP6JXfY0kRS34c6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/h0n4uH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/h0n4uH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3782562f8f.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141258; x=1786746058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iDVlcKhZ42D9PDtfe534iJgH+d1npj1KOZWIU9EL5Jk=;
        b=g/h0n4uHBZQq6eqPIUmq4q1WraDCOqtxSDYLwbrPx1ZhRvffqq0HsWDFphyuedxks9
         ZxaBYOEB7vQ0kEALUwcYzAKC039Xl0iGuyQqa4RHdvWwsWT8j0e8NXyn6gaXt6DiFrvd
         q0BLbgNOCw/6gxH5z4l45jZkZCOF4UzkMmPd69cF2PShYxwc/Gaj7mbNrzFA5C3ixokf
         R8LX+ghjgshhcXaKCw5L1Mt0EhUuKJ3i6HGoqfQKzB5WZbltPj1u8e8gPPjTc+liQrMH
         Z6uqL94LTjuSTZwwqUHvVyK6EjSIUTScyahQv8uYL9Nq62Ls9SXtbYVDRkFQ6EV6GQUE
         wu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141258; x=1786746058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iDVlcKhZ42D9PDtfe534iJgH+d1npj1KOZWIU9EL5Jk=;
        b=ZhtJ7lNdskxv6eRFlNQPWNFqYdp9ynGcb/KHicthw7neH5+L4GmBsmkWys3tZ3DJwA
         jLnIdI2zTg8D/v+mc+fgKE06A6d/BOItYiNePcMYzJboJOZn+ndHluCAevlJdXl0xzn7
         uqSV0zgjcuQIrd3tsdfk+02eGAeVuC+aYTnuftzmOpYXkgysE4M0Grzo70BKaMs8PQ+J
         GZ8FeQ5cieCc7ug2CwYHrFyLbe0lP/xqyxJCM8eshYtgWgIeAJSG2FUmCYkiefUfzFEK
         7oiSz6ck4Cq0LdpHmvibm3JB/QhOMBYwDhUIrnUtlcVKR1JxAo96xHIwf4uUqsKK+/70
         mfTw==
X-Forwarded-Encrypted: i=1; AHgh+RrghAiIqKaE2MN5wHIBEDRwDjGY9Blb7PAAPCa6t+EGk2TGLjsvpm5Zx8pPBuVELZv/iR+/QsHY2dMy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu3JnhY2TMkY7x1VAES1/8f1PeRs6KrCpiOUF3GVl7j5PsznyZ
	NLLVtAHC96enLtSSmrI27CII7NvGcUUMNi+mqJctnXTLwWByGmAu4B3H
X-Gm-Gg: AR+sD12tdhMb2qtZIXMnGU4YMlK8u11A2HQkhuY6DNH36cIo1nk65tAbB499xer1yhm
	PTRyu8MVeRoNgYNdSlqyjF6btNwBenXz05PpBaj+x5WImyvXP4RsCCxi4lJFIeXQi8LQaGPByi2
	QJuSOerE0RJWYo1HjIFLErRLyE1vCC5oYD6lZUofyjefiGG8OwhzEew/SLZKlFFBgBztOIrioh5
	MtWaeFEoa0b2G+r6Qjt6FKI0pWt4+hNygMq+prz/GYD2BkbzJjgSduGtZwLo4TNzIXCniFzRBUo
	MxuanJcR63iz2NiVR68g9gXbH4GoC+uLjkqxokmA1dVCcFuaZM/20HVb+/PdukHNG5YooVA/Yw1
	Wzp2nMBuh1BQ0O178IknHOTkrxt+jhLf/GQ6RBxRhgtAX/OU31VjJ4IKnSo/SrU49thAVn07XdY
	l2/+4nQi62dcJ/5WH2uvgQrvR3B8P6MEJ6mYl9Jn8Jssu8HxTBHMapGPMlzTkSeG+WWtKJj45Iz
	YKZQ/1yRxtYKKqLKS/JrH2nwnkjxNiJ5NXvpLXvbEeO0sLfa3h/MA==
X-Received: by 2002:a05:6000:4212:b0:47f:81a9:3f36 with SMTP id ffacd0b85a97d-47ffd924dffmr17206247f8f.18.1786141258081;
        Fri, 07 Aug 2026 15:20:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-480021f9182sm9581519f8f.28.2026.08.07.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:20:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Gerhard Engleder <eg@keba.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 2/2] serial: 8250: Add Airoha SoC UART and HSUART support
Date: Sat,  8 Aug 2026 00:20:40 +0200
Message-ID: <20260807222044.208056-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807222044.208056-1-ansuelsmth@gmail.com>
References: <20260807222044.208056-1-ansuelsmth@gmail.com>
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
 drivers/tty/serial/8250/8250_airoha.c | 186 ++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c   |  16 +++
 drivers/tty/serial/8250/Kconfig       |  11 ++
 drivers/tty/serial/8250/Makefile      |   1 +
 5 files changed, 220 insertions(+)
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
index 000000000000..5cc9b8f8a618
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_airoha.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Airoha UART driver
+ *
+ * Copyright (c) 2025 Genexis Sweden AB
+ * Author: Benjamin Larsson <benjamin.larsson@genexis.eu>
+ *	   Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/platform_device.h>
+#include <linux/serial_8250.h>
+#include <linux/serial_core.h>
+#include <linux/serial_reg.h>
+#include <linux/units.h>
+
+#include "8250.h"
+
+#define UART_AIROHA_XINCLKDR	10
+#define UART_AIROHA_XYD		11
+#define   UART_AIROHA_XYD_X	GENMASK(31, 16)
+#define   UART_AIROHA_XYD_Y	GENMASK(15, 0)
+
+struct airoha_8250_priv {
+	int line;
+};
+
+#define UART_BRD_20M		0x1
+
+#define XINDIV_CLOCK		(20 * HZ_PER_MHZ)
+#define XYD_Y			65000
+
+static const unsigned int airoha_clk_divs[] = { 2, 4, 10 };
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
+	struct uart_8250_port *up = up_to_u8250p(port);
+	u32 xindiv_clk;
+	u64 xyd_x, nom;
+	int div_bit;
+
+	/* Set baud rate calculation defaults (BRDIV ([BRDH,BRDL]) to 1) */
+	serial8250_do_set_divisor(port, baud, UART_BRD_20M);
+
+	/*
+	 * Calculate XYD_x and XINCLKDR register by searching
+	 * through a table of crystal_clock divisors.
+	 */
+	nom = (u64)baud * XYD_Y;
+	for (div_bit = ARRAY_SIZE(airoha_clk_divs) - 1;
+	     div_bit >= 0; div_bit--) {
+		unsigned int div = airoha_clk_divs[div_bit];
+
+		xindiv_clk = XINDIV_CLOCK / div;
+		xyd_x = div_u64(nom * 16, xindiv_clk);
+
+		/* For the HSUART xyd_x needs to be scaled by a factor of 2 */
+		if (port->type == UART_PORT_AIROHA_HS)
+			xyd_x /= 2;
+
+		if (xyd_x < XYD_Y)
+			break;
+	}
+
+	/* Couldn't find a valid xyd_x */
+	if (div_bit < 0) {
+		dev_err(port->dev, "failed to find suitable clock divisor for baud %u\n",
+			baud);
+		return;
+	}
+
+	serial_port_out(port, UART_AIROHA_XINCLKDR, BIT(div_bit));
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
+	{ }
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
+module_platform_driver(airoha_8250_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Airoha UART driver");
+MODULE_AUTHOR("Benjamin Larsson <benjamin.larsson@genexis.eu>");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 630deb7dd344..c888cae7d98b 100644
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
+		.rxtrig_bytes	= {1, 4, 4, 4},
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

