Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56447386554
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 11:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785064975; cv=none; b=GUyOqZzNLaccXTgrS3rVf3NRe1IK+owURtkCxnnGhfrYmC/xBAcPhEzK2K2H0m4GVZjFH5gSFOJPIJy9mVfX332s7WjtPApQDVQEvAU07ksIykxAs4I2CKSFLNdmnOZu5WBipfjcI6A6iCydASVMvL4itVqUszr8eXUcvKD4j2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785064975; c=relaxed/simple;
	bh=VL/g5CE7FJkYOSTy1f0FYtYFN2GRLoeQlOHWa07DRrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGkTEA9cRc0hILD2jH9kmC8j7Fs3BylHdKk9/++u3p4DF8PGiVMhimvc6eESww5woNMC/O9CDzOPlMG3kNTPzXZuRpjm6tfBHUTZmje/CPd42d0ZtNg5XeQE15fADB7PfqwkA7F+9mmrtMKJMFlcCz4uoHCHzqHh0bRh2m23gdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q62JOszW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q62JOszW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1335247f8f.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785064968; x=1785669768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7OnQKbzL42miSqebEG03z3AI3kA2cenK1gpZlkwILo=;
        b=q62JOszWaV7KUEfpyVeN3oMQ3bkq/APOT84CQZb03ZE6RmdhCAG2Xzg7iiD50skMns
         oFCEClUugbkZwlWvOtRsnqjmPdYGJ/PxxFZYMZ/re5SsUxJVZOrY9gIqKdggsBXREc7S
         W4kMjecL98O5VGZhJsDtPu/RgIvSLnH9+Jb5jp7groWN7EJHnEfXW1nzUirVDsPfctSw
         09OI7NbS3q2i0NsLEC+vsKbDCFrZQJ+HwUPiCwAaeNUhCKCnbGU7yNPK9oR+T5jrXAOz
         0NcLm/DYMOzsMZ/5SO5RUuZQo4woBW67p0IIrWS2uv4fraEXFbIC2e6wAyeEJDOAIS8A
         Vntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785064968; x=1785669768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7OnQKbzL42miSqebEG03z3AI3kA2cenK1gpZlkwILo=;
        b=qmEknmAlRxae/rXEQ52Yxp9MJAkm87pWqLJCVqiY2vV0YfPqmQJpnTl/ou8BNggjOJ
         jsXcw7WZvg8s8qdQTJNPMqZ8uFBXnoGSqEYbNrBRVRHNOaTXd9H3XfOQo1zfiHtROTqU
         QSGxQqBGDoQAwNUsk2HyMxVrkOEL6pcdtGPp/zEqX+yScraOyfLkIXQjABiGY/yGMVpy
         6JY667XCbuyuphrzcaltufN+fdI8m1C7FfZNa9X/4174ahcxEaf4xQHcU+2vdSvoFDF0
         0KqjI8B4H6k6JEJ7clLSje5fNjKMq1uFtdc0RRnDBmqdjQHDot3Vs+xBhWIr4aDcZI9e
         ptEw==
X-Forwarded-Encrypted: i=1; AHgh+RqxELCLeL9Wb1LtN6pNRvPhgfm99duEpCaEKCL4WKvwCAf+zzZsia1/FsqET/ja03TdV/OwHReEa+0T@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiD2xNrlWfmN30dZiriQVCjRQSmimVidQ3e9juXD2yXncBjwn
	PurX8+R6Vuq047x2Gb8hDvV4wg/Xhl8cXccoK38Lct4iRukJb0h5vG76
X-Gm-Gg: AR+sD12LuIc+Q5sixD7XRsqgfLj3PF3v2LiIh8UmJRCzY9RFbHXRwkSDSZlHZdn3PWO
	kHAzei/Qas/8ZiZAICQYUguFTbVIImO5g58nKdH+NIp0vurxi3ymWqKfCUbHzqXi8JNLqQs6FXm
	271dBCbrxaRYyicFjBAVLXbIBfMeSRyzQG7Wc0iUwyW9zLTyhlLFIIGhSJkJoBqOLRrWKQewy/a
	8M7bS4is/dbWbaAwtsRMB81lfRp1VHlXBXx1CLZG2RpT+JM/STuy8JWBtWjM/LxA48AgCb3nZkz
	J2VISSslLzx7Yi9td5aM+WBlsuYN/3HCKqxDbNB5oTKNXZEwunjKwbR+lxsdI1t9RE4TiIfza3b
	G4/3WlpjISLuoLlMh3R2UeeKV2FBaMPgOJ2ZUWPpnY43pguKdL1En3YnR+mbDet53Iq/QkMtb+f
	VTnuEZ
X-Received: by 2002:a05:6000:25c3:b0:47f:6dcb:3737 with SMTP id ffacd0b85a97d-47f9fe9ea99mr5503563f8f.29.1785064968332;
        Sun, 26 Jul 2026 04:22:48 -0700 (PDT)
Received: from builder ([2001:9e8:f12e:8416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm24902981f8f.26.2026.07.26.04.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 04:22:48 -0700 (PDT)
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
Subject: [PATCH net-next v9 4/4] net: pse-pd: realtek-pse-mcu: add UART transport
Date: Sun, 26 Jul 2026 11:22:22 +0000
Message-ID: <20260726112223.1286074-5-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260726112223.1286074-1-jelonek.jonas@gmail.com>
References: <20260726112223.1286074-1-jelonek.jonas@gmail.com>
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

