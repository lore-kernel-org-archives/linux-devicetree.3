Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803120;
	b=J/FcMSiZq9jHUDPCWmNq/ltkFgVy28OM9hQthov3Ph6KL9yctaGXqZ79uUli1WvkzFKk
	 6IvjnAJ1hwWSeekqHknpkfsIhXM6OGnhYFo2QFZW+jWZmu9xnKiIbKzkM8F67BkVyom5o
	 gZ/vz4V+3zRd5Gvs+2GWRnz/XY2CykaCrYkeXO8BDd9BbG9e0pMccCiZEeXm06V5azNX+
	 0Q0ru6v92lcRf2ZzElhP140IUAWfr9nPfodtVK4KhKDYwZ6H2T4q96qqjoirkm+HZ/ypi
	 KwGgmpqt0AWOMe6/YCJsucuOzpKTpB7TmObcO0SDy6M0RK/iF+7VyWksHWhudKCr5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WyQaDxrxGTsX5Oh1V8K+PKKyhp5Oq8DyrDg5XAZ9Gwc=;
	b=b/KFCABOW5dndeIUNpOWbMcqWLHXOflB9WQ84iPbowiqLGbys8UF49q4kUBbtax42p87
	 RyRw75AT82N6l696UqKxQS3CImLbrRqtt4uW0OMP1XRvd6IsQUnjTAgkKzCudxGWfm8r0
	 AFkmVepoJGPF4PMhLOUTnRz/UlEZcPNPOVnwvi0NFpBanzKySuNFNHJRjJnxJ2ROtfjmC
	 vlx1PWmkSq8am9306IWKiri9mIZmgD6Sk9s5IgFmtOSSlBzS4WuURuSNGgEdIZBuSpKQs
	 y31QUp0U5NVQ/xlPrMwbRJDPVVSCANgAGllPytOr2IZfWu1WPKNi7GqiEzfb2ukSHLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WzTEMHkt;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C6960A260F
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 00:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C6960A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WzTEMHkt
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so773640a91.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792803114; x=1793407914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyQaDxrxGTsX5Oh1V8K+PKKyhp5Oq8DyrDg5XAZ9Gwc=;
        b=WzTEMHktigzn5QU1ypgOW78Rjy6sGrSK6BNYl5UkSRi5I21k3KxC0mbXdQ9L3U5MPG
         1qwvnj+1kaPgyPlBGcAYC+oMgdtOjIPV9A1reZAArVSLkFf4cx4xo2HC1cxgiQxn5zAg
         fTWDAA4FhhNDmToS2ZLuGfAV2FT9XdBodGyG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803114; x=1793407914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyQaDxrxGTsX5Oh1V8K+PKKyhp5Oq8DyrDg5XAZ9Gwc=;
        b=RtM984/eWFUOJb5VU9cMdVEC1glT6VDYHx3Tmbd/vIy+rYn+C4Xt0rjfLNU0eEPzIi
         Rufb100EQw3SWOSCpYfe/Zz8cTQi4g1EV7gq69mYl1BKvPT89Uhv3Kg7hK0IRUZWn0s2
         bKtaKtYLz12liTVNvj012CzAjkychg9wJ3UuX/C0aeTMke6lbwrWDogPIx3s2kxBvEGX
         7mCHPLOeaIWBydIpztnDm1Z885hs8i2jqouP+S9VucX9Fyx79GW9QaN04nnHPTqAj2+6
         VP9oaCuXw1eL8HF0NcmkpopbY7mq4CmQU1+L1UWfWNuCl0uKCS6wskg4T3eJwA2XOd2u
         ppbg==
X-Forwarded-Encrypted: i=1; AKwUvBx5dMBhnnTyp+UYWChLHfv+8WGYOd2sq9aaAyj7DjRGun5QJdxSHHZkk93GVCngHJSs4uQFO+Qj9TCk@vger.kernel.org
X-Gm-Message-State: AFq9FYLMhMIz6auda+gj/Zx9dYq/SSlaMjsDshQjB+REHHXaW2Te6vpi
	IGtnrSaDJnnlHfeKWVkoTzjtP/6ITL/slxIzFf4kcL6Dh4FKzN2xysH5rXD+6Txfzg==
X-Gm-Gg: AYBFou0C2xWE7i34idWhqhNZ4ib6TDFM2zeC6qEsy0cF1e5mFo9z67N24UuOhHFjfaa
	hnM4eEWamheRW/3fKiFejnV9Iz6RN7GUChE8USQE3Y+8kbz4dZxEeTO54bbyx45tW5eNhJQF0xs
	XQPaX16yyRIMD0ZHZ5VTatBGhaYCEkFhkjjOOzGwrng2ra3HfDmxGlEyNZG2dshyEmAUC1Gmob7
	nsJ8+LB/fcCjA62WSvVH2CPsEv3n76DUZHZ049Ao8g0aIE3o675hkQ0xxfRD1XPm4IFeJEbeNWN
	Y+cnHWDPd5K3wh2DB7ULP7bki+sJUzFBP88qsl5hMxdToHZl07cMJValMTMGw57nwe2pKnIhFyg
	kXQ38ueBhWvautsjFX5Eb9sz+VugE1k77wOL/rA4Kpa215I5oyvlZ6GZilIJ4Aw3cSpkbYSMdgF
	ZW1DAfoFDw01ctCRGzVFcMD4LCx9DMMDu86u8t2QL/zgFGt5x9Leg3L4E7Kn4BjDazEXOiPxL2g
	iBPm6/VNogHeKUBJK7Qfvq3tr9DaHjDS3rjm0C9wl3NVkiog9UruUHI5HbnJGxChbLSUYxTLtha
	JX6vwC8IBsyrQPSKuM+0Exer2dfWerb9AyhCPxUwBWeLf0pV+l3GgcyG4AK89iA=
X-Received: by 2002:a17:90b:564d:b0:3ac:8ee5:e00f with SMTP id 98e67ed59e1d1-3adeafb048dmr756235a91.57.1792803114041;
        Fri, 23 Oct 2026 17:51:54 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm843763a91.9.2026.10.23.17.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:51:53 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Sat, 24 Oct 2026 00:51:37 +0000
Subject: [PATCH v7 03/11] HID: spi-hid: add transport driver skeleton for
 HID over SPI bus
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
Message-Id: <20261024-send-upstream-v7-3-abad13174b43@chromium.org>
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
 Jingyuan Liang <jingyliang@chromium.org>, Angela Czubak <acz@semihalf.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792803111; l=7049;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=dHd9ieI1rPWyNtZTf93ybIIIk3OGUSmw9cXrsWLZvDQ=;
 b=ipH/tV9JOZ3DbvJONxOAfdMqw9rKAu9tJrIPcOhAC2CR7qcP6xAaUKhV6h0bP3V+wJEPwD56u
 nseVQfrdrZcCIy8qrDC5nqHElhiGx8Vv+KJry6G8LiTt87kfPzbhiAw
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Angela Czubak <acz@semihalf.com>

Create spi-hid folder and add Kconfig and Makefile for spi-hid driver.
Add basic device structure, definitions, and probe/remove functions.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Angela Czubak <acz@semihalf.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/Kconfig                |   2 +
 drivers/hid/Makefile               |   2 +
 drivers/hid/spi-hid/Kconfig        |  15 ++++
 drivers/hid/spi-hid/Makefile       |   9 +++
 drivers/hid/spi-hid/spi-hid-core.c | 158 +++++++++++++++++++++++++++++++++++++
 5 files changed, 186 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index c43e824428f0..17a42301875c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1527,6 +1527,8 @@ source "drivers/hid/bpf/Kconfig"
 
 source "drivers/hid/i2c-hid/Kconfig"
 
+source "drivers/hid/spi-hid/Kconfig"
+
 source "drivers/hid/intel-ish-hid/Kconfig"
 
 source "drivers/hid/amd-sfh-hid/Kconfig"
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 48a863b245ee..b5a7ef7f208f 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -177,6 +177,8 @@ obj-$(CONFIG_USB_KBD)		+= usbhid/
 
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
index 000000000000..4991dc972cae
--- /dev/null
+++ b/drivers/hid/spi-hid/spi-hid-core.c
@@ -0,0 +1,158 @@
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
+		dev_err(dev, "%s: unable to request threaded IRQ\n", __func__);
+		return error;
+	}
+
+	error = shid->ops->power_up(shid->ops);
+	if (error) {
+		dev_err(dev, "%s: could not power up: %d\n", __func__, error);
+		return error;
+	}
+
+	shid->ops->deassert_reset(shid->ops);
+
+	dev_dbg(dev, "%s: d3 -> %s\n", __func__,
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
+		dev_err(dev, "failed to disable regulator: %d\n", error);
+}
+EXPORT_SYMBOL_GPL(spi_hid_core_remove);
+
+MODULE_DESCRIPTION("HID over SPI transport driver");
+MODULE_AUTHOR("Dmitry Antipov <dmanti@microsoft.com>");
+MODULE_LICENSE("GPL");

-- 
2.56.0.257.gf7497c7d27-goog

