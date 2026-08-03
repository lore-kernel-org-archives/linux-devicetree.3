Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D242669A
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778353; cv=none; b=MbbOKga0EzZpaaypzHy4k4xlAza7Vcx4njhgFlaAT/ybx33yTwDC4d/TF21Tip/DJHF8EHO6QRft3R/XxcOs70SwWW4xLr/jpoIv7pjhWKnJUv2/xb4D+HYvZrrUq9RhEcdXYk9jywExHPO4t6n9UFmqDDjq261MxNJPZHYEaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778353; c=relaxed/simple;
	bh=krxY0lu1oFLcj0ILTcjLHRmz1mRM3E8GryNvXf+BdVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjFiMZVkBC296pLHc9GgmGf8wFo3UEvBVixbJ8TZAckcTt+p/rLNMF/r38GB25HYDD0hMuM40zkNKQsA4Zacw3vYJflFoAlhPNSS42hYWUrASKdjSCJU1WIf0wwGum3yybuHYxyRVzdh2//Gv/E9sPOEHRzZqrZe3impB6GXJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTPz8pID; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTPz8pID"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954aff6088so20705965e9.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785778349; x=1786383149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwJsI1vUB3E2f0JzSuTW59bUIwuJOClS3FjW5yqPnhU=;
        b=cTPz8pIDcEdgKHb95RWHcXVNx2uWBgwMHfDaOxz6buo52mKlgzy4QqZ1ux76xUGAMz
         Bwj6eL/7W1l+njVRl46MWIUmdeFYpHjgpi33o+se/c6CikU0MA6HmDnocboIWYa12G05
         qU5MmfmA1wPfeiMFPB4UuckGzHY/HkhR/Qv/zbgmkymPaxe4t3vd9Og/XR2/TVpFBet0
         KPOeHIcj5XXi7etD7LRJcO1Wb52liChIgy6CZgoe90wOjryZ6FrRMK4wTif2JRK9WXV4
         5/gzhnJN/Q+9NS5R4/bTO/kvUoeI0rUr9j+pv98JfhLQxMcxbsnw+HwsQkfFQYlX2v8p
         C+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778349; x=1786383149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwJsI1vUB3E2f0JzSuTW59bUIwuJOClS3FjW5yqPnhU=;
        b=bur/awvIVBMArPH4TVZFFIchW4mkTICujyGd+CH8y6OU96TMrUKWx9NA3zZ7746rvM
         YTRnq0l8jzN2H2y+j1Xin8IGBc+jU1ca+QOwwPs6Yq05HkEnZVaZX5E8RBXrKBVDpw8y
         BFLSFR1EHYHyKFWHjpdiTX1s49usQYD26IJaQ78/z47LzsPdvxWABYctXl2s7VOmxNrW
         TjMSp8/NmllWNtIPgU+QmWPtDJ/yK4cw+YGBhxMzRaW3tbzIONvxb81hnwG9dgbV+daC
         2+syFI4pfrhn3vazmxgu33k63atDLMfEc8iLyR9Z6IJGwymXdeEF3xWAaV4APF4IBKqn
         ctdA==
X-Forwarded-Encrypted: i=1; AHgh+RpjeOh7hflCtdhrvOOj+xwo8cDa+KZ3uAyYSO5rc5r5f0VV5P9nNibjEl/rk+YZltxGqniISV45Grym@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40plrRubeCgQ02I5EapHnMgXjDFrJuNzlpiB6+7jEJux81PCH
	0AqhAjL+f7SOQ1CUaOSDne+8Aa1Jrjo6K7mp/uMKG/F0A1odMNjCFEuv6U+TuUz8juY=
X-Gm-Gg: AR+sD103qUk2gvtk1ny+BhFHoXa053B0/d8c4FGlAQs5wvRea37/vwmLblwzQ8ICH8X
	EqJkPleiVZrBcWyKYd1Y6Q/6U3qeYIdDYuHIUnt4ZcKQW8t6m24CO3Em9VYCSSoI76FfJrhAA/8
	Y60vh8Nj4ECgKs8Scq7JUcnta2wNx3ODhljAwo2hDmMaBcaeYTjlV21b0DOK5nHnqFPQCSsJte3
	i3Ibfm1WPckT7JcUGKlsfkYHcvPw1yKR7DKhqgwqdDUDvHIBvRKmh85t3ICJMBUmcAUCyQGGxC/
	2zcLScn7dl03slAfliSSadPmBzuhptcIUwu/7fGM4QbBecVbzHiBsjiVyX+NXSPuy22nnP2VR86
	+KN9yDBaIl+VrSi2EZK0AAkO7OETjxGRgVUPxS0MSKnTz/SqT9HxPnCiXG0HS4zA56EVcX6mSIO
	t3wxTdSS/kSTfC573QQqgadxzo3oOj4nh6sdLcZILyAogYhAIZWbT1lYfFpvHAFnHGB+rgyOamZ
	s+1QiaospiTblUQ2cPujHUxlMYh1kuOfcwJj3t+gBvPUPYMKE18TpaRO0s7Ecmy3pzVV+maz8t2
	byyK9t8et7r3M9O4ZwaNLNK+6xU3B2Xv7MZx2VlfIEVBwKSxV/C8Kz+LrDvkz5uGUtKk2ORDxWS
	4pwOUHQrS2iW4X1oFj03NMtqYClcqB1bl8aIJzQ==
X-Received: by 2002:a05:600c:840f:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-4980c601d19mr230022635e9.0.1785778348683;
        Mon, 03 Aug 2026 10:32:28 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199a68sm176259975e9.4.2026.08.03.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:32:28 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 03 Aug 2026 19:32:26 +0200
Subject: [PATCH v3 2/2] iio: dac: mcp47a1: add support for new device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-mcp47a1-add-support-v3-2-540e71b4fd2e@gmail.com>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
In-Reply-To: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785778346; l=6466;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=krxY0lu1oFLcj0ILTcjLHRmz1mRM3E8GryNvXf+BdVc=;
 b=vDcJNkdVI+bS9hrsfRn1RgDsgMN/O0hw/0Rl0c/N2XEJeB0Y9CqnhdgmM3cdWVbY0fLCCEsE/
 Edz/PjDKHFhBuxytaUZyeVchlcI+ZF7dFjGgvO5+d/5u5uofRhXL0SD
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
which communicates via I2C.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 MAINTAINERS               |   1 +
 drivers/iio/dac/Kconfig   |  10 +++
 drivers/iio/dac/Makefile  |   1 +
 drivers/iio/dac/mcp47a1.c | 166 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c8118eb4141..fc76a2159e1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17703,6 +17703,7 @@ MICROCHIP MCP47A1 DAC DRIVER
 M:	Joshua Crofts <joshua.crofts1@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
+F:	drivers/iio/dac/mcp47a1.c
 
 MICROCHIP MCP9982 TEMPERATURE DRIVER
 M:	Victor Duicu <victor.duicu@microchip.com>
diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 18a27785e28b..04c90d98f86f 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -582,6 +582,16 @@ config MCP4728
 	  To compile this driver as a module, choose M here: the module
 	  will be called mcp4728.
 
+config MCP47A1
+	tristate "MCP47A1 DAC driver"
+	depends on I2C
+	help
+	  Say Y here if you want to build a driver for the Microchip
+	  MCP47A1 digital-to-analog converter with an I2C interface.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mcp47a1.
+
 config MCP47FEB02
 	tristate "MCP47F(E/V)B01/02/04/08/11/12/14/18/21/22/24/28 DAC driver"
 	depends on I2C
diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
index 5d20d37e44ce..992f8930f95c 100644
--- a/drivers/iio/dac/Makefile
+++ b/drivers/iio/dac/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MAX5821) += max5821.o
 obj-$(CONFIG_MCF54415_DAC) += mcf54415_dac.o
 obj-$(CONFIG_MCP4725) += mcp4725.o
 obj-$(CONFIG_MCP4728) += mcp4728.o
+obj-$(CONFIG_MCP47A1) += mcp47a1.o
 obj-$(CONFIG_MCP47FEB02) += mcp47feb02.o
 obj-$(CONFIG_MCP4821) += mcp4821.o
 obj-$(CONFIG_MCP4922) += mcp4922.o
diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
new file mode 100644
index 000000000000..0bf994aa0e4f
--- /dev/null
+++ b/drivers/iio/dac/mcp47a1.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Microchip MCP47A1 DAC driver
+ *
+ * Copyright (c) 2026 Joshua Crofts <joshua.crofts1@gmail.com>
+ *
+ * Datasheet: https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <linux/iio/iio.h>
+
+#define MCP47A1_CMD_CODE	0x00
+#define MCP47A1_MAX_STEPS	64
+
+struct mcp47a1_data {
+	struct i2c_client *client;
+	int vref_mV;
+};
+
+static const int mcp47a1_raw_avail[] = { 0, 1, MCP47A1_MAX_STEPS - 1 };
+
+static const struct iio_chan_spec mcp47a1_channel = {
+	.type = IIO_VOLTAGE,
+	.indexed = 1,
+	.output = 1,
+	.channel = 0,
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_separate_available = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
+};
+
+static int mcp47a1_write(struct iio_dev *indio_dev,
+			 struct iio_chan_spec const *chan,
+			 int val, int val2, long mask)
+{
+	struct mcp47a1_data *data = iio_priv(indio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		if (!in_range(val, 0, MCP47A1_MAX_STEPS))
+			return -EINVAL;
+
+		return i2c_smbus_write_byte_data(data->client, MCP47A1_CMD_CODE,
+						 val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcp47a1_read(struct iio_dev *indio_dev,
+			struct iio_chan_spec const *chan,
+			int *val, int *val2, long mask)
+{
+	struct mcp47a1_data *data = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = i2c_smbus_read_byte_data(data->client, MCP47A1_CMD_CODE);
+		if (ret < 0)
+			return ret;
+
+		*val = ret;
+
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = data->vref_mV;
+		*val2 = MCP47A1_MAX_STEPS;
+
+		return IIO_VAL_FRACTIONAL;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcp47a1_read_avail(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      const int **vals, int *type, int *length,
+			      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		*vals = mcp47a1_raw_avail;
+		*type = IIO_VAL_INT;
+		return IIO_AVAIL_RANGE;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info mcp47a1_info = {
+	.write_raw = mcp47a1_write,
+	.read_raw = mcp47a1_read,
+	.read_avail = mcp47a1_read_avail,
+};
+
+static int mcp47a1_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct mcp47a1_data *data;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+	data->client = client;
+
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable regulator\n");
+
+	/* Delay after device exits reset state (see AC/DC characteristics) */
+	fsleep(20);
+
+	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read vref\n");
+
+	data->vref_mV = ret / (MICRO / MILLI);
+
+	indio_dev->name = "mcp47a1";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &mcp47a1_info;
+	indio_dev->channels = &mcp47a1_channel;
+	indio_dev->num_channels = 1;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id mcp47a1_of_match[] = {
+	{ .compatible = "microchip,mcp47a1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mcp47a1_of_match);
+
+static const struct i2c_device_id mcp47a1_id[] = {
+	{ .name = "mcp47a1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mcp47a1_id);
+
+static struct i2c_driver mcp47a1_driver = {
+	.driver = {
+		.name = "mcp47a1",
+		.of_match_table = mcp47a1_of_match,
+	},
+	.probe = mcp47a1_probe,
+	.id_table = mcp47a1_id,
+};
+module_i2c_driver(mcp47a1_driver);
+
+MODULE_AUTHOR("Joshua Crofts <joshua.crofts1@gmail.com>");
+MODULE_DESCRIPTION("Microchip MCP47A1 DAC Driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0

