Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C93EFD3C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420964; cv=none; b=G8hjSlMJSFNfuwqFUjT6rmd3HtVNcS63yXvnEcrW+AXyEjLDFqvb8SftSaYYdW0y0Pd+pPUuVrCSbZ9QYtozBVaCoJlt7eGBmeoxt3qwhuo8S3qJ7RIBTKARqZAyhnIHhGN6+DehMBc4IxK4jWhQK94fGOWJFHsFcD0N0Pw8Ld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420964; c=relaxed/simple;
	bh=8aiMpZC5E8gz1TExyqKARWeqxrokIdlgivq7H15GV9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MSu5Yb//olq7dC1W7/hxcfZnjPRv8tzEx789Tm4NHXQTwedCW6dmFb+LVw3VjyMga0qQ2dL4tTZdPwHes3mP5u6zcJi9E3MF2Qh6SEy4BPopU5ziAdG3WieK0tfQj7AL/hhST24yj+cgYG8x9Y2qkipH7kV4YOUzZr5KWKsqxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IepB7xpa; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IepB7xpa"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so3324653e87.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783420960; x=1784025760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBxmPRHERw9OFQ8qeZoOMxsTHHSNXQFfmO9X9Pjdxgg=;
        b=IepB7xpak6Vw8y8I7sAEbqWsgpeBZto4pZw222zLl2Cpc4+2KghVwT/WcO+JKDXHPO
         yRNckEfIUm9jAcY7Y9qkCE5B1BcGOunOLih9RMfgZ0UnTToEo2HVm1rBWK+fziVO4koV
         l5fEEU+TYdsEAVyw4M8drGdIiKfd67yNu5cJVKRetX8yjzt8Z/XnPJ+Fj5Jeeve7SXQn
         nJGnB9k4nI3wI5Ra/d/dx2zx8ZsueBs8Kw797wZjcslWWfbilWZ5nRDTof5rHojD2Sm+
         51garPHtaqEvQ6ITch/IE362p2K5YpSeGM8ws8gjC6HT9gAGb3Ugixa0XYxAPsXtTZIh
         gjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420960; x=1784025760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBxmPRHERw9OFQ8qeZoOMxsTHHSNXQFfmO9X9Pjdxgg=;
        b=slSJ7O74N7luVbP+kIXgWqQEslDKUef1Cg/oqVUEyOP8XsKFNjqI32sguCKJ3UrcJg
         pdCr6suzuoGqQaN4Br+FjfirK1mqSOFkCZs2GAhEphPKNb6kUvIylYLmLzN5x/PSG6NQ
         WlW52CuHH6pfL3yD489wuoTlL7Bu1JKZFZSMFzDn+RB6XdlI7wGWCJrPTg7WOIayz6ET
         Q8RIdOKXFzXGMBaXHNY4FpvCXrJXi2GZ2Tixhp+23vXvpvqog5PQfpFf4xcC+IOrez5G
         AxJ1lCXDW9a2gJKaUDHpw/5Q02tALRKvUF7Ul7m8wRWRMtNxzjo1Ce5DZ3wTsFj3ANPV
         XtGw==
X-Forwarded-Encrypted: i=1; AHgh+RpI8RmuDOXnStGqLyYhDIytCRlyzimG66vCog9moJTn2iA/15U7Ctb88qzJ7md85wvCZ13KqO40S6Eq@vger.kernel.org
X-Gm-Message-State: AOJu0YzfItAFo+I83Lit/ZBwFUxmIUfynFfe9vPG6okHrDXuiLo0PzOd
	t6KC3Zthxv5Dm6rxJSTubFIv6JTTqbJm7JcUKzVC1+h/xBls3HBBBtiy
X-Gm-Gg: AfdE7clPWQ1CHqwjg8H8/fdTPrVnMr9647fSZoFyKIsdwNdnietEe8bt/WZdhZ+EhuS
	4c0QGy3dXQWV2nWXnS6ZUHpr+WP/H30uokVVckmfFP0G5A16eN4vNvDuocuA+jkuQAGi7WikrQy
	J3gpFRdvf84W3W0Vu7s3+na9A3JUm3iZCPS+eJaS7R7Z0S5i8a7X5yotp4gdIstepYNXjdpYYPt
	g3EtgAqNv5QUw0PIceAdBCaoaXbX6iyuHSB+E+SLLxpjyvWjhYulT1vm7D2RZZCUb9pUarELeJ5
	3hd0otDF3O1CeNsC8pJjaoe53Emxzb3ytk1oDvD8eofAFBTYQMPZVBBnxeBGRJnJulH+rYNXl9q
	yWtnsBPKuz0bD8H1hnqLjP8wCcfy70J5zQgSPIsx0mXxXjNTGk3w3nvANXJ+Eeh66O2TZLuoRdN
	O0P9Kr5fWfmTpODuLayp+haPcrmzBitL3SJoPEnkXALRQkYA==
X-Received: by 2002:ac2:5321:0:b0:5ae:c21b:1cb1 with SMTP id 2adb3069b0e04-5b007b8bd8emr713628e87.13.1783420958715;
        Tue, 07 Jul 2026 03:42:38 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c1asm3533227e87.81.2026.07.07.03.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:42:38 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org,
	jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v8 2/2] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Tue,  7 Jul 2026 13:42:34 +0300
Message-ID: <20260707104234.1957104-3-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new IIO driver for the Analog Devices MAX86150 integrated
biosensor, which combines two PPG optical channels (Red/IR LED) and
one ECG biopotential channel in a single I2C device.

The device has a 32-entry hardware FIFO with a configurable almost-full
interrupt.  Because all samples arrive via the FIFO, the driver uses a
kfifo buffer (like the sibling MAX30100 and MAX30102 drivers) rather
than the triggered-buffer framework.  The interrupt handler drains the
FIFO on each A_FULL event and timestamps samples back-calculated from
the interrupt arrival time by one sample_period_ns per step.

Key implementation details:
- FIFO draining via iio_buffer_setup_ops postenable/predisable
- DMA-safe FIFO read buffer aligned to IIO_DMA_MINALIGN
- IIO_DECLARE_BUFFER_WITH_TS for the push buffer
- 24-bit FIFO words decoded via get_unaligned_be24()
- regmap_set_bits() / regmap_clear_bits() for single-direction writes
- Overflow drops all samples; timestamps are unreliable after overflow
- Device remains in shutdown between captures to suppress LED current
- vdd and vled regulators required per datasheet; vref is not a supply

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 MAINTAINERS                   |   7 +
 drivers/iio/health/Kconfig    |  18 ++
 drivers/iio/health/Makefile   |   1 +
 drivers/iio/health/max86150.c | 533 ++++++++++++++++++++++++++++++++++
 4 files changed, 559 insertions(+)
 create mode 100644 drivers/iio/health/max86150.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3115538ce8291..361a7c8b99ead 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15863,6 +15863,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
 F:	drivers/power/supply/max77976_charger.c
 
+MAX86150 ECG AND PPG BIOSENSOR DRIVER
+M:	Md Shofiqul Islam <shofiqtest@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
+F:	drivers/iio/health/max86150.c
+
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
diff --git a/drivers/iio/health/Kconfig b/drivers/iio/health/Kconfig
index a89f3abf11f4a..e5b8b6bb9351e 100644
--- a/drivers/iio/health/Kconfig
+++ b/drivers/iio/health/Kconfig
@@ -62,4 +62,22 @@ config MAX30102
 
 endmenu
 
+
+config MAX86150
+	tristate "MAX86150 ECG and PPG biosensor"
+	depends on I2C
+	select IIO_BUFFER
+	select IIO_KFIFO_BUF
+	select REGMAP_I2C
+	help
+	  Say Y here to enable support for the Maxim MAX86150 combined
+	  ECG and photoplethysmography (PPG) biosensor.
+
+	  The driver exposes three IIO channels: two PPG optical channels
+	  (Red and IR LED) for heart rate and SpO2 monitoring, and one
+	  ECG channel for biopotential recording.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called max86150.
+
 endmenu
diff --git a/drivers/iio/health/Makefile b/drivers/iio/health/Makefile
index 9108171122588..04fc73c584449 100644
--- a/drivers/iio/health/Makefile
+++ b/drivers/iio/health/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_AFE4403)		+= afe4403.o
 obj-$(CONFIG_AFE4404)		+= afe4404.o
 obj-$(CONFIG_MAX30100)		+= max30100.o
 obj-$(CONFIG_MAX30102)		+= max30102.o
+obj-$(CONFIG_MAX86150)		+= max86150.o
diff --git a/drivers/iio/health/max86150.c b/drivers/iio/health/max86150.c
new file mode 100644
index 0000000000000..1e3d28cb41b70
--- /dev/null
+++ b/drivers/iio/health/max86150.c
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MAX86150 combined ECG and PPG biosensor driver
+ *
+ * Copyright (C) 2026 Md Shofiqul Islam <shofiqtest@gmail.com>
+ *
+ * The MAX86150 integrates two PPG optical channels (Red/IR LED) and one
+ * ECG biopotential channel in a single I2C device.  Data is captured
+ * through a 32-entry hardware FIFO with a configurable almost-full
+ * interrupt, making it well-suited for continuous monitoring with a
+ * low-power host.
+ *
+ * Datasheet:
+ *   https://www.analog.com/media/en/technical-documentation/data-sheets/MAX86150.pdf
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/irq.h>
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/kfifo_buf.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+
+/* Register addresses */
+#define MAX86150_REG_INT_STATUS1	0x00
+#define MAX86150_REG_INT_STATUS2	0x01
+#define MAX86150_REG_INT_ENABLE1	0x02
+#define MAX86150_REG_INT_ENABLE2	0x03
+#define MAX86150_REG_FIFO_WR_PTR	0x04
+#define MAX86150_REG_OVF_COUNTER	0x05
+#define MAX86150_REG_FIFO_RD_PTR	0x06
+#define MAX86150_REG_FIFO_DATA		0x07
+#define MAX86150_REG_FIFO_CONFIG	0x08
+#define MAX86150_REG_FIFO_DCTRL1	0x09
+#define MAX86150_REG_FIFO_DCTRL2	0x0A
+#define MAX86150_REG_SYS_CTRL		0x0D
+#define MAX86150_REG_PPG_CONFIG1	0x10
+#define MAX86150_REG_PPG_CONFIG2	0x11
+#define MAX86150_REG_LED1_PA		0x14
+#define MAX86150_REG_LED2_PA		0x15
+#define MAX86150_REG_ECG_CONFIG1	0x3C
+#define MAX86150_REG_ECG_CONFIG3	0x3E
+#define MAX86150_REG_PART_ID		0xFF
+
+#define MAX86150_PART_ID_VAL		0x1E
+
+/* INT_STATUS1 / INT_ENABLE1 */
+#define MAX86150_INT_A_FULL		BIT(7)
+#define MAX86150_INT_PPG_RDY		BIT(6)
+
+/* SYS_CTRL */
+#define MAX86150_SYS_CTRL_SHDN		BIT(1)
+#define MAX86150_SYS_CTRL_RESET		BIT(0)
+
+/* FIFO_CONFIG */
+#define MAX86150_FIFO_CONFIG_SMP_AVE_MASK	GENMASK(7, 5)
+#define MAX86150_FIFO_CONFIG_ROLLOVER_EN	BIT(4)
+#define MAX86150_FIFO_CONFIG_A_FULL_MASK	GENMASK(3, 0)
+
+/* FIFO slot data-type codes */
+#define MAX86150_FD_NONE		0x0
+#define MAX86150_FD_LED1		0x1
+#define MAX86150_FD_LED2		0x2
+#define MAX86150_FD_ECG			0x9
+
+/* FIFO_DCTRL1 / FIFO_DCTRL2 */
+#define MAX86150_FIFO_DCTRL_FD_LO_MASK	GENMASK(3, 0)
+#define MAX86150_FIFO_DCTRL_FD_HI_MASK	GENMASK(7, 4)
+
+/* PPG_CONFIG1 */
+#define MAX86150_PPG_CONFIG1_ADC_RGE_MASK	GENMASK(7, 6)
+#define MAX86150_PPG_CONFIG1_SR_MASK		GENMASK(5, 1)
+
+#define MAX86150_FIFO_DEPTH		32
+#define MAX86150_BYTES_PER_SLOT		3
+#define MAX86150_NUM_SLOTS		3
+#define MAX86150_SAMPLE_BYTES		(MAX86150_NUM_SLOTS * MAX86150_BYTES_PER_SLOT)
+
+/* Fire A_FULL when 17 slots are available (32 - 15 = 17) */
+#define MAX86150_FIFO_A_FULL_VAL	15
+
+#define MAX86150_LED_PA_50MA		0x3F
+#define MAX86150_PPG_SR_100HZ		4
+#define MAX86150_PPG_ADC_RGE_16384	2
+
+enum max86150_scan_idx {
+	MAX86150_IDX_PPG_RED = 0,
+	MAX86150_IDX_PPG_IR  = 1,
+	MAX86150_IDX_ECG     = 2,
+	MAX86150_IDX_TS,
+};
+
+struct max86150_data {
+	struct regmap *regmap;
+	u32 sample_period_ns;
+	u8 fifo_raw[ALIGN(MAX86150_SAMPLE_BYTES, IIO_DMA_MINALIGN)]
+		__aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_BUFFER_WITH_TS(s32, buf, 3);
+};
+
+static const struct iio_chan_spec max86150_channels[] = {
+	{
+		.type               = IIO_INTENSITY,
+		.modified           = 1,
+		.channel2           = IIO_MOD_LIGHT_RED,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.scan_index         = MAX86150_IDX_PPG_RED,
+		.scan_type = {
+			.sign        = 'u',
+			.realbits    = 19,
+			.storagebits = 32,
+			.endianness  = IIO_CPU,
+		},
+	},
+	{
+		.type               = IIO_INTENSITY,
+		.modified           = 1,
+		.channel2           = IIO_MOD_LIGHT_IR,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.scan_index         = MAX86150_IDX_PPG_IR,
+		.scan_type = {
+			.sign        = 'u',
+			.realbits    = 19,
+			.storagebits = 32,
+			.endianness  = IIO_CPU,
+		},
+	},
+	{
+		.type               = IIO_VOLTAGE,
+		.channel            = 0,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.scan_index         = MAX86150_IDX_ECG,
+		.scan_type = {
+			.sign        = 's',
+			.realbits    = 18,
+			.storagebits = 32,
+			.endianness  = IIO_CPU,
+		},
+	},
+	IIO_CHAN_SOFT_TIMESTAMP(MAX86150_IDX_TS),
+};
+
+static const struct regmap_config max86150_regmap_config = {
+	.reg_bits     = 8,
+	.val_bits     = 8,
+	.max_register = MAX86150_REG_PART_ID,
+};
+
+static int max86150_read_one_sample(struct max86150_data *data,
+				    u32 *ppg_red, u32 *ppg_ir, s32 *ecg)
+{
+	int ret;
+
+	ret = regmap_noinc_read(data->regmap, MAX86150_REG_FIFO_DATA,
+				data->fifo_raw, MAX86150_SAMPLE_BYTES);
+	if (ret)
+		return ret;
+
+	*ppg_red = get_unaligned_be24(&data->fifo_raw[0]) & GENMASK(18, 0);
+	*ppg_ir  = get_unaligned_be24(&data->fifo_raw[3]) & GENMASK(18, 0);
+	*ecg = sign_extend32(get_unaligned_be24(&data->fifo_raw[6]) &
+			     GENMASK(17, 0), 17);
+
+	return 0;
+}
+
+static int max86150_read_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int *val, int *val2, long mask)
+{
+	struct max86150_data *data = iio_priv(indio_dev);
+	unsigned int ppg_rdy_status;
+	u32 ppg_red, ppg_ir;
+	s32 ecg;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		if (!iio_device_claim_direct(indio_dev))
+			return -EBUSY;
+
+		ret = regmap_clear_bits(data->regmap, MAX86150_REG_SYS_CTRL,
+					MAX86150_SYS_CTRL_SHDN);
+		if (ret)
+			goto out_shutdown;
+
+		ret = regmap_write(data->regmap, MAX86150_REG_FIFO_WR_PTR, 0);
+		if (ret)
+			goto out_shutdown;
+		ret = regmap_write(data->regmap, MAX86150_REG_OVF_COUNTER, 0);
+		if (ret)
+			goto out_shutdown;
+		ret = regmap_write(data->regmap, MAX86150_REG_FIFO_RD_PTR, 0);
+		if (ret)
+			goto out_shutdown;
+
+		/*
+		 * Poll PPG_RDY rather than sleeping a fixed interval -- the
+		 * internal oscillator may start slower than nominal, leaving
+		 * the FIFO empty if we read too early.
+		 */
+		ret = regmap_read_poll_timeout(data->regmap,
+					       MAX86150_REG_INT_STATUS1,
+					       ppg_rdy_status,
+					       ppg_rdy_status & MAX86150_INT_PPG_RDY,
+					       1000, 25000);
+		if (ret)
+			goto out_shutdown;
+
+		ret = max86150_read_one_sample(data, &ppg_red, &ppg_ir, &ecg);
+
+out_shutdown:
+		regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
+				MAX86150_SYS_CTRL_SHDN);
+		iio_device_release_direct(indio_dev);
+
+		if (ret)
+			return ret;
+
+		switch (chan->scan_index) {
+		case MAX86150_IDX_PPG_RED:
+			*val = ppg_red;
+			break;
+		case MAX86150_IDX_PPG_IR:
+			*val = ppg_ir;
+			break;
+		case MAX86150_IDX_ECG:
+			*val = ecg;
+			break;
+		default:
+			return -EINVAL;
+		}
+		return IIO_VAL_INT;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info max86150_iio_info = {
+	.read_raw = max86150_read_raw,
+};
+
+static int max86150_buffer_postenable(struct iio_dev *indio_dev)
+{
+	struct max86150_data *data = iio_priv(indio_dev);
+	int ret;
+
+	ret = regmap_clear_bits(data->regmap, MAX86150_REG_SYS_CTRL,
+				MAX86150_SYS_CTRL_SHDN);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(data->regmap, MAX86150_REG_FIFO_WR_PTR, 0);
+	if (ret)
+		goto err_shutdown;
+	ret = regmap_write(data->regmap, MAX86150_REG_OVF_COUNTER, 0);
+	if (ret)
+		goto err_shutdown;
+	ret = regmap_write(data->regmap, MAX86150_REG_FIFO_RD_PTR, 0);
+	if (ret)
+		goto err_shutdown;
+	ret = regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1,
+			   MAX86150_INT_A_FULL);
+	if (ret)
+		goto err_shutdown;
+	return 0;
+
+err_shutdown:
+	regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
+			MAX86150_SYS_CTRL_SHDN);
+	return ret;
+}
+
+static int max86150_buffer_predisable(struct iio_dev *indio_dev)
+{
+	struct max86150_data *data = iio_priv(indio_dev);
+
+	regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1, 0);
+	regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
+			MAX86150_SYS_CTRL_SHDN);
+	return 0;
+}
+
+static const struct iio_buffer_setup_ops max86150_buffer_setup_ops = {
+	.postenable = max86150_buffer_postenable,
+	.predisable = max86150_buffer_predisable,
+};
+
+static irqreturn_t max86150_interrupt_handler(int irq, void *private)
+{
+	struct iio_dev *indio_dev = private;
+	struct max86150_data *data = iio_priv(indio_dev);
+	unsigned int status, wr_ptr, rd_ptr, ovf;
+	u32 ppg_red, ppg_ir;
+	s32 ecg;
+	s64 ts;
+	int ret, n_avail, i, j;
+
+	ret = regmap_read(data->regmap, MAX86150_REG_INT_STATUS1, &status);
+	if (ret)
+		return IRQ_HANDLED;
+
+	if (!(status & MAX86150_INT_A_FULL))
+		return IRQ_NONE;
+
+	ret = regmap_read(data->regmap, MAX86150_REG_OVF_COUNTER, &ovf);
+	if (ret)
+		return IRQ_HANDLED;
+
+	if (ovf > 0) {
+		/* FIFO overflowed; timestamps are unreliable - flush and discard */
+		regmap_write(data->regmap, MAX86150_REG_FIFO_WR_PTR, 0);
+		regmap_write(data->regmap, MAX86150_REG_OVF_COUNTER, 0);
+		regmap_write(data->regmap, MAX86150_REG_FIFO_RD_PTR, 0);
+		return IRQ_HANDLED;
+	}
+
+	ret = regmap_read(data->regmap, MAX86150_REG_FIFO_WR_PTR, &wr_ptr);
+	if (ret)
+		return IRQ_HANDLED;
+	ret = regmap_read(data->regmap, MAX86150_REG_FIFO_RD_PTR, &rd_ptr);
+	if (ret)
+		return IRQ_HANDLED;
+
+	n_avail = (wr_ptr - rd_ptr) & (MAX86150_FIFO_DEPTH - 1);
+	if (!n_avail)
+		return IRQ_HANDLED;
+
+	/*
+	 * Anchor timestamps to the interrupt time: sample (n_avail - 1) is
+	 * the newest and corresponds to ts; earlier samples are back-calculated
+	 * by one sample_period_ns per step.
+	 */
+	ts = ktime_get_ns();
+
+	for (i = 0; i < n_avail; i++) {
+		s64 sample_ts = ts -
+			(s64)(n_avail - 1 - i) * data->sample_period_ns;
+
+		ret = max86150_read_one_sample(data, &ppg_red, &ppg_ir, &ecg);
+		if (ret)
+			break;
+
+		j = 0;
+		if (test_bit(MAX86150_IDX_PPG_RED, indio_dev->active_scan_mask))
+			data->buf[j++] = ppg_red;
+		if (test_bit(MAX86150_IDX_PPG_IR, indio_dev->active_scan_mask))
+			data->buf[j++] = ppg_ir;
+		if (test_bit(MAX86150_IDX_ECG, indio_dev->active_scan_mask))
+			data->buf[j++] = ecg;
+
+		iio_push_to_buffers_with_ts(indio_dev, data->buf,
+					    sizeof(data->buf), sample_ts);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void max86150_powerdown(void *arg)
+{
+	struct max86150_data *data = arg;
+
+	regmap_write(data->regmap, MAX86150_REG_INT_ENABLE1, 0);
+	regmap_set_bits(data->regmap, MAX86150_REG_SYS_CTRL,
+			MAX86150_SYS_CTRL_SHDN);
+}
+
+static int max86150_chip_init(struct max86150_data *data)
+{
+	int ret;
+
+	/* Software reset; the bit self-clears within 1 ms */
+	ret = regmap_write(data->regmap, MAX86150_REG_SYS_CTRL,
+			   MAX86150_SYS_CTRL_RESET);
+	if (ret)
+		return ret;
+	fsleep(1000);
+
+	ret = regmap_write(data->regmap, MAX86150_REG_FIFO_CONFIG,
+			   MAX86150_FIFO_CONFIG_ROLLOVER_EN |
+			   FIELD_PREP(MAX86150_FIFO_CONFIG_A_FULL_MASK,
+				      MAX86150_FIFO_A_FULL_VAL));
+	if (ret)
+		return ret;
+
+	/* Slot 1 = PPG Red (LED1), Slot 2 = PPG IR (LED2) */
+	ret = regmap_write(data->regmap, MAX86150_REG_FIFO_DCTRL1,
+			   FIELD_PREP(MAX86150_FIFO_DCTRL_FD_LO_MASK,
+				      MAX86150_FD_LED1) |
+			   FIELD_PREP(MAX86150_FIFO_DCTRL_FD_HI_MASK,
+				      MAX86150_FD_LED2));
+	if (ret)
+		return ret;
+
+	/* Slot 3 = ECG, Slot 4 = disabled */
+	ret = regmap_write(data->regmap, MAX86150_REG_FIFO_DCTRL2,
+			   FIELD_PREP(MAX86150_FIFO_DCTRL_FD_LO_MASK,
+				      MAX86150_FD_ECG) |
+			   FIELD_PREP(MAX86150_FIFO_DCTRL_FD_HI_MASK,
+				      MAX86150_FD_NONE));
+	if (ret)
+		return ret;
+
+	/* PPG: 100 Hz sample rate, 16384 nA ADC full-scale range */
+	ret = regmap_write(data->regmap, MAX86150_REG_PPG_CONFIG1,
+			   FIELD_PREP(MAX86150_PPG_CONFIG1_ADC_RGE_MASK,
+				      MAX86150_PPG_ADC_RGE_16384) |
+			   FIELD_PREP(MAX86150_PPG_CONFIG1_SR_MASK,
+				      MAX86150_PPG_SR_100HZ));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(data->regmap, MAX86150_REG_LED1_PA, MAX86150_LED_PA_50MA);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(data->regmap, MAX86150_REG_LED2_PA, MAX86150_LED_PA_50MA);
+	if (ret)
+		return ret;
+
+	data->sample_period_ns = 10 * NSEC_PER_MSEC;
+
+	return regmap_write(data->regmap, MAX86150_REG_SYS_CTRL,
+			    MAX86150_SYS_CTRL_SHDN);
+}
+
+static int max86150_probe(struct i2c_client *client)
+{
+	struct iio_dev *indio_dev;
+	struct max86150_data *data;
+	unsigned int part_id;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+
+	ret = devm_regulator_get_enable(&client->dev, "vdd");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to get/enable vdd supply\n");
+
+	ret = devm_regulator_get_enable(&client->dev, "vled");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to get/enable vled supply\n");
+
+	data->regmap = devm_regmap_init_i2c(client, &max86150_regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
+				     "Failed to initialise regmap\n");
+
+	ret = regmap_read(data->regmap, MAX86150_REG_PART_ID, &part_id);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Cannot read part ID\n");
+
+	if (part_id != MAX86150_PART_ID_VAL)
+		dev_warn(&client->dev,
+			 "Unexpected part ID 0x%02x (expected 0x%02x)\n",
+			 part_id, MAX86150_PART_ID_VAL);
+
+	ret = max86150_chip_init(data);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Chip initialisation failed\n");
+
+	ret = devm_add_action_or_reset(&client->dev, max86150_powerdown, data);
+	if (ret)
+		return ret;
+
+	indio_dev->name = "max86150";
+	indio_dev->channels = max86150_channels;
+	indio_dev->num_channels = ARRAY_SIZE(max86150_channels);
+	indio_dev->info = &max86150_iio_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	if (client->irq > 0) {
+		unsigned long irq_trig = irq_get_trigger_type(client->irq);
+
+		ret = devm_iio_kfifo_buffer_setup(&client->dev, indio_dev,
+						  &max86150_buffer_setup_ops);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					     "Cannot setup kfifo buffer\n");
+
+		ret = devm_request_threaded_irq(&client->dev, client->irq,
+						NULL,
+						max86150_interrupt_handler,
+						irq_trig | IRQF_ONESHOT,
+						"max86150", indio_dev);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					     "Cannot request IRQ %d\n",
+					     client->irq);
+	}
+
+	return devm_iio_device_register(&client->dev, indio_dev);
+}
+
+static const struct i2c_device_id max86150_id[] = {
+	{ "max86150" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max86150_id);
+
+static const struct of_device_id max86150_of_match[] = {
+	{ .compatible = "adi,max86150" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max86150_of_match);
+
+static struct i2c_driver max86150_driver = {
+	.driver = {
+		.name = "max86150",
+		.of_match_table = max86150_of_match,
+	},
+	.probe = max86150_probe,
+	.id_table = max86150_id,
+};
+module_i2c_driver(max86150_driver);
+
+MODULE_AUTHOR("Md Shofiqul Islam <shofiqtest@gmail.com>");
+MODULE_DESCRIPTION("MAX86150 ECG and PPG biosensor driver");
+MODULE_LICENSE("GPL");
-- 
2.51.1

