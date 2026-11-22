Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334903;
	b=jzysZDFqiYp8sXDjK3daYHarUFgC19xQsXhatg1z6D1KIS3u0AZrFWyxtOibwTwfP/3i
	 i0+l6JBiWbqaUVDC4N3pXK7bcypPYazHcbbCbxtEQj02j9t2fVmkXGehMAZsU5QTrHXJc
	 ez2zdeiiRm8LJwiAzUFlbrxTUM4o3PYi1OyStJuNVZn56bqQI8WYrpXAMWprSz3HLuzRa
	 T8aI9LclLlqXkSSWr7yXmBX9vBh6COanRP9x40mm7WwidnCu4+GX8/+BoxmesUvq/TT4F
	 pdAIkdYHKty5jWRVsdwuR0a6xWRFKpNuL8NudUcY5xr0sokX01zD03dfCBiL+sTJTmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O06D4Zfs7vfSLh8PDH8PDPdQDNuxiM9mrjreZlZ3/Gg=;
	b=j/FRCj+kENW3wUQlRWRcZp521nJgUej1IaBbkDjmb2V2fsrYun6QobrWv2wfIBYmJbC6
	 5TD8MnnN3NUmIXve8ujY5lQCxs+iZKTGfdY+A0UBoYV7/QQ5ueSkNgrhdOTdSP3weFGoM
	 7j1i5mxrct/0DHXWq1N1r1yt7U3onPixPOBaqcu9TgAoMKz580wAaoyqovFujJtH2Gp2e
	 edg7e0Vo2kYh5mvYV99y+azofrtWAPcenUSM5mBv8/gAoTZx6QPZ/woGFe3cTlTxYKDsN
	 6UK0T5hobExPmnFI2iYcqVd5bRyRx0gCPSJ6FBcewFZxPskfpeBwUWQiLRlBmIOp5Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOxrpoJ1;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60A606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A60A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOxrpoJ1
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3320339a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334902; x=1795939702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O06D4Zfs7vfSLh8PDH8PDPdQDNuxiM9mrjreZlZ3/Gg=;
        b=xOxrpoJ16/Hfjq6rsYcZ+ShoIamvGUCfTg2V9v/ntco7oUHIMGqFwITL83iD0aMAi7
         C6qrrWn3Mh5vw78ZQYhzKghym8+mlYod8u80bs3xyt4n5425BUXpowmBHYqd9lkE0Y6s
         xZZ8n1ax+4TH7JFELxEZEQNUPVguyWPOmvgLhD9wDP5LtJooSRY/GkhrVkYIOLcxdqLR
         VC3Plgzn7fJ0HeG7j2b2j+piAk4OO6SfNKBtl/c75MENOk7PeeBDw3t9ufT11kYFdpJ+
         8R19EA53XMqhzidWDkPi0JyEap2rD6Sx/bKz1oPhrUQqSoH4jcieZbS8is5Gk4NKP9Hw
         aEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334902; x=1795939702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O06D4Zfs7vfSLh8PDH8PDPdQDNuxiM9mrjreZlZ3/Gg=;
        b=0prhtn2F/LhGp5j4y6qkV5mrwZUaP2OAl4QR9GCa2K9bk+/B3GMCrcPyapeBa933lB
         vWfHge93gbBoCtiuWPpyiwbXrZnqZHsAUwNYTGL43LHEZ+qrYQBs9JqDWfjBwkoF0p9u
         4oM4meRCRLV2CaItrhRp6axu9OfcWe1xGoh4E1pJCLLRAV9gNn5scLxStH6Bwuv0AQmw
         QpuwfNkTyIUAPVR+3TqbFpGZbzAUPmII3un7FZKCD6u2fPqG7LjZoNoeHdEEQgX6dFFz
         bOZzdYem6q4EftEgcZL+g+LKlLD5XnFAZrrSw+TMCAeIUKqN7WO4IQ/QfF5y+Ut2pLPV
         LxdQ==
X-Forwarded-Encrypted: i=1; AL+hErESfeZ5huNlWTFfBn3bK9ajiVcTrT/vMvNDzqxRTPsZv6hkGW4gPH+DGy//Ov8EsEICaS6R4Nw288gT@vger.kernel.org
X-Gm-Message-State: APuU4Z/o31XnMTqLsI45JCocDyNMYpIGp8eMFHQ6giAoq3BZFyZk3SXX
	frfbbH/MfPmaktK/uxjfBvym39+1ccY2P9G/Gsz9smiAm37ttFOmlbwY
X-Gm-Gg: AZFdTZcV7qQdF7z6JEFX0UsTLeEixwhR7SRienGw03cGed2Lcq6m+qPO75/fut99LhP
	jyR165V0/rSk4fAPRb7LDw9CbwpoUZSC2C8ndl3Vi3hkXleiGKmHJi6ykFrBOGrkl0BSYP3UQ6T
	29bZplpIDliSyHNwHCb0Ad8vHfpdW15HNZEY2knUV6FgT4nxi4UzOpFi5Q3ZmMb4K2HriIan6pQ
	Qpc0MD0gj0zFe2Hk76kF5tUwgWaKrHFA7IfROPkna0+1xLiZ0N8jb3Rf4dgh8VEofnDFZnUH44h
	lndW7P6wXQAlR1+GVB7gff64YR+PfLPZoyIz7k2XLzjDBASc1i2Qz4g2NfkLkYBMB03EdZEur0e
	ddYXCtcZMuGxTP4v0OwWuFg0TkVk3niGmw71xOTCRKIhIaYfWrVNKQ7+tCJ71OdWM00HO96/eEY
	zWytX2yRKBE36kT7L02gbVZE9zmWV2OYsUQdo5M+1SqsF/RtPy3KNwgmRWLzJ49mT7ZrVSsQ1nj
	MdpGquAYHq8sPFfpejcR/MxY0TD4pUhPLtjYBjseW/OUXLufPf5cT7draWuaBRScguo3dY+I3ZH
	D/9Gkk1DnhKTssnYb2ETnSCW/4mD0K5iM6bGjyMkfe0OlTvmbLROSgreLg7yFjIY4R9uw+A5YLd
	t9bHi8bqpdg==
X-Received: by 2002:a05:6402:4447:b0:6b8:6f17:5a44 with SMTP id 4fb4d7f45d1cf-6ba37eadbefmr5361602a12.24.1795334901394;
        Sun, 22 Nov 2026 00:08:21 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm3596014a12.27.2026.11.22.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:08:19 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] iio: light: ltr501: Switch to read_avail() op from manual attribute registration
Date: Sun, 22 Nov 2026 10:07:50 +0200
Message-ID: <20261122080753.36349-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122080753.36349-1-clamor95@gmail.com>
References: <20261122080753.36349-1-clamor95@gmail.com>
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

Switch to the read_avail() operation from manual attribute group
registration. This eliminates the need for per-chip attribute_group
structures and related ltr501_chip_info iio_info entries.

Adjust LTR501_INTENSITY_CHANNEL to account for the new
info_mask_*_available layout, allowing the removal of _shared since all
intensity channels share the same layout of available entries.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 195 +++++++++++++++----------------------
 1 file changed, 79 insertions(+), 116 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 24733607d1b49..9e660ec4e25e7 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -133,6 +133,22 @@ static const struct ltr501_gain ltr559_ps_gain_tbl[] = {
 	{0, 15624},
 };
 
+static const int int_time_avail[][2] = {
+	{ 0, 50000 },
+	{ 0, 100000 },
+	{ 0, 200000 },
+	{ 0, 400000 },
+};
+
+static const int samp_freq_avail[][2] = {
+	{ 20, 0 },
+	{ 10, 0 },
+	{ 5,  0 },
+	{ 2,  0 },
+	{ 1,  0 },
+	{ 0,  500000 },
+};
+
 struct ltr501_chip_info {
 	u8 partid;
 	const struct ltr501_gain *als_gain;
@@ -145,8 +161,6 @@ struct ltr501_chip_info {
 	bool no_irq_support;
 	struct iio_chan_spec const *channels;
 	const int no_channels;
-	const struct iio_info *info;
-	const struct iio_info *info_no_irq;
 };
 
 struct ltr501_data {
@@ -164,6 +178,8 @@ struct ltr501_data {
 	struct regmap_field *reg_als_prst;
 	struct regmap_field *reg_ps_prst;
 	uint32_t near_level;
+	struct ltr501_gain als_gain_tbl[ARRAY_SIZE(ltr559_als_gain_tbl)];
+	u32 als_gain_tbl_len;
 };
 
 static const struct ltr501_samp_table ltr501_als_samp_table[] = {
@@ -582,14 +598,18 @@ static const struct iio_event_spec ltr501_pxs_event_spec[] = {
 	},
 };
 
-#define LTR501_INTENSITY_CHANNEL(_idx, _addr, _mod, _shared, \
-				 _evspec, _evsize) { \
+#define LTR501_INTENSITY_CHANNEL(_idx, _addr, _mod, _evspec, _evsize) { \
 	.type = IIO_INTENSITY, \
 	.modified = 1, \
 	.address = (_addr), \
 	.channel2 = (_mod), \
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
-	.info_mask_shared_by_type = (_shared), \
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) | \
+				    BIT(IIO_CHAN_INFO_INT_TIME) | \
+				    BIT(IIO_CHAN_INFO_SAMP_FREQ), \
+	.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_SCALE), \
+	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME) | \
+					     BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.scan_index = (_idx), \
 	.scan_type = { \
 		.sign = 'u', \
@@ -609,19 +629,18 @@ static const struct iio_event_spec ltr501_pxs_event_spec[] = {
 
 static const struct iio_chan_spec ltr501_channels[] = {
 	LTR501_LIGHT_CHANNEL(),
-	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH, 0,
+	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH,
 				 ltr501_als_event_spec,
 				 ARRAY_SIZE(ltr501_als_event_spec)),
-	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR,
-				 BIT(IIO_CHAN_INFO_SCALE) |
-				 BIT(IIO_CHAN_INFO_INT_TIME) |
-				 BIT(IIO_CHAN_INFO_SAMP_FREQ),
-				 NULL, 0),
+	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR, NULL, 0),
 	{
 		.type = IIO_PROXIMITY,
 		.address = LTR501_PS_DATA,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 			BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_INT_TIME) |
+						     BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 2,
 		.scan_type = {
 			.sign = 'u',
@@ -638,14 +657,10 @@ static const struct iio_chan_spec ltr501_channels[] = {
 
 static const struct iio_chan_spec ltr301_channels[] = {
 	LTR501_LIGHT_CHANNEL(),
-	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH, 0,
+	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH,
 				 ltr501_als_event_spec,
 				 ARRAY_SIZE(ltr501_als_event_spec)),
-	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR,
-				 BIT(IIO_CHAN_INFO_SCALE) |
-				 BIT(IIO_CHAN_INFO_INT_TIME) |
-				 BIT(IIO_CHAN_INFO_SAMP_FREQ),
-				 NULL, 0),
+	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR, NULL, 0),
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
@@ -1111,111 +1126,56 @@ static int ltr501_write_event_config(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
-static ssize_t ltr501_show_proximity_scale_avail(struct device *dev,
-						 struct device_attribute *attr,
-						 char *buf)
+static int ltr501_read_avail(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     const int **vals, int *type, int *length, long mask)
 {
-	struct ltr501_data *data = iio_priv(dev_to_iio_dev(dev));
+	struct ltr501_data *data = iio_priv(indio_dev);
 	const struct ltr501_chip_info *info = data->chip_info;
-	ssize_t len = 0;
-	int i;
 
-	for (i = 0; i < info->ps_gain_tbl_size; i++) {
-		if (info->ps_gain[i].scale == LTR501_RESERVED_GAIN)
-			continue;
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%06d ",
-				 info->ps_gain[i].scale,
-				 info->ps_gain[i].uscale);
-	}
-
-	buf[len - 1] = '\n';
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		if (chan->type == IIO_INTENSITY) {
+			*length = data->als_gain_tbl_len * 2;
+			*vals = (const int *)data->als_gain_tbl;
+		} else {
+			*length = info->ps_gain_tbl_size * 2;
+			*vals = (const int *)info->ps_gain;
+		}
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		return IIO_AVAIL_LIST;
 
-	return len;
-}
+	case IIO_CHAN_INFO_INT_TIME:
+		*vals = (const int *)int_time_avail;
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		*length = ARRAY_SIZE(int_time_avail) * 2;
+		return IIO_AVAIL_LIST;
 
-static ssize_t ltr501_show_intensity_scale_avail(struct device *dev,
-						 struct device_attribute *attr,
-						 char *buf)
-{
-	struct ltr501_data *data = iio_priv(dev_to_iio_dev(dev));
-	const struct ltr501_chip_info *info = data->chip_info;
-	ssize_t len = 0;
-	int i;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*vals = (const int *)samp_freq_avail;
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		*length = ARRAY_SIZE(samp_freq_avail) * 2;
+		return IIO_AVAIL_LIST;
 
-	for (i = 0; i < info->als_gain_tbl_size; i++) {
-		if (info->als_gain[i].scale == LTR501_RESERVED_GAIN)
-			continue;
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%06d ",
-				 info->als_gain[i].scale,
-				 info->als_gain[i].uscale);
+	default:
+		return -EINVAL;
 	}
-
-	buf[len - 1] = '\n';
-
-	return len;
 }
 
-static IIO_CONST_ATTR_INT_TIME_AVAIL("0.05 0.1 0.2 0.4");
-static IIO_CONST_ATTR_SAMP_FREQ_AVAIL("20 10 5 2 1 0.5");
-
-static IIO_DEVICE_ATTR(in_proximity_scale_available, S_IRUGO,
-		       ltr501_show_proximity_scale_avail, NULL, 0);
-static IIO_DEVICE_ATTR(in_intensity_scale_available, S_IRUGO,
-		       ltr501_show_intensity_scale_avail, NULL, 0);
-
-static struct attribute *ltr501_attributes[] = {
-	&iio_dev_attr_in_proximity_scale_available.dev_attr.attr,
-	&iio_dev_attr_in_intensity_scale_available.dev_attr.attr,
-	&iio_const_attr_integration_time_available.dev_attr.attr,
-	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
-	NULL
-};
-
-static struct attribute *ltr301_attributes[] = {
-	&iio_dev_attr_in_intensity_scale_available.dev_attr.attr,
-	&iio_const_attr_integration_time_available.dev_attr.attr,
-	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group ltr501_attribute_group = {
-	.attrs = ltr501_attributes,
-};
-
-static const struct attribute_group ltr301_attribute_group = {
-	.attrs = ltr301_attributes,
-};
-
 static const struct iio_info ltr501_info_no_irq = {
 	.read_raw = ltr501_read_raw,
 	.write_raw = ltr501_write_raw,
-	.attrs = &ltr501_attribute_group,
+	.read_avail = ltr501_read_avail,
 };
 
 static const struct iio_info ltr501_info = {
 	.read_raw = ltr501_read_raw,
 	.write_raw = ltr501_write_raw,
-	.attrs = &ltr501_attribute_group,
-	.read_event_value	= &ltr501_read_event,
-	.write_event_value	= &ltr501_write_event,
-	.read_event_config	= &ltr501_read_event_config,
-	.write_event_config	= &ltr501_write_event_config,
-};
-
-static const struct iio_info ltr301_info_no_irq = {
-	.read_raw = ltr501_read_raw,
-	.write_raw = ltr501_write_raw,
-	.attrs = &ltr301_attribute_group,
-};
-
-static const struct iio_info ltr301_info = {
-	.read_raw = ltr501_read_raw,
-	.write_raw = ltr501_write_raw,
-	.attrs = &ltr301_attribute_group,
-	.read_event_value	= &ltr501_read_event,
-	.write_event_value	= &ltr501_write_event,
-	.read_event_config	= &ltr501_read_event_config,
-	.write_event_config	= &ltr501_write_event_config,
+	.read_avail = ltr501_read_avail,
+	.read_event_value = &ltr501_read_event,
+	.write_event_value = &ltr501_write_event,
+	.read_event_config = &ltr501_read_event_config,
+	.write_event_config = &ltr501_write_event_config,
 };
 
 static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
@@ -1226,8 +1186,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1238,8 +1196,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1251,7 +1207,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
 		.no_irq_support = true,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1264,8 +1219,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1278,8 +1231,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1450,6 +1401,7 @@ static int ltr501_probe(struct i2c_client *client)
 	const void *ddata = NULL;
 	int partid, chip_idx;
 	const char *name;
+	int j = 0;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
@@ -1548,7 +1500,18 @@ static int ltr501_probe(struct i2c_client *client)
 				     &data->near_level))
 		data->near_level = 0;
 
-	indio_dev->info = data->chip_info->info;
+	for (int i = 0; i < data->chip_info->als_gain_tbl_size; i++) {
+		if (data->chip_info->als_gain[i].scale == LTR501_RESERVED_GAIN)
+			continue;
+
+		data->als_gain_tbl[j].scale = data->chip_info->als_gain[i].scale;
+		data->als_gain_tbl[j].uscale = data->chip_info->als_gain[i].uscale;
+
+		j++;
+	}
+	data->als_gain_tbl_len = j;
+
+	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
 	indio_dev->name = name;
@@ -1573,7 +1536,7 @@ static int ltr501_probe(struct i2c_client *client)
 		if (ret)
 			goto powerdown_on_error;
 	} else {
-		indio_dev->info = data->chip_info->info_no_irq;
+		indio_dev->info = &ltr501_info_no_irq;
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-- 
2.53.0

