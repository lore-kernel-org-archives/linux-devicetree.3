Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150861;
	b=TVsgY4jSKDYd9G+NqmHuFvrpl6VLjCCyccoGYW3hla2rMBy9Av2cdHKdVSThWLOGBDDL
	 HT59U8664PqpQuyGYLML8eaN5Aa/tl9rziPHnJNEwqmXl2ZXeuin6DjelBktp3ELnS76T
	 MJqR/K3KcFFEj7WpY+/qML/RHOg9rG2HdKCXIv7uJcF3vLQJqk910/kctWbX8K0qHno1z
	 FPJp/0YYT4QV14Twl6+DuArvXOS4eAtlHW++q+mfxniaeStx4aNXw6UaDhN0Y7ZcPedz0
	 LksFjUNpygCk4PdBpZUnnqadrt13BgyIV2qhu8Lu1TTgKGdZPnKN6fekBPprpc7U54A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
	b=btoQVOnpnKppx7/GcJDCvqvnVZfSVb9znesvIROSochj9apiB92sG2g8aQ2UFitkeF+N
	 ewn3acVZX5sO7234RkK1V6VKL/QRG+ZyiHdOrvZq0bKnXJjbUHEf32rKSpB8ICn2mM4pt
	 Z3ws4qaXfPZHQ8K3DWSRgWFQQXmh4gl1bfHDQV6MWyxKgsQFsk4Gp1/roCZbAtsMeoLhZ
	 rfD06R3gnwgr4sq7ydx0TsYuj6011B7S1018tFxgXNF82azafKzPq4I/hQDN1QzMMgQTI
	 490kzIPB/2W/HNPubARY9JQDj4wETGvLOuG6tfcdCuSkVtAJ8I9c8mmiXV7RAYaWofw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jCDCRLM;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8C606A326
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 15:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D8C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jCDCRLM
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4ceaee6770so17809966b.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150854; x=1794755654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=0jCDCRLMKln027NFtBCDUX9Nk3mKuhWrKQz2oC2tzqubtlZAnb+Ls2YiGiG0EQPSXC
         GK6PsG1Lt72qXpPuNlOdkg2oMXzI1nGxD6LRzLNL1logBe0mRXVNMfDZhwhBFpOj9pUb
         NeMNWRFO1oDUGJOUgx8Rpy7g/s1sctXllDTo0lMKPwqX/g6rHeXf25OTmMejF+8ZAHgQ
         BdvnrKWGSYQaXLWT/ZvPCb2Hc5dUUCl9Qxixf+Ccm/7WhrCAr+nc3zjAv1HXyebbdYmt
         5scVW3h80wS8dsdMdnR1yFx9WT6bcUcMy2vSdBnGLWWcks54m0Vdq5AUl8IJBtU68aFR
         EC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150854; x=1794755654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=nTy9BeT5YoKV01nxEgcEc/Z1a9ORQX1/BvKvX0vqpwbWjxf0fHipqMEpWv1Hy850ME
         mgyl3rEpTGANu5CcrNklWfiUwATuHyf3YIjd+i6FAy5CKHSIuhhQI9+TVts+qo0j3hYI
         ZO3cn/6XD1mMd6iXmLhfLHia7gcSFFpMViskLh3TsvvQn+5V0CjZ3/cleju2Zg+/LvRW
         kyU9FNZbWIXwgl6yTDdHusxsgRKLqlXnlnK3xy9Hozi+IaUXrs84717CI7tS/I0QM15/
         ypnNwNnGaVPgTwZ9DP543JK9TPdkbEAegKxKHP/fqHkKfj/aSngSTjurszqzEGdYR5Xe
         Pipw==
X-Forwarded-Encrypted: i=1; AL+hErGaGNIH6FAzxXwxLiiUfVsKTfs2ARdZYfJ5AckZNKEbKS9FdbvzU79W4hImm9gZpHfU9CCaNwUkrzWJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/JIqilWpCXjwLeJoe4H0W7ZJjz7HmEhoQR7xSVSWO40N2ReueC
	FFk+zLlc5tiZVgRHdL1dgXm4IQ1WounoJWwByjpSNMx/n7IGIAPHdMyv
X-Gm-Gg: AYBFou3S8VSk5VFTG5YQ5Zm4hiPy96qfK/v8FnHM2YhTZEW6x4rQDZ5B4NOPJkS3xLY
	EVxO5fn5vyXmjRz0UCNe3d0+7xTDekfNjs1QtFpCH0fcP3xVnbIZI6ol/qj1p22lcbwA5j+Ib3C
	wNPm2iSTKNQDDRHxBJjgB2nnEpXdglY25nFNCodUjrdaVF7XgeeaiPI5LbWqO4duCQRzE7iCL8v
	HXjyPlr0mqu6QmBYvkwpWTbN7qvJY+nWXX3cAjbGbtatb+kPtF51XwYBCWdySumyGCkE1Ag8PBi
	edV47V4FWVzUugqZgcTLnFogaxaGb7XH2W89s3qVhN+BK8vGT8aWk3IHUkDQxZDWBfeRMcNZ/qf
	5lUAV143cErQw5RQTR+9yAJXDRkZVjg1uP9Us0a30soXFWGQXpS1VM85Yg3nvCY8hw9tcoCQ1b0
	fNCITlDhsu9JeMnW0KQkZTyPbDp0OKVLLa5vDynpLgSisJ2dEc7LC9aAP46UyKsTopJc7hEF+Do
	eVHiJX7jljPOU0LZxFJ3SeSM+/ego6f/IDWwED0BFovdVr7bqCdvvcfGiolXvoGLhGIRYIV7CPv
	DOug9gdoa5JW7lBtS+AgbU/a7nBFNjB2hdbhgrQQfIDyo7lCYrzGckI+Ok5y1QG+p7XsGIGaVio
	sZAxgmipajA==
X-Received: by 2002:a17:907:5ce:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c4d6db1f141mr151964566b.19.1794150854401;
        Sun, 08 Nov 2026 07:14:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:13 -0800 (PST)
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
Subject: [PATCH v5 2/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:47 +0200
Message-ID: <20261108151348.204182-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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
index 0000000000000..795b35390b039
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
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
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
index e222250f0cc1e..35b2ede54f856 100644
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

