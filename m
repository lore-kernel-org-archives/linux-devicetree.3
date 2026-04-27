Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63463B47FA
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284676; cv=none; b=uRb/TwDOjXzEXRAtZfJ6JpuMGSpG131GbKY2dkqlLbQvvDDWlB9MzlfCswgks2SI/4/yHlCm3GgdbFc96zMRrEVs7600x0r8KG82+bzLah1Cymki4Di7PRd6q24dUftDrUo6OUrHxG5JXAoGPDV7n5Cu8kLT9ZogdQMIBDWjc0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284676; c=relaxed/simple;
	bh=Vq16/WUDJf9Q3aD6g2FZKj7xBHFR28TTRlkMvr4p9ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9hXjxWOoZeN8CejDhk97j3tZQJshajMDsNDLNSTI7epdOf8KrqAdY9Y7jQW//zQSOXa3xsbi1+2NalWeIZxxg3/lcRD/Ar6RnXgCHfzHCrxUTnpJLLU72fE/O/8OStFo8izqXFQGexOFlNWbK0MXBJqkgLv19feng6oW56JnWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clPx8DDo; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clPx8DDo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8296d553142so5490269b3a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284674; x=1777889474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z8BUX9VRr6axcG7TGELb+TV5DxSfrOFBihk/7IlPKE=;
        b=clPx8DDoWUoxUHekezSx3IGtYhrEr5Yn76/W5kqdJTG0Yz6oQ/kzaoa9erZmN2zY4v
         jB2XsUJ3Df8dsfRDJV0Li8SaEyDGRA0bjBCc2me1aYOgu3Elsp82yCYT1yEazknIE3J7
         sOWNdWyNVl3E41Si/BwQHYCYYp6l8JyjdrtQFjFIoQR7o3AjQzRHn8VWHv43OyX6IQQP
         5otf5eCo2tpLXvmmeQ5UeXGXHkMonzKB/xT3rwLeKsMpySwEtaa2gQAEBv8M/7BIgN8i
         EEbE6ywRN7yUVSujpJ+1JSnsFMc3zuPE1JTl6pkMpsvbHDy92vvdVpj44bw9/HxlIPfM
         LdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284674; x=1777889474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Z8BUX9VRr6axcG7TGELb+TV5DxSfrOFBihk/7IlPKE=;
        b=QEu49H/GSDAOUMwjujLsIAy28vOpfQMiKgrl0U32IELpAzzU411IV7FkvTLPXqv3Iv
         r3dZoUAYZi+na9YJwlTt88fjJ+5ORfLLspF0MGT/+Z4rf2NXvjIBlwT0NqvGdPgNV9pe
         Y3GEPCTlnDpMG5lKDTWA7oJo/IOT+LkHxFy+WJa4okuEKZ4YOyrUz8KM44MNKtKNbYGK
         fpb0sRDjF9sgmqT748/1MU2ktYg2QBVJRl4+Dpuf+PYRgfTqa953WfVIp1iNQLHRssWE
         qnlB27zxd45aakJ9eruTNfazrhLw4vY5oRdehALP9tAPwlYlbl4QmEJhDCD/itFaMffF
         bbow==
X-Forwarded-Encrypted: i=1; AFNElJ9xFn3KSWGLSjNAihEUleJNvN78LDtPX/HRY/bWrlh//GMO0P72h70WfBuyU0ZWLhEe/QEZlXYRn7LP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6kzgxIEHqbL09hmytYyNkKcvNk4ExjyfPzdANZAKcJPwODkj
	PCIuVrA9HAzmw73tdNMJ8bpYPHfSokF/n4kLlBEVN40CDK3zVsocpi74
X-Gm-Gg: AeBDiesNAy8tllIKOOWu2y/C4CYWv1HL6GfWZ6Q1dNQu4rA7gqI9kJOX78c6Zmj/6RB
	ie95Yvg852nM7ytqYD51flaY/IheYGtI9/sEjpzZta0zKin5cNUhV9n5VjYhTqa5jKNGDoKtg8g
	rWhIuN+uwuZCsyJUwmAN7f5vkYYhRe6laJx4zoTLbGbe+885XYjsPF7Gv+6xm20bDTPXdSX0/3h
	pz9gEDWBQ49dBUG9rB1mw8MqpONA5Kgl7rR96cOK4WypImB7BU4kJcD5SPvT+2YsFUbft85yYkq
	ZtymtEud+pjFf3JT59y9uXNP4EWJSEqawE06HXhJVXSIehLa61Urwf49DFw1lQmuRIiUlrj0as3
	nEArB069+0xbwbtLyM7RG3CziKnySURkMwAT1yHIIz/3FgE1T1fATvQIhylcGup7QDX+Y1vE0dS
	2dDv+eCkPCUldD6PaCfsKOxWndidA+2W1pjwzHTLsVL08GS9BHgErLzYj1sgjG0vf6Wv1/rqfVl
	8r/68C1nKtYPpgCv7HgazU2b4pKNnvb2ilxgiYmOPl+keXXng==
X-Received: by 2002:a05:6a00:27a8:b0:81a:b602:daf6 with SMTP id d2e1a72fcca58-82f8c9213a4mr42442600b3a.48.1777284674086;
        Mon, 27 Apr 2026 03:11:14 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:e577:22da:dc9:7f6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39534225b3a.38.2026.04.27.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:11:13 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] iio: adc: hx711: add support for HX710B
Date: Mon, 27 Apr 2026 15:39:38 +0530
Message-ID: <20260427100950.33936-8-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427100950.33936-1-piyushpatle228@gmail.com>
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the AVIA HX710B ADC, which shares the HX711 GPIO
interface but has a fixed gain of 128 and uses trailing PD_SCK pulses
to select the active channel rather than the gain.

The HX710B has three operating modes controlled by the trailing pulse
count after the 24 data bits (Table 3 in the HX710B datasheet):
  25 pulses (1 trailing): differential input at 10 SPS
  26 pulses (2 trailing): DVDD-AVDD supply monitor at 40 SPS
  27 pulses (3 trailing): differential input at 40 SPS

Model the HX710B with its own hx710b_chan_spec[] and hx710b_iio_info.
Store the trailing pulse count in chan->address so hx710b_set_channel()
can switch channels without a separate lookup table. The supply monitor
uses .channel = 2 to avoid aliasing the channel2 terminal (index 1) of
the differential pair.

The HX710B has a dedicated VREF pin for the ADC reference voltage. The
driver tries vref-supply first; if absent it falls back to avdd-supply
(for boards where VREF is tied to AVDD). The HX711 uses AVDD as its
reference and is unaffected.

Add fixed_gain and fixed_gain_val fields to hx711_chip_info to carry the
gain into the scale calculation. Store a per-instance scale in
hx711_data for HX710B and use it in hx711_read_raw() when fixed_gain is
set. Update hx711_reset() to reset channel_set on HX710B after a
power-down cycle.

Enlarge the trigger buffer from 2 to 3 channels plus a pad word to keep
the timestamp naturally aligned; HX711 continues to use only the first
two slots.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v4:
- Add a third HX710B channel (27 pulses, differential 40 SPS) based on
  Table 3 of the HX710B datasheet.
- Use .channel = 2 for the supply monitor channel to avoid aliasing the
  .channel2 = 1 terminal of the first differential pair.
- Add vref-supply probe path for the HX710B VREF reference pin; fall
  back to avdd-supply when vref-supply is absent.
- Add NULL guard on device_get_match_data() in the chip_info
  introduction patch; kept here as documentation that the guard exists.
- Keep hx711_chip_info fields in the final order introduced by the
  chip_info patch; this patch appends fixed_gain_val and fixed_gain
  without reordering existing fields.
- Move channel_set and scale fields to hx711_data (per-instance).
- Update channel_set only after both hx711_read() and
  hx711_wait_for_ready() succeed.
- Keep a single HX710B scale derived from the fixed gain of 128.

Changes in v3:
- Add HX710B support on top of the separate hx711_chip_info refactor.
- Update channel_set only after hx711_read() and hx711_wait_for_ready()
  both succeed.
- Keep a single HX710B fixed-gain scale based on the datasheet's fixed
  PGA gain of 128; do not apply the HX711 channel-B gain of 32 to the
  HX710B supply monitor path.
- Use unsigned int for channel state and fixed-gain scale storage.
- Keep HX710B trailing pulse counts in chan->address.
- Describe HX710B channel 0 as a differential IIO channel.
- Reorder hx711_chip_info fields based on pahole output so the
  structure has no internal holes.

Changes in v2:
- Fix pulse count bug: HX710B values were {25, 26} total SCK cycles;
  corrected to {1, 2} trailing pulses because hx711_read() already
  clocks the 24 data bits.
- Add .differential = 1 and .channel2 = 1 to HX710B channel 0.
- Move trailing pulse counts from a separate array to chan->address.
- Replace chan_pulse_count tests with a dedicated fixed_gain flag.
- Add fixed_gain_val to hx711_chip_info.
- Add the iio_info pointer to hx711_chip_info and assign
  indio_dev->info from chip_info.
- Remove the NULL check after device_get_match_data().
- Remove reset_channel from hx711_chip_info.
- Change hx711_reset_read() and hx710b_set_channel() to take
  const struct iio_chan_spec *.
- Revert unrelated hx711_data struct member alignment noise.
- Sort of_device_id entries alphabetically.
- Expand the commit message to explain HX711 versus HX710B trailing
  pulse behaviour.
- Restore the file header to mention weight sensor modules.
---
 drivers/iio/adc/Kconfig |   1 +
 drivers/iio/adc/hx711.c | 189 ++++++++++++++++++++++++++++++++++------
 2 files changed, 164 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f18692aea795..09a1b29fbd9c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -790,6 +790,7 @@ config HX711
 	select IIO_TRIGGERED_BUFFER
 	help
 	  If you say Y here you get support for the following AVIA ADCs:
+	    - HX710B
 	    - HX711
 	  which are used for bridge sensors such as weigh cells.
 
diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index dc6703ead8a0..41b9beb6d787 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -78,16 +78,20 @@ static int hx711_get_scale_to_gain(const int *gain_scale, int scale)
 
 /**
  * struct hx711_chip_info - per-variant static configuration
- * @name:         IIO device name
- * @channels:     channel specification array
- * @iio_info:     IIO info ops for this variant
- * @num_channels: number of entries in @channels
+ * @name:          IIO device name
+ * @channels:      channel specification array
+ * @iio_info:      IIO info ops for this variant
+ * @num_channels:  number of entries in @channels
+ * @fixed_gain_val: fixed PGA gain (used when @fixed_gain is true)
+ * @fixed_gain:    true if the variant has a fixed ADC gain (e.g. HX710B)
  */
 struct hx711_chip_info {
 	const char			*name;
 	const struct iio_chan_spec	*channels;
 	const struct iio_info		*iio_info;
 	unsigned int			num_channels;
+	unsigned int			fixed_gain_val;
+	bool				fixed_gain;
 };
 
 struct hx711_data {
@@ -97,14 +101,17 @@ struct hx711_data {
 	int			gain_set;	/* gain set on device */
 	int			gain_chan_a;	/* gain for channel A */
 	int			gain_scale[HX711_GAIN_MAX];
+	unsigned int		channel_set;	/* HX710B active channel */
 	const struct hx711_chip_info	*chip_info;
+	unsigned int		scale;		/* HX710B fixed-gain scale */
 	struct mutex		lock;
 	/*
 	 * triggered buffer
-	 * 2x32-bit channel + 64-bit naturally aligned timestamp
+	 * up to 3x32-bit channels + pad + 64-bit naturally aligned timestamp
 	 */
 	struct {
-		u32 channel[2];
+		u32 channel[3];
+		u32 pad;
 		aligned_s64 timestamp;
 	} buffer;
 	/*
@@ -204,6 +211,7 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
+	const struct hx711_chip_info *info = hx711_data->chip_info;
 	int val = hx711_wait_for_ready(hx711_data);
 
 	if (val) {
@@ -222,8 +230,11 @@ static int hx711_reset(struct hx711_data *hx711_data)
 
 		val = hx711_wait_for_ready(hx711_data);
 
-		/* after a reset the gain is 128 */
-		hx711_data->gain_set = HX711_RESET_GAIN;
+		if (info->fixed_gain)
+			hx711_data->channel_set = 0;
+		else
+			/* after a reset the gain is 128 */
+			hx711_data->gain_set = HX711_RESET_GAIN;
 	}
 
 	return val;
@@ -264,9 +275,36 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 	return 0;
 }
 
+/*
+ * Switch the HX710B to the requested channel for the next conversion.
+ * chan->address holds the trailing pulse count (Table 3 in datasheet).
+ * channel_set is updated only after both reads succeed.
+ */
+static int hx710b_set_channel(struct hx711_data *hx711_data,
+			      const struct iio_chan_spec *chan)
+{
+	int ret;
+
+	if (hx711_data->channel_set == (unsigned int)chan->channel)
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
 	unsigned int trailing_pulses;
 	int ret;
 
@@ -279,11 +317,18 @@ static int hx711_reset_read(struct hx711_data *hx711_data,
 		return -EIO;
 	}
 
-	ret = hx711_set_gain_for_channel(hx711_data, chan->channel);
-	if (ret < 0)
-		return ret;
+	if (info->fixed_gain) {
+		ret = hx710b_set_channel(hx711_data, chan);
+		if (ret < 0)
+			return ret;
+		trailing_pulses = chan->address;
+	} else {
+		ret = hx711_set_gain_for_channel(hx711_data, chan->channel);
+		if (ret < 0)
+			return ret;
+		trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
+	}
 
-	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
 	return hx711_read(hx711_data, trailing_pulses);
 }
 
@@ -292,6 +337,7 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 				int *val, int *val2, long mask)
 {
 	struct hx711_data *hx711_data = iio_priv(indio_dev);
+	const struct hx711_chip_info *info = hx711_data->chip_info;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -308,8 +354,11 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 		*val = 0;
 		mutex_lock(&hx711_data->lock);
 
-		*val2 = hx711_get_gain_to_scale(hx711_data->gain_scale,
-						hx711_data->gain_set);
+		if (info->fixed_gain)
+			*val2 = hx711_data->scale;
+		else
+			*val2 = hx711_get_gain_to_scale(hx711_data->gain_scale,
+							hx711_data->gain_set);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -445,6 +494,10 @@ static const struct iio_info hx711_iio_info = {
 	.attrs			= &hx711_attribute_group,
 };
 
+static const struct iio_info hx710b_iio_info = {
+	.read_raw		= hx711_read_raw,
+};
+
 static const struct iio_chan_spec hx711_chan_spec[] = {
 	{
 		.type = IIO_VOLTAGE,
@@ -477,6 +530,68 @@ static const struct iio_chan_spec hx711_chan_spec[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
+/*
+ * HX710B channels (Table 3 in datasheet).
+ * 25 pulses (1 trailing): differential input, 10 SPS  -> channel 0
+ * 26 pulses (2 trailing): DVDD-AVDD supply monitor, 40 SPS -> channel 2
+ * 27 pulses (3 trailing): differential input, 40 SPS  -> channel 3
+ * .address stores the trailing pulse count for hx710b_set_channel().
+ * Channel 2 is used for the supply monitor to avoid aliasing the
+ * channel2 terminal (index 1) of the differential pair.
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
@@ -484,6 +599,15 @@ static const struct hx711_chip_info hx711_chip = {
 	.num_channels	= ARRAY_SIZE(hx711_chan_spec),
 };
 
+static const struct hx711_chip_info hx710b_chip = {
+	.name		= "hx710b",
+	.channels	= hx710b_chan_spec,
+	.iio_info	= &hx710b_iio_info,
+	.num_channels	= ARRAY_SIZE(hx710b_chan_spec),
+	.fixed_gain	= true,
+	.fixed_gain_val	= 128,
+};
+
 static int hx711_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -525,32 +649,44 @@ static int hx711_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hx711_data->gpiod_dout),
 				     "failed to get dout-gpiod\n");
 
-	ret = devm_regulator_get_enable_read_voltage(dev, "avdd");
+	/*
+	 * The HX710B uses the VREF pin as the ADC reference; try vref-supply
+	 * first and fall back to avdd-supply when VREF is tied to AVDD on the
+	 * board.  The HX711 uses AVDD as its reference.
+	 */
+	if (chip_info->fixed_gain)
+		ret = devm_regulator_get_enable_read_voltage(dev, "vref");
+	if (!chip_info->fixed_gain || ret == -ENODEV)
+		ret = devm_regulator_get_enable_read_voltage(dev, "avdd");
 	if (ret < 0)
 		return ret;
 
 	/*
 	 * with
-	 * full scale differential input range: AVDD / GAIN
+	 * full scale differential input range: VREF / GAIN
 	 * full scale output data: 2^24
 	 * we can say:
-	 *     AVDD / GAIN = 2^24
+	 *     VREF / GAIN = 2^24
 	 * therefore:
-	 *     1 LSB = AVDD / GAIN / 2^24
-	 * AVDD is in uV, but we need 10^-9 mV
+	 *     1 LSB = VREF / GAIN / 2^24
+	 * VREF is in uV, but we need 10^-9 mV
 	 * approximately to fit into a 32 bit number:
-	 * 1 LSB = (AVDD * 100) / GAIN / 1678 [10^-9 mV]
+	 * 1 LSB = (VREF * 100) / GAIN / 1678 [10^-9 mV]
 	 */
 
 	/* we need 10^-9 mV */
 	ret *= 100;
 
-	for (i = 0; i < HX711_GAIN_MAX; i++)
-		hx711_data->gain_scale[i] =
-			ret / hx711_gain_to_scale[i].gain / 1678;
+	if (chip_info->fixed_gain) {
+		hx711_data->scale = ret / chip_info->fixed_gain_val / 1678;
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
@@ -589,7 +725,8 @@ static int hx711_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id of_hx711_match[] = {
-	{ .compatible = "avia,hx711", .data = &hx711_chip },
+	{ .compatible = "avia,hx710b", .data = &hx710b_chip },
+	{ .compatible = "avia,hx711",  .data = &hx711_chip  },
 	{ }
 };
 
-- 
2.43.0

