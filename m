Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7093C10BA
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423649; cv=none; b=A3jrlpigNfOJiabVfPDQYnWMDdfYOfagp+DKgxD8GmU7AY8C4Q/If+VMQhJDDpkDj5gayowcipUJkZoVYDQr4VP4x/Wqv/6iqF68pArBkLM+SYnQZIVOFLb3zrt6kWICX/VBOCR8eZBk0pJUHnJEJBMbLIc8cwcMuOl1HZr2w9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423649; c=relaxed/simple;
	bh=drC/Pjoy3necJ0IfcN9z8qtvC1gjHWvahpv5Y8updA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QC8kXzzReo6MzI2qEM8erfOjCF4pvEGs3lxr/mAf4TIvzP8puvTk7XCL4PJgDKLGIY7Zc1yJd5q5KGgilZ4rXR6ay3R4+sn7UXJ4IkzKUe9awiXwq7csm079XEqa9GvT2fAtcI3jeH2vU6gXChgNGCR+WOhOBkNJ0otw70CHVS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxLVowFi; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxLVowFi"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b0c6488e6so44670821fa.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423643; x=1784028443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmp6qI3D/M2HnrfNjgIUzg8GQs4IkrRTs170Fb1aH7g=;
        b=cxLVowFiUYQ/wurZsCX8PfJ0bzUVnHbYnk7522eVidIDku43QDVdcO+hS5Vk1DHjmc
         WxaZUyvIh++tw4+DlwaayG73dvxRGrHrOL8/ni8mjkJm6nYlvhRFfS6TbP9trjUWLwAp
         U7XRuGNkgDd7GeWm5CS22r+EhOP1Kd/3m/F3V1rc6mlQKW9f2Gz24oe7sl6v6S9Rc3zX
         yunajGYGFvxK/Di5TarlnNZB+zvonesKFPxsAxS7iZp2vkUCjavtChQftKA9cYItLDbz
         uZtW6Suj/og7Z9wubywzPYFqcSI7ROwEG+Apn1rnkz9DHJmByg1vojumkD1mwXU7TDR2
         n9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423643; x=1784028443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmp6qI3D/M2HnrfNjgIUzg8GQs4IkrRTs170Fb1aH7g=;
        b=ZNWBo6TSQQcAqRSbF14WwdEnhg+ti/KEzFtTypn63JD5QLxTBbR8AM02oQkb6DpdhB
         Fth7QzLj5QwWeQ5X1aWRN6xsabAGEQD3SWvt4D6Y9r9E5LGT2AR1CZnyly8nb2s92ZnB
         btZFYmTfsypA4YJHiFiqO0TfR9W88/w3hHd3ivjrOHTFPkv5hzmBx0kwpI5KGg6fiAgr
         ei/BSyE68mYiLl1kfNIiRki6IPXpOg0tfTqhr6VXL4lFkQA+VvlUOdd40Eo2RQtIKzYy
         Gdat7ULj23znZvrNydAiTXt1iQ4Q63DyT4s9hX1rucvlCS4G4RJM5HfgnF6WRLGACSac
         ErEg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/7UH0DNJS5OTSC2o5hlp13Y7K/f2x2H1yejUgu/nQGptaRMJIGBrc+spzix+YQKcejl53WoBUTYOB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uUAxKJbbgBOoGVv6xC8j0mvwBUTZuyE3nkO5dZWCyV6oFOqp
	iBj1Tl2pqpi9YaUVsyR35MZdBuwIqCOUPwwjy7V3v4X8SqLXGvLab/UY
X-Gm-Gg: AfdE7cn/Ncp5LFt56wf+puKHcX87HuALc/FvUI7+iJZTiM6Y/ju2mHhU3cJor7Jc90H
	jvUsTUm0ooWEJZ1kk0M8GxWrV84ZWgWkuLQ4g6Y23t/5SFflG64A8QjvcmHsZrIn5+9Rm673dJG
	ipKn+HIn86ZCCTv4EU6xhWhdqqhPXoQkWYZwxTcQVIzhMW89/xWOK1gF91MCe26cOMfMPO+h+TQ
	DbO5frVvLWF/CstzG6RlYgGGFEANL7Sf1wA4ops2Ly6NFlLabCBWqwqMajNm94SlVaP/O6QE5E1
	21PIn8LVmjXJdXjvBBJ5nqOmuAmLEKhxsVMZOPIQVzaFpy4YvY0gkTCmMKqGQIxWQrSSM+eTMU5
	ww2vGlcmBKb0GoPVFHNQrD5VCQsVpdTLsyGNrHJO7Oztr6z/AOkTYtoZQtQsLQlVkS/IF4++ByA
	KqusYqSVMXXkcFkn3NIzXPqvlZiHHTgg70bdauqxQwLntMgg==
X-Received: by 2002:a05:6512:60b:b0:5ae:aeea:c60a with SMTP id 2adb3069b0e04-5b007b6eb9emr774509e87.11.1783423640713;
        Tue, 07 Jul 2026 04:27:20 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1890asm23602331fa.3.2026.07.07.04.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:27:20 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@intel.com,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com
Subject: [PATCH v9 2/2] iio: health: add MAX86150 ECG and PPG biosensor driver
Date: Tue,  7 Jul 2026 14:27:14 +0300
Message-ID: <20260707112714.2261727-3-shofiqtest@gmail.com>
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
- synchronize_irq() in predisable ensures threaded handler completes
  before the IIO core clears active_scan_mask
- INT_STATUS1 cleared before polling PPG_RDY to avoid stale flag
- A_FULL status bit used to detect FIFO exactly full (wr_ptr == rd_ptr
  with OVF_COUNTER == 0) so valid samples are not silently dropped

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 MAINTAINERS                   |   1 +
 drivers/iio/health/Kconfig    |  17 ++
 drivers/iio/health/Makefile   |   1 +
 drivers/iio/health/max86150.c | 560 ++++++++++++++++++++++++++++++++++
 4 files changed, 579 insertions(+)
 create mode 100644 drivers/iio/health/max86150.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e9b9fd619bd86..361a7c8b99ead 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15868,6 +15868,7 @@ M:	Md Shofiqul Islam <shofiqtest@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
+F:	drivers/iio/health/max86150.c
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
diff --git a/drivers/iio/health/Kconfig b/drivers/iio/health/Kconfig
index a89f3abf11f4a..c18d41d5044fa 100644
--- a/drivers/iio/health/Kconfig
+++ b/drivers/iio/health/Kconfig
@@ -62,4 +62,21 @@ config MAX30102
 
 endmenu
 
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
index 0000000000000..e8394031f3acb
--- /dev/null
+++ b/drivers/iio/health/max86150.c
@@ -0,0 +1,560 @@
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
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/timekeeping.h>
+#include <linux/unaligned.h>
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/kfifo_buf.h>
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
+	MAX86150_IDX_PPG_RED,
+	MAX86150_IDX_PPG_IR,
+	MAX86150_IDX_ECG,
+	MAX86150_IDX_TS,
+};
+
+struct max86150_data {
+	struct regmap *regmap;
+	int irq;
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
+		 * Clear stale PPG_RDY from a previous session; reading
+		 * INT_STATUS1 de-asserts any pending flags so the poll
+		 * below waits for a genuinely new sample.
+		 */
+		regmap_read(data->regmap, MAX86150_REG_INT_STATUS1,
+			    &ppg_rdy_status);
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
+	/*
+	 * Mask the hardware interrupt first, then synchronize to ensure any
+	 * threaded handler already in flight completes before the IIO core
+	 * clears active_scan_mask; without this a delayed handler would
+	 * dereference a NULL active_scan_mask.
+	 */
+	synchronize_irq(data->irq);
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
+	unsigned int status, wr_ptr, rd_ptr, ovf, n_avail;
+	u32 ppg_red, ppg_ir;
+	s32 ecg;
+	s64 ts;
+	unsigned int i, j;
+	int ret;
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
+	/*
+	 * When the FIFO holds exactly MAX86150_FIFO_DEPTH samples the
+	 * write pointer wraps around to equal the read pointer even though
+	 * OVF_COUNTER is still zero.  The A_FULL status bit disambiguates
+	 * this wrap-around from a genuinely empty FIFO.
+	 */
+	if (!n_avail && (status & MAX86150_INT_A_FULL))
+		n_avail = MAX86150_FIFO_DEPTH;
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
+	struct device *dev = &client->dev;
+	struct iio_dev *indio_dev;
+	struct max86150_data *data;
+	unsigned int part_id;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+	data->irq = client->irq;
+
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get/enable vdd supply\n");
+
+	ret = devm_regulator_get_enable(dev, "vled");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get/enable vled supply\n");
+
+	data->regmap = devm_regmap_init_i2c(client, &max86150_regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap),
+				     "Failed to initialise regmap\n");
+
+	ret = regmap_read(data->regmap, MAX86150_REG_PART_ID, &part_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot read part ID\n");
+
+	if (part_id != MAX86150_PART_ID_VAL)
+		dev_warn(dev, "Unexpected part ID 0x%02x (expected 0x%02x)\n",
+			 part_id, MAX86150_PART_ID_VAL);
+
+	ret = max86150_chip_init(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Chip initialisation failed\n");
+
+	ret = devm_add_action_or_reset(dev, max86150_powerdown, data);
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
+		ret = devm_iio_kfifo_buffer_setup(dev, indio_dev,
+						  &max86150_buffer_setup_ops);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Cannot setup kfifo buffer\n");
+
+		ret = devm_request_threaded_irq(dev, client->irq,
+						NULL,
+						max86150_interrupt_handler,
+						irq_trig | IRQF_ONESHOT,
+						"max86150", indio_dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Cannot request IRQ %d\n",
+					     client->irq);
+	}
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct i2c_device_id max86150_id[] = {
+	{ .name = "max86150" },
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

