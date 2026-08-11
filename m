Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A042643A
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439562; cv=none; b=cOhNqydSAcD3/vuXGsiT8mh4Mj+29kdn9GYKFddiP93jz+fLviFfUlYWDoOchiwCyw7crbgJCY6sx/i1fi4jTbgfp2rWKy+bIeR5mEXNqbsEd1BA+ZzzofgsW5xgojAKvKiEb6WwPpxCehM/jaIt8kcrJoIZ9HL8QTC3G/jYhfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439562; c=relaxed/simple;
	bh=QfaGrD5PK4T9fVP8DLGNnQwLAHh5R25DZ/Poef8hRPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cM1/e/6JHHi9P4UlepGXL2SriqPEqLCfci6SNxLR+EK2GRxQ+r/nnwJbo+KXgubc1IT/EMvSlW/eZERV/GQftWUvnDURMIWa+JWmptWzEhk2F1Kedv3725Ro6K1EHtQfQCHyKgHmGqTpa+GDyKlNtRgYCmNlbXWDOsNXSMkWvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIt/8ihX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIt/8ihX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4997581cdc1so4313665e9.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439556; x=1787044356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kciKuR8y+KyI5RgInUcoSau9Ylaam1ueLLu/72dbFbY=;
        b=KIt/8ihXAjMJS7LJ22KhXmf258Vs8y9Vg2Rpz9sD4KUwaFyd5jQsWsXguUrBmWRTKO
         vb76IDUAWBCHKK++bUdDyAjegrc1b2a4ZzM+Vh5OvaGjIQr72PZjyt+X1ZiW11pp/VxH
         dAxkCqVbK+D8YsB4Pdr/JU55fZB6nkjNqBDRepeysfc7GKs4CZ8D02vQGPDB/o015sUI
         WDpzQtF7E5LMlyr7jrwF9MNRa53LYsJYkSpPvVydUpgUXFS8LAZOiokXQNa3eKAsaWzs
         EqcoGcpahZyG/jzOK6sEMJ8WOGFUTi+WRWjU8F7MGSwQsBNngj2rdBGSMuj7cqBW6132
         6EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439556; x=1787044356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kciKuR8y+KyI5RgInUcoSau9Ylaam1ueLLu/72dbFbY=;
        b=kiRsEDJXsuoH85zR1saRoXWWNfaYfvQL7pKO9xIYKXtoM9ec9CI6Bk8zUOZSM5DxtP
         DGA+INYctRc+VUD+7TFDSGzeA6DioRew9FoS/34+OMlpxp+dBjQNLEWDo3wwWMri0Aq7
         +LIlls7nWPOvBzWHaMkkKAQrNJc8+DphM+26moF01yvmO95O3NP/BU6zmbBwPK4j39f9
         pfEUFrqZg9k/0oJS3oLavC0yvBoCR7ZqBj/XOTvm93UmTmjUkg6k3H0bQ5EhN9P/SbmX
         Cm8WTA3ugg5xhtEJbRzNydoasjO5T2HEOYrJQLdh2QlUqNOPtQFEn4pQ+oZlAOlgNGtN
         ErGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpj5Xif9WP1y0QSymROFbMVEXBaWewjPOnDxxxtcmW7a69ckdtjNURZsLfKz+9vXVVTv+SMLabfJQh1@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMMmVwQoBWK7khp1Wrg5JhERlkhXq0yR46dLAAKEvXufQmiYc
	/ddZEBwJotmAibx895HyPAkg9oG5eliTK8QpTpN/gIiVntSzjhXVLt7X
X-Gm-Gg: AR+sD10GZugKcuaYgPl3BmBPxjr0MZlpIvmkqu/MKqPQz8Fu0fHnjjxt2pgsLH+kDcO
	db/Ppdzt7ub8czybblBGkqJyNd5+HGIGfnj4h1T4gKEFgNHC6c2IDSTltoV++q0C8GNHT2SVQjs
	Ap3neYHsDHDcTEkuAh4Hm0gnpecVzX2CmWe1aD2x+V+y2NbmjbnZ5zBPMWfdtN/4yKJp1PBVMpI
	tg2TuGRqfSEGv9PsShcjfCnzuC8+ylfY2u7KMQqA7VZSLnRX2p27bRU6G6Cu0p7gf6vIVcowSfb
	AMqc16EAKUEdubIDCEGgVvwA/zXtCGQ2MQaRNCj0uUQFJPzOkwLEHRYPvb9V3zbXHnshpomGeOi
	wrnDoFnnLKqmJwZGue+REw3Q1hfy7DK1HReelxDkMU2umoFnSy441KptNIsBjpJThedgSRQ6cs+
	dpQ37m6W4ALMM4G6700f7rOkrplpZdWMzuFsRjcoDNUKjKIN9VuGgLpzvveTsn1Ec5OOf9fLs8Y
	Q==
X-Received: by 2002:a05:600c:3553:b0:499:7312:2d5f with SMTP id 5b1f17b1804b1-49978494c8cmr23761765e9.19.1786439556411;
        Tue, 11 Aug 2026 02:12:36 -0700 (PDT)
Received: from builder ([2001:9e8:f10e:2116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788f17ccsm25738935e9.11.2026.08.11.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:12:36 -0700 (PDT)
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
Subject: [PATCH net-next v13 4/4] net: pse-pd: realtek-pse-mcu: add UART transport
Date: Tue, 11 Aug 2026 09:12:16 +0000
Message-ID: <20260811091218.353399-5-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811091218.353399-1-jelonek.jonas@gmail.com>
References: <20260811091218.353399-1-jelonek.jonas@gmail.com>
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

