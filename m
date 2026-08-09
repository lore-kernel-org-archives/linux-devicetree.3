Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FFF3CEBB7
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786274596; cv=none; b=ZqihO7namfQp/hD6U7ZhduhQxXXZ3PBX8Eg7itoenMWWELC4Ld5woZpFKEh+qfS6qYBpsXvqCcJTlGGFOOWeyzGaITY7+dmTVoSBc2DRBWrYSc+QTC1op0X7i6Hwd+Qc5cMTEmvnbw5gwxccouhrHqP/l3BqcblHPveNxu/8hI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786274596; c=relaxed/simple;
	bh=TWC42KHRA99mOUxjvK7KWmd5j/41prlmkSt9b0Ksxyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q20Tb9zg7IylJPEo8FMfLpl8THxc9i4nVQPIkhtzvN4EFT8k3mCG0bWP2+wGBoFUPLRhrgzGcIFvPGwvHjzh6viVjXs1og2mMusYas2R/fqZvyLYNlHBJZ2pOc24ay7OFF9NRprfWQ8M+kBDzYcxvsIEQZlfgjhxLyOEbTrS3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKzMndds; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKzMndds"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954dff6536so8130785e9.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786274591; x=1786879391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BCX4v0DhWllNqKiGGZVB2uHNQ0xsH23pXC+LPhYJa8=;
        b=DKzMndds4lNuoHUFO3qPC/WJ+a6lBGkppdZSCVGYlPgpEvMxA1yeEJYpcGbGy2LPWu
         tBiOyoeIHaT2hRZiVyC5Q9Qj7YK2U8rBzGuAZQOnVAQFIQHKNVO2N9xbfO48aztEj5Pl
         QJo1cVWorZAc49+gmWMfJijqHpW04rfBvLKM+L+/QYQPNmHgnOUm2M1EiGJwjkt1G+bS
         nyHSHTuxlf2FJ5E9fIJ2VbMhZJiA3wY6BJ4maQOF4mVhVkyg4dYxMGgaQzCSKu3zpgNU
         G4S8lXJhQ3HUVCcEG9YDy8XPQf5EprF32npS8ZxNqACdIsBcfni20F8a+Ef0I4YcafPO
         1YrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786274591; x=1786879391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0BCX4v0DhWllNqKiGGZVB2uHNQ0xsH23pXC+LPhYJa8=;
        b=buzN6wUnh+bCN1dirLPS3w+dIT8MGADbaLjUofQHoZ+tLly6Y9dm0nyuLx+cCVtACY
         EOsMnFAXh6vNM8fGU9+/BQ1vSXsUTwJK6QvRwYc/Wtous3fkehjlNstCfEqn21w4/L+D
         9FNBbog3SfJvxKfOgn62jnITK0bpLEgvxHFXHvbSLaDUfV+TssDnq8pdvBpVKkpnTIw6
         8c1eSCIBuHjiHg8yIOHZU1CHmi8Ih6PHLD5Gp29dDt+6rk0W8iJOS8B60kkv2shFb1Jj
         lDLXIGVv/WywM0Bg0p73lV4mqhfz7WPMlO5js46I9VqQ9HAa8nmDAsi7AlV4qb9AkkwA
         zTrg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2R4KE+bKztpQnUbmF784w7lslCYbKJjjXrBHb1ypdKVspUBonrRTh0yfUqa+weHQBvb9YAnqXQISs@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0WJkSy3sMYZTZco71UFf6njY269w/ZeJGR263DT3MiAMV/xn
	b6cCULkTWD4KrQund84+QTQbHFlZ7pAoNesEHp/1ldJZ50C4t8RqDH64
X-Gm-Gg: AR+sD13waoSjIoYLDmzW6U/KjzILm8GkbmXX3JPgeOO0Yx2YU5iKlFPIseIBwgNYQA+
	usbwVMR2ifkUjOZg8AwwfkRv1mmkzPoRZzPr79C4p5V0WXcsVwORD5FGN2lUmki/+6dp2UiSNhW
	qxKdN7EXVcxoDZjXvdpK+Ymoyic6VqgD4AVI+s3ZD88QIKNmdUb8/0vorXLPE59wLSa6XPKhNng
	dt12kAYUmimvsiQaahuXSLV4YwCFCrPIGa9d0nRs+u0JHV3D1JuMH7Tf0ip9T7dC/vQIpyD+yXr
	n7RDEkzW6rSWfu1I2xwJ+RvUQHCPfhGgHD5j3O1EhPsG/lEyX9ZxdYLbd2oC8T9PUVyZcFElLDn
	Vcnv00yiBhue05mNzahKKVeos+X/nPxqECjR8+MOZ7reanF1Yr5UWeeYm5lVHtHk1eE+vJ/ZmTA
	c0GJwfTljO5WQSY/xIW2k8lIueRQC4GIaKn/aXhUY0ukstmkxX/ta9W5axX/pujBk=
X-Received: by 2002:a05:600c:1f85:b0:495:734e:4825 with SMTP id 5b1f17b1804b1-49959e3c571mr283645505e9.16.1786274591009;
        Sun, 09 Aug 2026 04:23:11 -0700 (PDT)
Received: from builder ([2001:9e8:f105:3c16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f9182sm23156775f8f.28.2026.08.09.04.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 04:23:10 -0700 (PDT)
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
	Sander Vanheule <sander@svanheule.net>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH net-next v12 4/4] net: pse-pd: realtek-pse-mcu: add UART transport
Date: Sun,  9 Aug 2026 11:22:50 +0000
Message-ID: <20260809112251.5797-5-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809112251.5797-1-jelonek.jonas@gmail.com>
References: <20260809112251.5797-1-jelonek.jonas@gmail.com>
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
---
 drivers/net/pse-pd/Kconfig                |  11 ++
 drivers/net/pse-pd/Makefile               |   1 +
 drivers/net/pse-pd/realtek-pse-mcu-uart.c | 176 ++++++++++++++++++++++
 3 files changed, 188 insertions(+)
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
index 000000000000..af8bd8ace00e
--- /dev/null
+++ b/drivers/net/pse-pd/realtek-pse-mcu-uart.c
@@ -0,0 +1,176 @@
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
+	unsigned long timeout = RTPSE_MCU_UART_RX_TIMEOUT;
+	bool final;
+
+	/* Wait past a non-final frame (transient NOT_READY / stale) within budget. */
+	do {
+		timeout = wait_for_completion_timeout(&ctx->rx_done, timeout);
+		if (!timeout)
+			return -ETIMEDOUT;
+
+		scoped_guard(spinlock_irqsave, &ctx->rx_lock) {
+			if (ctx->rx_len != sizeof(*resp))
+				return -EIO;
+
+			memcpy(resp, ctx->rx_buf, sizeof(*resp));
+			final = rtpse_mcu_resp_is_final(req, resp);
+			if (!final) {
+				reinit_completion(&ctx->rx_done);
+				ctx->rx_len = 0;
+			}
+		}
+	} while (!final);
+
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

