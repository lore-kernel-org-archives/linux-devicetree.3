Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803120;
	b=0FurBNCwrTeUPmWpyuzs9OyCkqcR1D00wcqx2VXrjE5lCj0MURyEff8qjWM8cf4qX88q
	 aeQ0yYyvW4krFZPN+Ly5R+fjaG7GjBILi3vrIFMbK3jzFSfIaMfx7yvHhD+hgZaxFWJCI
	 d0ZXOPTaKgqtHlev5s863eo1OJ2AWHc6w3uJ1VdztNyMbHC9wUcYA9AZhfBMDJqetOYTI
	 NndIKu++peBiVVZfpwl5Saja+A3nrma34IAs3w65sV2KGgp+uFoHdw1z6vzUfP56W15ZP
	 V3l7TbBoo0Alcvv1b4WYJUvjm5E6V3MXJwyH4PDlENEBujwYa985QvZQk3TJqJaXoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qhROuWKNB1zu9GN0+zWtwkE2StJd098hmWLDpMHCuHw=;
	b=xYnkOvBfaRDnpdRReFNmWJo5LYoSK9mM00s2HOVgSMKjIy21hJ9tQ9FuNyL3t3cnA0Iz
	 n5xydt1hHEa1UDWTWpPM8epBVlfbxJC+EKH4BFlB25vJzlV7zdzS+xL774R4zzV4shNIE
	 7Chb2a+UU3nodsFRi30lznFIpYVa31ztpSaC1uEPzrDBSIpTEpa0cX4OdSEe5lulnJJHq
	 6V7EU7EfxrdGHUI660MJYGA6JuZfQ60nq4NPLWtterB7XMba3bkf0FFGccUdPMD3dG6rU
	 t2c2cSDM5y0yZAs/uavVMRuJnWhKZnZuTFFzZONeqQnlWAU8M+dnYjrFoJjWJlE6HKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RLtLcn9L;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968ED60A3809
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 00:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 968ED60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RLtLcn9L
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so780373a91.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792803119; x=1793407919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhROuWKNB1zu9GN0+zWtwkE2StJd098hmWLDpMHCuHw=;
        b=RLtLcn9LajDMTUG4e+brYlO8O8fLxgyQJvbrTx5vRJIknt12EczmRKkqtdKbofOvXK
         lMlIKXCU0ip9IujT4eDHRJTaWv6ExERqP5JqNyM80ZggSP5E+SezOdf+7gz4cm32Memi
         r1TVe8bYt43+Ht8K0n8KrS2La3cPrpG84I0QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803119; x=1793407919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhROuWKNB1zu9GN0+zWtwkE2StJd098hmWLDpMHCuHw=;
        b=q/E1S+rGM85g2GQdcSpyis9zcu2I/A0Zsvu4IlI9uaoV9tMBF04EipyghnHk6SeiS0
         ok3izP87EwBsWsosAxXarvimT6fb3nWirCaWWvLSzhurhPyUgXR/kvZRA4R8k8yCK62Y
         ceAeRP3kvUb8ep6U8E1sFNrVydErwm9P8ewuwg2nPAVfj29j1HaDCd/89kuel9RdQJfx
         Pbih7DuBvBXIiLHBGxVQAHutRelxhjnrzcmHwSECR3kfCwg//xIA0A2lr4av+klFWtVk
         fGyYQzvAPWCuAdEOWysbNSDA6YMyOjqdFtJV497DgQsHR/eLN4UxIgAPcQ7jDwr1F1ec
         vbqg==
X-Forwarded-Encrypted: i=1; AKwUvBzK+c38LjFjkktF4eOv07vc6GupkguufYRsJ23O8Qrpg+wDidmtebqmzui/WxRmmrrleqQr7nIdihrV@vger.kernel.org
X-Gm-Message-State: AFq9FYI/B5+BxusWXxS8w01DZGhxARNAdsg21cZ9YJvSY1RQ9ztbcayB
	VeheDBOc4WkCkJN/2DL3sPMQ+ljl6MRmuyj5nmWvwijBi5t3XSF2CgBBcC0/OtoLDg==
X-Gm-Gg: AYBFou2QP0s2tyyJ0VBqiDDWgSLyAS9g1oHKmvNDwJmfoSq10qXvyWPqE5ux/eDinDh
	tnT0vfxfiOVJRlwe5X8doNF2U39/Xon19sc5yC9N212cZUaSKNllMzSE2WzWluLxIdE7YkndGHY
	X2KNo/0t1Y/zEo1EA1IUUXerEFMGn6HsP6YsR3l7datnQkKLu/55+q8uyRsLc+2v78syz9Vpjrg
	rDj4+dC7ZOKkcTvNTAjpvBseVPwR0iVmipyc7Mv9WAw/tFwFYIqjgZkNNW5FEFbgRU/4CLFZCa7
	CuVA1ezGHlPjmht2TlOv3HHRjv6quaXTpHM5/I+xQ4mu9ZVvf/IMjVzlEZg1FTnfJ8vmdsBRqcx
	GLiZ/n8kTN0KM0AszmS15A1mLY/y5aOBSeiotQTRzYsIOe1uMO6w9fqzXB212Rw36jJsd+H7rSU
	n1hl4sVUx8KgPuv4tp/GN95r/yX3lgUluoYQSq+NTwSC0flhN2Q3dNWqUA4/pXo/Rt5VMHxEt9U
	OV1rO1A/AxnjT3XzsHaWzf48CMXkaeCI/a8WiPDjzg6q6hmcgi7EJs0OPyBV6tlVWOqniQ8uuJp
	6whOQFY9TbZOwOWA/nkJn3EX4ZF5UFk/Q8VdCZ6EueH73TnQovjWTC0MM9Glxnc=
X-Received: by 2002:a17:90b:5787:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3adeabe4318mr657663a91.29.1792803118943;
        Fri, 23 Oct 2026 17:51:58 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm843763a91.9.2026.10.23.17.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:51:58 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Sat, 24 Oct 2026 00:51:43 +0000
Subject: [PATCH v7 09/11] HID: spi-hid: add device tree support for HID
 over SPI
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-send-upstream-v7-9-abad13174b43@chromium.org>
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792803111; l=7909;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=d3PymUtLWxe99doziaHIYJBPfLQ/rKkR0CjPyLuledA=;
 b=HYYjnGNbkyh3fZZpXhyedWvrRYvZqZYx97jmI7aJXcMi0wFN0CAIwXs8IizWJ6Wmqs12BPKIO
 Se0/gf9HIVkD0xH6JAOWiVmPARO82ZGh1vMVOLcLXknY8haBXi74hD3
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Detect SPI HID devices described in Device Tree.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/spi-hid/Kconfig      |  15 +++
 drivers/hid/spi-hid/Makefile     |   1 +
 drivers/hid/spi-hid/spi-hid-of.c | 210 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)

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
index 000000000000..d1bbdc17102e
--- /dev/null
+++ b/drivers/hid/spi-hid/spi-hid-of.c
@@ -0,0 +1,210 @@
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
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/types.h>
+
+#include "spi-hid.h"
+
+/* Per-compatible data: protocol parameters and timings */
+struct spi_hid_of_data {
+	struct spi_hid_conf conf;
+	u32 post_power_on_delay_ms;
+	u32 minimal_reset_delay_ms;
+};
+
+/* Config structure is filled with match data and Device Tree resources */
+struct spi_hid_of_config {
+	struct spihid_ops ops;
+
+	struct spi_hid_of_data data;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator *supply;
+	bool supply_enabled;
+};
+
+static const struct spi_hid_of_data microsoft_g6_data = {
+	.conf = {
+		.input_report_header_address = 0x1000,
+		.input_report_body_address = 0x1004,
+		.output_report_address = 0x2000,
+		.read_opcode = 0x0b,
+		.write_opcode = 0x02,
+	},
+	.post_power_on_delay_ms = 10,
+	.minimal_reset_delay_ms = 100,
+};
+
+static int spi_hid_of_populate_config(struct spi_hid_of_config *conf,
+				      struct device *dev)
+{
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
+		fsleep(1000 * conf->data.post_power_on_delay_ms);
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
+	fsleep(1000 * conf->data.minimal_reset_delay_ms);
+}
+
+static int spi_hid_of_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	const struct spi_hid_of_data *data;
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
+	data = spi_get_device_match_data(spi);
+	if (!data)
+		return dev_err_probe(dev, -ENODEV, "No match data\n");
+
+	config->data = *data;
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
+	return spi_hid_core_probe(spi, &config->ops, &config->data.conf);
+}
+
+static const struct of_device_id spi_hid_of_match[] = {
+	{ .compatible = "microsoft,g6-touch-digitizer", .data = &microsoft_g6_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, spi_hid_of_match);
+
+static const struct spi_device_id spi_hid_of_id_table[] = {
+	{ .name = "g6-touch-digitizer", .driver_data = (kernel_ulong_t)&microsoft_g6_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, spi_hid_of_id_table);
+
+static struct spi_driver spi_hid_of_driver = {
+	.driver = {
+		.name = "spi_hid_of",
+		.owner = THIS_MODULE,
+		.of_match_table = spi_hid_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = spi_hid_of_probe,
+	.remove = spi_hid_core_remove,
+	.id_table = spi_hid_of_id_table,
+};
+
+module_spi_driver(spi_hid_of_driver);
+
+MODULE_DESCRIPTION("HID over SPI OF transport driver");
+MODULE_AUTHOR("Dmitry Antipov <dmanti@microsoft.com>");
+MODULE_LICENSE("GPL");

-- 
2.56.0.257.gf7497c7d27-goog

