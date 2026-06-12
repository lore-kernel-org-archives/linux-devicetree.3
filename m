Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B10138910F
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278476; cv=none; b=F5yV7xiA2k7K9RIXOKIca9qW0HU0cAjrByLW3ZFzWnd3xonCVDn7K+6h+jjsKkqJdNx9fjwcd+XR2CKzpxYu8qqtYKMXg6KtD67WnCU03gG/VohGoE5tXZuPCoQjwefQfL+zmwTn4S9T5OVm5JfzspykqTbGNCRO48tveMfp2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278476; c=relaxed/simple;
	bh=vhA9/ATviEwBlDlfV0VM4/797omUF5cQADPNVx8ByzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdhoMAAA6F7vt/fxXUB1UU8/FJ0w5Cx/Y2NNT0mzmlX2vPxx9/j1lQFOhQD2dVx9kI/HOcnHaNUOYwo1taZqu2QxjjL4ArDeMkj7Mrp4dqKK+9mC94WK5h9zUYCskNxaKimsA8p4IbXJrTlec5HgIXL6++vSjwaKAd1vk9RM7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=EXR3xUxN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="EXR3xUxN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b613a17bso9677985e9.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278473; x=1781883273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYxxSyaRg/yzYVKGPqcxonYGXxUTX4Q0RqUNGU9bZiU=;
        b=EXR3xUxNuxJKQH0UZpT8uYRWLfTpRa4twiPIjnEvrtnFhc5MQVbwmMruU5sGNTYL+e
         DWqhnEhSf2wXOwZpVYCzzKwqX1wOrQ535CiECgMoK6oSAYw9vmdJTqPs9P0v9fVcxzgj
         MBNAo+5q804AEAP35iQjPEGqJtzyvbIlxlK99p9P8HqM1Guc2oUhaU6MwAPnCzHlY/xJ
         dJ09XOH4u15JtAcC8FscDseOUcP1ZVOYZZ43ALb/b0z6q88aSEtBTUzkxq4oz94wLt3m
         aG2bnQhKg3xYASOspCTkYZAHHagZfEyo6z3gH41+xjB9pne9//aHEuoIoHkkNR8XVrSS
         V+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278473; x=1781883273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYxxSyaRg/yzYVKGPqcxonYGXxUTX4Q0RqUNGU9bZiU=;
        b=ge8YHqTgbVwTLKxHOq4wxSpUGPoidrw/eT/ruPsA+UGJ5ZSS/rQjJgKJbrqN9+XtDR
         j6y3t1gwzY3oQ5fTZY5fL+aVbkLjfVa0JH/qbaebUJIgUmlTHCePb2trHF71rtWajLgK
         58Fl1Vj4p3dlLuhxI1AhXF9azi7nnyTmnevuQvkpV4IRZ5g2WWZi7zv91qvoLdvwhJvX
         5D+LCOTXfTz+0ruzq6qy9AJ0UvoxRvf1TdS3FWj81B5Baa8VuzEaaLfg/JZWkGcxXL+w
         mO15Qi0tFSfSgr6aDqhQksMy3Kj2NwqN6ms6+bH4mmdxGoMZgO9oCaSMOri/jzMRPH4k
         nvSw==
X-Gm-Message-State: AOJu0Yxd1fMaPxZ4cWseNCUT98did9HgcYxHUlcg2JAEJAQE3B6b0bcC
	7F5jYyhl0NRpUXmZK4aUrPxx/3i2eC4C5mZ4tSDUm2j4qo8jGSbwlEBaNJwCldkCHC0=
X-Gm-Gg: Acq92OHgpv/n5mjAicbD61uNviS+R8i1Y6Ce2ICKvgK0j603Cdj3fzOQ78hm/wlPBLk
	tN4cjyg4xNiCbFyVprmAUPVjEnqFO9teqz81HR/nud64nvXwphreUb5w/tHxXZPylAVMX3DgxPm
	7CYksIA1wN3iti6zhXXIIp7rtHql5LJFdEw6kJ702V16Z7Z0vit5Ytl4QVaIXmq9zB3BHsLHhUN
	6ruC63k1BkpbzFQ3c+cX/dPBcX2ZrYE32RaP1Ov7y2KbU1DTvTroFVmYSV3IUsvNTTMkgfrLEqF
	R25SNNBArJCPLOSLuRIGrJPGmrNE7DQ4Y7suR6y5XBmFV7wD4IZXIJBP+4J7oOBCnlGeneiCDqB
	dNJX15x2zqHhOXMZFhhJbVFb1pus3J5Qca1VfLSW2aHxFrvc01tKZ1raeY8J1ZxA4n28lXV/GLK
	SpasAYRJ3v5enK3ZSLMydnNuoSFggWF3HGuEJHpbQc
X-Received: by 2002:a05:600c:3548:b0:490:ea8a:32d0 with SMTP id 5b1f17b1804b1-490ec501917mr47188245e9.20.1781278473433;
        Fri, 12 Jun 2026 08:34:33 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:33 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 12 Jun 2026 19:34:16 +0400
Subject: [PATCH 3/4] mfd: Add support for UGREEN NASync DH2300 MCU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-dh2300-mcu-v1-3-ab8db1617bc0@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876; i=alchark@flipper.net;
 h=from:subject:message-id; bh=vhA9/ATviEwBlDlfV0VM4/797omUF5cQADPNVx8ByzU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP2N1fU+fvpD3S3jp21p535KPapR4LsiFfn012fmy
 3P3Jym1dkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVuUkM/2t+yM6boJbb8ELzbETLW2UpA6f4U5PvCk4ST5xpzXIjyZWRYb+hVMj
 3dBWmE45pygu/bIzjMk3+/rlKxDTIfl7xxmtfGAE=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add a driver for the HC32F005 MCU used as an embedded controller on the
UGREEN NASync DH2300 NAS.

This part provides the shared I2C regmap to be used by function-specific
sub-devices, and instantiates the SATA drive-bay power gate regulator.
Implemented as an MFD to allow for other functions of the MCU to be added
later: vendor binaries imply that it also provides a hardware watchdog
and somehow serves as a wake source, but so far only the SATA power gating
function has been confirmed in absence of documentation and sources for the
vendor firmware.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 MAINTAINERS                     |  1 +
 drivers/mfd/Kconfig             | 16 +++++++++++
 drivers/mfd/Makefile            |  1 +
 drivers/mfd/ugreen-dh2300-mcu.c | 60 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca27df7cd684..9578a06fe651 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27637,6 +27637,7 @@ UGREEN DH2300 MCU MFD DRIVER
 M:	Alexey Charkov <alchark@flipper.net>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
+F:	drivers/mfd/ugreen-dh2300-mcu.c
 
 UHID USERSPACE HID IO DRIVER
 M:	David Rheinsberg <david@readahead.eu>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..5a2ad75bd9c9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1947,6 +1947,22 @@ config MFD_TPS6594_SPI
 	  This driver can also be built as a module.  If so, the module
 	  will be called tps6594-spi.
 
+config MFD_UGREEN_DH2300_MCU
+	tristate "UGREEN NASync DH2300 embedded controller"
+	depends on I2C
+	depends on OF
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  Say yes here to enable support for the HC32F005 microcontroller found
+	  on the UGREEN NASync DH2300 NAS, where it acts as a board embedded
+	  controller. This core driver sets up the shared register map and
+	  instantiates the function sub-devices (the SATA drive-bay power
+	  regulator).
+
+	  This driver can also be built as a module. If so, the module will be
+	  called ugreen-dh2300-mcu.
+
 config TWL4030_CORE
 	bool "TI TWL4030/TWL5030/TWL6030/TPS659x0 Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..6247239bcfe1 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -109,6 +109,7 @@ obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
 obj-$(CONFIG_MFD_TPS6594)	+= tps6594-core.o
 obj-$(CONFIG_MFD_TPS6594_I2C)	+= tps6594-i2c.o
 obj-$(CONFIG_MFD_TPS6594_SPI)	+= tps6594-spi.o
+obj-$(CONFIG_MFD_UGREEN_DH2300_MCU)	+= ugreen-dh2300-mcu.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
 obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
diff --git a/drivers/mfd/ugreen-dh2300-mcu.c b/drivers/mfd/ugreen-dh2300-mcu.c
new file mode 100644
index 000000000000..5184b0c98759
--- /dev/null
+++ b/drivers/mfd/ugreen-dh2300-mcu.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Core driver for the UGREEN NASync DH2300 embedded controller (HC32F005 MCU).
+ *
+ * The microcontroller sits on I2C and exposes an 8-bit register map. It is a
+ * multi-function device: SATA drive-bay power gate, hardware watchdog and
+ * possibly other functions
+ */
+
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define UGREEN_DH2300_MCU_REG_MAX	0x94
+
+static const struct regmap_config ugreen_dh2300_mcu_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = UGREEN_DH2300_MCU_REG_MAX,
+};
+
+static const struct mfd_cell ugreen_dh2300_mcu_cells[] = {
+	{ .name = "ugreen-dh2300-mcu-regulator" },
+};
+
+static int ugreen_dh2300_mcu_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_i2c(client, &ugreen_dh2300_mcu_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to initialise regmap\n");
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    ugreen_dh2300_mcu_cells,
+				    ARRAY_SIZE(ugreen_dh2300_mcu_cells),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id ugreen_dh2300_mcu_of_match[] = {
+	{ .compatible = "ugreen,dh2300-mcu" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ugreen_dh2300_mcu_of_match);
+
+static struct i2c_driver ugreen_dh2300_mcu_driver = {
+	.driver = {
+		.name = "ugreen-dh2300-mcu",
+		.of_match_table = ugreen_dh2300_mcu_of_match,
+	},
+	.probe = ugreen_dh2300_mcu_probe,
+};
+module_i2c_driver(ugreen_dh2300_mcu_driver);
+
+MODULE_DESCRIPTION("UGREEN NASync DH2300 embedded controller core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

