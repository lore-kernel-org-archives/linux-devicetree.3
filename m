Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6740F75B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228212; cv=none; b=X1Jo8xxyp0wXz7JoTparFvluOMWuCErS+RONxGrIptQy/n3a0KI/oA7dUv435pab9jqQdElfPk903axU874pT3htxtRhscEHxFMT8us0nmm+3Ygj5pcO9oUgUqffh30ew0meZldzhceisjvp04AZlPyertvFaDfY/3retmTwYls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228212; c=relaxed/simple;
	bh=VL/g5CE7FJkYOSTy1f0FYtYFN2GRLoeQlOHWa07DRrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srDnDhy3r0yFRwYRbbtoirrmupeNH3i5boMR6VEk4KyWFjLgyYBHbyKg/c6RiMxG+4nXYzS0JB47Fj74L+/Haf5dqkakQ5B1FsnlCH5xVDJ3bCJb7TypamDYncWEBcUlI+cyVyYoGB+1JB0TvSE1aHw3H0E3IEMqSELgZiuZPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIO3en2a; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIO3en2a"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495635a85d2so29500355e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785228208; x=1785833008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7OnQKbzL42miSqebEG03z3AI3kA2cenK1gpZlkwILo=;
        b=bIO3en2a6xcsfJAg76x7lGmOTwNgONUqUW/a8qW8t3NkRcHsQ/P3t/GeCM7ZxmxjK4
         maX+Qx+/HV9w1HWjg1uh1l0P685xJQrKSSn0VqsW65Ui5ATOoyVqZiSxlg/c+ZmVBaAn
         8DeuGPhGn1S5mltIGcOK1S85N1h3XKEe/phHTfUkwWGxp+XSshe6wr0n+/zWisgrnq/X
         rCpPnFoz35+uBtYcjwOZgBF+mRRO2vHSglHBls0tyQiy0uJ5Dgz+9mkrMP19zc7/CsGr
         IBOM0eRSnMo6R2e/bpKkM+WW66yNiVotDud/ELpBmp5SUzO83F/hVmpU++a/sSWqrIlw
         w6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228208; x=1785833008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7OnQKbzL42miSqebEG03z3AI3kA2cenK1gpZlkwILo=;
        b=id4Nv8x7jGy3mRHIHCErbHgIZm41ZJ47m4IPQERLdF4UIga0OqbWPFB/R1Gfg0Brow
         oOxeZSXhcxx4Ma2+wrt2KgQ3l8S0gIKaeqYqcx3xp5wJdYzOoNnvvTaUIk0r6BtB2AP3
         1ZK1uXLtYCdcbew0R+U2j4j0L+aHMVOMdy4dwvZpQUV+gFeBUwfU/5zRHSqGPQPZi82W
         ffA7qsP0HSy/wU2xnZgmdgKh2HePEkAwupmptTtXMx4xByZCQVdGizuVQMBBJgcVygxL
         UkXz0tdSiK9O3cPHn+NJR1GI+D/dUhoBR/3KfCV16mpNsi+JIL9wVGFYf5W3Tjbytw0g
         mGNA==
X-Forwarded-Encrypted: i=1; AHgh+RpXxKSVI3KyObbESOneElI0azjrxXfs0ar4ixU4CCPoV6GTcnRzNn186gWUJeuP+bEkWNgvsVc2R4Iw@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrW4T3sw97OJYC0Shx3nolKcdOVkNfdPYBtkWnTL4Ksom7fz1
	MaMNR7gj8/JSrDQHB/YlT9W+19F668leXfaTVAbT9Udr0JuAG8bCL78j
X-Gm-Gg: AR+sD11fzAjVOA218GDS3GdgFRnkr4paYewSY0m40iwG3517fbQYNarRwhYnqyr5Tad
	etGIvkLvth8RYfWvAZhcuYSjXAMkPwqQU8GQ+i/KWhFTct9SDN2EAPCkoVxZ2/DEJreFjcVQgSL
	RrTVdQpMoLDr58VESk2MwPTP5MhnIiww/p2zNm8X7+Y6psZFjIm+yDf+ieCKijR3YdCKXwTOYtK
	e9glz273zbmREHEPX/jJ6BWUXZfrEr2CdbPmSGm2Pwrwcy9iTd8q6u38KYa3uItir2w70jh5WUz
	jq7/+Dk/TSYpon6AqhmlZC7ZziSAXkQ8uXRXdBVg1fHVK7E8xBhrxGVoczqljAWaOUPlmhoHDBM
	fyOdNnCGWBpt7WjoOCC2cmRvpfa6BWfqx4R1oSLedYX/FG6swEIp/1OzrO7o20f9tFUd5RFGNxw
	XELX+GswyaAwT9400=
X-Received: by 2002:a05:600c:548a:b0:495:6060:d6de with SMTP id 5b1f17b1804b1-496c6581719mr13675655e9.31.1785228207878;
        Tue, 28 Jul 2026 01:43:27 -0700 (PDT)
Received: from builder ([2001:9e8:f139:f416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm57730845e9.0.2026.07.28.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:43:27 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH net-next v10 4/4] net: pse-pd: realtek-pse-mcu: add UART transport
Date: Tue, 28 Jul 2026 08:43:06 +0000
Message-ID: <20260728084307.2129515-5-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728084307.2129515-1-jelonek.jonas@gmail.com>
References: <20260728084307.2129515-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the serdev (UART) transport for the Realtek PSE MCU core. It registers
the MCU as a serdev device and provides the send/recv callbacks the core
uses to exchange the 12-byte frames, receiving asynchronously via the
serdev receive_buf callback.

The baud rate defaults to 19200 and can be overridden per board with the
"current-speed" property.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/net/pse-pd/Kconfig                |  11 ++
 drivers/net/pse-pd/Makefile               |   1 +
 drivers/net/pse-pd/realtek-pse-mcu-uart.c | 164 ++++++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu-uart.c

diff --git a/drivers/net/pse-pd/Kconfig b/drivers/net/pse-pd/Kconfig
index 6d14c8832e8b..a0f2ae668c67 100644
--- a/drivers/net/pse-pd/Kconfig
+++ b/drivers/net/pse-pd/Kconfig
@@ -30,6 +30,17 @@ config PSE_REALTEK_MCU_I2C
 	  PSE silicon is not accessed directly. To compile this driver as a
 	  module, choose M here: the module will be called realtek-pse-mcu-i2c.
 
+config PSE_REALTEK_MCU_UART
+	tristate "Realtek PSE MCU driver (UART transport)"
+	depends on SERIAL_DEV_BUS
+	select PSE_REALTEK_MCU
+	help
+	  Driver for the microcontroller (MCU) that fronts the PSE
+	  hardware on various Realtek-based managed switches, attached
+	  via UART. The MCU exposes a message-based protocol; the actual PSE
+	  silicon is not accessed directly. To compile this driver as a
+	  module, choose M here: the module will be called realtek-pse-mcu-uart.
+
 config PSE_REGULATOR
 	tristate "Regulator based PSE controller"
 	help
diff --git a/drivers/net/pse-pd/Makefile b/drivers/net/pse-pd/Makefile
index ef869bba5ed9..9cca5900fe34 100644
--- a/drivers/net/pse-pd/Makefile
+++ b/drivers/net/pse-pd/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PSE_CONTROLLER) += pse_core.o
 
 obj-$(CONFIG_PSE_REALTEK_MCU) += realtek-pse-mcu-core.o
 obj-$(CONFIG_PSE_REALTEK_MCU_I2C) += realtek-pse-mcu-i2c.o
+obj-$(CONFIG_PSE_REALTEK_MCU_UART) += realtek-pse-mcu-uart.o
 obj-$(CONFIG_PSE_REGULATOR) += pse_regulator.o
 obj-$(CONFIG_PSE_PD692X0) += pd692x0.o
 obj-$(CONFIG_PSE_SI3474) += si3474.o
diff --git a/drivers/net/pse-pd/realtek-pse-mcu-uart.c b/drivers/net/pse-pd/realtek-pse-mcu-uart.c
new file mode 100644
index 000000000000..9baa17d8d31f
--- /dev/null
+++ b/drivers/net/pse-pd/realtek-pse-mcu-uart.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pse-pd/pse.h>
+#include <linux/serdev.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include "realtek-pse-mcu.h"
+
+#define RTPSE_MCU_UART_BAUD_DEFAULT	19200
+#define RTPSE_MCU_UART_TX_TIMEOUT	msecs_to_jiffies(100)
+#define RTPSE_MCU_UART_RX_TIMEOUT	msecs_to_jiffies(RTPSE_MCU_RESPONSE_MAX_MS)
+
+struct rtpse_mcu_uart {
+	struct rtpse_mcu_ctrl pse;
+	struct serdev_device *serdev;
+	struct completion rx_done;
+	spinlock_t rx_lock;		/* protects rx_buf and rx_len */
+	size_t rx_len;
+	u8 rx_buf[RTPSE_MCU_MSG_SIZE];
+};
+
+#define to_rtpse_mcu_uart(p)  container_of(p, struct rtpse_mcu_uart, pse)
+
+/*
+ * No framing is done here: a glitched frame costs one transaction, then
+ * the next _send re-frames from rx_len 0. Resync works by returning count
+ * (not take), dropping any overflow so serdev keeps no leftover to bleed
+ * into the next frame.
+ */
+static size_t rtpse_mcu_uart_receive(struct serdev_device *serdev,
+				     const u8 *buf, size_t count)
+{
+	struct rtpse_mcu_uart *ctx = serdev_device_get_drvdata(serdev);
+	size_t take;
+
+	scoped_guard(spinlock_irqsave, &ctx->rx_lock) {
+		take = min(count, sizeof(ctx->rx_buf) - ctx->rx_len);
+		if (take) {
+			memcpy(ctx->rx_buf + ctx->rx_len, buf, take);
+			ctx->rx_len += take;
+			if (ctx->rx_len == sizeof(ctx->rx_buf))
+				complete(&ctx->rx_done);
+		}
+	}
+
+	/* consume all to avoid desync/misalignment */
+	return count;
+}
+
+static const struct serdev_device_ops rtpse_mcu_uart_serdev_ops = {
+	.receive_buf = rtpse_mcu_uart_receive,
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+static int rtpse_mcu_uart_send(struct rtpse_mcu_ctrl *pse, const struct rtpse_mcu_msg *req)
+{
+	struct rtpse_mcu_uart *ctx = to_rtpse_mcu_uart(pse);
+	int written;
+
+	/* clear any leftover rx state before transmitting */
+	scoped_guard(spinlock_irqsave, &ctx->rx_lock) {
+		reinit_completion(&ctx->rx_done);
+		ctx->rx_len = 0;
+	}
+
+	written = serdev_device_write(ctx->serdev, (const u8 *)req, sizeof(*req),
+				      RTPSE_MCU_UART_TX_TIMEOUT);
+	if (written < 0)
+		return written;
+	if (written != sizeof(*req))
+		return -EIO;
+
+	return 0;
+}
+
+static int rtpse_mcu_uart_recv(struct rtpse_mcu_ctrl *pse,
+			       const struct rtpse_mcu_msg *req,
+			       struct rtpse_mcu_msg *resp)
+{
+	struct rtpse_mcu_uart *ctx = to_rtpse_mcu_uart(pse);
+
+	if (!wait_for_completion_timeout(&ctx->rx_done, RTPSE_MCU_UART_RX_TIMEOUT))
+		return -ETIMEDOUT;
+
+	scoped_guard(spinlock_irqsave, &ctx->rx_lock) {
+		if (ctx->rx_len != sizeof(*resp))
+			return -EIO;
+
+		memcpy(resp, ctx->rx_buf, sizeof(*resp));
+	}
+	return 0;
+}
+
+static const struct rtpse_mcu_transport_ops rtpse_mcu_uart_transport_ops = {
+	.send = rtpse_mcu_uart_send,
+	.recv = rtpse_mcu_uart_recv,
+};
+
+static int rtpse_mcu_uart_probe(struct serdev_device *serdev)
+{
+	u32 speed = RTPSE_MCU_UART_BAUD_DEFAULT;
+	struct device *dev = &serdev->dev;
+	struct rtpse_mcu_uart *ctx;
+	unsigned int baud;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->serdev = serdev;
+	ctx->pse.dev = dev;
+	ctx->pse.pcdev.owner = THIS_MODULE;
+	ctx->pse.transport = &rtpse_mcu_uart_transport_ops;
+	init_completion(&ctx->rx_done);
+	spin_lock_init(&ctx->rx_lock);
+
+	serdev_device_set_drvdata(serdev, ctx);
+	serdev_device_set_client_ops(serdev, &rtpse_mcu_uart_serdev_ops);
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to open serdev\n");
+
+	fwnode_property_read_u32(dev_fwnode(dev), "current-speed", &speed);
+
+	baud = serdev_device_set_baudrate(serdev, speed);
+	if (baud != speed)
+		dev_warn(dev, "could not set baudrate %u, controller uses %u\n",
+			 speed, baud);
+
+	serdev_device_set_flow_control(serdev, false);
+
+	ret = serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+	if (ret)
+		dev_warn(dev, "could not set parity to none: %d\n", ret);
+
+	return rtpse_mcu_register(&ctx->pse);
+}
+
+static const struct of_device_id rtpse_mcu_uart_of_match[] = {
+	{ .compatible = "realtek,pse-mcu-gen1", .data = &rtpse_mcu_gen1_data },
+	{ .compatible = "realtek,pse-mcu-gen2", .data = &rtpse_mcu_gen2_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rtpse_mcu_uart_of_match);
+
+static struct serdev_device_driver rtpse_mcu_uart_driver = {
+	.driver = {
+		.name = "realtek-pse-mcu-uart",
+		.of_match_table = rtpse_mcu_uart_of_match,
+	},
+	.probe  = rtpse_mcu_uart_probe,
+};
+module_serdev_device_driver(rtpse_mcu_uart_driver);
+
+MODULE_AUTHOR("Jonas Jelonek <jelonek.jonas@gmail.com>");
+MODULE_DESCRIPTION("Realtek PSE MCU driver (UART transport)");
+MODULE_LICENSE("GPL");
-- 
2.53.0

