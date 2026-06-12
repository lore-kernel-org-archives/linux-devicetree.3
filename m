Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C638910F
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278479; cv=none; b=opEGk44tVlL4hCIl/7+EwIdTau6z9UAaNbzUq/UHspvRpw0ooWtCzF/3egc+d2K1hXj+EdhXZDWaHaf91DJvjPjedOnZj9bPkDD1RkjHT8y15I/dDXcFnFNjswxXalbHF3B1oIqSkAhmDpqZV/TqN8PPcuWbOpOsZf/x9UQpJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278479; c=relaxed/simple;
	bh=pO9z3jMa8HkpZeV2bnc4gj2kfzujnJX0LE3K/RZ5nqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0I0voO/MQIuO1BpwAbsa2NKLlvWHj9jByZHU8a6z43XatCohDg8SqRseHS+8DdU2mb+zunZbqvly6Z088DvN0GYgegMS1ZamfO2QhP3gNooC2ADuY+t22F+4TfoVxmYFbvu7Vxz4EVB88jQ/I29gub8BwGvh9gCSl3ywz9LKXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=lhuNBDOY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="lhuNBDOY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso8655635e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278476; x=1781883276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C77dw0Vtz8mOpBkQCeTh06vcPM193z5oy1TKnaUahRI=;
        b=lhuNBDOYieBW3c++/XKEQwVgcsiadoohEOs1/BtqevHbyf0E4+YJkSgh26t2nrd54m
         x1VSX9LRthVXyj2TElwx/ije7hNr1mOtW9LfgZiVR5KSymMX3Xw19G4Gaa9Has5HDnxE
         R0XM+AXuFHJSVykhk0sCAg9lnSB2bd2c5/uF4W3cPCjtNwN+/Q/lj1ythFE08gCc1+B0
         KSwyl2nz6mutTZTut+lgpeb8SCvGnG+7L6Jjld8jqzbCTvOgryf8mDEc+3tayoXu1w1h
         SpJ1Or205wNxfd5CfPUa9B0mweNlLf4UPNRU3aNrtfqKpJoOL71ivskFSt3PNGM6QUEH
         Jdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278476; x=1781883276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C77dw0Vtz8mOpBkQCeTh06vcPM193z5oy1TKnaUahRI=;
        b=SYGifArZRp4BHkfetyDrjCNL//Y8R2TBWYc2/DkfvSDgJZx9CLa6uHMVM0ECmIAviR
         MSEB2JQlXbG/FU7xqqlpEtYIjKvPU47oh/10Ar04VcjaRSWxSjst9en9cXZGECIe3p4b
         GOFiC/9540wX74p+R5035iTbera7cI8Bx/TnQXoo6qdWiQPXApl2+MxpRXNFZyjkWDh0
         85Dj3qOodA6qtZ3jTv9dC2xx+06c8x9cxyvcHy6euXWRftQf2njaJlF5VWruBTNRDgNR
         tvCrEXHhhu5NbomnVrTKIYZtqSfXCDPg5zwHWurhLwmRuSfogundamkvWtcQ85HUpTWU
         yPiQ==
X-Gm-Message-State: AOJu0YwU5SV5gRmk1DMBis7wY+YFrVstgGVUwVfuBZtklaK14fXBop5+
	k/GZUnWSFt150b43yTktpwgoLlB1LNZ7UtId5faFBW73PtwI0jJeGTMiJ+OdZNuvXsFrXEvH1CV
	xHrJwj5s=
X-Gm-Gg: Acq92OFlopPow6yiE2zMGS+/bcY3t1jiWwzQj8R1hiU9OebJTbjjRPAbaJ4g/nORnwV
	Hwginnngm2Sdbz1WTgf0s9w1LJcX/Yet6uWUWfXHk7Uxs0Ym3DDeFIBWArJN3UbLuQseuurHdrP
	lFIzWlgZimv/JEp4kyvcL3lX8qdoQp1OAPwJ6adyhGTpUl5716ptR8deXDwqCMkdg4TqJcTIXFS
	5wDvSe4i/Mw2p7nS7RSGaieylKareF4bxJZ02q1QRNmG/1HxDKFlzdLGTVMxE0D1l2bLnBvA/rR
	suD1CZygEgXtZ6mQIGGfwvlSQTgm2Mpsgad4urwaMqYy+SQS+QChAukybPT5AKMUA662EkE/VUU
	0TXE4v7JjMV70RkdFmmnHWUvAjmRAm8O7079iKpu3Qj6sAwwsd7C8WdY9lC5HF6RTCtAbFSxFVt
	eM2e6kKFGEYBWP9Be94MmgsiEV5vaBKyW7tM/CRiv2
X-Received: by 2002:a05:600c:314a:b0:490:bcc1:4edb with SMTP id 5b1f17b1804b1-490ec504eb5mr40584955e9.27.1781278475899;
        Fri, 12 Jun 2026 08:34:35 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:35 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 12 Jun 2026 19:34:17 +0400
Subject: [PATCH 4/4] regulator: Add support for UGREEN NASync DH2300 MCU
 SATA power gate
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-dh2300-mcu-v1-4-ab8db1617bc0@flipper.net>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
In-Reply-To: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5555; i=alchark@flipper.net;
 h=from:subject:message-id; bh=pO9z3jMa8HkpZeV2bnc4gj2kfzujnJX0LE3K/RZ5nqM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP1teOQo+XzpyZz3a8S6NxuJ2Xouu9r2skcvSt115
 ZL/+YVfOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqqecZ/ulqxO3/Z1LLxZzMcW3LYx4OufxULvOPre7GwcFdK/plXRgZJok4hS7
 ULmCdczdQd1nZrtkbHSxXPTfLcP8l/Zf90dsXrAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add a driver for the SATA drive-bay power gate function of the UGREEN
NASync DH2300 embedded controller (HC32F005 MCU).

This is a simple on/off regulator, controlled by bit 0 of register 0x41,
with inverted polarity (0 = enabled, 1 = disabled). Boot-time default is
disabled, so this driver is required to use the NAS functionality.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 MAINTAINERS                                     |  1 +
 drivers/regulator/Kconfig                       | 12 ++++
 drivers/regulator/Makefile                      |  1 +
 drivers/regulator/ugreen-dh2300-mcu-regulator.c | 80 +++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9578a06fe651..2fc84be86e46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27638,6 +27638,7 @@ M:	Alexey Charkov <alchark@flipper.net>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
 F:	drivers/mfd/ugreen-dh2300-mcu.c
+F:	drivers/regulator/ugreen-dh2300-mcu-regulator.c
 
 UHID USERSPACE HID IO DRIVER
 M:	David Rheinsberg <david@readahead.eu>
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index a54a549196fe..e692ff864806 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1812,6 +1812,18 @@ config REGULATOR_TWL4030
 	  This driver supports the voltage regulators provided by
 	  this family of companion chips.
 
+config REGULATOR_UGREEN_DH2300_MCU
+	tristate "UGREEN NASync DH2300 MCU SATA power regulator"
+	depends on MFD_UGREEN_DH2300_MCU
+	help
+	  Say yes here to enable support for the SATA drive-bay power gate of
+	  the UGREEN NASync DH2300 embedded controller. The regulator is a
+	  sub-device of the ugreen-dh2300-mcu MFD core and is normally consumed
+	  by the SATA controllers via their target-supply.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called ugreen-dh2300-mcu-regulator.
+
 config REGULATOR_UNIPHIER
 	tristate "UniPhier regulator driver"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 134eee274dbf..44956d795923 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -206,6 +206,7 @@ obj-$(CONFIG_REGULATOR_TPS6594) += tps6594-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65132) += tps65132-regulator.o
 obj-$(CONFIG_REGULATOR_TPS68470) += tps68470-regulator.o
 obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
+obj-$(CONFIG_REGULATOR_UGREEN_DH2300_MCU) += ugreen-dh2300-mcu-regulator.o
 obj-$(CONFIG_REGULATOR_UNIPHIER) += uniphier-regulator.o
 obj-$(CONFIG_REGULATOR_RZG2L_VBCTRL) += renesas-usb-vbus-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
diff --git a/drivers/regulator/ugreen-dh2300-mcu-regulator.c b/drivers/regulator/ugreen-dh2300-mcu-regulator.c
new file mode 100644
index 000000000000..69fda90f7ace
--- /dev/null
+++ b/drivers/regulator/ugreen-dh2300-mcu-regulator.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SATA drive-bay power gate for the UGREEN NASync DH2300 embedded controller
+ * (HC32F005 MCU).
+ *
+ * The microcontroller gates the SATA bay power rail through register 0x41.
+ * The polarity is inverted: writing 0 enables the rail, writing 1 disables it
+ * (the controller latches "off" out of reset).
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+#define UGREEN_DH2300_MCU_REG_SATA_POWER	0x41
+
+static const struct regulator_ops ugreen_dh2300_sata_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct regulator_desc ugreen_dh2300_sata_desc = {
+	.name = "sata-power",
+	.enable_is_inverted = true,
+	.enable_mask = 0x01,
+	.enable_reg = UGREEN_DH2300_MCU_REG_SATA_POWER,
+	.supply_name = "vin",
+	.ops = &ugreen_dh2300_sata_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+};
+
+static int ugreen_dh2300_mcu_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	struct device_node *np;
+
+	np = of_get_child_by_name(dev->parent->of_node, "regulator");
+	if (!np)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing regulator child node\n");
+
+	config.dev = dev;
+	config.of_node = np;
+	config.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!config.regmap) {
+		of_node_put(np);
+		return dev_err_probe(dev, -ENODEV,
+				     "no regmap available from parent\n");
+	}
+
+	config.init_data = of_get_regulator_init_data(dev, np,
+						      &ugreen_dh2300_sata_desc);
+
+	rdev = devm_regulator_register(dev, &ugreen_dh2300_sata_desc, &config);
+	of_node_put(np);
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "failed to register regulator\n");
+
+	return 0;
+}
+
+static struct platform_driver ugreen_dh2300_mcu_regulator_driver = {
+	.driver = {
+		.name = "ugreen-dh2300-mcu-regulator",
+	},
+	.probe = ugreen_dh2300_mcu_regulator_probe,
+};
+module_platform_driver(ugreen_dh2300_mcu_regulator_driver);
+
+MODULE_DESCRIPTION("UGREEN NASync DH2300 MCU SATA power regulator");
+MODULE_LICENSE("GPL");

-- 
2.53.0

