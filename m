Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731879;
	b=1y1jBnzi2eVYXl3A/L/c9JP0gnhLFK4/uxfCU03I5KQpr7zKWjomb8A9WOxhBn+nQBZo
	 YFZl5Ag46tzb6mG1wxosah7eFqnByaRLLXJLYVjnTeenePE5pRIpFwfD4IsC2NJ55ePwL
	 JqGO030w25N6AMb/zY8+wyt6g+bEiE8xbczHU82xMvwY1hLoRYy4UB/rmHcwz4vJnSY35
	 o3vnKJz99YJVnDKxamleQVznFHo4hvONA/VMi5w8uFDWVctqDPCVZBQ3d6M7P2OE8Nusq
	 nByWO9o8iEAmKnnCQ0Vsg1GXocsEHhe9Z3cQYmkuvBhPbVErAgFMmH1AMW/PYSeEFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jtbqpR4PVOYpBoo8BS7ac5grEKA6PA4yUOvkcxAWBqE=;
	b=N5Jycsc/SjfgVcl0iAZ2wbKc1VtFYje9egQ/4CAv0TKTaaUar2+NLyaVNdE5Qi+R/q7P
	 5L6+QPCL9nVGNUcF1exRJcXOKL8j3R2p/yKshFko/CO+dYy1YYj+AB+D6XWGQZQrBedYd
	 Orgh1IrJgzZvGhohMujSnCpQBetCK7Jz4+BQL+yw0sCU2TPfujn/DrozOBx2nRk72x1Tp
	 3qGoRVu3Yfg/1X8crOgyOjRQbj6tjXJVThoyLtYOHvmkJUr5Vq6NYLzF3mKMwLKzn7ney
	 gRPS4wct4lNmsA+d1LiW/5lgswMCR/KVX/Kd1aIeq4aE/xfMmoA1oaBdxKNSmGm6JHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xSWolltU;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA25606A880
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA25606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xSWolltU
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso390626766b.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731877; x=1795336677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtbqpR4PVOYpBoo8BS7ac5grEKA6PA4yUOvkcxAWBqE=;
        b=xSWolltUx0cu9rG0v3Gwyfon4ESyDGwACQeay5cjvh3GLW5ysHvcrsvGNJmpi1pFhI
         CtveyAbd/zl5WNXbKMS4atuvD1OWiwkCLcaKX7v2hDVoypIf7VinfoXLqSJ/vxKcoRqs
         TPResK1jWndOW+X8QsW8CthUkAPmxTQ86xu6s6Euy+0dnqLYPXHZTqgWKnPgq9ZiJMJ5
         IIw1Jgbm9RsPmViiz8YJTsXHIM4ApWGVBfhOh04HZLqDZL30hwo4tw0TjZUVzoI04Bjc
         Kh9fPNTgtdEMCZhOEA5ISYz0GCr/UIjtPAxly/xAM8QgxWHowoeEPk5cO8Bs5TkPTg+5
         vj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731877; x=1795336677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtbqpR4PVOYpBoo8BS7ac5grEKA6PA4yUOvkcxAWBqE=;
        b=aLU/alQMYlt4a/YGELo6hu7xZrjkmlf5S0Y06+3YMb9cakQUsqq7FZjuMZCEZK3OHG
         6ly3NQ6ssaYNswD2OfO/RQs5OyEcSk+5Tsq0BUHnUwhRFeOinCc68Nyw+VDlI7fRkkqe
         2IQ7bsK0CdJgYFq5U7X01rHSrUA+O8S1YP1LE2g/Hf0YqXdvbrSsfMW3H2HmIzkjQ8bk
         Wmgdaoznu4+nAh4B9mq+0bzNIugvhcovCMbTBYONtAyn5vEReX8mibDyXdskyLWpQtX6
         hkU4VKs32TiTFGvhEuYJSBoqxmKmvuSvogQs7/WsL3CSv8eLg1IPVNyAFgCetoiXOx+0
         4nbQ==
X-Forwarded-Encrypted: i=1; AL+hErEyJG+ApVeycil3c4Yhy4S6/GXpQu3OL0v6joYZuu5qxVtiov0TYDxFuPgjeVlW0GFockny3QWmqgh2@vger.kernel.org
X-Gm-Message-State: APuU4Z9726DmOO9g2VoSFU1XdPcUaNwlJd5NItEHrOvfyf0hJjLEHoQ0
	hlWOw3g3HAJcalrD8Nj17Cm9epkJLVnXxgxp6+4rwOI4sZ1o9vbEy1cw
X-Gm-Gg: AYBFou3iSl/vh3zM5Wdve/Hk3Gk6LUstxNiiLtKZLWZmf3iLQ65AC/FHm8kB6sCJLO8
	/0CdMJ3tOe5pqqTVS++VF7oFj31HlwcTfVeHCjxpryhA8n1kVlUsVyRo2mI6Z3ozGNYfUa/4JPA
	JhyX9E2ujCk6NGja7sP5C5J50D1bzBi3is9Rs2ExscV80Qq+CIxKLzaIJjIgEFBGehmM5Mh8ddf
	OHCtUTFf02Nom7FznGI/ZqZt7ZixVoVHVm87/+q6W6Mt/ImibbID7xBwdMIYILP83pGnSH1yK77
	NnmhQYjolKfiHeGBhxSwEtdFBQufweB0Q9cjQJ/nLn/PddJ5+zILt0GV6pdZsS/hsm4VIK0vvbR
	vJJayz7EHzt4QiBuJ7gdTJ+ONlJUrYs3w8suclYqJWCRZmh7VX7nknfWEBkHJgvYeSd9n8ay6sZ
	qp+Z21pzhp+eQhRgM1EtpqQrMhbvrr6jV3l9jKuhSpxDOGfKyppd4mDe3TSj0I/Vv9ce1Hq0LrW
	gy8YMe0KxIuVPuz46hhOHp7hzP/Nzd1pmXtlr81oMQBFgEjFVdCa2QoXMVWtI1+0Fk/DIbw7MQh
	fBnx6QTCIQxnwCRXw/+iGkNlhvnse0HM+zYeeEm0aK857DVCeTnlmTU/ingNpHM4sonLa++JXNB
	VXK0mHV+OAiOVk0Kv0v7VT2nKlsB80QU=
X-Received: by 2002:a17:907:8687:b0:c4c:eb16:b567 with SMTP id a640c23a62f3a-c50963114ccmr577809566b.19.1794731877111;
        Sun, 15 Nov 2026 00:37:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm284815666b.2.2026.11.15.00.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:37:55 -0800 (PST)
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
Subject: [PATCH v4 1/4] iio: light: ltr501: Switch to read_avail() op from manual attribute registration
Date: Sun, 15 Nov 2026 10:37:38 +0200
Message-ID: <20261115083741.62140-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115083741.62140-1-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com>
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
 drivers/iio/light/ltr501.c | 193 +++++++++++++++----------------------
 1 file changed, 77 insertions(+), 116 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 24733607d1b49..3662aed5225bc 100644
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
+			*length = data->als_gain_tbl_len;
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
@@ -1548,7 +1500,16 @@ static int ltr501_probe(struct i2c_client *client)
 				     &data->near_level))
 		data->near_level = 0;
 
-	indio_dev->info = data->chip_info->info;
+	for (int i = 0; i < data->chip_info->als_gain_tbl_size; i++) {
+		if (data->chip_info->als_gain[i].scale == LTR501_RESERVED_GAIN)
+			continue;
+
+		data->als_gain_tbl[j++].scale = data->chip_info->als_gain[i].scale;
+		data->als_gain_tbl[j++].uscale = data->chip_info->als_gain[i].uscale;
+	}
+	data->als_gain_tbl_len = j;
+
+	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
 	indio_dev->name = name;
@@ -1573,7 +1534,7 @@ static int ltr501_probe(struct i2c_client *client)
 		if (ret)
 			goto powerdown_on_error;
 	} else {
-		indio_dev->info = data->chip_info->info_no_irq;
+		indio_dev->info = &ltr501_info_no_irq;
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-- 
2.53.0

