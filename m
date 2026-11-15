Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733898;
	b=a2Ar7VcLxlo16BEeQ7Vn2vmqvotDN24Cgu14o2dX6n0j9e0N4GdqKUpgGw4THtW7R5D9
	 xIxe8JitIacMvf3r1zVqZoWFCKwJFGShBEnpktkHzCGnZfZrUMJByS7KKZ+0VqzlFAXpZ
	 eoJPxC2AXv7z7RnBrghvE4stjabdSi9qmtTYh99dyVGTN8r+QuKpZRvxan7QzrTZ+QIZ0
	 D/t83cGoUVxW5FUVWfWYtJZufTmF+jLPl2McjkkWIUlqX9SPtr6UFQ+8tCnKDWkSzAyt3
	 i+he764cts59EYJqCub8S66zOaaCKpgkTuaYFmd44KehHhoqusjxixMP3KcGPQjr3rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
	b=IeAUdvVSkJS/9uadMJydbQpsRStIOJCydy7hBQ7uahlfkugGKrcxUKAh1jHqyKdL8Lb7
	 cs9y5geClid+VOyNM/g6qr8xRP278QxqKbCLrtsZ5VXmuPBJSrxo1TSulUJcO667CBdxq
	 4VoiHd7WcK/MfQYwwv4zVpH9FHIeRiZxjrLAbA9q2atXXNIbabZu2hS1bioSnL7rx20Tc
	 iSW2HKKVsQQWTfS5J3Cuo1mp4HHCPsS4x7bT9a/GeqEdnjSm7yhUS5Oh4VlF3iyMYcPYG
	 xLye7vhrig8IhYSZ0i9YKY02aZ/SrxqLkBYg5pucDv7dz7x168IpzV8SUlGPvM+Z7Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHTpmVAm;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A0606A333
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082A0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHTpmVAm
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d30639709so370158666b.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733896; x=1795338696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
        b=tHTpmVAmuXfO6xhACr2ooRjFyAE/c3XHioSsoHEEY70qgft9KyR6+jvRKcUi9spInK
         bSAskAVmr4C8q1qzC0ju6lUW1Y/pOb3TjPNWwcEazWhK/p0JkzvEHaA+yWPX/fOFDxoq
         cMs3+tHM9APPJObX9pMx0LwqBIJ1S9W/rnZGqnh9FL3H6MkktME8QoI/g4HCjBYBcSjh
         4q7TcGbGUKmWZYj9FwBboNtASOa2X8ii2bJIAkVWQ2Q5AI1KgDYYENf4Da/pCjqE/v9C
         mixIvyoKdRq5uTC/TFciZDsNZZax4Z2oi6afJADXWxaHIC73NZV02ksn3+V+lOMToI9B
         QBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733896; x=1795338696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
        b=uBAucz2vil9/ShIVXolMk1WMeeQ2YYE3wPGQWIarY0sVCef1BYWM9V+tqkqDfs+zoq
         R+8wjEzGfSSouTqCU1rR6AP3A8OcHXKflHcyGvGFcXuUQFIMN0Egs8WPu6a+AtiF7TTv
         +tH6fx2jPNKZER+pT7dZUeRrKs5XyNkoRoLdOTh2iEa/d49i97DkQ8UVfrfzQuCSjKV2
         46NkaCrJ1FrGfWxE6NtqUb6lEfR+KE73TLFIzWONhOVCuKvTSTLhiVuf2SdpFxeX/q//
         17g2FIQeyMF/a8O6QnmHiZRkBlIC5ea4wBG78DWJt9wvde/jpIiJmnhYgqxeuOn9NB3r
         TpxA==
X-Forwarded-Encrypted: i=1; AL+hErEL1HtVENjU8MpXipSbAnZmKa2AEKpzhFjJnOkUXGJNNrftnyQ5YbJnernn+5uqyy/OieR7hiLFEEZW@vger.kernel.org
X-Gm-Message-State: APuU4Z+X2Bbf2pHUV30OqybO+9YAPE+rNSsBrI297dlh58vFeiFv5MHi
	8iEWWGYEgWfmL0V+fkIPYXa+ZGrMo2GC1H62g3weAvKZLTB7/XIwvLxY
X-Gm-Gg: AYBFou20t7yMEjWGF4JD5aNhVOOYKBW3k5s+FN4peJDVdF9hGaqqlKd6D6Eu+nJVPNB
	LkZR3y4zBIAS9009sLQs4XmC4EChMU1h3JKgwCcW8zeV7BbtUq6/N1KVBNMkv32CnDahWuaXX2I
	RO0c13UoqhBl+oCDDXygHWtrnpoOBF8I7ACztbO0xDHgZ1S3UNgz/1gB16b6TMhxqDdcmUV87dz
	54l7IEsMsS7ZvojJEzeWpts76lNb+1WSNtigK3LgvbYGTEKLMLM4UOQ/K5Osesch6Wpj129VMUa
	inQtSA7SjbmiIeB4W+2BH8ZywidGyPKGZPv+Aq8Z2Mqim8ietmNVK/9IuD1KT98paHPxurF986X
	iaNgvRdfOiQTzB3RsCyzbLNEuFfZRQXgpFJ+VdGPpEAeqgC+EhCD7Ex10iBX59G5gMKW2EF3V0q
	0SAyqr8OmtuwBj0rJW881Qak/j/+Isps/x+q68vbhp1IDhKDQVD4q3C9J6WR7NfUlfCQIqt3nTB
	0a3syotskRR3PPHbPikb80nnS2YbOfXLQ0nIzDa0YD3OZs9jOJ9t5KDVA+dLYIEIoizk0fv6AEo
	ux9QKUy4YSH6jAgnZnkKXhehpyVn8GuJNUwfg6DRx3u8JYP0V3YEj9IF89OnKSjmHWMDejAgdNO
	AXkgvHcmks6GLedL23W1KyWHNBZxXi24=
X-Received: by 2002:a17:906:c14d:b0:c50:5cd7:2901 with SMTP id a640c23a62f3a-c509640bfa8mr557945766b.23.1794733896267;
        Sun, 15 Nov 2026 01:11:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:34 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 3/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun, 15 Nov 2026 11:11:19 +0200
Message-ID: <20261115091120.108684-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/adc/Kconfig       |  10 ++
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/max8907-adc.c | 169 ++++++++++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f8456c8039883..4d5bd8f93fb8c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1176,6 +1176,16 @@ config MAX77541_ADC
 	  To compile this driver as a module, choose M here:
 	  the module will be called max77541-adc.
 
+config MAX8907_ADC
+	tristate "Maxim MAX8907 ADC driver"
+	depends on MFD_MAX8907
+	help
+	  Say yes here to build support for 8 channel 12-bit ADC
+	  interface found in the Maxim MAX8907 PMIC.
+
+	  To compile this driver as a module, choose M here:
+	  the module will be called max8907-adc.
+
 config MAX9611
 	tristate "Maxim max9611/max9612 ADC driver"
 	depends on I2C
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index d7bb4815df61c..8e6755315aa35 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_MAX14001) += max14001.o
 obj-$(CONFIG_MAX34408) += max34408.o
 obj-$(CONFIG_MAX40080) += max40080.o
 obj-$(CONFIG_MAX77541_ADC) += max77541-adc.o
+obj-$(CONFIG_MAX8907_ADC) += max8907-adc.o
 obj-$(CONFIG_MAX9611) += max9611.o
 obj-$(CONFIG_MCP320X) += mcp320x.o
 obj-$(CONFIG_MCP3422) += mcp3422.o
diff --git a/drivers/iio/adc/max8907-adc.c b/drivers/iio/adc/max8907-adc.c
new file mode 100644
index 0000000000000..1776032efc913
--- /dev/null
+++ b/drivers/iio/adc/max8907-adc.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/mfd/max8907.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_ADC_SCHED_AUTOSCH_ENABLE	BIT(1)
+#define MAX8907_ADC_SCHED_AUTOSCH_TIME		BIT(0)
+
+#define MAX8907_TO_REG(n)			((n) & 0xff)
+#define MAX8907_TO_MEASURE(n)			(((n) >> 8) & 0xff)
+
+enum {
+	TDIE, THM, ISNS, VMBATT, VBBATT, VCHG, AUX2, AUX1
+};
+
+static const u32 max8907_default_ref[] = {
+	[TDIE] = 4096,
+	[THM] = 4096,
+	[ISNS] = 4096,
+	[VMBATT] = 8192,
+	[VBBATT] = 8192,
+	[VCHG] = 8192,
+	[AUX2] = 2500,
+	[AUX1] 4096,
+};
+
+#define MAX8907_CHAN(_type, _idname, _datasheet_name) {		\
+	.type = (_type),					\
+	.address = MAX8907_REG_##_idname##_MSB |		\
+		   MAX8907_REG_##_idname##_MEASURE << 8,	\
+	.indexed = 1,						\
+	.channel = (_idname),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
+			      BIT(IIO_CHAN_INFO_SCALE),		\
+	.scan_index = (_idname),				\
+	.scan_type = {						\
+		.format = IIO_SCAN_FORMAT_UNSIGNED_INT,		\
+		.realbits = 12,					\
+		.storagebits = 16,				\
+		.endianness = IIO_CPU,				\
+	},							\
+	.datasheet_name = (_datasheet_name),			\
+}
+
+static const struct iio_chan_spec max8907_adc_channels[] = {
+	MAX8907_CHAN(IIO_VOLTAGE, TDIE,   "tdiode"),
+	MAX8907_CHAN(IIO_VOLTAGE, THM,    "thermistor"),
+	MAX8907_CHAN(IIO_CURRENT, ISNS,   "isense"),
+	MAX8907_CHAN(IIO_VOLTAGE, VMBATT, "vmbatt"),
+	MAX8907_CHAN(IIO_VOLTAGE, VBBATT, "vbbatt"),
+	MAX8907_CHAN(IIO_VOLTAGE, VCHG,   "vcharge"),
+	MAX8907_CHAN(IIO_VOLTAGE, AUX2,   "aux2"),
+	MAX8907_CHAN(IIO_VOLTAGE, AUX1,   "aux1"),
+};
+
+static int max8907_adc_read(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long mask)
+{
+	struct regmap **regmap = iio_priv(indio_dev);
+	__be16 data;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = regmap_write(*regmap, MAX8907_TO_MEASURE(chan->address), 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_bulk_read(*regmap, MAX8907_TO_REG(chan->address), &data, sizeof(data));
+		if (ret)
+			return ret;
+
+		*val = be16_to_cpu(data) >> 4;
+
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		*val = max8907_default_ref[chan->channel];
+		*val2 = chan->scan_type.realbits;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info max8907_adc_info = {
+	.read_raw = &max8907_adc_read,
+};
+
+static int max8907_adc_init(struct regmap *regmap)
+{
+	u32 value;
+	int ret;
+
+	/* Enable internal voltage reference. Exact purpose of bits is not known. */
+	ret = regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK(1, 0), BIT(1));
+	if (ret)
+		return ret;
+
+	/* Check for internal reference IRQ */
+	ret = regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT, value,
+				       !(value & MAX8907_MASK_NREF_OK), 0, 1000);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
+				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE |
+				  MAX8907_ADC_SCHED_AUTOSCH_TIME,
+				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE);
+}
+
+static int max8907_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct iio_dev *indio_dev;
+	struct regmap **regmap;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*regmap));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	regmap = iio_priv(indio_dev);
+
+	*regmap = max8907->regmap_adc;
+
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = max8907_adc_channels;
+	indio_dev->num_channels = ARRAY_SIZE(max8907_adc_channels);
+	indio_dev->name = dev_name(dev);
+	indio_dev->info = &max8907_adc_info;
+
+	/*
+	 * The ADC does not require a dedicated node; hence, the PMIC is set as
+	 * the iio_dev parent to enable the use of the PMIC node phandle in the
+	 * Device Tree bindings.
+	 */
+	iio_device_set_parent(indio_dev, dev->parent);
+
+	ret = regmap_set_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			      MAX8907_MASK_INT_REF_EN);
+	if (ret)
+		return ret;
+
+	ret = max8907_adc_init(max8907->regmap_adc);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static struct platform_driver max8907_adc_driver = {
+	.driver.name = "max8907-adc",
+	.probe = max8907_adc_probe,
+};
+module_platform_driver(max8907_adc_driver);
+
+MODULE_ALIAS("platform:max8907-adc");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 ADC driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

