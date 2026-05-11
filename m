Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF55477E4D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521529; cv=none; b=VH6YsHjWIFTfZ0MEtIn3PWfHQfSV0o7yus2vFNA9T2V4obMgaC0jbxZXI1g0uP5BfOHIurN+QnhUyptjbjVZ8bpqpPtQVQEuVS3LzUQbxe4EPK4GNAvldg+FI184YK8e8MRpsgJ7NL0zq9MTz+aiydLf6m4DlgghHvTSHhecTRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521529; c=relaxed/simple;
	bh=zqVTtYWb0+swrTGYbWxQXlgUdiISDtlU33r5BVnXTMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li6mLVBITwMwykQPs+qR08BKIy2KySktOhmnZKvFyD26gvfwcjWJ6dJr4wpZFnue1vnNucuabumCZ9H1gbCjdgFYfmX37gRHJq7VX94z1R/eWDxsrpsv59NSlgSWFdrSn25jKu/9GcKHeY+loOPFxlQsQFHgm8+Q+RxkqZprtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqHebjyg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqHebjyg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b9ea536877so26930795ad.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521527; x=1779126327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzftT75wkhUWLYqTnzIpdZtkzhmLETv7GJcpetSaav4=;
        b=oqHebjygi+m6jrpWx2Q4Y90ikgWYHwCOnPw8aukQ8V32aT8RxSWBc+sv7fCuejtJfx
         iP4ZyuMQfW3YQnEr5Ox06I/OBhRYMC/yFc3pJjl7Oka6UzZAZdHz79VsMV1/RPiwnya3
         2Tdniv0jHB9vbceKaKYr1+h9Zh+RzxjcwKAvp6v8wJ2amhntsDffzKh3UD0MuYyEeVZM
         aMD+HHXSsAjSifAqj2Qz+sNM/RB10H1MeBzgPr7nc7oVwx/+ZunvR6vbWH6nUNZQ7JPI
         5q38iht9b2w+UFym/yFCy50RVPpv0p7yloUytKEpsvdkKmDiKN0HwO7TezzjKD2p8eis
         hKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521527; x=1779126327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzftT75wkhUWLYqTnzIpdZtkzhmLETv7GJcpetSaav4=;
        b=Ha4XYlWh8cXwol3p9qDlJ14U3aFkNZwDEd3kPMJav1zHOH/SJqf48kDw30JtdDMBNT
         SbbX40rYCNv0lDiE/Cnke+tuhGIgjcCncRUqdEz3+m5YSGiAx31WB6aQ+Ke6Jrpfw/c1
         fV0le3mzKsJmPLpSDW9gs+sFbrIc16wAH+kfPTuhGzXTFCxup1HgX6sT5wYGK2fvhFPg
         xjqWN0dm7kV6fxtJiT0fiai/5QZUWOG0rn5iUI9J7QryGfBgYJl2Hq+7ZvHduK5nRzCc
         +uxvcFb90W4gDX5WEQGzXFaXnZC+aNZ5mORQB+dA+GGFuI74LU8Kky7Vx/ghUXmm950G
         1t8A==
X-Forwarded-Encrypted: i=1; AFNElJ8N0Bo+K0twNa5JD6FQd4Ay7vBsB6MnLbyF5z/spQrDq5OXsIdxvhVm/2kZ45mO9l2Gn6XJnkXzp2iH@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiDSAzMxukVrn+wVByl7FThO/eSRVUWkP/iWEJ8V+cWN8wKdb
	1MUBvkqUL0fJqZzt8uBrOLL09Zv8k/IEyntmlU+CLFCnhjOUPRmEGvbD
X-Gm-Gg: Acq92OHynMquGvLZTLxxQCB33ichCzepXtB4XE5Rh56dom2F8tp3COW9YPQmFa7ZPRh
	/qDMMY1KCCko9Py5bK9SW1v+qKarDRe69hWWQJZCcBTnB6vsEe5U/lF6UFZYsh6AhVzVydKvxxY
	XaGXvxhFe/tFVjh57QBGgKyIGDQwY0z9Tdbt5FF/OvZAIbWqh45MsCmuubibgjmcJkzcNouo2TC
	kWyEl/DUTIEB9G7gG3NFdetNDuIM6dokzwfX2xQ6oyQO1trnJ0Uags7BRdfG8KtrGqwXHKha+GA
	jtHn6lVozit6LtyYQYHp0dmbBVvCW+UlwmOa5vY9DDlt4ZbnrYugfDtod9gE6mIIjEZl0fmhYOc
	Jkmfsb6GHz9HzmhZf9Al2pkLjUncEimctI88olk5tFWeOz6YduDPyA3gHo7ugxSu5is9CM6SD/F
	ANUA46pOn3/yMeYD+ekrIMTUAygUzyaIFQqfwOtWR/L75CIyDQ03o7Hk45GBa1bMLtGVeZydKsP
	sn3SFYFqyE/VoVs3Ukn6FcAHVwy5o6CU/Ah6B8kLkuuoBibh7g/40jYcjkG
X-Received: by 2002:a17:903:13c7:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bcfd4ade9emr3925165ad.27.1778521526541;
        Mon, 11 May 2026 10:45:26 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:45:25 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 v8 11/11] iio: adc: hx711: add support for HX710B
Date: Mon, 11 May 2026 23:13:36 +0530
Message-ID: <20260511174342.123820-12-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511174342.123820-1-piyushpatle228@gmail.com>
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the AVIA HX710B ADC, which shares the HX711 GPIO
interface but uses trailing PD_SCK pulses to select the active mode.

Model the HX710B with variant-specific channel tables and IIO info,
track the active channel across conversions, and use the fixed gain
value when computing scale.

Also update the adjacent Kconfig text, file header, and module
description so the driver text matches the newly supported variant.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/Kconfig |   8 +-
 drivers/iio/adc/hx711.c | 187 +++++++++++++++++++++++++++++++++-------
 2 files changed, 161 insertions(+), 34 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a9dedbb8eb46..38ba8cae13f1 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -791,13 +791,15 @@ config HI8435
 	  called hi8435.
 
 config HX711
-	tristate "AVIA HX711 ADC for weight cells"
+	tristate "AVIA HX711 and compatible ADCs"
 	depends on GPIOLIB
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
-	  If you say yes here you get support for AVIA HX711 ADC which is used
-	  for weigh cells
+	  If you say Y here you get support for the following AVIA ADCs:
+	    - HX710B
+	    - HX711
+	  which are used for bridge sensors such as weigh cells.
 
 	  This driver uses two GPIOs, one acts as the clock and controls the
 	  channel selection and gain, the other one is used for the measurement
diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 183568196d52..dc4090e4faeb 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HX711: analog to digital converter for weight sensor module
+ * HX711 and compatible ADCs driver for weigh sensor modules
  *
  * Copyright (c) 2016 Andreas Klinger <ak@it-klinger.de>
  */
@@ -15,6 +15,8 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
+#include <linux/types.h>
+
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 #include <linux/iio/buffer.h>
@@ -84,12 +86,16 @@ static int hx711_get_scale_to_gain(const int *gain_scale, int scale)
  * @channels: channel specification array
  * @num_channels: number of entries in @channels
  * @iio_info: IIO info ops for this variant
+ * @fixed_gain_val: fixed PGA gain (used when @has_fixed_gain is true)
+ * @has_fixed_gain: true if the variant has a fixed ADC gain
  */
 struct hx711_chip_info {
 	const char			*name;
 	const struct iio_chan_spec	*channels __counted_by_ptr(num_channels);
 	unsigned int			num_channels;
 	const struct iio_info		*iio_info;
+	unsigned int			fixed_gain_val;
+	bool				has_fixed_gain;
 };
 
 struct hx711_data {
@@ -99,16 +105,11 @@ struct hx711_data {
 	int			gain_set;	/* gain set on device */
 	int			gain_chan_a;	/* gain for channel A */
 	int			gain_scale[HX711_GAIN_MAX];
+	int			channel_set;	/* HX710B active channel */
 	const struct hx711_chip_info	*chip_info;
 	struct mutex		lock;
-	/*
-	 * triggered buffer
-	 * 2x32-bit channel + 64-bit naturally aligned timestamp
-	 */
-	struct {
-		u32 channel[2];
-		aligned_s64 timestamp;
-	} buffer;
+	/* up to 3x32-bit channels + 64-bit naturally aligned timestamp */
+	IIO_DECLARE_BUFFER_WITH_TS(u32, buffer, 3);
 	/*
 	 * delay after a rising edge on SCK until the data is ready DOUT
 	 * this is dependent on the hx711 where the datasheet tells a
@@ -207,6 +208,7 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
+	const struct hx711_chip_info *info = hx711_data->chip_info;
 	int val;
 
 	val = hx711_wait_for_ready(hx711_data);
@@ -227,8 +229,11 @@ static int hx711_reset(struct hx711_data *hx711_data)
 
 		val = hx711_wait_for_ready(hx711_data);
 
-		/* after a reset the gain is 128 */
-		hx711_data->gain_set = HX711_RESET_GAIN;
+		if (info->has_fixed_gain)
+			hx711_data->channel_set = 0;
+		else
+			/* after a reset the gain is 128 */
+			hx711_data->gain_set = HX711_RESET_GAIN;
 	}
 
 	return val;
@@ -284,9 +289,36 @@ static int hx711_set_hx711_channel(struct hx711_data *hx711_data,
 	return 0;
 }
 
+/*
+ * Switch the HX710B to the requested channel for the next conversion.
+ * chan->address holds the trailing pulse count (Table 3 in datasheet).
+ * channel_set is updated only after both reads succeed.
+ */
+static int hx711_set_hx710b_channel(struct hx711_data *hx711_data,
+				    const struct iio_chan_spec *chan)
+{
+	int ret;
+
+	if (hx711_data->channel_set == chan->channel)
+		return 0;
+
+	ret = hx711_read(hx711_data, chan->address);
+	if (ret < 0)
+		return ret;
+
+	ret = hx711_wait_for_ready(hx711_data);
+	if (ret)
+		return ret;
+
+	hx711_data->channel_set = chan->channel;
+
+	return 0;
+}
+
 static int hx711_reset_read(struct hx711_data *hx711_data,
 			    const struct iio_chan_spec *chan)
 {
+	const struct hx711_chip_info *info = hx711_data->chip_info;
 	int trailing_pulses;
 	int ret;
 
@@ -299,9 +331,16 @@ static int hx711_reset_read(struct hx711_data *hx711_data,
 		return -EIO;
 	}
 
-	ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
-	if (ret < 0)
-		return ret;
+	if (info->has_fixed_gain) {
+		ret = hx711_set_hx710b_channel(hx711_data, chan);
+		if (ret < 0)
+			return ret;
+		trailing_pulses = chan->address;
+	} else {
+		ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
+		if (ret < 0)
+			return ret;
+	}
 
 	return hx711_read(hx711_data, trailing_pulses);
 }
@@ -403,16 +442,16 @@ static irqreturn_t hx711_trigger(int irq, void *p)
 
 	mutex_lock(&hx711_data->lock);
 
-	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
+	memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
 
 	iio_for_each_active_channel(indio_dev, i) {
-		hx711_data->buffer.channel[j] =
+		hx711_data->buffer[j] =
 			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
 		j++;
 	}
 
-	iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer,
-							pf->timestamp);
+	iio_push_to_buffers_with_timestamp(indio_dev, hx711_data->buffer,
+					   pf->timestamp);
 
 	mutex_unlock(&hx711_data->lock);
 
@@ -463,6 +502,10 @@ static const struct iio_info hx711_iio_info = {
 	.attrs			= &hx711_attribute_group,
 };
 
+static const struct iio_info hx710b_iio_info = {
+	.read_raw		= hx711_read_raw,
+};
+
 static const struct iio_chan_spec hx711_chan_spec[] = {
 	{
 		.type = IIO_VOLTAGE,
@@ -495,6 +538,68 @@ static const struct iio_chan_spec hx711_chan_spec[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
+/*
+ * HX710B channels (Table 3 in datasheet).
+ * 25 pulses (1 trailing): differential input, 10 SPS -> channel 0
+ * 26 pulses (2 trailing): DVDD-AVDD supply monitor, 40 SPS -> channel 2
+ * 27 pulses (3 trailing): differential input, 40 SPS -> channel 3
+ * .address stores the trailing pulse count for hx711_set_hx710b_channel().
+ * Channel 2 is used for the supply monitor to avoid aliasing the
+ * channel2 terminal of the first differential pair.
+ */
+static const struct iio_chan_spec hx710b_chan_spec[] = {
+	{
+		.type = IIO_VOLTAGE,
+		.differential = 1,
+		.channel = 0,
+		.channel2 = 1,
+		.indexed = 1,
+		.address = 1,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = 0,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 24,
+			.storagebits = 32,
+			.endianness = IIO_CPU,
+		},
+	},
+	{
+		.type = IIO_VOLTAGE,
+		.channel = 2,
+		.indexed = 1,
+		.address = 2,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = 1,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 24,
+			.storagebits = 32,
+			.endianness = IIO_CPU,
+		},
+	},
+	{
+		.type = IIO_VOLTAGE,
+		.differential = 1,
+		.channel = 3,
+		.channel2 = 4,
+		.indexed = 1,
+		.address = 3,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = 2,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 24,
+			.storagebits = 32,
+			.endianness = IIO_CPU,
+		},
+	},
+	IIO_CHAN_SOFT_TIMESTAMP(3),
+};
+
 static const struct hx711_chip_info hx711_chip = {
 	.name		= "hx711",
 	.channels	= hx711_chan_spec,
@@ -502,6 +607,15 @@ static const struct hx711_chip_info hx711_chip = {
 	.num_channels	= ARRAY_SIZE(hx711_chan_spec),
 };
 
+static const struct hx711_chip_info hx710b_chip = {
+	.name		= "hx710b",
+	.channels	= hx710b_chan_spec,
+	.iio_info	= &hx710b_iio_info,
+	.num_channels	= ARRAY_SIZE(hx710b_chan_spec),
+	.fixed_gain_val	= 128,
+	.has_fixed_gain	= true,
+};
+
 static int hx711_probe(struct platform_device *pdev)
 {
 	const struct hx711_chip_info *chip_info;
@@ -544,32 +658,42 @@ static int hx711_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hx711_data->gpiod_dout),
 				     "failed to get dout-gpiod\n");
 
-	ret = devm_regulator_get_enable_read_voltage(dev, "avdd");
+	if (chip_info->has_fixed_gain)
+		ret = devm_regulator_get_enable_read_voltage(dev, "vref");
+	else
+		ret = devm_regulator_get_enable_read_voltage(dev, "avdd");
 	if (ret < 0)
 		return ret;
 
 	/*
-	 * with
-	 * full scale differential input range: AVDD / GAIN
+	 * With
+	 * full scale differential input range: reference / GAIN
 	 * full scale output data: 2^24
 	 * we can say:
-	 *     AVDD / GAIN = 2^24
+	 *     reference / GAIN = 2^24
 	 * therefore:
-	 *     1 LSB = AVDD / GAIN / 2^24
-	 * AVDD is in uV, but we need 10^-9 mV
+	 *     1 LSB = reference / GAIN / 2^24
+	 * reference is in uV, but we need 10^-9 mV
 	 * approximately to fit into a 32 bit number:
-	 * 1 LSB = (AVDD * 100) / GAIN / 1678 [10^-9 mV]
+	 * 1 LSB = (reference * 100) / GAIN / 1678 [10^-9 mV]
 	 */
 
 	/* we need 10^-9 mV */
 	ret *= 100;
 
-	for (i = 0; i < HX711_GAIN_MAX; i++)
-		hx711_data->gain_scale[i] =
-			ret / hx711_gain_to_scale[i].gain / 1678;
+	if (chip_info->has_fixed_gain) {
+		for (i = 0; i < HX711_GAIN_MAX; i++)
+			hx711_data->gain_scale[i] =
+				ret / chip_info->fixed_gain_val / 1678;
+		hx711_data->gain_set = chip_info->fixed_gain_val;
+	} else {
+		for (i = 0; i < HX711_GAIN_MAX; i++)
+			hx711_data->gain_scale[i] =
+				ret / hx711_gain_to_scale[i].gain / 1678;
 
-	hx711_data->gain_set = 128;
-	hx711_data->gain_chan_a = 128;
+		hx711_data->gain_set = 128;
+		hx711_data->gain_chan_a = 128;
+	}
 
 	hx711_data->clock_frequency = 400000;
 	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
@@ -608,6 +732,7 @@ static int hx711_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id of_hx711_match[] = {
+	{ .compatible = "avia,hx710b", .data = &hx710b_chip },
 	{ .compatible = "avia,hx711", .data = &hx711_chip },
 	{ }
 };
@@ -625,7 +750,7 @@ static struct platform_driver hx711_driver = {
 module_platform_driver(hx711_driver);
 
 MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
-MODULE_DESCRIPTION("HX711 bitbanging driver - ADC for weight cells");
+MODULE_DESCRIPTION("HX711 and compatible bitbanging ADC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:hx711-gpio");
 
-- 
2.43.0

