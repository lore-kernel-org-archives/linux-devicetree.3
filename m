Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542A9414A37
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337090; cv=none; b=XZQhrrDKrJjomndPxaSIeb7UJ3n3tRmojy+ExpUUZlq0in+9uOhCmMeMQf6rwcm50d9C1lnXaPAE/83LH/qQmKBLwynf/r+9bwIQXqzUfsYaQM/V5m7+7g1JZRjbSlgU+Z8lor7FtA1oamJM3KZstg3+2uPyMWJRPU5ThpC2jww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337090; c=relaxed/simple;
	bh=UmfJxJ8nhIHyUkERVrzBBo1YhOLLDzXmiqnhuCB/hWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ar1cXKYHsHh+LPOqwFHjUIaxzM8CAUz5+7dxsDp4bnuLGNmRPIpz5dODclsvJZqBoLxCQsVhgsAGi22XvE8rbwbIXDUnSjeih2rs1KM5Td+TFfYaOx6oralcxMli8/PO24cMQxFWm7XdYaxcqGtlTfeqRZQKmhwfRNvJP//defw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBBpq4/9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBBpq4/9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so18737345e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783337085; x=1783941885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmK9K2DaO6tNCCapIEUZmp/TbdlsdPw4vmN3f60Soh8=;
        b=WBBpq4/9i7e7/GdOaqtA0/yjXTaiAGTURt9SyXu1PKaOrJ6wcLyQax4cE7GZyK60Lz
         SM3+nFqjmc6110Dqup1600vBt9CU0Latuklp43JdPdsoV+n2xuM34pz5DS8vW7/h2J4R
         J7r2pUFSLUoI4MxJw6aB2PpSiJ2jTBmHj2UcDkQouvQUd+hN8fO0BP+0oidErK1DpTyJ
         x1a2z/YTcsD9tudSrHahJrc4G5FUdLoQYlBQtcBm1PlTmWcF3e4whR+J8tsiVCyP2DYd
         TBDHrEbmwPyGjxxBbIpzsieDBS5nDkr3SavhU7sXe/LCY2WUA/2mSnvTRpjO3LBxo4zv
         DHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337085; x=1783941885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RmK9K2DaO6tNCCapIEUZmp/TbdlsdPw4vmN3f60Soh8=;
        b=ZuqccxQeeN0V53FSyfJzimRp5B02IUOjEd0P1MwSpATFAzpFtwtaAqQdRrorOpCMmq
         2W1aIOUg61fRfabrmH9lt8zxyJKf2K7MyeAJpK6Srd4UzSePucvM6em4FUi4pyxqYFh0
         MArnZgSqTz8K5tI00ZsInR5SECBZks0OHyREl8KphYqafvLDzSh4exIy7ex5fZTndK5y
         Jjy/zm6HynpZyGyZVf7t1bzemPZWeF5uI306Vh/s6B44fxhO2OkEMNYfyR8Q0Cp1yD0K
         nowLxo/+n2dPKXyNjlNJtivXE7fYSKvCZJr98MnrFb5NVmypPnlgtYgUqx3klsmzSUsp
         jf7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqIHoIEysreXPWrhZpZmitAnxThijzArN/V02E2ejoIqm5cU9BhOYc71tZVQxNqAAxA52zmYrp256UK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb5GQBzQ+Vmt6f0KMOUIfELaRARdu6v6QWgMcONB1a8E7UAox9
	8V54MTsUTbxE2bxINEoHbPYKCaRm2qQ9mjPBPh3/B00oIzmTXOyNuyrY
X-Gm-Gg: AfdE7clZQ2RD2WtDJoHG5+Jmf+A47/BO6amhLN++zv/cngWeR2CX45Fx9rhWGbNUSQU
	ZaMcqb7hr0fywLAYW+IQK1xvSvpqUn3bw82Ef6r7FZwysEEal8McvZaiy4deigr46YXwbuzNk/Q
	xh2SLPd9oT68Buxq2ewhWA3TAxm4HzTYOh+jOKBJRQKPp0bxg4q/m4D5k1kKR37WSLKJVcM/INj
	FLpS8Fc1VB4oviz6JFxn1SzVVy5NJKieSMZIxb+Oxg6npnw9IqYL6tdOwH2/a+aLbdmiV2vCwR+
	WvDYYMWFXET0IoATkzlofwQwwdQFVoQFpTjsZIx6mj4np2n+aP7c5JxDO5RRDFWGSTL+1+bouKW
	c/zKro+b/08/i25XA86c6SgstxuRdiloA4YyYaYMkIhpjSqSXld3BvIsJPxKRIXdc972jGE4e9O
	VU5e7mDhkoo34rXI0=
X-Received: by 2002:a05:600c:8b12:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493dececcd3mr2531445e9.14.1783337084583;
        Mon, 06 Jul 2026 04:24:44 -0700 (PDT)
Received: from builder ([2001:9e8:f13c:d516:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm258903245e9.4.2026.07.06.04.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:24:44 -0700 (PDT)
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
Subject: [PATCH net-next v5 4/4] net: pse-pd: realtek-pse-mcu: add UART transport
Date: Mon,  6 Jul 2026 11:24:24 +0000
Message-ID: <20260706112425.3149226-5-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
References: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the serdev (UART) transport for the Realtek/Broadcom PSE MCU core. It
registers the MCU as a serdev device and provides the send/recv callbacks
the core uses to exchange the 12-byte frames, receiving asynchronously via
the serdev receive_buf callback.

The baud rate defaults to 19200 and can be overridden per board with the
"current-speed" property.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/net/pse-pd/Kconfig                |  11 ++
 drivers/net/pse-pd/Makefile               |   1 +
 drivers/net/pse-pd/realtek-pse-mcu-uart.c | 156 ++++++++++++++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu-uart.c

diff --git a/drivers/net/pse-pd/Kconfig b/drivers/net/pse-pd/Kconfig
index 7074d6733ff3..23e44dde3dbf 100644
--- a/drivers/net/pse-pd/Kconfig
+++ b/drivers/net/pse-pd/Kconfig
@@ -30,6 +30,17 @@ config PSE_REALTEK_MCU_I2C
 	  PSE silicon is not accessed directly. To compile this driver as a
 	  module, choose M here: the module will be called realtek-pse-mcu-i2c.
 
+config PSE_REALTEK_MCU_UART
+	tristate "Realtek/Broadcom PSE MCU driver (UART transport)"
+	depends on SERIAL_DEV_BUS
+	select PSE_REALTEK_MCU
+	help
+	  Driver for the microcontroller (MCU) that fronts the PSE
+	  hardware on switches with Realtek or Broadcom PSE chips, attached
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
index 000000000000..ef04e0d92963
--- /dev/null
+++ b/drivers/net/pse-pd/realtek-pse-mcu-uart.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
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
+	serdev_device_set_baudrate(serdev, speed);
+	serdev_device_set_flow_control(serdev, false);
+	serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+
+	return rtpse_mcu_register(&ctx->pse);
+}
+
+static const struct of_device_id rtpse_mcu_uart_of_match[] = {
+	{ .compatible = "realtek,pse-mcu-rtk", .data = &rtpse_mcu_rtk_data },
+	{ .compatible = "realtek,pse-mcu-brcm", .data = &rtpse_mcu_brcm_data },
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
+MODULE_DESCRIPTION("Realtek/Broadcom PSE MCU driver (UART transport)");
+MODULE_LICENSE("GPL");
-- 
2.51.0

