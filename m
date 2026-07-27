Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BBD435A8D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177111; cv=none; b=bOcHPlkI/tSpLWdIWdoyad4c9ZN5DPrEv+gHoWgoCPzDIwfjArm9p5PjAEPI1EJf14J9gl3Buo6Y8ra/ghfkmMExglmsZcHI43o8Y3Pj6WEYNu/0ZUW5BaWwzWLaLVA85xtAsrwQSujMbKhEONT8eNt6xD4e7RIrBpE91ab5tkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177111; c=relaxed/simple;
	bh=4JT14rLPSxyQEjNzCZhXOMA1Il5BxVYAEfdgDtNZKtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWg0aBPxfHiN6pNe1qIsxkmB2jU39+sU+Pnmb8b81zBXqEu8SFisV5Vn/zhtINU6sCXxws4phKOhqNGoa1l7FprZ4E0V5yHoM0N+vP6DXdWcK9WRLF9mxTZsXrHBaFopGbCtlcw1MrfLt5kbNGUj5kZJH7d3PZQBdKCZIHjmAcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIlbafGT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIlbafGT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4955de8797cso18954935e9.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785177108; x=1785781908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXHaKZDYAUayy9xU8XiocSP4ZIrroI8ulKIatD3hmEE=;
        b=tIlbafGTSfQf89VY0BEZ6QlxaXlpOzpHqn8iBl+bnEehFkp7D/jjZuhc0p6TugYd3m
         csOKEMsptyrdDIsYXeatGINvaICSyZkI513i98PJuQhZSf3JcpYSu/dwl0uY8L1l/fc0
         OAs9pzkTED9WrVo6jWCG2qNCA/PWILYm7nyCuI8UnbUh0ekp8PQej7VySIiaEVDtyOZl
         8ov1EKxc4r7RkAvF7QHX/vdwvpdUOx6TNN1s+dxYGN7yXSuy+oPIdEposFTPwEAVLMXX
         HL1+FDGWvL68Os1PkF1EB5BvieiWSelB/Vxwxx+Zv/IHwzXJz9BPrCYSa1nJVLT2xMaF
         7PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177108; x=1785781908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXHaKZDYAUayy9xU8XiocSP4ZIrroI8ulKIatD3hmEE=;
        b=kBjIdd63WD7vHnMkMgRFBs0Jrp2DODTyLDNFiCdjQ4viRc8X2Nram1Dv4pL/GaLWH+
         N6R3SnaKgnaOWI6VxgQFoAuXBIsaG5vyM7SBZGWzTXrJU2wBtpjMEHJicHfQvEWQk4Lg
         ZZxApxLJNIaeqAG/S/OjYtZLP1/QQnLJ91/TPWjaziQgcfjhaaUsKlP2cDCJfwVuQN7G
         YBj+GinnuJLjwBo6QSW/CAqE486ndcPQpUkGMRI/xT2Bd2wFLlsHXYHqbnoEdaWbci/b
         0NCcuF4PYQs4dt6nycH6E75Tw6uK+qDCKEGEiq+5+fGbqIdgP3XoWrJDYBhlzw2DySLP
         D4RA==
X-Forwarded-Encrypted: i=1; AHgh+RrCK0MwRdM4rmWQShyc2wN1c89jMIvguTrjQgm+xNaLULcRk7l/4NpNY1on1m3EFvnPjyQ7KWSiFyWO@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ1j0qvLgOVZSb4lobSJorG1StmUXnI6xOjBMkpRzGYATlhxKg
	4BXNOgD7fxH+HIg2ZtM91uz41BjunF/d7VcaK94T8/ieoiD0udDphoHl
X-Gm-Gg: AR+sD13M+0KNKyaFNNl/yAdGzilGN0iZZMrhTBnqR08x62mQkCHFmIp2yFfFf6z6d/6
	ov50JDcEk9B0dHol6vrY6DxGi7PgJXwGEkJerGotezWTQeUkWn2khUpoDrr8WhRXZEQnfmZO6bx
	ogDBhQEjXCfZ1eYudlMU0kLH+SjJvNmdnD88TJGwzx6z5MoW3/amEBMpt2HDVZ+RkTvmQwE6F8r
	rq+fzBogOYsLRNE5XqxyeqiszGtDQixxNQot0Su/j9OB4NhwmyGdcoibgvFmnZk69DwNuIw704c
	usydRkm0TulKW1QTDNVgeZPyXmKhY3kmmEnMRVQDlP4pWp7fbcKYA/mSOOuuR+nkT0/+bA+7NW4
	wxncukzQFi2tkbgIzmE6TPoIrawvlPCa5E+z/3ERs3AsY93k6XpDE39l+l/rD6lHJ+4KktMiH/n
	j2uhGzm+9wdcxW1M0JE7AQQ6KVbx88NtTLpavKmnNVab3+DJ1kp8T3FBjLGYxzCtUyHbUGZUAqr
	o7KiKVx/Gk2MNisyWultI+hb9iFOB5uKb4Ne3fYVA6CPnINJCyHjfsWCfMfXt7CwXwWo1ZemjYT
	7KF4NN8Fxuj82PX0chu7Mjti4f7RzrcnB1R1x0yYiSSfnRusSmn8H43C04WbHp/hI35SPia1WX9
	G9fKXPD5qscNEynw=
X-Received: by 2002:a05:600c:8b52:b0:495:6e68:39bd with SMTP id 5b1f17b1804b1-496b5726cf0mr127138915e9.28.1785177107810;
        Mon, 27 Jul 2026 11:31:47 -0700 (PDT)
Received: from [192.168.1.187] (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44b84edsm17800535e9.5.2026.07.27.11.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:31:47 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 27 Jul 2026 20:31:25 +0200
Subject: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-mcp47a1-add-support-v2-2-d4591a2ce69e@gmail.com>
References: <20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com>
In-Reply-To: <20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785177105; l=6518;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=4JT14rLPSxyQEjNzCZhXOMA1Il5BxVYAEfdgDtNZKtE=;
 b=FLzg2SkqLnqwDA8HaSXCLmwW3IiPoUBhMs7c4nN6a58/0euilvt+SWlxuKtgQHqpbopEQU9P9
 oGlh+VgFLmHAVKEHGh5K2rD9CKQAtaWxJRSNrRgs181WPa0klL533AW
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
which communicates via I2C.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 MAINTAINERS               |   1 +
 drivers/iio/dac/Kconfig   |  10 +++
 drivers/iio/dac/Makefile  |   1 +
 drivers/iio/dac/mcp47a1.c | 169 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 181 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a0b23418a64..552ced65cf75 100644
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
index d6d560c09e25..1d00cd911826 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -565,6 +565,16 @@ config MCP4728
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
index 000000000000..140e93ff2ba0
--- /dev/null
+++ b/drivers/iio/dac/mcp47a1.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip MCP47A1 DAC driver
+ *
+ * Copyright (c) 2026 Joshua Crofts <joshua.crofts1@gmail.com>
+ *
+ * Datasheet: https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf
+ */
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <linux/iio/iio.h>
+
+#define MCP47A1_REG_MAX		0x40
+#define MCP47A1_CMD_CODE	0x00
+#define MCP47A1_MAX_STEP	63
+
+struct mcp47a1_data {
+	struct i2c_client *client;
+	int vref_mV;
+};
+
+static const int mcp47a1_raw_avail[] = { 0, 1, MCP47A1_MAX_STEP };
+
+static const struct iio_chan_spec mcp47a1_channels[] = {
+	{
+		.type = IIO_VOLTAGE,
+		.indexed = 1,
+		.output = 1,
+		.channel = 0,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
+	},
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
+		if (val < 0 || val > MCP47A1_MAX_STEP)
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
+		*val2 = MCP47A1_MAX_STEP;
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
+	indio_dev->channels = mcp47a1_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mcp47a1_channels);
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
+MODULE_DESCRIPTION("MCP47A1 DAC");
+MODULE_LICENSE("GPL");

-- 
2.55.0

