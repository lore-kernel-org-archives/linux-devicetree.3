Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC691310784
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095186; cv=none; b=fPInS3eFxG5tw3g+9NecMAGlMdkryGAA6eyUfGNZstKdQg0aEBTgMaSPAd1Fg53OKdinziZ8NxcCulGd7GRtVsouEqbNC56GrPmv9yFAzuarJIU2+rG4hxDWkyBgyKaSGEWbMzGv8wGdJYG0gWePz/IDVABxWPir04E9ODvBQyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095186; c=relaxed/simple;
	bh=tYvqGQV800S2KgKjcqUob/5OYtcybaCsli/eTLii6dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJ/+hqa4UM1a/viataNVfR9XcLvUuw9li5706UkgmjmkbM4lU+T61wbUXpn0EtcXqU4N6IzCmoYpY0VgX2NCmQTKdQwbDKUVjR+0PLmIALzbm3TaVBn05LpdOjg7/MnA/WN4ConvnT91jFsxonHFI+zOxgcbnpcq0sROUkETPsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bbrFV31A; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bbrFV31A"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35691a231a7so166902a91.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775095183; x=1775699983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmx5tAEeqHeylhKnot0cbS4zhiC5aaYm/HdQaLxFmFo=;
        b=bbrFV31AfDRhx9puLKyf4EbTpJy+Am67xDU+DbekBFiBmlQAj8ZVIZcxM0wN5zg6PR
         8eMsudj9KWut8AWAot3bNusORoE1WN4ySrU9uSCXOIieVKDl0e84PLb+owiVYLV1L+Hd
         TZ0vnA82dnVaFikiuLee/OdQj3ovEfDIspOoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775095183; x=1775699983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmx5tAEeqHeylhKnot0cbS4zhiC5aaYm/HdQaLxFmFo=;
        b=VV2pDWKqhF8Az/PcsAaMQDZeIRKT7tDOiIf3AzKULyTpGMOqxarz/dfdImWoOHUY16
         W79DY9XAHjZqypkYqRs+PejdsAQK+jXHJNPmxkZznRGs3zev5nNGWQHp5ZI/UWzFVTkC
         58PXv72DfxR/+2CI/e63D/++096LZL0AxDPxHDgwrepIGJPRkpKuMTLbfjdsX7OSw7jg
         K8xSBw1mpGJ4jF1uRUppQ4d2tyiPJS14uIiam4zdc8as+5rYAZjCEfVzz77AWXa9GjB1
         CzPkZPs4y+sIQcw4gkpcteOznUXWNfZ6IanAeQhsLbQ0cE+DxwR4mtuLhIG7YRBTpEdN
         LbLA==
X-Forwarded-Encrypted: i=1; AJvYcCX1WJCJVXJZEioi4VPkEq8HYmqVbiy3R07MRazvmjRhLjTe01XLiUSIDtkX+anrrvA4KWKDJsblDM5A@vger.kernel.org
X-Gm-Message-State: AOJu0YypPlQ7H9toz0PqY5qW77PN0+W3rXluI7t+mU1jLnDmDQo/n56U
	ghDbn32sJjHBRY+HAJdSm/XogaTbRwwyXybcH6MbS6TP8MoqXyHSfYEhagib0nGLnQ==
X-Gm-Gg: ATEYQzy9pIxvVPciDaIwg/ycFoAJvvTC9ntxoRV0MYmZX/wYC0wDJr6x8OHK5oXARlx
	uFq14uPkZrKD3YPmHmiZs1rFvxh3ftZPKRhFQ6ykHmloUS1XGzgmTIuwepEbwk4VOgJeH+0swlp
	wvbDWIVchLZS+hy5kAkvuUPkEMLBXpBl92p8JcxLIgSGnJWO1YH29fVr2xaHWcnvQpYKWysDqIY
	xb6RwpHCFjS8P/uO20F6L6WlmnZn811o0Cq6rAorF4CPzXthgunXqe6M6tR/SIF/GCxw5MHJvku
	G8gkEom0y9X1L9oLUbD8bsdRhYzdnQ85iE2SWd3cTAPiWRl2CTyA5xlwM4RDDwRnJ/WrqbQ/jkT
	rDK18K3MGk79bUJtChH9bwOQ8oXCy0cTVEGMI4dDyz2NSr/CXFKOx4PAqCuqFHfAuLY97Um5q5H
	5qX9ywiHrlGrQwJ1ztRAyKylxeA2uOqYvK7YEiWfRV6NQwuEvl1Mcd+SXOLfhrFkYSzroaip1US
	sCF26V0dk3LXaFmjSCRl37f2z3LH2hH3g==
X-Received: by 2002:a17:903:3c4c:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b269aa6173mr57330235ad.12.1775095183221;
        Wed, 01 Apr 2026 18:59:43 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm11187535ad.29.2026.04.01.18.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:59:42 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Thu, 02 Apr 2026 01:59:40 +0000
Subject: [PATCH v3 03/11] HID: spi-hid: add transport driver skeleton for
 HID over SPI bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-send-upstream-v3-3-6091c458d357@chromium.org>
References: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
In-Reply-To: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
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
 Jingyuan Liang <jingyliang@chromium.org>, Angela Czubak <acz@semihalf.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775095180; l=8512;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=k2H3ie7YFtCK66VrpOXNpoULBztAuQv+M2HBUIlKwfo=;
 b=1nxLuZX4OuDDCMTgcILKZSnyc1P+vds8a7ZXwwb+4u9DhHv+kUv3LpJr7WJ4xoUsTb9xytxxY
 3j07DLvTVJ6CRkW91979YiP4IX+D0CA3BV9AWdeCIn0lPeb25v69YjO
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Angela Czubak <acz@semihalf.com>

Create spi-hid folder and add Kconfig and Makefile for spi-hid driver.
Add basic device structure, definitions, and probe/remove functions.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Angela Czubak <acz@semihalf.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/Kconfig                |   2 +
 drivers/hid/Makefile               |   2 +
 drivers/hid/spi-hid/Kconfig        |  15 +++
 drivers/hid/spi-hid/Makefile       |   9 ++
 drivers/hid/spi-hid/spi-hid-core.c | 213 +++++++++++++++++++++++++++++++++++++
 5 files changed, 241 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 920a64b66b25..c6ae23bfb75d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1434,6 +1434,8 @@ source "drivers/hid/bpf/Kconfig"
 
 source "drivers/hid/i2c-hid/Kconfig"
 
+source "drivers/hid/spi-hid/Kconfig"
+
 source "drivers/hid/intel-ish-hid/Kconfig"
 
 source "drivers/hid/amd-sfh-hid/Kconfig"
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 361a7daedeb8..6b43e789b39a 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -169,6 +169,8 @@ obj-$(CONFIG_USB_KBD)		+= usbhid/
 
 obj-$(CONFIG_I2C_HID_CORE)	+= i2c-hid/
 
+obj-$(CONFIG_SPI_HID_CORE)	+= spi-hid/
+
 obj-$(CONFIG_INTEL_ISH_HID)	+= intel-ish-hid/
 
 obj-$(CONFIG_AMD_SFH_HID)       += amd-sfh-hid/
diff --git a/drivers/hid/spi-hid/Kconfig b/drivers/hid/spi-hid/Kconfig
new file mode 100644
index 000000000000..836fdefe8345
--- /dev/null
+++ b/drivers/hid/spi-hid/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (c) 2021 Microsoft Corporation
+#
+
+menuconfig SPI_HID
+	tristate "SPI HID support"
+	default y
+	depends on SPI
+
+if SPI_HID
+
+config SPI_HID_CORE
+	tristate
+endif
diff --git a/drivers/hid/spi-hid/Makefile b/drivers/hid/spi-hid/Makefile
new file mode 100644
index 000000000000..92e24cddbfc2
--- /dev/null
+++ b/drivers/hid/spi-hid/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for the SPI HID input drivers
+#
+# Copyright (c) 2021 Microsoft Corporation
+#
+
+obj-$(CONFIG_SPI_HID_CORE)	+= spi-hid.o
+spi-hid-objs 			= spi-hid-core.o
diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/spi-hid-core.c
new file mode 100644
index 000000000000..d7b4d4adad95
--- /dev/null
+++ b/drivers/hid/spi-hid/spi-hid-core.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HID over SPI protocol implementation
+ *
+ * Copyright (c) 2021 Microsoft Corporation
+ * Copyright (c) 2026 Google LLC
+ *
+ * This code is partly based on "HID over I2C protocol implementation:
+ *
+ *  Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
+ *  Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
+ *  Copyright (c) 2012 Red Hat, Inc
+ *
+ *  which in turn is partly based on "USB HID support for Linux":
+ *
+ *  Copyright (c) 1999 Andreas Gal
+ *  Copyright (c) 2000-2005 Vojtech Pavlik <vojtech@suse.cz>
+ *  Copyright (c) 2005 Michael Haboustak <mike-@cinci.rr.com> for Concept2, Inc
+ *  Copyright (c) 2007-2008 Oliver Neukum
+ *  Copyright (c) 2006-2010 Jiri Kosina
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/hid-over-spi.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+
+/* struct spi_hid_conf - Conf provided to the core */
+struct spi_hid_conf {
+	u32 input_report_header_address;
+	u32 input_report_body_address;
+	u32 output_report_address;
+	u8 read_opcode;
+	u8 write_opcode;
+};
+
+/**
+ * struct spihid_ops - Ops provided to the core
+ * @power_up: do sequencing to power up the device
+ * @power_down: do sequencing to power down the device
+ * @assert_reset: do sequencing to assert the reset line
+ * @deassert_reset: do sequencing to deassert the reset line
+ * @sleep_minimal_reset_delay: minimal sleep delay during reset
+ */
+struct spihid_ops {
+	int (*power_up)(struct spihid_ops *ops);
+	int (*power_down)(struct spihid_ops *ops);
+	int (*assert_reset)(struct spihid_ops *ops);
+	int (*deassert_reset)(struct spihid_ops *ops);
+	void (*sleep_minimal_reset_delay)(struct spihid_ops *ops);
+};
+
+/* Driver context */
+struct spi_hid {
+	struct spi_device	*spi;	/* spi device. */
+	struct hid_device	*hid;	/* pointer to corresponding HID dev. */
+
+	struct spihid_ops	*ops;
+	struct spi_hid_conf	*conf;
+
+	enum hidspi_power_state power_state;
+
+	u32 regulator_error_count;
+	int regulator_last_error;
+	u32 bus_error_count;
+	int bus_last_error;
+	u32 dir_count;	/* device initiated reset count. */
+};
+
+static const char *spi_hid_power_mode_string(enum hidspi_power_state power_state)
+{
+	switch (power_state) {
+	case HIDSPI_ON:
+		return "d0";
+	case HIDSPI_SLEEP:
+		return "d2";
+	case HIDSPI_OFF:
+		return "d3";
+	default:
+		return "unknown";
+	}
+}
+
+static irqreturn_t spi_hid_dev_irq(int irq, void *_shid)
+{
+	return IRQ_HANDLED;
+}
+
+static ssize_t bus_error_count_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d (%d)\n",
+			  shid->bus_error_count, shid->bus_last_error);
+}
+static DEVICE_ATTR_RO(bus_error_count);
+
+static ssize_t regulator_error_count_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d (%d)\n",
+			  shid->regulator_error_count,
+			  shid->regulator_last_error);
+}
+static DEVICE_ATTR_RO(regulator_error_count);
+
+static ssize_t device_initiated_reset_count_show(struct device *dev,
+						 struct device_attribute *attr,
+						 char *buf)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", shid->dir_count);
+}
+static DEVICE_ATTR_RO(device_initiated_reset_count);
+
+static struct attribute *spi_hid_attrs[] = {
+	&dev_attr_bus_error_count.attr,
+	&dev_attr_regulator_error_count.attr,
+	&dev_attr_device_initiated_reset_count.attr,
+	NULL	/* Terminator */
+};
+
+static const struct attribute_group spi_hid_group = {
+	.attrs = spi_hid_attrs,
+};
+
+const struct attribute_group *spi_hid_groups[] = {
+	&spi_hid_group,
+	NULL
+};
+EXPORT_SYMBOL_GPL(spi_hid_groups);
+
+int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
+		       struct spi_hid_conf *conf)
+{
+	struct device *dev = &spi->dev;
+	struct spi_hid *shid;
+	int error;
+
+	if (spi->irq <= 0)
+		return dev_err_probe(dev, spi->irq ?: -EINVAL, "Missing IRQ\n");
+
+	shid = devm_kzalloc(dev, sizeof(*shid), GFP_KERNEL);
+	if (!shid)
+		return -ENOMEM;
+
+	shid->spi = spi;
+	shid->power_state = HIDSPI_ON;
+	shid->ops = ops;
+	shid->conf = conf;
+
+	spi_set_drvdata(spi, shid);
+
+	/*
+	 * At the end of probe we initialize the device:
+	 *   0) assert reset, bias the interrupt line
+	 *   1) sleep minimal reset delay
+	 *   2) request IRQ
+	 *   3) power up the device
+	 *   4) deassert reset (high)
+	 * After this we expect an IRQ with a reset response.
+	 */
+
+	shid->ops->assert_reset(shid->ops);
+
+	shid->ops->sleep_minimal_reset_delay(shid->ops);
+
+	error = devm_request_threaded_irq(dev, spi->irq, NULL, spi_hid_dev_irq,
+					  IRQF_ONESHOT, dev_name(&spi->dev), shid);
+	if (error) {
+		dev_err(dev, "%s: unable to request threaded IRQ.", __func__);
+		return error;
+	}
+
+	error = shid->ops->power_up(shid->ops);
+	if (error) {
+		dev_err(dev, "%s: could not power up.", __func__);
+		return error;
+	}
+
+	shid->ops->deassert_reset(shid->ops);
+
+	dev_dbg(dev, "%s: d3 -> %s.", __func__,
+		spi_hid_power_mode_string(shid->power_state));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_hid_core_probe);
+
+void spi_hid_core_remove(struct spi_device *spi)
+{
+	struct spi_hid *shid = spi_get_drvdata(spi);
+	struct device *dev = &spi->dev;
+	int error;
+
+	shid->ops->assert_reset(shid->ops);
+	error = shid->ops->power_down(shid->ops);
+	if (error)
+		dev_err(dev, "failed to disable regulator.");
+}
+EXPORT_SYMBOL_GPL(spi_hid_core_remove);
+
+MODULE_DESCRIPTION("HID over SPI transport driver");
+MODULE_AUTHOR("Dmitry Antipov <dmanti@microsoft.com>");
+MODULE_LICENSE("GPL");

-- 
2.53.0.1185.g05d4b7b318-goog

