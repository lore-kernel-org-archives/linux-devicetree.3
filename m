Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0C3E63AF
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706360; cv=none; b=T7cDHeuxwH45tY95E0PGZlPiMUw7obQd6wuxOWd6ZwZRDwpdOUdugoe/eNCBeYeHux8d44hDOuF5O5n5Btd8wOeSbtOWNdE/aBvzCPPwK++Hgk1noaiDW5ku1wJS/yXB3m8VRhdMuzgCRW//LQm8jISTqY8ZWDxMp96xbY9ENOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706360; c=relaxed/simple;
	bh=h1Mu+c5aWlZ4TVI2ZMCzad4dYzEVAsJI0Beg+oLCU1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEtDa7ONYL2WbbBDnQVEuW1DC6WA6IwY+Xp+OEhj5ffGIWWpaUNcioIiZbMdBWv/NT4HY02sDU94uc4YBdKtk/AZtNCBTI7KJy+wUKesr+7h19nfpi56DKTW5bkhq/jYhunyVKCSupGvcvPVCNqfMxs/0g3sT1uVb+ruiVTfiDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIkj2Ljf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIkj2Ljf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36abfe17c11so1284741a91.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706354; x=1780311154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBT7ivZhN63Crud550Vz1jsL4y5b4w8SONDK6zwOrRo=;
        b=UIkj2LjfGrDOXoQD2c4zcjQSnK2NIyIeuBKzV8lxu8InZ4ENRJJsvGE86YpMm1wNr9
         NQzQ4EYZPo+Vp8fiiuAlIrcezJ0WsXpiGpLyiTIwJDiCjSiKOyxhOVGxw6T0kBmVbP2N
         ngZmM3KTnKBb7/oEFi0aRwNaqYteVFjKgyGZPQX0f7ku5HA7G9vgk8S1+3wOU3mTbLxS
         67AeRdJ0+hybGc4u6IV4OwbaAkQY7q8yh8pfB+v3jQHWWECfhcLlRhf3eb14AgaJK61r
         PUBo1Qhj9G4JGeGqMlEa+JgIwuvdeQ+XgV9SKAnyfdpontGYagUdYVuRWoB6GZeF7CVC
         QQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706354; x=1780311154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBT7ivZhN63Crud550Vz1jsL4y5b4w8SONDK6zwOrRo=;
        b=UK0ijt3A/EBvyp7ujZYYL81GfDhm3QWLI5tS2WDUlu46t8on3pwbUg0+qOoEZmhmo8
         oN8ThWwateXfVkadTHZ/6rdnynoepR1nvrqishfYBCcp8s01tLutIVE/pf+pm4C8ZwyO
         4TNUiyncMGgNL6I0seM8hNh8nrMRgn0tud78E2H7+uP6OWXdsh5WUrTy6vOdWtToG/B4
         s/0g7nhyWiX3kEO7Ho43Dyl10sUaVIBxkuvrGjXX/ksNQjHrks+6FxYoQ7AJg2+H+tXj
         Xs7nFD39olDE0rjzVmbs/c5nhLyMHNP66uhr9Q5e9YVBzgblpGznaA2ao4BBRS/WZ9K6
         Y4SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wGpldYpzJU3+Iynp8TlSoVTrrcRTK5u3ontTBwKZxkU3spgsI0TP0nuTXeOS3xR5fXcHBf4ah4Pv2@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYh2E9JErUJlJcmvtyM84Kt0NDkr8P3vzhFJQhXtS9adhmVUf
	nGyPuN5tnPo1OcBOeghzqFDK+RGBUlYayqiSoK9nyb2gAoFqPJQEi3jh
X-Gm-Gg: Acq92OEzQUbDNkkxISP3/nXEavZwwaWyUfWwGfgFssL9tVd30zAbjMmyZmZn9f+MNYs
	U5aGGTBSFREw+cU8/r+MI097mTO7vGqwfs0hUjJqkYHHw+YHtK4Psy8PBuEbUueRnITHkxNBTc2
	98WbN1TNNbwBsq9+fuvGXuIUMfu8LabSEa7b8kT4PPGnghNKVJSTw97VMRw7UqF3Ian05VbM4s0
	Ekr1EFGHkyNn5W4dS9xNU94cnBaKZdpXDTLBvF16kqIHe+74uoOUgTvbm8iMlarudJJttT+dT/J
	hrA1u5BGTTTxFO/EhK0JRyuKcPhsWcqjzWzUmo9tzENOqHnQGEZTK4AWMFDy2iDmXYAvwxukpUP
	MlwYf3TTb5U719FU17Ux6ag7RRMjQAaOBJ1dAKCq2qI849BVtOlt8dESkbahznBRAhiSFI5skiX
	I08MsUpADNdxIYC/30tp4Ug1778MclFmjtwhn9TJDiC+dthh9OjZCeFJ+05rc7NU1nOg8JTrADr
	0rcIugoMoMfJpZRuTp+9GzrvvLdGFvqOzzKXIjA+iGKwS17qZOX
X-Received: by 2002:a17:90b:5284:b0:35f:b7f5:9b3 with SMTP id 98e67ed59e1d1-36a67420e95mr12704820a91.3.1779706354231;
        Mon, 25 May 2026 03:52:34 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:52:31 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v10 11/11] iio: adc: hx711: add support for HX710B
Date: Mon, 25 May 2026 16:21:27 +0530
Message-ID: <20260525105127.180156-12-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525105127.180156-1-piyushpatle228@gmail.com>
References: <20260525105127.180156-1-piyushpatle228@gmail.com>
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
 drivers/iio/adc/hx711.c | 230 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 212 insertions(+), 26 deletions(-)

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
index fde95758b9a0..32a35f644834 100644
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
@@ -99,6 +105,8 @@ struct hx711_data {
 	int			gain_set;	/* gain set on device */
 	int			gain_chan_a;	/* gain for channel A */
 	int			gain_scale[HX711_GAIN_MAX];
+	int			channel_set;	/* HX710B active channel */
+	unsigned int		samp_freq;	/* HX710B differential channel sample rate */
 	const struct hx711_chip_info	*chip_info;
 	struct mutex		lock;
 	/*
@@ -207,6 +215,7 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
+	const struct hx711_chip_info *info = hx711_data->chip_info;
 	int val;
 
 	val = hx711_wait_for_ready(hx711_data);
@@ -226,8 +235,11 @@ static int hx711_reset(struct hx711_data *hx711_data)
 
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
@@ -283,9 +295,51 @@ static int hx711_set_hx711_channel(struct hx711_data *hx711_data,
 	return 0;
 }
 
+/*
+ * Return the trailing pulse count for an HX710B channel (Table 3 in
+ * the datasheet).  The supply-monitor channel always uses 2 trailing
+ * pulses; the differential channel uses 1 (10 SPS) or 3 (40 SPS).
+ */
+static int hx710b_trailing_pulses(const struct hx711_data *hx711_data,
+				  const struct iio_chan_spec *chan)
+{
+	if (!chan->differential)
+		return 2;
+	return hx711_data->samp_freq == 10 ? 1 : 3;
+}
+
+/*
+ * Switch the HX710B to the requested channel for the next conversion.
+ * channel_set tracks the trailing pulse count that was last sent to the
+ * chip; it is updated immediately after hx711_read() commits the new
+ * mode in hardware, before waiting for the chip to be ready again.
+ */
+static int hx711_set_hx710b_channel(struct hx711_data *hx711_data,
+				    const struct iio_chan_spec *chan)
+{
+	int trailing_pulses = hx710b_trailing_pulses(hx711_data, chan);
+	int ret;
+
+	if (hx711_data->channel_set == trailing_pulses)
+		return 0;
+
+	ret = hx711_read(hx711_data, trailing_pulses);
+	if (ret < 0)
+		return ret;
+
+	hx711_data->channel_set = trailing_pulses;
+
+	ret = hx711_wait_for_ready(hx711_data);
+	if (ret)
+		return ret;
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
 
@@ -298,9 +352,16 @@ static int hx711_reset_read(struct hx711_data *hx711_data,
 		return -EIO;
 	}
 
-	ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
-	if (ret < 0)
-		return ret;
+	if (info->has_fixed_gain) {
+		ret = hx711_set_hx710b_channel(hx711_data, chan);
+		if (ret < 0)
+			return ret;
+		trailing_pulses = hx710b_trailing_pulses(hx711_data, chan);
+	} else {
+		ret = hx711_set_hx711_channel(hx711_data, chan, &trailing_pulses);
+		if (ret < 0)
+			return ret;
+	}
 
 	return hx711_read(hx711_data, trailing_pulses);
 }
@@ -322,6 +383,9 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 		if (*val < 0)
 			return *val;
 		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*val = hx711_data->samp_freq;
+		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
 		*val = 0;
 		mutex_lock(&hx711_data->lock);
@@ -399,20 +463,26 @@ static irqreturn_t hx711_trigger(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct hx711_data *hx711_data = iio_priv(indio_dev);
 	int i, j = 0;
+	int ret;
 
 	mutex_lock(&hx711_data->lock);
 
 	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
 
 	iio_for_each_active_channel(indio_dev, i) {
-		hx711_data->buffer.channel[j] =
-			hx711_reset_read(hx711_data, &indio_dev->channels[i]);
-		j++;
+		ret = hx711_reset_read(hx711_data, &indio_dev->channels[i]);
+		if (ret < 0) {
+			dev_err_ratelimited(hx711_data->dev,
+					    "read failed: %d\n", ret);
+			goto out_unlock;
+		}
+		hx711_data->buffer.channel[j++] = ret;
 	}
 
 	iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer,
-							pf->timestamp);
+					   pf->timestamp);
 
+out_unlock:
 	mutex_unlock(&hx711_data->lock);
 
 	iio_trigger_notify_done(indio_dev->trig);
@@ -462,6 +532,54 @@ static const struct iio_info hx711_iio_info = {
 	.attrs			= &hx711_attribute_group,
 };
 
+static const int hx710b_samp_freq_avail[] = { 10, 40 };
+
+static int hx710b_read_avail(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     const int **vals, int *type, int *length,
+			     long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*vals = hx710b_samp_freq_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(hx710b_samp_freq_avail);
+		return IIO_AVAIL_LIST;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int hx710b_write_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int val, int val2, long mask)
+{
+	struct hx711_data *hx711_data = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		if (val != 10 && val != 40)
+			return -EINVAL;
+		ret = iio_device_claim_direct_mode(indio_dev);
+		if (ret)
+			return ret;
+		mutex_lock(&hx711_data->lock);
+		hx711_data->samp_freq = val;
+		mutex_unlock(&hx711_data->lock);
+		iio_device_release_direct_mode(indio_dev);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info hx710b_iio_info = {
+	.read_raw		= hx711_read_raw,
+	.write_raw		= hx710b_write_raw,
+	.read_avail		= hx710b_read_avail,
+};
+
 static const struct iio_chan_spec hx711_chan_spec[] = {
 	{
 		.type = IIO_VOLTAGE,
@@ -494,6 +612,51 @@ static const struct iio_chan_spec hx711_chan_spec[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
+/*
+ * HX710B channels (Table 3 in datasheet).
+ * 25 pulses (1 trailing): differential input, 10 SPS
+ * 26 pulses (2 trailing): DVDD-AVDD supply monitor, 40 SPS
+ * 27 pulses (3 trailing): differential input, 40 SPS
+ * Channel 0 exposes both differential rates via IIO_CHAN_INFO_SAMP_FREQ.
+ * Channel 2 is used for the supply monitor to avoid aliasing the
+ * channel2 terminal of the differential pair.
+ */
+static const struct iio_chan_spec hx710b_chan_spec[] = {
+	{
+		.type = IIO_VOLTAGE,
+		.differential = 1,
+		.channel = 0,
+		.channel2 = 1,
+		.indexed = 1,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE) |
+				      BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),
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
+	IIO_CHAN_SOFT_TIMESTAMP(2),
+};
+
 static const struct hx711_chip_info hx711_chip = {
 	.name		= "hx711",
 	.channels	= hx711_chan_spec,
@@ -501,6 +664,15 @@ static const struct hx711_chip_info hx711_chip = {
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
@@ -543,32 +715,43 @@ static int hx711_probe(struct platform_device *pdev)
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
+		hx711_data->samp_freq = 10;
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
@@ -607,6 +790,7 @@ static int hx711_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id of_hx711_match[] = {
+	{ .compatible = "avia,hx710b", .data = &hx710b_chip },
 	{ .compatible = "avia,hx711", .data = &hx711_chip },
 	{ }
 };
@@ -624,7 +808,7 @@ static struct platform_driver hx711_driver = {
 module_platform_driver(hx711_driver);
 
 MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
-MODULE_DESCRIPTION("HX711 bitbanging driver - ADC for weight cells");
+MODULE_DESCRIPTION("HX711 and similar bitbanging ADC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:hx711-gpio");
 
-- 
2.43.0

