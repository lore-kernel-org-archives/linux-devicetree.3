Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B44C14F9
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404277; cv=none; b=pJXmHjQiTMNebd2XPnQejmsM5PmxHMBf5IIAsIt+yWMKPrHnKogrq01TRhLzNTmTBhM4zjMSF98EmkbUgxVr95F0+KPieXYNq/oKLzrmnBmF5yz5RACHbHnV3xtNIauFNGANM5o54f6sd1EP2ZH/IX0jKSBk62IaxL9sx5SsXyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404277; c=relaxed/simple;
	bh=7M5n4Fe1d7nAGa4sY1uvEcB63Zg+5MuLDpYygqliR18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+OUUcYPU0GrQDKE+Tx0iuMI38K3y46mOhZCQXbAeNAmxvPXEQU17kRY0jhI0sbZhUNNS/YNrfyucf/I1RZ5tuDf5MWpeNZTpzoxmI2bu+gxVDM/lKY81v+GtqNxbxugwSoZxcPStuV88L5VLG6nM8dUL8xVebUWX2hgiWAn2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMiZC7oa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMiZC7oa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so16830755e9.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404273; x=1793009073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=meBcBi3FNg9K5RGmJtRczJgiLIyFhuFl/GOkK9YGvsY=;
        b=HMiZC7oa7yxSzrXgm+iYgb+pxR/RMdVXrSs3Fg/Bqexg42Ye6dwaGImLgM6rvzSSva
         fVKlX0NUdIgXt7bIP13ge1t9EPaMj4zC8ChTd+5DsOe0EtDU4tjaBlERZYbPtUbgOxBJ
         2jv96m/I0CODJ+Gj73eWfFM64+YAyB96/5cg1l42J6ezhhCZpZD4EmQvgOGMjK/8jf+K
         Yj2ygfSusIlSyMjeLwMer+fgQ8T0x2A8VjdPJjRGl5H6r4nLMNxMXNL+B1Wvz/ihmMxg
         PK13gduYGK5mBsaNc+XtYLNWNTMgpwtkXLyKvJog4lz2+lumiLhmHb8tbNwKKhXp/SE6
         +Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404273; x=1793009073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meBcBi3FNg9K5RGmJtRczJgiLIyFhuFl/GOkK9YGvsY=;
        b=thqTwBfOyAbwaED8W4ybM9znvspTO2ujQjITsqepoCoBvbXExkUhd9Vo0TsAMfbdVa
         ZSZfwwITe63wE/dSYJ/eCSRLKCqO3mjHn7L4TisEGoo/1hZaTI+T6ze4aN2xwKLKKpzc
         4IFYlgUMB9AYaGf3lKDmnVAjBq3lD9T8fJzsnhpOwpFZJs4FE6xKCKjNp8efzuY8XjcG
         +kMGzv3WPU35VtkosHH9kXVUgDqVIpMYF5rCJV7DA/bsKmBciODlKlpszFJD7bB7gVc8
         Czkn/Uo4ZBjtfOTz9TVF66WM1cIbRdGxhZv4E/udR7EuPhdREwlZLaXe/8/9rOqyZ7T2
         3axw==
X-Gm-Message-State: AFq9FYJrJjGBu6gv4HFlYwe1dgL5PiKjE3TmaDy27aYVJNPNbe6gdDpR
	LgXyN2eYGiprzP9khuFS2g5i/ScXpXAFCrfMENd2ZMF7phNojXmvZ+YY
X-Gm-Gg: AYBFou3yoJxf9QqWDNzDEvzdqtjALVK8ZO1FCCg0uW2Xomvi07mXhqCi4Oiwipzfj6t
	4E8J44yqhy0nIPTnRX635v45yy1RTOsxudQaK/LdFZzKKXiEkBZd0Y6Wb4osTofwAM9VqrSRw9G
	ZSChXqvnA3t2kLlXKpemNTF176uqEyN8FJ/FQ/ITM/PB6ZMN0J6I3j3mDN7tpSqplMDT1+LYkIN
	OKcHL04KqYJ6S8cagC6nufQ+I7zN3z0rR5oKzL8+binphwZ7ZZyIKg00DjgADtnyk/TLfpztqNo
	Pn58W8edLsfb2r0Wdkj6w+jRsZOCahWKDI2uJdMgsBCyaNRMI7ChCMooOrkpYjXKLzP657UpfFH
	0aQiZq/RpB67Vmj72JL2P10wdQLgmODK1aqgbGNiZxDxz1zAVpqH1ZnIWJwrob6jMgJQB9H+N/a
	hYwSyPKqskCet2IPntNx3MlRMvWVJYCNulXssfcTlvllAOMSVBdP/Q7BpiMF9UZM7QJBRRlEbNd
	iScew/HPQTc19wcayw=
X-Received: by 2002:a05:600c:698d:b0:4a1:d767:ba33 with SMTP id 5b1f17b1804b1-4a1d767ba47mr151602155e9.12.1792404272295;
        Mon, 19 Oct 2026 03:04:32 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm177811485e9.5.2026.10.19.03.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:04:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v12 5/7] leds: Add driver for ASUS Transformer LEDs
Date: Mon, 19 Oct 2026 13:04:04 +0300
Message-ID: <20261019100406.103687-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

ASUS Transformer tablets have a green and an amber LED on both the Pad
and the Dock. If both LEDs are enabled simultaneously, the emitted light
will be yellow.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/leds/Kconfig                    |  11 +++
 drivers/leds/Makefile                   |   1 +
 drivers/leds/leds-asus-transformer-ec.c | 125 ++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 7ec2c8d785426..788e689fe875c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-as3668.
 
+config LEDS_ASUS_TRANSFORMER_EC
+	tristate "LED Support for Asus Transformer charging LED"
+	depends on LEDS_CLASS
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  This option enables support for charging indicator on
+	  Asus Transformer's Pad and its Dock.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-asus-transformer-ec.
+
 config LEDS_AW200XX
 	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4d4b089156e24..3da746279bb81 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
+obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)	+= leds-asus-transformer-ec.o
 obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)	+= leds-as3668.o
 obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds/leds-asus-transformer-ec.c
new file mode 100644
index 0000000000000..1b129247ea6c6
--- /dev/null
+++ b/drivers/leds/leds-asus-transformer-ec.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+enum {
+	ASUSEC_LED_AMBER,
+	ASUSEC_LED_GREEN,
+	ASUSEC_LED_MAX
+};
+
+struct asus_ec_led_config {
+	const char *name;
+	unsigned int color;
+	u64 ctrl_bit;
+};
+
+struct asus_ec_led {
+	struct asus_ec_leds_data *ddata;
+	struct led_classdev cdev;
+	u64 ctrl_bit;
+};
+
+struct asus_ec_leds_data {
+	const struct asusec_core *ec;
+	struct asus_ec_led leds[ASUSEC_LED_MAX];
+};
+
+static const struct asus_ec_led_config asus_ec_leds[] = {
+	[ASUSEC_LED_AMBER] = {
+		.name = "amber",
+		.color = LED_COLOR_ID_AMBER,
+		.ctrl_bit = ASUSEC_CTL_LED_AMBER,
+	},
+	[ASUSEC_LED_GREEN] = {
+		.name = "green",
+		.color = LED_COLOR_ID_GREEN,
+		.ctrl_bit = ASUSEC_CTL_LED_GREEN,
+	},
+};
+
+static enum led_brightness asus_ec_led_get_brightness(struct led_classdev *cdev)
+{
+	struct asus_ec_led *led = container_of(cdev, struct asus_ec_led, cdev);
+	const struct asusec_core *ec = led->ddata->ec;
+	u64 ctl;
+	int ret;
+
+	ret = asus_dockram_access_ctl(ec->dockram, &ctl, 0, 0);
+	if (ret)
+		return LED_OFF;
+
+	return ctl & led->ctrl_bit ? LED_ON : LED_OFF;
+}
+
+static int asus_ec_led_set_brightness(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct asus_ec_led *led = container_of(cdev, struct asus_ec_led, cdev);
+	const struct asusec_core *ec = led->ddata->ec;
+
+	if (brightness)
+		return asus_dockram_access_ctl(ec->dockram, NULL,
+					       led->ctrl_bit, led->ctrl_bit);
+
+	return asus_dockram_access_ctl(ec->dockram, NULL, led->ctrl_bit, 0);
+}
+
+static int asus_ec_led_probe(struct platform_device *pdev)
+{
+	const struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_leds_data *ddata;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ddata);
+	ddata->ec = ec;
+
+	for (int i = 0; i < ASUSEC_LED_MAX; i++) {
+		const struct asus_ec_led_config *cfg = &asus_ec_leds[i];
+		struct asus_ec_led *led = &ddata->leds[i];
+
+		led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s",
+						ddata->ec->name, cfg->name);
+		if (!led->cdev.name)
+			return -ENOMEM;
+
+		led->cdev.max_brightness = 1;
+		led->cdev.color = cfg->color;
+		led->cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
+		led->cdev.brightness_get = asus_ec_led_get_brightness;
+		led->cdev.brightness_set_blocking = asus_ec_led_set_brightness;
+
+		led->ddata = ddata;
+		led->ctrl_bit = cfg->ctrl_bit;
+
+		ret = devm_led_classdev_register(dev, &led->cdev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register %s LED\n",
+					     cfg->name);
+	}
+
+	return 0;
+}
+
+static struct platform_driver asus_ec_led_driver = {
+	.driver.name = "asus-transformer-ec-led",
+	.probe = asus_ec_led_probe,
+};
+module_platform_driver(asus_ec_led_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-led");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("ASUS Transformer's charging LED driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

