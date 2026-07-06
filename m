Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B543FE677
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337087; cv=none; b=SjE2hdaTo5+NHSnrd7IxcJ3FgYCK8ZUmU+AwkmbZ9z1H7new+813R6b8hVHf6ng+FxL5IK+YJePFw/EHHVM3kaIC2O9BkNSuVVrBNLjxXo5ds/315DU5yCJ3scwczRPx3sOtRHbKgLjry8FkufOdHCDtoeTRkV1qoBbXvlG+e60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337087; c=relaxed/simple;
	bh=IoLwpj0Oc/wRXTWhdV0K7RGU0OItAbdA41jadgeYGW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eghNK92fP6Nm++1vTGbLp0sOkBsjZrDIQ0s+YvhX1I0gwgo+LTyNE3rhgZwVpfEc6SnnXrZDgRJQAHQFXuNaXj/Yh99KZ0K5h//W3cg+8fz6ZLPfFO5tL9MKTlnQifSms1IDQ5eVfDfy/Aq0bsZ2KuzG573wNPNaoRJ5GVAVcOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyrSrSMf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyrSrSMf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so19872655e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783337084; x=1783941884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3wXm3ZFK3RS/54OX3WM5P3/OSQWApUo1TE0TM+meZ4=;
        b=YyrSrSMfmNHrzy6a4ZYcJr2v47iZyD7T0MhwdsmQ+U7L+k/cE5/VPiXYEBd7rNqPNh
         F9YkXJ/PXejFdOqmDDcGRLHZNisi87VtEuNGjT7GbdI2XkFKYjnGPcciUXMwZxYU3A3C
         olncUft8+/BHf7fq3blLk9cJ8MOoYkO/F5Hkg8dQYM50zL7sT5sSLOAPjj4QpLAnlr6F
         cZUNafymFwyFQo/natgBKtka0Ce/+j+pkoeAJ4Ubpj4JD8BUw701g1LKYZl/xUgcnpub
         0UmlVRqEb/X+bwS8eO4orXi6X8GNvQFnOYBw8Bd0bPD4m2pQZJ6XI/bKbwMcA/+kb1EM
         90xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337084; x=1783941884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3wXm3ZFK3RS/54OX3WM5P3/OSQWApUo1TE0TM+meZ4=;
        b=A/rVs4Ba+Hy+momFD1VWiBi78mA85c5kJ+BdJMglNm7TxpgQ6UmOPdOAVLFnyW5nG/
         07NOrs3gfKSPA5YL60Wt8YOmjqOakrtQkzKMa7FE1NPW141ITIB+0sb1jhu30hW0rDib
         PI+WJmn1CBDPRUwooYlEUeQXfbn9gn1Bh3sKiqa9xlBgbHrGJHYNzpMTr26SlS5m/gJw
         /QGnVIbxxfS/XiSgDFfv9N8iUHfG25dqBjt7g2di5TK6eX8zqAWjKDhYNJAfvSpCjRaO
         VGV3f6QMPEhClYlTOdc4uOl1+5QDdYkG4jjzbhxlofIQU9hyP9l0tIjSc1yR4Z5gP3Tp
         xrOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmuY4GE5o1/e7QzzJcxhmc9bi1EWTEAIxQ+T+cxfX1RISiyLTzxEoXg6e3mJ+5oWhulsmG8ktIjeBO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9uZ3gT/myOzn74jI58TiSyYz61a8VlsyitNjf/QHwWlg7+PkA
	ND5YzJS4VdaxoWWTSG2LVujkqayn3A7OEB12Fcm2ZIPeqioJEyHVUpt2
X-Gm-Gg: AfdE7cmw86qg0Dfs82ZpCFHnrWpKSPhF5X0r9LS8bg/14z+CjDJR7NmeyvxTHDNFynI
	Gjd/nOKTJsTigYJ+Y4t1kwxB3yuszy0PrvpvM3ONGFWf1Ms/cTRgmv34NLwieg3XNQQHMAgrDtC
	faHyzhloC5efyFiT7J/8ry97A2EOId6EFTXkIXUZMu/WR+ImOcQiCma0PEEBMjx2WLPZlCg4rFP
	vhRWDT35k0AzUDZHZ5pzOfyp5/VdK9GwPEDRHg68ZxWtfDTNRWXeS3vplGk65E74hel/dvHHK11
	dsU+FdULRVrXAHZCzH9p+XM9PrU6G1QbXalNmccPUi0aq4sp83qrHUwf04Nx01IM5Vk5YUWlc97
	U9DPueony20lUCA/grBUVWlFnmMFBoR5yCDfPK17viGy3wFvtJpM8XP1kIgWbJG3386/kNDxpT1
	ln3rdw9trqC3unr9E=
X-Received: by 2002:a05:600c:6692:b0:493:ca3a:d738 with SMTP id 5b1f17b1804b1-493df055a84mr415e9.7.1783337083731;
        Mon, 06 Jul 2026 04:24:43 -0700 (PDT)
Received: from builder ([2001:9e8:f13c:d516:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm258903245e9.4.2026.07.06.04.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:24:43 -0700 (PDT)
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
Subject: [PATCH net-next v5 3/4] net: pse-pd: realtek-pse-mcu: add I2C transport
Date: Mon,  6 Jul 2026 11:24:23 +0000
Message-ID: <20260706112425.3149226-4-jelonek.jonas@gmail.com>
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

Add the I2C/SMBus transport for the Realtek/Broadcom PSE MCU core. It
registers the MCU on an I2C bus and provides the send/recv callbacks the
core uses to exchange the 12-byte frames.

The MCU firmware expects one of two framings on the I2C bus, selected per
board via the "realtek,i2c-protocol" property: "smbus" (reads carry a
leading command byte and a repeated start) or "i2c" (bare block writes and
reads). The property is required for the Realtek dialect; the Broadcom
dialect and boards that omit it default to SMBus framing.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/net/pse-pd/Kconfig               |  11 ++
 drivers/net/pse-pd/Makefile              |   1 +
 drivers/net/pse-pd/realtek-pse-mcu-i2c.c | 163 +++++++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu-i2c.c

diff --git a/drivers/net/pse-pd/Kconfig b/drivers/net/pse-pd/Kconfig
index 626f47b8acd7..7074d6733ff3 100644
--- a/drivers/net/pse-pd/Kconfig
+++ b/drivers/net/pse-pd/Kconfig
@@ -19,6 +19,17 @@ config PSE_REALTEK_MCU
 	  Shared core for the Realtek/Broadcom PSE MCU driver. This is
 	  selected automatically by the transport options below.
 
+config PSE_REALTEK_MCU_I2C
+	tristate "Realtek/Broadcom PSE MCU driver (I2C transport)"
+	depends on I2C
+	select PSE_REALTEK_MCU
+	help
+	  Driver for the microcontroller (MCU) that fronts the PSE
+	  hardware on switches with Realtek or Broadcom PSE chips, attached
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
index 000000000000..6e6e3645c509
--- /dev/null
+++ b/drivers/net/pse-pd/realtek-pse-mcu-i2c.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pse-pd/pse.h>
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
+	int ret;
+
+	ret = i2c_master_send(client, (const u8 *)req, RTPSE_MCU_MSG_SIZE);
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
+
+	for (tries = 0; tries < RTPSE_MCU_I2C_MAX_TRIES; tries++) {
+		if (tries > 0)
+			msleep(RTPSE_MCU_I2C_RETRY_MS);
+
+		ret = i2c_master_recv(client, (u8 *)resp, RTPSE_MCU_MSG_SIZE);
+		if (ret < 0)
+			return ret;
+		if (ret == RTPSE_MCU_MSG_SIZE && rtpse_mcu_resp_is_final(req, resp))
+			return 0;
+	}
+
+	return -ETIMEDOUT;
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
+	bool use_native = false;
+	int ret;
+
+	match = device_get_match_data(dev);
+	if (!match)
+		return dev_err_probe(dev, -ENODEV, "missing match data\n");
+
+	if (rtpse_mcu_needs_i2c_proto(match)) {
+		const char *proto;
+
+		ret = device_property_read_string(dev, "realtek,i2c-protocol", &proto);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "missing required \"realtek,i2c-protocol\" property\n");
+
+		if (!strcmp(proto, "i2c"))
+			use_native = true;
+		else if (!strcmp(proto, "smbus"))
+			use_native = false;
+		else
+			return dev_err_probe(dev, -EINVAL,
+					     "unknown realtek,i2c-protocol \"%s\"\n", proto);
+	}
+
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
+	{ .compatible = "realtek,pse-mcu-rtk", .data = &rtpse_mcu_rtk_data },
+	{ .compatible = "realtek,pse-mcu-brcm", .data = &rtpse_mcu_brcm_data },
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
+MODULE_DESCRIPTION("Realtek/Broadcom PSE MCU driver (I2C transport)");
+MODULE_LICENSE("GPL");
-- 
2.51.0

