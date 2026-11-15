Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733536;
	b=GopaAMWe0BOj68CilIZi2cpxJqUugnfcxLE9N0eCBiIOBiUaHZzxgfs/8XSJZq5vhti2
	 MQF8gY5SXw99QfGKGyeWK4hjtBAQ4AfOdq8kM/X6ymAmmj0nRxTcfY8Mbm/RVpm8pT5TS
	 ijlJFddHrCywUCMFeaFUa18ctYkv8WtUayMzu7ZzDjUIhtatO3TcMgPDSRfiqI1aTKBN1
	 NIgKmKBM17Napm0lDq3Dntu/6vCCXr1F4mU6R7c7tAJHD+YlVrrkiTrZQfWcR0hPUtG6H
	 7E+TiYyTZ/LFm/bw6BUzSO4sf2pN+K+sR3UWsrYypsDZiN9d+kXY48KE12CXjj9anIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OXs965iTfMNugiuDlC2HCgJXfc/BaB4gTTxdzfucgUU=;
	b=5HWvKNwqasVyZKvRPofvAkp66duzPrjtOjGpy8cMDrNrOokXzMj3g3YtHYmaoh7so3Cu
	 l6uJ42O7lCIeXL9JWiCMqNvNrb2nChLYetntewMoT66nWrOJxTEW0u3O9t2+WJ82Atq10
	 ON0A9n0jasQ0P1vk910NH1FzmcuSOczNerR7MMFmPv7/v8WObnpzps//6ZYiq/g2Czxne
	 SKh7gkY6mszzrKwnT5lVySxx4RFWF28CYd+37kipXd641egxmTH/vhBaYj+hqP5+9YYyn
	 9J2L6xFDETDESPrue5UPJ4idqKqMrCkqudqI0f7B4o7ESu/I/6fvUpbSKEbDBG3GMug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWozHVA9;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C28606A897
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C28606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWozHVA9
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40f29667e6so454473066b.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733534; x=1795338334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXs965iTfMNugiuDlC2HCgJXfc/BaB4gTTxdzfucgUU=;
        b=HWozHVA9ZhvKtYEM0wXep5L4zlMbocaTIkQCafkjgriab51605UKWIq7ERLfGUGmH8
         vRFrjswJ/i8hvTJ34Ijde9r6lPdhSrGpxx4JNGWV4dLe1ege7fMUS/pqqW2vVHxaZd8d
         0J6h4N3WuEE7xgKmhChi7lgJLTAW5bm+JC+gVmNlf7dLjja/cZEhUUhTpt098Cw4KLQP
         17FebpggtVtZF+CptCi3jBTnda94y4jrmwzmXERX7poMHd3NmD3tvatMBhFa07tixUjL
         o7H3tLb+AOVpPZdy81dVqd6qoeoMWOYJa4Gz90ZZANTUZjREDOb5W9GRFLGniNNjYzJ6
         4fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733534; x=1795338334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXs965iTfMNugiuDlC2HCgJXfc/BaB4gTTxdzfucgUU=;
        b=J9vzJYdeCBGtpGtLe6aXV6+Y8jaKQi3Yzr7gKbP2KQzS3vQ8QdGhfxzrXmquU0wiou
         4iSYxc8jfW58nFPTk7roglE4mzm5r7w3Gn720KHkg/NUGvkhHTnR6lLCJkTg9ublk32C
         QYjNlvXIZOJ2Tqlgnlz6qy8/zpAI3Nky/tYvCCyu8Jr81F75fA596DFem022kQLw+KGo
         UuIM95DociFYb4nS8g+vQtUzY0v0JWSDfjwvVV+8vbgroa5fIN/bWJVVK6rV/xjslxSm
         VAes4qUd0MVuPcafQe7gO75WcbpqI1ED7Tb9UPP4GvcrdaSaaEpt5Kwj4w9KVug8Fpsg
         y/OQ==
X-Forwarded-Encrypted: i=1; AL+hErEfYN7cl7SdNtNp5LEY4l1nAqeFXN8Ce1RerqLtc2GXF49xZu3Kjya+Dj5hUowqaLdYd8pispBG5Z0y@vger.kernel.org
X-Gm-Message-State: APuU4Z9DB0a5bBZjk71pjc5fVIhGFVj3nxQHGkHYU49HFAALqDA85sFP
	9ZC9dUtdr7lME8I3+GPebUcuEb32702Zt3Mwi+vUG+cJ0TS0X4ncL1MP
X-Gm-Gg: AYBFou2vHxGj0W4i24NJx/k7vKkXzzmpFTWfgGD0zdj38zU41wJlbHXd/z3BU7hcYDt
	gNitJ1m3t1WYhCrn2jGIEsjE4F2qxsPdfJv6EVNu+5AYkAgHKA0p/5l90X9TS3tLBZwdWY/gdK5
	K5v76+zVZzbDQS/IJi9YWdyPiWRR4V7badbTJpDOyVaxbhdjsOXvRpwASApxuL7hf5HkEMlilRg
	0khYK/3XDegZWfMycDnaLj13HYiGeFXzz9ERyBx+m2XsarIlK33og8OrGk5s3vWzG1JGM0YsUc5
	s2c7+qOmbmEptRZXUAZjZ+wJFPfu8U8GUBh0qd2bO8mFoChsGbfWrZwZx/Ima99trUfWeKaTwIA
	8P2+BxZcvaXe2Bi+iG8zv0UksacbRBQiMHcU3jlcqDmnM27a3YwN1I+sYYBo7rcHXx4Sa95/RJw
	MktJrO/sWZbc7Ha2peOPw31Bh5qVrQ/OdsGhnwmDbVtRhVmu4L1Zw/B41PhqkhfXUEPc+pY56oL
	ylfkHXPc8JAyxPLN7M6STxE0TmJfbMDioYAAbTy9nfW1ywZMsDQZpJgGil5yw3OI9vA5JHbs7Z2
	y7m7mHkYofftSxLiCaQlHEIs3kWkXzrU0K+ZXeYNPBTPNMwt64OnEXZf38Nhc88nDCDPHpOOx2p
	TN2tzIX2Trw==
X-Received: by 2002:a17:907:6d07:b0:c4c:b4fe:ca01 with SMTP id a640c23a62f3a-c509642cc7bmr553111866b.37.1794733534433;
        Sun, 15 Nov 2026 01:05:34 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 2/3] leds: Add driver for MAX8907 LED cell
Date: Sun, 15 Nov 2026 11:05:19 +0200
Message-ID: <20261115090520.102216-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED node is a child of the PMIC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/Kconfig        | 10 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 99 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h |  2 +-
 4 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 788e689fe875c..d4e0f514bd667 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -813,6 +813,16 @@ config LEDS_MAX77705
 	help
 	  LED driver for MAX77705 PMIC from Maxim Integrated.
 
+config LEDS_MAX8907
+	tristate "LED support for MAX8907 PMIC"
+	depends on LEDS_CLASS && MFD_MAX8907
+	help
+	  This option enables support for on-chip LED drivers on
+	  MAXIM MAX8907 PMIC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-max8907.
+
 config LEDS_MAX8997
 	tristate "LED support for MAX8997 PMIC"
 	depends on LEDS_CLASS && MFD_MAX8997
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 3da746279bb81..24efda3fbaa44 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
+obj-$(CONFIG_LEDS_MAX8907)		+= leds-max8907.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
new file mode 100644
index 0000000000000..46c60fde4ee39
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_REG_WLED_MODE_ON	BIT(0)
+
+struct max8907_led_data {
+	struct regmap *regmap;
+	struct led_classdev cdev;
+};
+
+static enum led_brightness max8907_led_get_brightness(struct led_classdev *cdev)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	unsigned int brightness_lvl;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &brightness_lvl);
+	if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
+		return LED_OFF;
+
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &brightness_lvl);
+	if (ret)
+		return LED_OFF;
+
+	return brightness_lvl;
+}
+
+static int max8907_led_set_brightness(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	int brightness_lvl, ret;
+
+	brightness_lvl = clamp(brightness, LED_OFF, LED_FULL);
+
+	if (brightness_lvl) {
+		ret = regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL, brightness_lvl);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL,
+				  MAX8907_REG_WLED_MODE_ON,
+				  brightness_lvl ? MAX8907_REG_WLED_MODE_ON : 0);
+}
+
+static int max8907_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *led_np __free(device_node) =
+		of_get_available_child_by_name(dev_of_node(dev->parent), "led");
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct led_init_data init_data = { };
+	struct max8907_led_data *ddata;
+
+	if (!led_np)
+		return -ENODEV;
+
+	ddata = devm_kzalloc_obj(dev, struct max8907_led_data);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->regmap = max8907->regmap_gen;
+
+	init_data.fwnode = of_fwnode_handle(led_np);
+	init_data.devicename = "max8907";
+	init_data.default_label = ":wled";
+
+	ddata->cdev.brightness = LED_OFF;
+	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
+	ddata->cdev.max_brightness = LED_FULL;
+
+	ddata->cdev.brightness_get = max8907_led_get_brightness;
+	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
+
+	return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
+}
+
+static struct platform_driver max8907_led_driver = {
+	.driver = {
+		.name = "max8907-leds",
+	},
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_ALIAS("platform:max8907-leds");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 025874e5f8808..9865ae52877fd 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -112,7 +112,7 @@
 #define MAX8907_REG_CHG_IRQ2_MASK	0x81
 #define MAX8907_REG_CHG_STAT		0x82
 #define MAX8907_REG_WLED_MODE_CNTL	0x84
-#define MAX8907_REG_ILED_CNTL		0x84
+#define MAX8907_REG_WLED_CNTL		0x85
 #define MAX8907_REG_II1RR		0x8E
 #define MAX8907_REG_II2RR		0x8F
 #define MAX8907_REG_LDOCTL20		0x9C
-- 
2.53.0

