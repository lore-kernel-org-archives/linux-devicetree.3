Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581B509EF5
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 22:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584811; cv=none; b=Q0V6SpNd1uNFlB2DUjox5T9IUp0UlKwgP/4sO8uTCJ3yVJpZ7jIs+TF7fqYgQvEhgnq2ge0TaQj38H9SOAk0HQ7a2vFvasOjvqg451utxgBrs3t90Wg15v6MIB8wK5arN0jzQ8u2tYWGAAyM50b4QZWOlGzyEd/nVp3xj8QRUUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584811; c=relaxed/simple;
	bh=LJj6K1G7nIg4RUpnBzs9tUCxlDRH5sE1C6GzE4JA8zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdcypQqA+dwy1DkBP/n+xC9bCCnORVQUKuVUf4YbMyPUROmxA6y2pb4O9zVTCm5wBQlOeqcwv4MJAhvjx6+nNZZPSOo8FSc8U33+DDJpQ41xJaGHRIzjr+Psy76mB2OGCcyp+YgbaBhqYCHIN3DuIKZNRmj9iP9AoG6bYrqeMrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aowRUttk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aowRUttk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5fb79ce82so1208905ad.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 15:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584804; x=1792189604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiDXJETLiBuBer69iWP6U6KIqCZWH0VNC8FWsxXPDiM=;
        b=aowRUttk/3xc/0wvwvv+zJ+BugnUNlbjpFt1E47iSy4S80XvDJy2hNTpi2G6Law+pW
         01TcgJWyHJ0WJL74LJTy3vh+RKPvjVj0D+s23OKLKjrRlw0kkuHXX7eDkDe27DcUnk3j
         mJuyLDNSEwkeboezjrYLjF8GF31V4z72vPRus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584804; x=1792189604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiDXJETLiBuBer69iWP6U6KIqCZWH0VNC8FWsxXPDiM=;
        b=DaPECHPsWjw5nOjHGaDkuLAdqhFzFTQvxZCLG8IpGv7viG0/ermRJPsXJmEw3tJAbu
         9m1t23JMSX0K4Q/28WfLZ8sSOZ661LI1eklkuCrBJDsIAXyQ1WUwRe+hmASVI5aUySUr
         VP3dGPWQv/8H5kUVwUNMAJx7R+HTEJJyqsny/HtlAabAollHenSHclIf+ViRTzFJ5Qjn
         9Zm4j8aj1nauAJ6WlToujzl9wz3MXLBQwX0GPWnDEkWltTyFwzwvSoDs7veNk9yQHIrZ
         lBJbiiY4w1cVJ8H1iiSHeW2uc8dO5Gn4Fe9v6qSmoYkbjFAcOcTHXniuzKfzQqp/csRB
         DECA==
X-Forwarded-Encrypted: i=1; AKwUvBxeGwmo5YmKoY2mjFbgVugFUhHoSf24hJkREwpg5dY2zkFyitGE2WfbMGyRMTVUYJVlX6JLqhgk1p+d@vger.kernel.org
X-Gm-Message-State: AFq9FYJpoOjpA+J+RoJK/YmGyxdpusutssnvttf+OdCqN6j6GnrqzRXY
	BkKcswUE+kRmiA17N9WBgsdf2D5qywqEvlr6imK2NU6UFq4D2kg6iuUV4n6TaWGw6Q==
X-Gm-Gg: AYBFou0SFTr52Jfz4Fvt8Yy252OByAfK/nQ7meUJ4hTzfzOTD6Vz5qmIAjVUP4cJelx
	Q5nyZsFZJy9FoiFW1MvAN+e9IHYqqrpsase6kMLWOKwCLo9oZwxwCNv+bLUBFdlLBp6annKA479
	srybXQB4q6Fz+H5XJ8aMhMAT7OzxZlV7Q59pQsRwgyaby4YyfSVXOpPOjWa9pd/K/zd94JH98aw
	LMY4qUjVnjgncpMzY7+WIDYtEp3Vh58ZGe1u7KtEuLg3/xtZOBkEth6mXhCTjnhEZ+FaMH9Fhit
	4dM7VWYGuIlUs5AtUNQUAJc4VzopdUHDO9r+HDmZYT2UoLYsC/Nw/FGTL9cnL/icPuZaW9dlaE3
	7NKtcSFG+Fz+4gI7e/Z550eXu/CvjASH1eobvXZ/1sULmyi45WtFLqDxx0+q7DFYZRsKGxbrjZU
	uNXc/pzRpQP8fKbdqIkorvJRcTj6EjlqmIwVvANY4y0WgRAlowtwoYoGHOaNQp8noo1n/+Ajmdr
	cvXvDQ0wHEcbjaNI03l4cHZU8moMFNuO+s2GbHoxsQtoTN7iSShcLMCP2kbUQqs6eBbkZj6Bvlt
X-Received: by 2002:a17:903:2449:b0:2e2:b624:54b7 with SMTP id d9443c01a7336-2e842ab655amr30881845ad.17.1791584804323;
        Fri, 09 Oct 2026 15:26:44 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:43 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 09 Oct 2026 22:25:33 +0000
Subject: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-send-upstream-v5-8-384af01da3ee@chromium.org>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
In-Reply-To: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
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
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=8839;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=WJ2nncs4s7Vr34l/kiuI+CgdhV71c08a4zP7a3A7Ha4=;
 b=H2ur9bO5JtxjncaGlW7l7M0K4HiPmlmzLGgUgGwjjuRS9Urn0Qhon3CqWNoDfJ3uqvQXW2JxN
 0Gplh/rTOrxD2g1kSwLMGzZt+Mw4Nlt6onqz8fhiyQwe1tUgdc/0+Rq
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Detect SPI HID devices described in Device Tree.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/spi-hid/Kconfig      |  15 +++
 drivers/hid/spi-hid/Makefile     |   1 +
 drivers/hid/spi-hid/spi-hid-of.c | 242 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)

diff --git a/drivers/hid/spi-hid/Kconfig b/drivers/hid/spi-hid/Kconfig
index 303ada03a1bf..63f202975ac3 100644
--- a/drivers/hid/spi-hid/Kconfig
+++ b/drivers/hid/spi-hid/Kconfig
@@ -26,6 +26,21 @@ config SPI_HID_ACPI
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
index 3ca326602643..31192e71edae 100644
--- a/drivers/hid/spi-hid/Makefile
+++ b/drivers/hid/spi-hid/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SPI_HID_CORE)	+= spi-hid.o
 spi-hid-objs 			= spi-hid-core.o
 CFLAGS_spi-hid-core.o 		:= -I$(src)
 obj-$(CONFIG_SPI_HID_ACPI)	+= spi-hid-acpi.o
+obj-$(CONFIG_SPI_HID_OF)	+= spi-hid-of.o
diff --git a/drivers/hid/spi-hid/spi-hid-of.c b/drivers/hid/spi-hid/spi-hid-of.c
new file mode 100644
index 000000000000..78d0530d2473
--- /dev/null
+++ b/drivers/hid/spi-hid/spi-hid-of.c
@@ -0,0 +1,242 @@
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
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/types.h>
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
+};
+
+static const struct spi_hid_timing_data timing_data = {
+	.post_power_on_delay_ms = 10,
+	.minimal_reset_delay_ms = 100,
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
+		dev_err(dev, "Input report header address not provided\n");
+		return -ENODEV;
+	}
+	conf->property_conf.input_report_header_address = val;
+
+	error = device_property_read_u32(dev, "input-report-body-address", &val);
+	if (error) {
+		dev_err(dev, "Input report body address not provided\n");
+		return -ENODEV;
+	}
+	conf->property_conf.input_report_body_address = val;
+
+	error = device_property_read_u32(dev, "output-report-address", &val);
+	if (error) {
+		dev_err(dev, "Output report address not provided\n");
+		return -ENODEV;
+	}
+	conf->property_conf.output_report_address = val;
+
+	error = device_property_read_u8(dev, "read-opcode",
+					&conf->property_conf.read_opcode);
+	if (error) {
+		dev_err(dev, "Read opcode not provided\n");
+		return -ENODEV;
+	}
+
+	error = device_property_read_u8(dev, "write-opcode",
+					&conf->property_conf.write_opcode);
+	if (error) {
+		dev_err(dev, "Write opcode not provided\n");
+		return -ENODEV;
+	}
+
+	conf->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(conf->supply))
+		return dev_err_probe(dev, PTR_ERR(conf->supply),
+				     "Failed to get regulator\n");
+	conf->supply_enabled = false;
+
+	conf->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(conf->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(conf->reset_gpio),
+				     "Failed to get reset GPIO\n");
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
+	return gpiod_set_value_cansleep(conf->reset_gpio, 1);
+}
+
+static int spi_hid_of_deassert_reset(struct spihid_ops *ops)
+{
+	struct spi_hid_of_config *conf = container_of(ops,
+						      struct spi_hid_of_config,
+						      ops);
+
+	return gpiod_set_value_cansleep(conf->reset_gpio, 0);
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
+	if (!config->timing_data)
+		config->timing_data = &timing_data;
+
+	/*
+	 * FIXME: multi-SPI not supported. Once it is, derive the
+	 * HID-over-SPI flags from spi->mode.
+	 */
+
+	error = spi_hid_of_populate_config(config, dev);
+	if (error)
+		return dev_err_probe(dev, error, "Unable to populate config data\n");
+
+	return spi_hid_core_probe(spi, &config->ops, &config->property_conf);
+}
+
+static const struct of_device_id spi_hid_of_match[] = {
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
2.56.0.385.gd3acb90ef8-goog

