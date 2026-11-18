Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003645;
	b=XJGj9nWKm9BX+ZCPhZNgkPMbuuWOz2QBZ8eHxv5UrJgYbKeAWxQIbtgQibFjsE/3qdDX
	 tbjwRIT3TJELxMCsrnNoEWCp/TxEu/0HnXLHVWGDodMyLD7ijzzYofJ9T3dc1/fnOQFag
	 WfsxeHj9rjeCk24y8zkZvZ5d7CTcIsT52Q0wwRQ9tb86fhTH0MiKR33v3libeS3q7e/Qv
	 9DedoyKz6NvJsBRDq26dPKLF+zbhafngK3zBH+OXBIxnnOYLr8c5vH+BBni2L93oAviUp
	 yjGNJMfGpZMiENOE7x8C6tughTB8kc5sLYwjGYty6jvI/flts7xPzkPz3AuFcikcR6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y92PsFPQNLfQa7UDE3X0vSYgt7cHL17UdfoYDBKMtBA=;
	b=ynxb1GCZZrIDgc6OY9tJuxkA6NY7STE26WVo975XgVb2nZtf58JmaOmgVPYB5/Z/zsy7
	 aFmWSHHSTd7keUDyQ7STs3PP2VW7nSLAlCuUcyphMJadEB0BCMaeVeZzM/mLl+Zs00yyw
	 5h/YKHiejvHBG2wMmxk+Wh5JthabzvUDPP31JHcA2+2zMdleipmAkBiAmdIICpTyeWBvx
	 iMACIsOVfBsxTEQn6Ju5TmGIJ/8wVc/AqIo0bq75X97h1oCyx8ADdTQ1/FkQ93BGRXffu
	 cYp18SDcDjVL3DzXE88akfK3wTvRZFXQ2z/xkSit9SoKRvYqAN74UmK7MfqLuILDQGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klhq+Kcz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C460A383C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB1C460A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klhq+Kcz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b001cd92bso473849f8f.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003643; x=1795608443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y92PsFPQNLfQa7UDE3X0vSYgt7cHL17UdfoYDBKMtBA=;
        b=klhq+KczTFnDBpjpk5F01J6ptZ/ONmvh/GfoOAFuLSAb9ByKgOOooFCNX6k8oIA/sa
         uvNwmcW/MTnBGvRExgOJ/iyb+zNZGlnNqVSflEkpFxB9IIWfspnACIqO3H1hVYAUh+/J
         0JaUPLSu35IS5y65jbiFyx5OVPSyWV+Q2JaE4Ni1K5+AHQVDdO3+1KA9CS329VOqR+BP
         OoIFt6VBZrPfmw6DP0f/YSWIuH+wliA3ei3T6E6plRZJ3Vsk5TUvst4i2ud8rOvgDeXQ
         gHjiN2q8kYEUwrkut3hYzpfObusEEz78rNYLN8fEwTKFbjS8DXCsgurqJpmEWx4nE4v7
         4kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003643; x=1795608443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y92PsFPQNLfQa7UDE3X0vSYgt7cHL17UdfoYDBKMtBA=;
        b=CX8bdjOHXHXyuM8ot4+fP957XZJDNH9Lsh0J19ZdWSeZVlwIk5r5dh8JRBcgarcNWd
         qrrHYL06MQA50yhVjvK+rIeaSLWsDrMWS2iYmBXFjRsvLoxf8Zay9Z19pjknFbHoWIOR
         B7jP9TPMXVL9xI8sycYwphDGNN0F/KFqEMixUQcrbTilEj43TzjYnKcOMEZ6tBBT5Yfw
         ISl/xH1Ysvk5wM7kGv1HsH45ujowB//QU17r7cK6lv6VAKwsjl7YqAJZgzcdwWCAuMrH
         LZomghf7cNKAO3dpQIohdp9AKRewgeqFB1toHo+xk1/lFu7uMh2dvyvhYSRH0lUQGNSa
         GWPw==
X-Gm-Message-State: APuU4Z+vHkHdRsXvkY5XAfZwqzpaCUaEYJpZVB/mpJcg+StNLFafPQpv
	3Gw06wf+WlUTmsr5oMvG2Cu9MJbZuY0yLYq+Fre/3nCdv1d+4lBRsHUH
X-Gm-Gg: AZFdTZca9HiTF0MhubLoc0crF8iMww88o+kFMMsNabfNtzDEIfFnuEKdE9lN8oPUWhr
	hlTNfxFe4TdA/eVMxMcmEiHzwyKWkdp/M415YEaoLQxsU5xgM4yQHHrrIbUwVfP+Uzwemn1XUXp
	KWMP2ZVVdJ1mmodPqr5BE6Eg9FM12EWTkD0TAsW+32VhObAsTnC/m836GfQWM/Dzw5z3dX4nelN
	QilRNlOuoKsRtMOMhk5SopcGbLwSW7miAbLJg1Yd9i0EMg1xfNbRNkFoPbHNT19Y+JRk4wrXdCx
	h4whRpY7IxbLK1VG/gn9R7+QFIg7AZAXS0um2m3jomJYwwABoC3w9b0pxCGvIFCxiar2IvXUFh6
	Z2cKnGDTk6mizesiZmsUsnACno3uOr1Y5zzXj2aSZFW+hfCdNk5eRCIAx6l4pcYqNPxFZ0ahlpJ
	bt7zgkkcxGTaZReOJB9os/K48O7zOG+xivQjTnzd5nY1XWWUICQchjw/kViDUPxp+eQ25bJVda2
	7OEFvYgiiQbf6tCdNbvyUSuIecMYqUfrbxbP6bZ/5SCxyIwUt5eCKMe3AXAtDqivtoKH3PixGng
	geknNzZsD8+8BQIaI9oDX/o3uStW9aCpUXcM3BZBW+0XzKnW9vfOoi1P1T30QjWfyz4MRqe7L48
	=
X-Received: by 2002:a05:6000:161f:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-4a6334a7710mr3688999f8f.5.1795003643037;
        Wed, 18 Nov 2026 04:07:23 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:22 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 06/10] Input: touchscreen: add Silicon Works SW42902 support
Date: Wed, 18 Nov 2026 13:07:10 +0100
Message-Id: <20261118120714.31505-7-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Add basic multitouch support for the SW42902 controller. Implement the
power and reset sequence using regulator supplies and use the firmware
already present in controller flash; no firmware update is performed.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 MAINTAINERS                         |   1 +
 drivers/input/touchscreen/Kconfig   |  13 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/sw42902.c | 355 ++++++++++++++++++++++++++++
 4 files changed, 370 insertions(+)
 create mode 100644 drivers/input/touchscreen/sw42902.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a29019d984393..7a1904f6d0fad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25840,6 +25840,7 @@ M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+F:	drivers/input/touchscreen/sw42902.c
 
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 9b9ae8ac3f7fd..14c6cd999ec92 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1299,6 +1299,19 @@ config TOUCHSCREEN_SURFACE3_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called surface3_spi.
 
+config TOUCHSCREEN_SW42902
+	tristate "Silicon Works SW42902 touchscreen"
+	depends on I2C
+	depends on GPIOLIB
+	help
+	  Say Y here if you have a Silicon Works SW42902 touchscreen
+	  connected to your system (e.g. LG V60).
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sw42902.
+
 config TOUCHSCREEN_SX8654
 	tristate "Semtech SX8654 touchscreen"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index bfd9de83389d8..1ee2590014535 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_TOUCHSCREEN_STMPE)		+= stmpe-ts.o
 obj-$(CONFIG_TOUCHSCREEN_SUN4I)		+= sun4i-ts.o
 obj-$(CONFIG_TOUCHSCREEN_SUR40)		+= sur40.o
 obj-$(CONFIG_TOUCHSCREEN_SURFACE3_SPI)	+= surface3_spi.o
+obj-$(CONFIG_TOUCHSCREEN_SW42902)	+= sw42902.o
 obj-$(CONFIG_TOUCHSCREEN_TI_AM335X_TSC)	+= ti_am335x_tsc.o
 obj-$(CONFIG_TOUCHSCREEN_TOUCHIT213)	+= touchit213.o
 obj-$(CONFIG_TOUCHSCREEN_TOUCHRIGHT)	+= touchright.o
diff --git a/drivers/input/touchscreen/sw42902.c b/drivers/input/touchscreen/sw42902.c
new file mode 100644
index 0000000000000..a68bd850bf2e2
--- /dev/null
+++ b/drivers/input/touchscreen/sw42902.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Abdur Rofik <rofikcoga@gmail.com>
+ * Silicon Works SW42902 touchscreen, as used by LG V60 (timelm).
+ * Register protocol and report layout derived from the LGE vendor driver
+ * (Copyright (C) 2015 LGE, author hoyeon.jang@lge.com).
+ * This driver uses the controller's existing flash firmware.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#define SW42902_MAX_CONTACTS	10
+#define SW42902_REPORT_SIZE	(12 + 24 + 12 * SW42902_MAX_CONTACTS)
+#define SW42902_IC_STATUS	0x600
+#define SW42902_VERSION		0x642
+#define SW42902_DEVICE_CTL	0xc00
+#define SW42902_INTERRUPT_CTL	0xc01
+#define SW42902_DRIVING_CTL	0xc03
+#define SW42902_SERIAL_SPI_EN	0xfe4
+#define SW42902_DRIVING_STOP	0x04
+#define SW42902_DRIVING_U3	0x8303
+
+static const char * const sw42902_supplies[] = {
+	"vcl",
+	"vdd",
+};
+
+struct sw42902 {
+	struct i2c_client *client;
+	struct input_dev *input;
+	struct touchscreen_properties prop;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(sw42902_supplies)];
+	bool suspended;
+	u8 report[SW42902_REPORT_SIZE];
+};
+
+static int sw42902_read(struct sw42902 *ts, u16 reg, void *data, u16 len)
+{
+	u8 command[] = { (reg >> 8) | (len > 4 ? 0x20 : 0), reg & 0xff };
+	struct i2c_msg msgs[] = {
+		{ .addr = ts->client->addr, .len = sizeof(command),
+		  .buf = command },
+		{ .addr = ts->client->addr, .flags = I2C_M_RD,
+		  .len = len, .buf = data },
+	};
+	int error;
+
+	error = i2c_transfer(ts->client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (error < 0)
+		return error;
+	return error == ARRAY_SIZE(msgs) ? 0 : -EIO;
+}
+
+static int sw42902_write(struct sw42902 *ts, u16 reg, u32 value)
+{
+	u8 command[6] = { 0x40 | (reg >> 8), reg & 0xff };
+	int error;
+
+	put_unaligned_le32(value, command + 2);
+	error = i2c_master_send(ts->client, command, sizeof(command));
+	if (error < 0)
+		return error;
+	return error == sizeof(command) ? 0 : -EIO;
+}
+
+static void sw42902_release_contacts(struct sw42902 *ts)
+{
+	int i;
+
+	for (i = 0; i < SW42902_MAX_CONTACTS; i++) {
+		input_mt_slot(ts->input, i);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
+	}
+	input_mt_sync_frame(ts->input);
+	input_sync(ts->input);
+}
+
+static irqreturn_t sw42902_irq(int irq, void *data)
+{
+	struct sw42902 *ts = data;
+	struct input_dev *input = ts->input;
+	u32 status, header;
+	unsigned int count, i;
+	int error;
+
+	error = sw42902_read(ts, SW42902_IC_STATUS, ts->report,
+			     sizeof(ts->report));
+	if (error) {
+		dev_err_ratelimited(&ts->client->dev, "report read failed: %d\n", error);
+		sw42902_release_contacts(ts);
+		return IRQ_HANDLED;
+	}
+
+	status = get_unaligned_le32(ts->report + 4);
+	header = get_unaligned_le32(ts->report + 8);
+	/* Only normal absolute-touch reports; ignore pen/gesture/debug IRQs. */
+	if (((status >> 16) & 0xf) != 5 || (header & 0xff))
+		return IRQ_HANDLED;
+
+	count = (header >> 8) & 0x1f;
+	if (count > SW42902_MAX_CONTACTS) {
+		dev_warn_ratelimited(&ts->client->dev, "invalid contact count: %u\n", count);
+		sw42902_release_contacts(ts);
+		return IRQ_HANDLED;
+	}
+
+	/* A palm report cancels all active fingers. */
+	if (header & BIT(31)) {
+		sw42902_release_contacts(ts);
+		return IRQ_HANDLED;
+	}
+
+	/* Pre-scan for palm report to avoid queueing partial touch events */
+	for (i = 0; i < count; i++) {
+		const u8 *contact = ts->report + 36 + 12 * i;
+		u32 a = get_unaligned_le32(contact);
+
+		if ((a & 0x1f) == 15) {
+			sw42902_release_contacts(ts);
+			return IRQ_HANDLED;
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		const u8 *contact = ts->report + 36 + 12 * i;
+		u32 a = get_unaligned_le32(contact);
+		u32 b = get_unaligned_le32(contact + 4);
+		u32 c = get_unaligned_le32(contact + 8);
+		unsigned int id = a & 0x1f;
+		unsigned int event = (a >> 16) & 3;
+
+		if (id >= SW42902_MAX_CONTACTS || (event != 1 && event != 2))
+			continue;
+
+		input_mt_slot(input, id);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+		touchscreen_report_pos(input, &ts->prop, a >> 18, b & 0x3fff, true);
+		input_report_abs(input, ABS_MT_PRESSURE, (b >> 14) & 0xff);
+		input_report_abs(input, ABS_MT_TOUCH_MAJOR, (c >> 4) & 0x3fff);
+		input_report_abs(input, ABS_MT_TOUCH_MINOR, c >> 18);
+	}
+
+	input_mt_sync_frame(input);
+	input_sync(input);
+	return IRQ_HANDLED;
+}
+
+static void sw42902_power_off(void *data)
+{
+	struct sw42902 *ts = data;
+
+	gpiod_set_value_cansleep(ts->reset, 1);
+	usleep_range(1000, 2000);
+	regulator_bulk_disable(ARRAY_SIZE(ts->supplies), ts->supplies);
+}
+
+static int sw42902_power_on(struct sw42902 *ts)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(ts->supplies), ts->supplies);
+	if (error)
+		return error;
+
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ts->reset, 0);
+	/* Docomo downstream DT specifies a 90 ms hardware reset delay. */
+	msleep(90);
+
+	return 0;
+}
+
+static int sw42902_start(struct sw42902 *ts)
+{
+	u8 version[4];
+	int error;
+
+	error = sw42902_read(ts, SW42902_VERSION, version, sizeof(version));
+	if (error)
+		return error;
+	if (version[2] != 10 || (version[3] & 0xf) != 4) {
+		dev_err(&ts->client->dev, "unexpected chip/protocol: %u/%u\n",
+			version[2], version[3] & 0xf);
+		return -ENODEV;
+	}
+
+	error = sw42902_write(ts, SW42902_SERIAL_SPI_EN, 0);
+	if (error)
+		return error;
+	error = sw42902_write(ts, SW42902_DEVICE_CTL, 1);
+	if (error)
+		return error;
+	error = sw42902_write(ts, SW42902_INTERRUPT_CTL, 1);
+	if (error)
+		return error;
+	error = sw42902_write(ts, SW42902_DRIVING_CTL, SW42902_DRIVING_STOP);
+	if (error)
+		return error;
+	msleep(30);
+	error = sw42902_write(ts, SW42902_DRIVING_CTL, SW42902_DRIVING_U3);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int sw42902_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct sw42902 *ts;
+	struct input_dev *input;
+	int error, i;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -EOPNOTSUPP;
+	if (client->irq <= 0)
+		return dev_err_probe(dev, -EINVAL, "missing interrupt\n");
+
+	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+	ts->client = client;
+	i2c_set_clientdata(client, ts);
+
+	ts->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ts->reset))
+		return dev_err_probe(dev, PTR_ERR(ts->reset), "reset GPIO\n");
+
+	for (i = 0; i < ARRAY_SIZE(sw42902_supplies); i++)
+		ts->supplies[i].supply = sw42902_supplies[i];
+
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->supplies), ts->supplies);
+	if (error)
+		return dev_err_probe(dev, error, "failed to get regulators\n");
+
+	error = devm_add_action_or_reset(dev, sw42902_power_off, ts);
+	if (error)
+		return error;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+	ts->input = input;
+	input->name = "Silicon Works SW42902";
+	input->id.bustype = BUS_I2C;
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 1079, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 2459, 0, 0);
+	input_set_abs_params(input, ABS_MT_PRESSURE, 0, 255, 0, 0);
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 16383, 0, 0);
+	input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0, 16383, 0, 0);
+	touchscreen_parse_properties(input, true, &ts->prop);
+	error = input_mt_init_slots(input, SW42902_MAX_CONTACTS,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error)
+		return error;
+	error = devm_request_threaded_irq(dev, client->irq, NULL, sw42902_irq,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  dev_name(dev), ts);
+	if (error)
+		return error;
+
+	error = sw42902_power_on(ts);
+	if (error)
+		return error;
+
+	error = sw42902_start(ts);
+	if (error)
+		return dev_err_probe(dev, error, "controller initialization failed\n");
+	error = input_register_device(input);
+	if (error)
+		return error;
+	enable_irq(client->irq);
+	dev_info(dev, "SW42902 initialized using existing flash firmware\n");
+	return 0;
+}
+
+static int sw42902_suspend(struct device *dev)
+{
+	struct sw42902 *ts = i2c_get_clientdata(to_i2c_client(dev));
+
+	if (ts->suspended)
+		return 0;
+
+	disable_irq(ts->client->irq);
+	sw42902_release_contacts(ts);
+	sw42902_write(ts, SW42902_DRIVING_CTL, SW42902_DRIVING_STOP);
+	sw42902_power_off(ts);
+	ts->suspended = true;
+
+	return 0;
+}
+
+static int sw42902_resume(struct device *dev)
+{
+	struct sw42902 *ts = i2c_get_clientdata(to_i2c_client(dev));
+	int error;
+
+	if (!ts->suspended)
+		return 0;
+
+	error = sw42902_power_on(ts);
+	if (error)
+		return error;
+
+	error = sw42902_start(ts);
+	if (error) {
+		sw42902_power_off(ts);
+		return error;
+	}
+	enable_irq(ts->client->irq);
+	ts->suspended = false;
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(sw42902_pm_ops, sw42902_suspend, sw42902_resume);
+
+static const struct of_device_id sw42902_of_match[] = {
+	{ .compatible = "lg,sw42902" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sw42902_of_match);
+
+static const struct i2c_device_id sw42902_ids[] = {
+	{ .name = "sw42902" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, sw42902_ids);
+
+static struct i2c_driver sw42902_driver = {
+	.driver = {
+		.name = "sw42902",
+		.of_match_table = sw42902_of_match,
+		.pm = pm_sleep_ptr(&sw42902_pm_ops),
+	},
+	.probe = sw42902_probe,
+	.id_table = sw42902_ids,
+};
+module_i2c_driver(sw42902_driver);
+
+MODULE_AUTHOR("Abdur Rofik <rofikcoga@gmail.com>");
+MODULE_DESCRIPTION("Silicon Works SW42902 touchscreen driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

