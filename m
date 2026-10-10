Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3F74A99DE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637246; cv=none; b=u6XLW70DskvtTbc3LKo1vP12i+0e1XGle50sM9xuyk1YS+0BtzmLTCXuYoXvpayjRGQkD1V3eYCKCvYZxYSA5E/GDv6f/7dbYwzpmQhdq9nqjCs2Z4X/IrnvDNbGBBI/uvcxopvLRsbmoFRXNn4odyxKrkAJaSRdeXbuxv8qfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637246; c=relaxed/simple;
	bh=HdygoRF6oEk1SkwGhEtVhXOCKvExlr02A9uruapDZTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=am259PjNfu4yO+BMnkraTcz6AGBaaRgj9kDIoIWR6Ad2jcGryEHTSfN/pt9kqw2e91KR8GOIg7Ty/kGs91oFLQx3fPrCY5879j4TXLaRspkx804HhnDYNWVy+3bOAL7FF7fxm/utP3eUKAdv7O+DXkKEcPl/yrHvYI0a/98AGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4jaYpr7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4jaYpr7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso4450565e9.2
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637239; x=1792242039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGFpiejSGpOIzstNVckwDDSyChSy7GVC4iVpGtXgDOE=;
        b=E4jaYpr7OBgzFcwimWa8Mb5mwkCGoT0Z12NTki549AC1SLeSJA4fm6sPRLKJ9gLuQE
         pR+Q5ZLsRsH3crZDR9ENSb8zNzkW31NwKJ4w8juRksUBzy5Pr1Ehw69pzVS7Nk08mfSd
         wxrPqGXp+F0UdvhdrDiXFaB0g6SJaR9xC5jhwJkKzplTYswBA0E64MOb9JCZqZOBMQc9
         qeIo0y/fVTsoL08Cx0GglZstNjV0WFabdXlz92wYqsCJa7ovKelpOgP6rL4NjQCI6PI0
         TGSMdMICXliU/SQ0duG7KSWOkvkqQAWZuZgg/SVcKCUCAB927DnLUP2srfVHlZEBSc3D
         V9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637239; x=1792242039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGFpiejSGpOIzstNVckwDDSyChSy7GVC4iVpGtXgDOE=;
        b=zvbuTBFxVu8egPbYUs+BnLKhmgvlI4dSP/naWaFkIem29zX4En3E19uuV3Fdbez2Tt
         7/qb2T1cOLKy4k14N/XqIVCGASxHtc+uk9sqsQLiIZDShIOjs8Nz+h4J/yu6/mLbZjmM
         MQxwQqcyQm24d4lzUwzSyQ07Lwey5+/Nwbd21Un8Oz154oEXO7+vt1ugsxmBrg8XwI85
         70COFkVcq0rcsaAOPxp3oq35atL4tDnMSdNqW9ITL0Sll2EroMJKeC336kAY8CQLcbaa
         0oFOvkDscQiFdRtdZCrnbPDaPLQctRdsPNIsrimORduRpK0IFszOmDfXEO2a1+hUrJRx
         CVXA==
X-Gm-Message-State: AFq9FYKh2/qwxkmiI5c+9V0xfYQJoK44nuQuZpMnju0ntMGI/k7MwDPJ
	5PKtVOVJ82LW6APJC8jp6RPQKlapDMO+LrK8TtNaO1rm/oj7fWDsCOlR
X-Gm-Gg: AYBFou38We0jpiCmzjj4RiBDJ4B8WbVf6yga1W+915aogSLLPuywg5Iy2ybIvGjCBKP
	Z+/REtmVPatti5z+LCAcec2jPN6EiZG2ujWtfLA+hkyaxsGSqBm67GyvVZTZhzs/vXIsAs6vV1U
	37UPmvFRLSJev7e+hDSqNAThQuu4B9KyUoTIGxFfQD/lf3FuOS3J16YzE4aW1RiEQ71LrgtdRcF
	ndOnrHvuMNGcI6hDKE0ALItFAiel7Zlh3RL2/KnPPXoZWptsYlyxkz+zmtMpJOkqWDwfT/k7kaM
	G6pESAuYhWkZbOvcq6ZQYP+8RSY1e2HwXv7w1dJEIM7eH5eL8KLtE3YKfh7legFVQMAh5Qv3/5+
	aHonwq1CQWED2hgHnwoETq4pyGyGvQYXz55omXENokACkPM7XYT275o5O2WgqIkNCg8vl+6OO2P
	K980hf95CqdbzhRO6XgS0dbmZm0clEh+wzevspoM54OTP5Ww+ogRbuCQ0q/4JdhiRtDJpI0jBJV
	N2v0ve4plX6Efz3rsb3PDNcjr3fq38UP+ZPqLrWmN6KMXM5LoTvQ5WGygfOdU4j0Y9SGQ3k4wbv
	gYo4i3iVBX7F6HVukzpp8YSEcekT+z0ujhjdE8gzXPorpQurTNZGjdGvKmDD3Q==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr88069255e9.16.1791637238622;
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sat, 10 Oct 2026 13:59:47 +0100
Message-ID: <20261010130024.177503-10-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the six banks using the generic GPIO implementation and enable
the register clock before accessing the bank.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/gpio/Kconfig          | 12 ++++++
 drivers/gpio/Makefile         |  1 +
 drivers/gpio/gpio-zx279128s.c | 78 +++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 drivers/gpio/gpio-zx279128s.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8e..3ae51a3c10 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -902,6 +902,18 @@ config GPIO_ZEVIO
 	help
 	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
 
+config GPIO_ZX279128S
+	tristate "ZTE zx279128s GPIO support"
+	depends on ARCH_ZTE || COMPILE_TEST
+	select GPIO_GENERIC
+	help
+	  Say yes here to support the GPIO controller of the ZTE zx279128s
+	  SoC. It has several banks of 16 lines each, which boards such as
+	  the ZTE ZXHN H3600 use for LEDs, buttons and reset lines.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gpio-zx279128s.
+
 config GPIO_ZYNQ
 	tristate "Xilinx Zynq GPIO support"
 	depends on ARCH_ZYNQ || ARCH_ZYNQMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b..a57ed7ec71 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -223,5 +223,6 @@ obj-$(CONFIG_GPIO_XLP)			+= gpio-xlp.o
 obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
+obj-$(CONFIG_GPIO_ZX279128S)		+= gpio-zx279128s.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
 obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
diff --git a/drivers/gpio/gpio-zx279128s.c b/drivers/gpio/gpio-zx279128s.c
new file mode 100644
index 0000000000..8f37b908bb
--- /dev/null
+++ b/drivers/gpio/gpio-zx279128s.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s GPIO controller
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/*
+ * Each bank has 16 lines, one bit per line in each register. The registers
+ * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not supported
+ * yet.
+ */
+#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
+#define ZX279128S_GPIO_DATA	0x14	/* line level */
+#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
+#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */
+
+static int zx279128s_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_generic_chip_config config = { };
+	struct device *dev = &pdev->dev;
+	struct gpio_generic_chip *chip;
+	void __iomem *base;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
+
+	config.dev = dev;
+	config.sz = 2;
+	config.dat = base + ZX279128S_GPIO_DATA;
+	config.set = base + ZX279128S_GPIO_SET;
+	config.clr = base + ZX279128S_GPIO_CLEAR;
+	config.dirout = base + ZX279128S_GPIO_DIR;
+
+	ret = gpio_generic_chip_init(chip, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set up the GPIO chip\n");
+
+	return devm_gpiochip_add_data(dev, &chip->gc, NULL);
+}
+
+static const struct of_device_id zx279128s_gpio_of_match[] = {
+	{ .compatible = "zte,zx279128s-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zx279128s_gpio_of_match);
+
+static struct platform_driver zx279128s_gpio_driver = {
+	.probe = zx279128s_gpio_probe,
+	.driver = {
+		.name = "zx279128s-gpio",
+		.of_match_table = zx279128s_gpio_of_match,
+	},
+};
+module_platform_driver(zx279128s_gpio_driver);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx279128s GPIO controller driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

