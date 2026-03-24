Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5053C7DF7
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334419; cv=none; b=byUTxTpzSOkRJ92vZ43eNtkYFBTS5Cap1wum39AXUXdlM2Wvf6seCGF47mQ8GphJ8Eo6RI/lLYc6JHP3TCtrWNL//PvxHSmeBiINGJcZNo8nnYbHaj1Dx0Jsccuzzp4UnXbrJjDM474PIRg3Ms+bAHHcRRO6mxoGZ84g/con8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334419; c=relaxed/simple;
	bh=1LdXJ5jnOfI9O5hQ73wJ1dSLwCSR4SGiOqmQhpvEUSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcDznYRon1kLOtJJ0A8j3AFQmW1cD1V8/Nm+WVCRwOhL4r8oIgd/0Zbt/TXgcobWVueW6UOxPGzAbZ20bYYi4DRlzPxoy0SUdQb8Q+swhrQxALtzzOEaWPVA+hFXkPOGJx8wf05NIIVIUNwaFWESdFn+RAxRg1AVPYwVsnDMWeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UUYevHvz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UUYevHvz"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aecefc7503so37343345ad.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774334410; x=1774939210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQShHEmZaDqkpmvNKc42ulb0eSRkDXykwi+h4iXesqs=;
        b=UUYevHvzG4uqcOz4L5v6K0xOLUjrEq/AeuGx39jgmAbzRh6DZqJu2vYLou1pxdnHAo
         mQhkGOEBPFgvRqK9rdgzIAjqmMnBwXRqPNVuizQM9BNsIKtBwUXoDzkIrJm6TX0Q79U1
         9DGGZywKHw/kf3BLcSr0JVXJ/TcH++Mg/wxAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334410; x=1774939210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eQShHEmZaDqkpmvNKc42ulb0eSRkDXykwi+h4iXesqs=;
        b=r9sw/P47Zt8iFwG4Tb9jRD/rjJubmZDA7y2VdbZY+OSC4XLbfFFB2qWvwdw41sQG1f
         nCKQodBz1jBck0+hf83GA5/1wL12m2EqxhaKF+8nf1R2jwk1D1lbidWwXbCH0KLmomlK
         C9m8pCnDvIwV5q9fUOOJ0GVq/oZW18S6euvDg5MbX44YA5LRvd6GP2qWrBmCezddKIUQ
         IHamlX8n4xZwnUE0yId3FaxetqrWDcXRAeE9OdNb8MCJ+X9PGH7D2QUXOfmP42v42Cjr
         kHSaZwcb2QsIdXGgj4Do3ahLU6wKN13dkyug1FLh9gc6hlh4+hAvXvi1AUEoxZbR8ObV
         aHZA==
X-Forwarded-Encrypted: i=1; AJvYcCWFbmaRNJjukiAAX0q/P+9n70WHEC8MMj+MjX56PcjJhcTMtDwTk/BLmj6C/K6Gq+lNkCD/v5KzLi9n@vger.kernel.org
X-Gm-Message-State: AOJu0YwmB/6ALcJUOTNzCPIXYanEwBzPMBu9P3ZU8GH+KTagZn+41/qy
	+JB9ir4QGm67hfOrhRgOR3r2xUJ7rxzuDrmy67bFZ/9S+6RnK7mTuqGfFSuRgankQQ==
X-Gm-Gg: ATEYQzxpplmvokbpuqN7tYQWam9Cdn6zqihkhHci5qXawywNmJvb19PCOTbD33mYM3Y
	7HbnkZy2q/HM95buC2JZz+DBsuydrqt9nQyiEaKdqUh7c0O9Ax5kl9nkPqg208kWYx/zUk1mywr
	sndQzlsIYZj8/IzJLNpQUAuUiDV4bJ07GK2zEOm9pX87VFQtIDC3rBuK8fomJk6UUrp+bWFST4q
	nbabBmWSVe4BpXQ5xWIUeqnEKDafGLEs/9EgBv+pyg/k06axq2aqZVxKsqUikTgvBmKMbrhpGFA
	vgzIUenl8n4U5xqoBUb3abKNTFCST/ji9mdK6HvYhvg9fthC7D4e+d3dsX8QHL22PxrJQJyhmIT
	sR5QoLIPJyFWcojFmSXl0OzaOgLa/nBZdTeI9AAuyK2o/xQjJzm7vEpVgYCOYefQh425jWj96Om
	SksgCtEAW+mMuTPorZ38GkAuuLt0C4zaGXEKSt3l2+NW+z4uelcTojV6JwQGm6aIEHjk3QJ10Cv
	zOMnmjHM1QOK/DlDyBqbkgZyw81abxjgA==
X-Received: by 2002:a17:903:288:b0:2b0:4579:ae6 with SMTP id d9443c01a7336-2b08279f65cmr136502225ad.38.1774334409749;
        Mon, 23 Mar 2026 23:40:09 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835429afsm128416545ad.26.2026.03.23.23.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:40:08 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 24 Mar 2026 06:39:41 +0000
Subject: [PATCH v2 08/11] HID: spi_hid: add device tree support for SPI
 over HID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-send-upstream-v2-8-521ce8afff86@chromium.org>
References: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
In-Reply-To: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774334401; l=8620;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=mkmXMpXTmrFUxfWJvm7MB0bvyfpEyxmpvE8pXakk9Dg=;
 b=EY1PsvT152HiRsQwPnxFaTeiDOxDUJPtg2Vd3VONn6Cp/IP7jBxSczW243Y7uWFrnT585x4/u
 EMUh75vdFzRB8r7sDt1ixzYVE6Tp3lcRgyP6vl4WiqjfftzAUXdntNg
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/spi-hid/Kconfig      |  15 +++
 drivers/hid/spi-hid/Makefile     |   1 +
 drivers/hid/spi-hid/spi-hid-of.c | 243 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)

diff --git a/drivers/hid/spi-hid/Kconfig b/drivers/hid/spi-hid/Kconfig
index 114b1e00da39..76a2cd587a3e 100644
--- a/drivers/hid/spi-hid/Kconfig
+++ b/drivers/hid/spi-hid/Kconfig
@@ -25,6 +25,21 @@ config SPI_HID_ACPI
 	  will be called spi-hid-acpi. It will also build/depend on the
 	  module spi-hid.
 
+config SPI_HID_OF
+	tristate "HID over SPI transport layer Open Firmware driver"
+	depends on OF
+	select SPI_HID_CORE
+	help
+	  Say Y here if you use a keyboard, a touchpad, a touchscreen, or any
+	  other HID based devices which are connected to your computer via SPI.
+	  This driver supports Open Firmware (Device Tree)-based systems.
+
+	  If unsure, say N.
+
+	  This support is also available as a module.  If so, the module
+	  will be called spi-hid-of. It will also build/depend on the
+	  module spi-hid.
+
 config SPI_HID_CORE
 	tristate
 endif
diff --git a/drivers/hid/spi-hid/Makefile b/drivers/hid/spi-hid/Makefile
index 753c7b7a7844..fe627fd378e3 100644
--- a/drivers/hid/spi-hid/Makefile
+++ b/drivers/hid/spi-hid/Makefile
@@ -8,3 +8,4 @@
 obj-$(CONFIG_SPI_HID_CORE)	+= spi-hid.o
 spi-hid-objs 			= spi-hid-core.o
 obj-$(CONFIG_SPI_HID_ACPI)	+= spi-hid-acpi.o
+obj-$(CONFIG_SPI_HID_OF)	+= spi-hid-of.o
diff --git a/drivers/hid/spi-hid/spi-hid-of.c b/drivers/hid/spi-hid/spi-hid-of.c
new file mode 100644
index 000000000000..651456b6906d
--- /dev/null
+++ b/drivers/hid/spi-hid/spi-hid-of.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HID over SPI protocol, Open Firmware related code
+ *
+ * Copyright (c) 2021 Microsoft Corporation
+ *
+ * This code was forked out of the HID over SPI core code, which is partially
+ * based on "HID over I2C protocol implementation:
+ *
+ * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
+ * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
+ * Copyright (c) 2012 Red Hat, Inc
+ *
+ * which in turn is partially based on "USB HID support for Linux":
+ *
+ * Copyright (c) 1999 Andreas Gal
+ * Copyright (c) 2000-2005 Vojtech Pavlik <vojtech@suse.cz>
+ * Copyright (c) 2005 Michael Haboustak <mike-@cinci.rr.com> for Concept2, Inc
+ * Copyright (c) 2007-2008 Oliver Neukum
+ * Copyright (c) 2006-2010 Jiri Kosina
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+
+#include "spi-hid.h"
+
+struct spi_hid_timing_data {
+	u32 post_power_on_delay_ms;
+	u32 minimal_reset_delay_ms;
+};
+
+/* Config structure is filled with data from Device Tree */
+struct spi_hid_of_config {
+	struct spihid_ops ops;
+
+	struct spi_hid_conf property_conf;
+	const struct spi_hid_timing_data *timing_data;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator *supply;
+	bool supply_enabled;
+	u16 hid_over_spi_flags;
+};
+
+static int spi_hid_of_populate_config(struct spi_hid_of_config *conf,
+				      struct device *dev)
+{
+	int error;
+	u32 val;
+
+	error = device_property_read_u32(dev, "input-report-header-address",
+					 &val);
+	if (error) {
+		dev_err(dev, "Input report header address not provided.");
+		return -ENODEV;
+	}
+	conf->property_conf.input_report_header_address = val;
+
+	error = device_property_read_u32(dev, "input-report-body-address", &val);
+	if (error) {
+		dev_err(dev, "Input report body address not provided.");
+		return -ENODEV;
+	}
+	conf->property_conf.input_report_body_address = val;
+
+	error = device_property_read_u32(dev, "output-report-address", &val);
+	if (error) {
+		dev_err(dev, "Output report address not provided.");
+		return -ENODEV;
+	}
+	conf->property_conf.output_report_address = val;
+
+	error = device_property_read_u32(dev, "read-opcode", &val);
+	if (error) {
+		dev_err(dev, "Read opcode not provided.");
+		return -ENODEV;
+	}
+	conf->property_conf.read_opcode = val;
+
+	error = device_property_read_u32(dev, "write-opcode", &val);
+	if (error) {
+		dev_err(dev, "Write opcode not provided.");
+		return -ENODEV;
+	}
+	conf->property_conf.write_opcode = val;
+
+	conf->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(conf->supply)) {
+		if (PTR_ERR(conf->supply) != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get regulator: %ld.",
+				PTR_ERR(conf->supply));
+		return PTR_ERR(conf->supply);
+	}
+	conf->supply_enabled = false;
+
+	conf->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(conf->reset_gpio)) {
+		dev_err(dev, "%s: error getting reset GPIO.", __func__);
+		return PTR_ERR(conf->reset_gpio);
+	}
+
+	return 0;
+}
+
+static int spi_hid_of_power_down(struct spihid_ops *ops)
+{
+	struct spi_hid_of_config *conf = container_of(ops,
+						      struct spi_hid_of_config,
+						      ops);
+	int error;
+
+	if (!conf->supply_enabled)
+		return 0;
+
+	error = regulator_disable(conf->supply);
+	if (error == 0)
+		conf->supply_enabled = false;
+
+	return error;
+}
+
+static int spi_hid_of_power_up(struct spihid_ops *ops)
+{
+	struct spi_hid_of_config *conf = container_of(ops,
+						      struct spi_hid_of_config,
+						      ops);
+	int error;
+
+	if (conf->supply_enabled)
+		return 0;
+
+	error = regulator_enable(conf->supply);
+
+	if (error == 0) {
+		conf->supply_enabled = true;
+		fsleep(1000 * conf->timing_data->post_power_on_delay_ms);
+	}
+
+	return error;
+}
+
+static int spi_hid_of_assert_reset(struct spihid_ops *ops)
+{
+	struct spi_hid_of_config *conf = container_of(ops,
+						      struct spi_hid_of_config,
+						      ops);
+
+	gpiod_set_value(conf->reset_gpio, 1);
+	return 0;
+}
+
+static int spi_hid_of_deassert_reset(struct spihid_ops *ops)
+{
+	struct spi_hid_of_config *conf = container_of(ops,
+						      struct spi_hid_of_config,
+						      ops);
+
+	gpiod_set_value(conf->reset_gpio, 0);
+	return 0;
+}
+
+static void spi_hid_of_sleep_minimal_reset_delay(struct spihid_ops *ops)
+{
+	struct spi_hid_of_config *conf = container_of(ops,
+						      struct spi_hid_of_config,
+						      ops);
+	fsleep(1000 * conf->timing_data->minimal_reset_delay_ms);
+}
+
+static int spi_hid_of_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct spi_hid_of_config *config;
+	int error;
+
+	config = devm_kzalloc(dev, sizeof(struct spi_hid_of_config),
+			      GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	config->ops.power_up = spi_hid_of_power_up;
+	config->ops.power_down = spi_hid_of_power_down;
+	config->ops.assert_reset = spi_hid_of_assert_reset;
+	config->ops.deassert_reset = spi_hid_of_deassert_reset;
+	config->ops.sleep_minimal_reset_delay =
+		spi_hid_of_sleep_minimal_reset_delay;
+
+	config->timing_data = device_get_match_data(dev);
+	/*
+	 * FIXME: hid_over_spi_flags could be retrieved from spi mode.
+	 * It is always 0 because multi-SPI not supported.
+	 */
+	config->hid_over_spi_flags = 0;
+
+	error = spi_hid_of_populate_config(config, dev);
+	if (error) {
+		dev_err(dev, "%s: unable to populate config data.", __func__);
+		return error;
+	}
+
+	return spi_hid_core_probe(spi, &config->ops, &config->property_conf);
+}
+
+const struct spi_hid_timing_data timing_data = {
+	.post_power_on_delay_ms = 10,
+	.minimal_reset_delay_ms = 100,
+};
+
+const struct of_device_id spi_hid_of_match[] = {
+	{ .compatible = "hid-over-spi", .data = &timing_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, spi_hid_of_match);
+
+static const struct spi_device_id spi_hid_of_id_table[] = {
+	{ "hid", 0 },
+	{ "hid-over-spi", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, spi_hid_of_id_table);
+
+static struct spi_driver spi_hid_of_driver = {
+	.driver = {
+		.name	= "spi_hid_of",
+		.owner	= THIS_MODULE,
+		.of_match_table = spi_hid_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.dev_groups = spi_hid_groups,
+	},
+	.probe		= spi_hid_of_probe,
+	.remove		= spi_hid_core_remove,
+	.id_table	= spi_hid_of_id_table,
+};
+
+module_spi_driver(spi_hid_of_driver);
+
+MODULE_DESCRIPTION("HID over SPI OF transport driver");
+MODULE_AUTHOR("Dmitry Antipov <dmanti@microsoft.com>");
+MODULE_LICENSE("GPL");

-- 
2.53.0.983.g0bb29b3bc5-goog

