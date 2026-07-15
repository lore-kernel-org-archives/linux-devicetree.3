Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED63C73D9
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102167; cv=none; b=bau4QTmhN3bB7bJkaj/M6VaG/u4I4ejwnOlVgp2CfmCoHlxJNO1uDaG9eR1eRv/g2ZVoa/y6G1rf3n0CGNJkfvOO0jzEaNJwnU5zbQLIfn8pqMQLNzTW/wU6OzxpoyYJmyiSx7wolyhcnd/rIhovVBivhhAPN6DJHfHLdCNglVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102167; c=relaxed/simple;
	bh=FXIWaikWvBRtfU1J3KOdHnX5xaM/te2Hxobie9hcoaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZI3uNDowUeOoSSzMZAa0hMF+qKMVC0+KZ9o2kKP/LZSgwsn8eTThOBfOzfuYmNUsffw3ANLYblgHxzLd4JqgAG8ghcfCVnVGko7HL2Mu4v1d1OBE6xPabUKMxGxzjTihy+lIMb5kFtaZO1zPvRYauvbfKrAF/XWOVDeZ6Qj/VFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxzQKdYc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxzQKdYc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso30801885e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784102162; x=1784706962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDlpe2ppLDWV18JTmkBQtiHTRCRohI8EE5C61VgWrzc=;
        b=DxzQKdYcG+k3YLc+pcG8qtKcdueuuO813NK/G04gxnztQJYyuUajgjhipMi86hyder
         AhZTTs2tZ69IyL9y7Jd6Ohu2at6XGzZonyAfk7ZG4L2dcBPWDIPNo7ugXQRW3cI+YOBZ
         n7MO83kQn+Tx/A/fZW/2Ce6Z7VRNGMypu6y2grxvW+nZp+ZPUUOpdhHSOaNs0rTkxioO
         nsAlF0wttFX0tGP7DKyqba0Ma8N+e0fjPrJL/NVMHo4uD3z34HXFESlOuFHklTFEHieV
         tA0CNpgULpfPremvw8lw3h/GSUd0A7NoJRTKbK/BmS1j3V+Ebl80FPRVvcYEnE9saJDI
         /c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102162; x=1784706962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDlpe2ppLDWV18JTmkBQtiHTRCRohI8EE5C61VgWrzc=;
        b=dw2icIHXOV2Glhnkw8S52sBdgDScMjK77oCrEK2lSzk8+tRqX4AJNwKYTB9MW1325U
         FLcSX6jscboJLtTlANuMKJMtyyYeM/D+8QUtkPUVXbIHo5m+we9MkXx1iDGu6P+6wleL
         tqfLf89v/Ictacbqqu9unNhuPkGonjy2vUl/BrmKQPvGxMB0C6Zm1Qgzwju1e6s4+wOB
         g6v3/UUtpftB/DSi3hTZSoy+VtqPrqekQSzXRD3htnybfNEK1g8/CMkO7Lv3TgFlohdD
         PGpe3QEL08JUDAW0ZGsYvb3MurDz60DR/FBPqAyahwA07+wnxBITfb81sEKx3FMcGuGW
         CMOA==
X-Forwarded-Encrypted: i=1; AHgh+Rrf5Sa/JT+8JG278Tr1ufvcIV+0iHR1DWDIjs9WkEi5M7fDr5T7JJbYJR3FyX56FEjomz+W26H3zCmz@vger.kernel.org
X-Gm-Message-State: AOJu0YxrDZ9vyMb99rsKltyRmyrsXoZ1OejZHwmzxm2Vdto8zpF9kgeG
	v511jbO+uRlTb4puolC2grqrTiRHHXINotNFiZeMbtlsb9YRnQSsuYMG
X-Gm-Gg: AfdE7cnWc5bcvtq+vG4MV60IgGNWSwjEeRQMiXi5WeJKUbsL7uB+J5Ir7vVwiYQqDFo
	HZw7y5e3qPskjK5nOY72XysgTwHsbI9BLP6O+7dsaJ1i+8FQAuthjf1100BxZgoCNEY3zuy5Joe
	/8SDmH7JT1BKcVeQXH8SeR3yokHIs9aE3Z9omccn9oWLxWeDhZXyWUYx/FEM4OW1uPgh3HnwUCh
	k/cZjCUdGfi7cDgZVWg9o21/VI+6YcZd7e/ZvyAMFnKJDTjwmCWtOjRVhkSqrVicoVetLis8FcH
	F+HXTYmEM0jQ4aVRJf1RLlj4nKRPAyjQh0bVoFkk5noa94r1EZJ/glSU45Gb+tWvhfA3Skd6VOR
	z+kqGTdHl8whK/2Z2le+AVDrLR50s8eGK6CcVWe4LOQFJ3IPsTX4lRLjLYcq6iKbJVUEZqk2ug0
	23KRET88zgWMxaYhs=
X-Received: by 2002:a05:600c:4f90:b0:493:af56:8e64 with SMTP id 5b1f17b1804b1-49538a1755cmr56357035e9.32.1784102161960;
        Wed, 15 Jul 2026 00:56:01 -0700 (PDT)
Received: from builder ([2001:9e8:f12f:cb16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm16219701f8f.18.2026.07.15.00.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:56:01 -0700 (PDT)
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
Subject: [PATCH net-next v8 3/4] net: pse-pd: realtek-pse-mcu: add I2C transport
Date: Wed, 15 Jul 2026 07:55:27 +0000
Message-ID: <20260715075530.2491534-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715075530.2491534-1-jelonek.jonas@gmail.com>
References: <20260715075530.2491534-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the I2C/SMBus transport for the Realtek PSE MCU core. It registers
the MCU on an I2C bus and provides the send/recv callbacks the core
uses to exchange the 12-byte frames.

The MCU firmware expects one of two framings on the I2C bus, and which one
is part of the compatible: '-smbus' (reads carry a leading command byte
and a repeated start) or raw '-i2c' (bare block writes and reads). The
match data flags the raw-I2C case; SMBus is the default because that's
what the majority of devices uses.

Because i2c_master_send()/i2c_master_recv() may DMA, the raw-I2C path
bounces each frame through a heap buffer rather than the core's stack
buffers; the SMBus path is unaffected.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/pse-pd/Kconfig               |  11 ++
 drivers/net/pse-pd/Makefile              |   1 +
 drivers/net/pse-pd/realtek-pse-mcu-i2c.c | 170 +++++++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu-i2c.c

diff --git a/drivers/net/pse-pd/Kconfig b/drivers/net/pse-pd/Kconfig
index 3b0c245a2bc7..6d14c8832e8b 100644
--- a/drivers/net/pse-pd/Kconfig
+++ b/drivers/net/pse-pd/Kconfig
@@ -19,6 +19,17 @@ config PSE_REALTEK_MCU
 	  Shared core for the Realtek PSE MCU driver. This is selected
 	  automatically by the transport options below.
 
+config PSE_REALTEK_MCU_I2C
+	tristate "Realtek PSE MCU driver (I2C transport)"
+	depends on I2C
+	select PSE_REALTEK_MCU
+	help
+	  Driver for the microcontroller (MCU) that fronts the PSE
+	  hardware on various Realtek-based managed switches, attached
+	  via I2C/SMBus. The MCU exposes a message-based protocol; the actual
+	  PSE silicon is not accessed directly. To compile this driver as a
+	  module, choose M here: the module will be called realtek-pse-mcu-i2c.
+
 config PSE_REGULATOR
 	tristate "Regulator based PSE controller"
 	help
diff --git a/drivers/net/pse-pd/Makefile b/drivers/net/pse-pd/Makefile
index bf35e2a5b110..ef869bba5ed9 100644
--- a/drivers/net/pse-pd/Makefile
+++ b/drivers/net/pse-pd/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_PSE_CONTROLLER) += pse_core.o
 
 obj-$(CONFIG_PSE_REALTEK_MCU) += realtek-pse-mcu-core.o
+obj-$(CONFIG_PSE_REALTEK_MCU_I2C) += realtek-pse-mcu-i2c.o
 obj-$(CONFIG_PSE_REGULATOR) += pse_regulator.o
 obj-$(CONFIG_PSE_PD692X0) += pd692x0.o
 obj-$(CONFIG_PSE_SI3474) += si3474.o
diff --git a/drivers/net/pse-pd/realtek-pse-mcu-i2c.c b/drivers/net/pse-pd/realtek-pse-mcu-i2c.c
new file mode 100644
index 000000000000..e10f8c633b68
--- /dev/null
+++ b/drivers/net/pse-pd/realtek-pse-mcu-i2c.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pse-pd/pse.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "realtek-pse-mcu.h"
+
+/*
+ * The core has already waited RTPSE_MCU_RESPONSE_MS before calling us, so
+ * the response is normally ready on the very first read. For commands the
+ * MCU produces more slowly, keep polling at the typical response cadence
+ * up to the worst-case ceiling.
+ */
+#define RTPSE_MCU_I2C_RETRY_MS	RTPSE_MCU_RESPONSE_MS
+#define RTPSE_MCU_I2C_MAX_TRIES	(RTPSE_MCU_RESPONSE_MAX_MS / RTPSE_MCU_I2C_RETRY_MS)
+
+static int rtpse_mcu_i2c_smbus_send(struct rtpse_mcu_ctrl *pse, const struct rtpse_mcu_msg *req)
+{
+	struct i2c_client *client = to_i2c_client(pse->dev);
+
+	/* Send opcode as SMBus command byte; remaining 11 bytes as block data */
+	return i2c_smbus_write_i2c_block_data(client, req->opcode, RTPSE_MCU_MSG_SIZE - 1,
+					      (u8 *)req + 1);
+}
+
+static int rtpse_mcu_i2c_smbus_recv(struct rtpse_mcu_ctrl *pse, const struct rtpse_mcu_msg *req,
+				    struct rtpse_mcu_msg *resp)
+{
+	struct i2c_client *client = to_i2c_client(pse->dev);
+	int tries, ret;
+
+	for (tries = 0; tries < RTPSE_MCU_I2C_MAX_TRIES; tries++) {
+		if (tries > 0)
+			msleep(RTPSE_MCU_I2C_RETRY_MS);
+
+		/* MCU needs 0x00 as command byte for read */
+		ret = i2c_smbus_read_i2c_block_data(client, 0x00,
+						    RTPSE_MCU_MSG_SIZE,
+						    (u8 *)resp);
+		if (ret < 0)
+			return ret;
+		if (ret == RTPSE_MCU_MSG_SIZE && rtpse_mcu_resp_is_final(req, resp))
+			return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
+static const struct rtpse_mcu_transport_ops rtpse_mcu_i2c_smbus_ops = {
+	.send = rtpse_mcu_i2c_smbus_send,
+	.recv = rtpse_mcu_i2c_smbus_recv,
+};
+
+static int rtpse_mcu_i2c_native_send(struct rtpse_mcu_ctrl *pse, const struct rtpse_mcu_msg *req)
+{
+	struct i2c_client *client = to_i2c_client(pse->dev);
+	void *buf;
+	int ret;
+
+	/* i2c_master_send() may DMA, so the buffer must not be on the stack. */
+	buf = kmemdup(req, RTPSE_MCU_MSG_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = i2c_master_send(client, buf, RTPSE_MCU_MSG_SIZE);
+	kfree(buf);
+	if (ret < 0)
+		return ret;
+	return ret == RTPSE_MCU_MSG_SIZE ? 0 : -EIO;
+}
+
+static int rtpse_mcu_i2c_native_recv(struct rtpse_mcu_ctrl *pse, const struct rtpse_mcu_msg *req,
+				     struct rtpse_mcu_msg *resp)
+{
+	struct i2c_client *client = to_i2c_client(pse->dev);
+	int tries, ret;
+	u8 *buf;
+
+	/* i2c_master_recv() may DMA, so read into an off-stack buffer. */
+	buf = kmalloc(RTPSE_MCU_MSG_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (tries = 0; tries < RTPSE_MCU_I2C_MAX_TRIES; tries++) {
+		if (tries > 0)
+			msleep(RTPSE_MCU_I2C_RETRY_MS);
+
+		ret = i2c_master_recv(client, buf, RTPSE_MCU_MSG_SIZE);
+		if (ret < 0)
+			goto out;
+		if (ret == RTPSE_MCU_MSG_SIZE) {
+			memcpy(resp, buf, RTPSE_MCU_MSG_SIZE);
+			if (rtpse_mcu_resp_is_final(req, resp)) {
+				ret = 0;
+				goto out;
+			}
+		}
+	}
+	ret = -ETIMEDOUT;
+out:
+	kfree(buf);
+	return ret;
+}
+
+static const struct rtpse_mcu_transport_ops rtpse_mcu_i2c_native_ops = {
+	.send = rtpse_mcu_i2c_native_send,
+	.recv = rtpse_mcu_i2c_native_recv,
+};
+
+static int rtpse_mcu_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	const struct rtpse_mcu_match_data *match;
+	struct rtpse_mcu_ctrl *pse;
+	bool use_native;
+
+	match = device_get_match_data(dev);
+	if (!match)
+		return dev_err_probe(dev, -ENODEV, "missing match data\n");
+
+	/* The framing (raw I2C vs SMBus) is carried by the match data. */
+	use_native = match->native_i2c;
+	if (use_native) {
+		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+			return dev_err_probe(dev, -EOPNOTSUPP,
+				"plain-I2C MCU protocol requires I2C-capable adapter\n");
+	} else {
+		if (!i2c_check_functionality(client->adapter,
+					     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
+					     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
+			return dev_err_probe(dev, -EOPNOTSUPP,
+				"SMBus MCU protocol requires SMBus I2C-block support\n");
+	}
+
+	pse = devm_kzalloc(dev, sizeof(*pse), GFP_KERNEL);
+	if (!pse)
+		return -ENOMEM;
+
+	pse->dev = dev;
+	pse->pcdev.owner = THIS_MODULE;
+	pse->transport = use_native ? &rtpse_mcu_i2c_native_ops : &rtpse_mcu_i2c_smbus_ops;
+
+	return rtpse_mcu_register(pse);
+}
+
+static const struct of_device_id rtpse_mcu_i2c_of_match[] = {
+	{ .compatible = "realtek,pse-mcu-gen1-smbus", .data = &rtpse_mcu_gen1_data },
+	{ .compatible = "realtek,pse-mcu-gen2-smbus", .data = &rtpse_mcu_gen2_data },
+	{ .compatible = "realtek,pse-mcu-gen2-i2c", .data = &rtpse_mcu_gen2_i2c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rtpse_mcu_i2c_of_match);
+
+static struct i2c_driver rtpse_mcu_i2c_driver = {
+	.driver = {
+		.name		= "realtek-pse-mcu-i2c",
+		.of_match_table	= rtpse_mcu_i2c_of_match,
+	},
+	.probe		= rtpse_mcu_i2c_probe,
+};
+module_i2c_driver(rtpse_mcu_i2c_driver);
+
+MODULE_AUTHOR("Jonas Jelonek <jelonek.jonas@gmail.com>");
+MODULE_DESCRIPTION("Realtek PSE MCU driver (I2C transport)");
+MODULE_LICENSE("GPL");
-- 
2.53.0

