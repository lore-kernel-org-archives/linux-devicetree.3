Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650396;
	b=acx4SwhVAX+dOwo0wSZSDGqZGzaENQ5YjbKp2j94KgUhwIcLYX9w1UjXfcoikCxzZyr9
	 sAiTGmJdSl0A4LGIRUNlRWOlY+hI/7rUZ1aEvIZ8BUQNwHkbCXEnqoG0Des0WW1NMSjMw
	 tVNDIuIlurCVBWwREPsMTAbgEmKjMQBTCAd/Y/oAWtAYM1AXSveUQJulc+0LgHc4UsDfM
	 oYuUmCjL+OLOVh4zL3VObsxGjNTZBMcZy54sGrvp1qv+ueMv/TCQleq32GupxogLWG9zI
	 OGmeO/MbV8k+NHVK8uwIdzNsX0MtpcenbyMIEFH3id4+7Y9NTY28bAmWELcggYvEVCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j97QnN1Q3ga0QK4QhcAlzVnDrJyvADYSfmPJLExtZLA=;
	b=vAflZoyQA60jClSzbW2Qo+rpBybS9SWj9HnjSApxYJ128gY2ldIuq/KNVHIuw30hTrsb
	 4DTu0GVEFhoe5Z5XbbRiBmqujHIzOdJOTUxabqm2u21ePGl21TSqKGJkYnr6usLNOdRni
	 PVAoFieBoIh7id+tN/VbmVZtB13nyL1VPQRouvecQks6JFfa1qro50S9TbOxiZnfAqftt
	 53PVReUUjQbnxMvJxAZQ/+sXHm1bW4DHk/wMqU+E4lR4+/luIRVTBM0k7lxcLu87nRP55
	 TK5y98YhetdRElW4fmGe4YxRJ3ItQcSGeDGvNNAKGv4C3/F2ghrFWfRBtSu7QcXHjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N8jarnVk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B849606A335
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B849606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N8jarnVk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso21796145e9.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650394; x=1794255194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j97QnN1Q3ga0QK4QhcAlzVnDrJyvADYSfmPJLExtZLA=;
        b=N8jarnVk/b+P64jysqX3+09TJz4RuRtLWtl3HftfkUF726qZqZ6BkNVeOtUlehvoI9
         MieHnPrLYfu0dhaWUcmJn5qWMn48H2RRAlFF2Ej68kdms5dTeR1eU9UBVDfOb2sQibk9
         IS2VJpfB+f1kDH0ucT4+KmpaK780GCuPb+wpMe4Id5/0vSLng07CsinuCGUwvRK3+tWH
         9j+V9fnbLd6ZmzcjTApzApRAHs62KcpPvn1OGfvjNKOQqgMKnz7K6eWAAjckw9eAh8Io
         9OjY6U45z+oCru2kMpeWmanGjf5D9J2vL4KP0CjtW3wg4csc6OQPmKs48Y/ZU4tludaq
         OEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650394; x=1794255194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j97QnN1Q3ga0QK4QhcAlzVnDrJyvADYSfmPJLExtZLA=;
        b=FWjn8srmkiGwmjYgOGREuZqEsHnNnHd2+6xgdpRDcW5/m44Af0Xk0LbRgJLCZtB+pX
         xnrYm84sVtd0NQ/XgDnQpovfIO4x1vx9pDRi2J5af0g4pGzFthqQVfWQUMZfyyVFHLYA
         RWnPEnKHMcHr2vXd+A2esErc6VPHd3puOedygMmS9idDRVOB1CBZOD4vd2oAaSHU1LjI
         +3LArT7/7ehgJY7bmUjyOuUKNBai03YIXlOj/Nxx86BTZcYvNYwRo8giPuuEjKkg3RiU
         HH7FcqT2xx5pOaxEEeZbrJQpYYKZjt3pqUIJ1ghaOMOzZFwKa/a7Aa4FCdU1yPbfHK5l
         UdcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy8ggvXSuryN7xuvxJOcbqT1yG92nlhdlgogoQQTc5Y7xpqDpoWN3ncCfUNXLrg+FqytRoJ0Ug38x0@vger.kernel.org
X-Gm-Message-State: AFq9FYKy+/HrZRxP6p4fyPQIuq2K45nrTk0hjYei/M2MPWbLr5NzcipQ
	yhNXcwbrWeJI3Z8fhLqgEK6N+x700s8vVW+bgGy02OOi+jLhvpHDuBgsyPamuD8zTok=
X-Gm-Gg: AYBFou2YImiI2xKQwEgeKa8ZHzvrSCdvhYWnZcAqKg5Hzck4TkSOmrgQ4rzn+3B1V0S
	RCbb63hScQ5I+yuds9/NQjIEiZ7tFhJgDrrZKafEXJ6eERCR+V+m9yTsxzJIaZIOmGAiPOqScdo
	oyeKjlPcJQRNWUnxvPeD8S9VqR2RN/F4d1mocnyntqnhsJIIuzJTXKsJ8mkpuijsOpsO1A4Vqks
	YwUeAO0iW0HpMaWJstEwArE2TLxveE9StXy++w5dWvAOYIcPQfH+wcHKupuN2MtheRxj9s3GyfA
	f0a5nICuEHMtqsI6LJ9us5CeYf2UR8iCB4jFJ/61v9O3dNEiQ1tUwcyDG/gg0YxDMoSTtmegrtU
	Yxblvr5p/3yKStDRU7jGLiAlDo49LYUGzdzIHKuYWDEwN/FpDWsvFnjro8SAsUWMt8G5MKR+noh
	gqlIgHnC8Tb6kq3dda8MBidQ1sx88yHF7byom8I/LoWcvYcQRkPaZcjGLrShImviPbUt3qekyKf
	OV+NOkqtx0Lg0nnnlonaTwx/8XDrfb1UiqSuudHJj27iFRy6dNoNBAhDvtbwIyXbRTY6fPiy6tu
	CpwUwOuSSJSaeGUnJytl9DQY/lnnDxGzqOgr3F9n+vZBBE+xjfBQBSGvwzLS
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr253364875e9.18.1793650393795;
        Mon, 02 Nov 2026 12:13:13 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm13969155e9.2.2026.11.02.12.13.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:13:13 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Date: Mon,  2 Nov 2026 21:11:55 +0100
Message-ID: <20261102201155.10948-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201155.10948-1-olivier@mgcrea.io>
References: <20261102201155.10948-1-olivier@mgcrea.io>
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

The X1600's SAR ADC has four auxiliary channels, each with its own start
bit, interrupt flag and 12-bit result, and none of the touchscreen or
battery engines of the JZ47xx ADCs that ingenic-adc drives. Add a small
driver that exposes the four channels as voltages against the 3.3 V
reference.

The registers are in chapter 19 of the X1600 programming manual. The
ADC clock divider is even, as the manual has it (an odd value divides
by one less); the vendor kernel writes the divider minus one, which
gives a slightly faster clock than it asks for.

Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
behind adc-keys: all three read and report correctly.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 MAINTAINERS                         |   1 +
 drivers/iio/adc/Kconfig             |  10 ++
 drivers/iio/adc/Makefile            |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c | 257 ++++++++++++++++++++++++++++
 4 files changed, 269 insertions(+)
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fd4bb5c6bf16..d1472b569fc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12929,6 +12929,7 @@ INGENIC X1600 ADC DRIVER
 M:	Olivier Louvignes <olivier@mgcrea.io>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+F:	drivers/iio/adc/ingenic-x1600-adc.c
 
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a802d8ee4dd9..7b5c3d3fcfdb 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -881,6 +881,16 @@ config INGENIC_ADC
 	  This driver can also be built as a module. If so, the module will be
 	  called ingenic_adc.
 
+config INGENIC_X1600_ADC
+	tristate "Ingenic X1600 ADC driver"
+	depends on MIPS || COMPILE_TEST
+	help
+	  Say yes here to build support for the SAR ADC of the Ingenic X1600
+	  SoC and its four auxiliary channels.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called ingenic-x1600-adc.
+
 config INTEL_DC_TI_ADC
 	tristate "Intel Bay Trail / Cherry Trail Dollar Cove TI ADC driver"
 	depends on INTEL_SOC_PMIC_CHTDC_TI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 9e82c21dbd37..f76e62b0cd04 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_IMX8QXP_ADC) += imx8qxp-adc.o
 obj-$(CONFIG_IMX93_ADC) += imx93_adc.o
 obj-$(CONFIG_INA2XX_ADC) += ina2xx-adc.o
 obj-$(CONFIG_INGENIC_ADC) += ingenic-adc.o
+obj-$(CONFIG_INGENIC_X1600_ADC) += ingenic-x1600-adc.o
 obj-$(CONFIG_INTEL_DC_TI_ADC) += intel_dc_ti_adc.o
 obj-$(CONFIG_INTEL_MRFLD_ADC) += intel_mrfld_adc.o
 obj-$(CONFIG_LP8788_ADC) += lp8788_adc.o
diff --git a/drivers/iio/adc/ingenic-x1600-adc.c b/drivers/iio/adc/ingenic-x1600-adc.c
new file mode 100644
index 000000000000..03a26e2bffc3
--- /dev/null
+++ b/drivers/iio/adc/ingenic-x1600-adc.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ingenic X1600 ADC driver
+ *
+ * Copyright (c) 2026 Olivier Louvignes <olivier@mgcrea.io>
+ *
+ * The X1600's SAR ADC has four auxiliary channels, each with its own start
+ * bit, interrupt and 12-bit result (X1600 programming manual, chapter 19).
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/iio/iio.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+#define X1600_ADC_REG_ENABLE		0x00
+#define X1600_ADC_REG_CTRL		0x08
+#define X1600_ADC_REG_STATUS		0x0c
+#define X1600_ADC_REG_DATA(bank)	(0x10 + (bank) * 4)
+#define X1600_ADC_REG_CLKDIV		0x20
+#define X1600_ADC_REG_STABLE		0x24
+
+/* ENABLE: bits 3..0 start a channel's conversion; bit 15 powers down. */
+#define X1600_ADC_ENABLE_POWER_DOWN	BIT(15)
+/* CTRL: bits 3..0 mask the channels' interrupts. STATUS: write 1 to clear. */
+#define X1600_ADC_CHANNELS_MASK		GENMASK(3, 0)
+#define X1600_ADC_DATA_MASK(shift)	(GENMASK(11, 0) << ((shift) * 16))
+/* CLKDIV: an even divider from the device clock; US and MS: for repeats. */
+#define X1600_ADC_CLKDIV_CLKDIV		GENMASK(7, 0)
+#define X1600_ADC_CLKDIV_US		GENMASK(15, 8)
+#define X1600_ADC_CLKDIV_MS		GENMASK(31, 16)
+#define X1600_ADC_STABLE_TIME		GENMASK(15, 0)
+
+#define X1600_ADC_NUM_CHANNELS		4
+#define X1600_ADC_VREF_mV		3300
+#define X1600_ADC_BITS			12
+/* The ADC clock the vendor kernel runs at. */
+#define X1600_ADC_CLK_RATE_HZ		1166667
+#define X1600_ADC_TIMEOUT_MS		20
+
+struct x1600_adc {
+	void __iomem *base;
+	struct clk *clk;
+	struct completion done;
+	/* Serialises conversions: there is one completion for all channels. */
+	struct mutex lock;
+};
+
+static u32 x1600_adc_read(struct x1600_adc *adc, unsigned int offset)
+{
+	return readl(adc->base + offset);
+}
+
+static void x1600_adc_write(struct x1600_adc *adc, unsigned int offset, u32 value)
+{
+	writel(value, adc->base + offset);
+}
+
+static irqreturn_t x1600_adc_irq(int irq, void *data)
+{
+	struct x1600_adc *adc = data;
+	u32 status;
+
+	status = x1600_adc_read(adc, X1600_ADC_REG_STATUS) & X1600_ADC_CHANNELS_MASK;
+	if (!status)
+		return IRQ_NONE;
+
+	x1600_adc_write(adc, X1600_ADC_REG_STATUS, status);
+	complete(&adc->done);
+	return IRQ_HANDLED;
+}
+
+static int x1600_adc_read_raw_channel(struct x1600_adc *adc, unsigned int ch, int *val)
+{
+	unsigned int bank, shift;
+	int ret = 0;
+	u32 enable, data;
+
+	guard(mutex)(&adc->lock);
+
+	reinit_completion(&adc->done);
+	x1600_adc_write(adc, X1600_ADC_REG_STATUS, BIT(ch));
+	enable = x1600_adc_read(adc, X1600_ADC_REG_ENABLE);
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, enable | BIT(ch));
+
+	if (!wait_for_completion_timeout(&adc->done,
+					 msecs_to_jiffies(X1600_ADC_TIMEOUT_MS)))
+		ret = -ETIMEDOUT;
+
+	enable = x1600_adc_read(adc, X1600_ADC_REG_ENABLE);
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, enable & ~BIT(ch));
+	if (ret)
+		return ret;
+
+	/* Two results to a data register, the even channel's in the low half. */
+	bank = ch / 2;
+	shift = ch % 2;
+	data = x1600_adc_read(adc, X1600_ADC_REG_DATA(bank));
+	*val = field_get(X1600_ADC_DATA_MASK(shift), data);
+	return 0;
+}
+
+static int x1600_adc_read_raw(struct iio_dev *iio_dev,
+			      struct iio_chan_spec const *chan,
+			      int *val, int *val2, long mask)
+{
+	struct x1600_adc *adc = iio_priv(iio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = x1600_adc_read_raw_channel(adc, chan->channel, val);
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = X1600_ADC_VREF_mV;
+		*val2 = X1600_ADC_BITS;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info x1600_adc_info = {
+	.read_raw = x1600_adc_read_raw,
+};
+
+#define X1600_ADC_CHANNEL(_ch) {				\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (_ch),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+}
+
+static const struct iio_chan_spec x1600_adc_channels[] = {
+	X1600_ADC_CHANNEL(0),
+	X1600_ADC_CHANNEL(1),
+	X1600_ADC_CHANNEL(2),
+	X1600_ADC_CHANNEL(3),
+};
+
+static void x1600_adc_power_down(void *data)
+{
+	struct x1600_adc *adc = data;
+
+	x1600_adc_write(adc, X1600_ADC_REG_CTRL, X1600_ADC_CHANNELS_MASK);
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, X1600_ADC_ENABLE_POWER_DOWN);
+}
+
+static int x1600_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *iio_dev;
+	struct x1600_adc *adc;
+	unsigned long rate;
+	u32 div, reg;
+	int irq, ret;
+
+	iio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!iio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(iio_dev);
+	init_completion(&adc->done);
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	adc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(adc->base))
+		return PTR_ERR(adc->base);
+
+	adc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk), "Unable to get clock\n");
+
+	/* Powered down, interrupts masked and cleared, as the vendor does. */
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, X1600_ADC_ENABLE_POWER_DOWN);
+	x1600_adc_write(adc, X1600_ADC_REG_CTRL, X1600_ADC_CHANNELS_MASK);
+	x1600_adc_write(adc, X1600_ADC_REG_STATUS, X1600_ADC_CHANNELS_MASK);
+
+	rate = clamp(clk_get_rate(adc->clk), 2UL * X1600_ADC_CLK_RATE_HZ,
+		     254UL * X1600_ADC_CLK_RATE_HZ);
+	div = round_up(DIV_ROUND_UP(rate, X1600_ADC_CLK_RATE_HZ), 2);
+	/* US and MS at their reset values: single conversions don't use them. */
+	x1600_adc_write(adc, X1600_ADC_REG_CLKDIV,
+			FIELD_PREP(X1600_ADC_CLKDIV_CLKDIV, div) |
+			FIELD_PREP(X1600_ADC_CLKDIV_US, 16) |
+			FIELD_PREP(X1600_ADC_CLKDIV_MS, 4));
+	reg = x1600_adc_read(adc, X1600_ADC_REG_STABLE) & ~X1600_ADC_STABLE_TIME;
+	x1600_adc_write(adc, X1600_ADC_REG_STABLE,
+			reg | FIELD_PREP(X1600_ADC_STABLE_TIME, 1));
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, x1600_adc_irq, 0, dev_name(dev), adc);
+	if (ret)
+		return ret;
+
+	/*
+	 * Left powered up: a typical use, such as buttons read through adc-keys,
+	 * polls every few tens of milliseconds, and powering up takes 2 ms.
+	 */
+	x1600_adc_write(adc, X1600_ADC_REG_ENABLE, 0);
+	fsleep(2 * USEC_PER_MSEC);
+	x1600_adc_write(adc, X1600_ADC_REG_CTRL, 0);
+
+	ret = devm_add_action_or_reset(dev, x1600_adc_power_down, adc);
+	if (ret)
+		return ret;
+
+	iio_dev->name = "x1600-adc";
+	iio_dev->modes = INDIO_DIRECT_MODE;
+	iio_dev->channels = x1600_adc_channels;
+	iio_dev->num_channels = ARRAY_SIZE(x1600_adc_channels);
+	iio_dev->info = &x1600_adc_info;
+
+	return devm_iio_device_register(dev, iio_dev);
+}
+
+static const struct of_device_id x1600_adc_of_match[] = {
+	{ .compatible = "ingenic,x1600-adc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, x1600_adc_of_match);
+
+static struct platform_driver x1600_adc_driver = {
+	.driver = {
+		.name = "ingenic-x1600-adc",
+		.of_match_table = x1600_adc_of_match,
+	},
+	.probe = x1600_adc_probe,
+};
+module_platform_driver(x1600_adc_driver);
+MODULE_AUTHOR("Olivier Louvignes <olivier@mgcrea.io>");
+MODULE_DESCRIPTION("Ingenic X1600 ADC driver");
+MODULE_LICENSE("GPL");
-- 
2.54.0

