Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731888;
	b=Hy/wmfAl5FLXz3SC3tWwGIz0iF2Hw8/R/9NrZvCQBfJVkMWqIlKqprnrPGsSdiK6FMt2
	 o0noz3d7ep7eY+xwPXRcTErTso2e7JRS0x7gJUJmpyjRPtoDBnRFlyCPVky4bU7czV7yA
	 HsVc48xyc/jUf3KMDp7Pdi3b141C0QMydNMJGMftqQyF9IALYef2QCwTnDofMCChR9RuF
	 95exexHOqge+q5QXb05c79K+SQ0p1yPgAkUU/cXxZgoj7uWF0mqThTvSRolLFqRCCEZls
	 YGtVyqL8EFdOJYsZdTgwCOLr7o9LVW4LzkMJCHhaM5j7t7zIdMgsDt44KnxBPZSH5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/MbbDD57P/KeyF+nc1m1H/fHW8AV7QTTEwuQUWKknZ8=;
	b=hSHEcsRvlAKLj/CWQfLbwZuPsKAl0siZqdc5akabcuWChJ/gLU/gGL8eITcjPfFQH+tX
	 NgwOdo5aXsOOF1W5ABSVpYNJq16IEN2iMed7bQEGOMxJciCdV4s/6oWnm3OJT0QdvWhIY
	 GB2pG2slD81Ko3YZWEu0KRgkC1XSAkVVjf1uqz5vxQ6ah/L8A5ClxuaLrkbxfse7brJXI
	 zab9R1zMN7W/+bYwv84GgOgFh/liZzaaOPKC8h2dou+o4Dkrs6vZerPaUBOyAwq+0Xrkw
	 e3oCsu39W5Wp320Cn1fAURw+x/1quMVUAZCYmRcsuJkv5r1PDrqcnrsamfI1km1cVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wl+FGbMJ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C896A606A8AA
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C896A606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wl+FGbMJ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so42143166b.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731886; x=1795336686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MbbDD57P/KeyF+nc1m1H/fHW8AV7QTTEwuQUWKknZ8=;
        b=wl+FGbMJy3l3qlIgBl3eecuI+VYWFKecwCV7FnBLMa449ZqZK8/EN232t8Odjyfn66
         fsf3iqONvCja+h6YdsPrLDxsvopMlg974ujV5iDK9uB5rAkXooEMJLO2+Vl1J8F7Jeiq
         koSj+6SeZDXzhGOdcEgvu63Wa7eExZOh1e0Tvn6oPIebjGVaOtmxCmcQChllBIEWsilY
         NoGk4cuoWfqG7rCc+QCyPSMg7NSGRVWQ6z+B/4nFlJ9D+lmx/sDODeXZ5s+KGj6Bb/el
         JXzYNltgb/bMUnD+hme6nGE7Azfs3l2Xrge5ZgKk6OdL+cWAAK40XTVfGkzm3CT9ezBs
         UITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731886; x=1795336686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MbbDD57P/KeyF+nc1m1H/fHW8AV7QTTEwuQUWKknZ8=;
        b=hWNooyDXC7Xj44FE3VDjSGauixwNHLjnySwqIEoULQuRezFfJbLNw5ZxrDUYrWXNi1
         zY3wL0z3BUye07wky9ZFXzQ/dlAL1K2SaZ7Cqo4u1Y8gONR5NRoemdNrKVor95E2922B
         Mv0nfRxUnVVqKdwFOAfEmi/lJOaZKjEldM19kutHyaYbf8EOGStKZ3geyx00HnTkNCTk
         N2FgCm+QOAjZFwJ5Y+fiPqpnIRzi5OkE0rNKSi47f36xPy2gme42eKeM7YAjbBckb+mV
         l6bsH33hTfZYYRdGK9n3CwPkEPNlk/5do75vHadqDcArQ6iX18ZcJBQzzoy5Fx1tQXJ4
         21XQ==
X-Forwarded-Encrypted: i=1; AL+hErHiTXV8w6mkgQHjnsrW0T9h11mc74p8c0H94sZ8r44N7/yrQ/7+zaeCn0lTK+BUHvMbQBVbT3LCB2fU@vger.kernel.org
X-Gm-Message-State: APuU4Z8dXSk+Uzp3Pm+DBIfdY8HBkNzlwh37K08MnNhS/Cijb7hPZrwD
	gQlroXlZX0wVGVqpPIZrpzINqTSGqLsRMYOQapmbl8UiNOdQRtDCOqwM
X-Gm-Gg: AYBFou0hoTl5y3trGm82USVcSMsLfXl7I350MMsGudMaGxg0B2zJtTc4ZJ89kEx9YjZ
	k1AelOa4AQZI/pptDSgEFABn4zMQFn34nPsvORhxvG/AB7Wq7PH4wNsqRsherQtk+NPwdffR4KK
	3lLddF+1OfJf42YJHaeo01TYUXKHwgzsA7cZrpIWfHUqYBdT4BtXKp8IAv7ngmgyEcxR2rz4X+y
	HFCZeQje0Hfl9Uwu8gSoWFCvDt3427Gq8OxcEfCAYZEXfDSfvIQUMXT8YzAZF1uQNhTx94J4qWT
	tBzHJLDssDw4+o/oXSgeFHo7Ga3zKu3OiNj1A0J7cduThj/8K13EIrtD6SGCY4kkEZWiSVyFVsc
	4FN1ptk5JVT+B2nLRbvMyX8vtjeYjHwT7eRjB6X3V27WXahJ6fpDv53gzYVzvLkuDQrvnaauO3h
	xjLb1ZfgpYBpKkfUITQrJny2z/DodBNMoxam3sThL1ozq4ehm1BZABVFNyFe8dzz2r2Dvv1bUKs
	o0ZYEEgZ01a923I669C/Ki7w8YxdqoJ5SgoZLS7oAALZxEb00qAcwS9mGyMPRfbnqoBkUDstZYD
	BvU0olkYNKq/jQw1pGjxqdY9CTfa21X9HgejAW2IsM7Oxr4DTV1I/+R0Id3ESxA3EtzenORJD5Z
	gBnzMuthHlQ==
X-Received: by 2002:a17:907:6e94:b0:c49:df71:14f5 with SMTP id a640c23a62f3a-c509643acd8mr505346466b.31.1794731886046;
        Sun, 15 Nov 2026 00:38:06 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm284815666b.2.2026.11.15.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:38:05 -0800 (PST)
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
Subject: [PATCH v4 4/4] iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor
Date: Sun, 15 Nov 2026 10:37:41 +0200
Message-ID: <20261115083741.62140-5-clamor95@gmail.com>
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

Add a no_als_support flag, similar to how no_irq_support is used, to
isolate ALS register access for the LTR-659PS-01, since ALS registers are
marked as reserved and interactions with them are discouraged.

The ltr501_trigger_handler relied on the scan index to identify channels.
This approach is fragile regarding channel status flags and can break if
the index is not strictly set. Switch to checking the channel type
instead.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 76 ++++++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index bf3cc32a55c3c..394e08c78005e 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -151,6 +151,7 @@ struct ltr501_chip_info {
 	u8 als_gain_mask;
 	u8 als_gain_shift;
 	bool no_irq_support;
+	bool no_als_support;
 	struct iio_chan_spec const *channels;
 	const int no_channels;
 };
@@ -656,6 +657,29 @@ static const struct iio_chan_spec ltr301_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
+static const struct iio_chan_spec ltr659_channels[] = {
+	{
+		.type = IIO_PROXIMITY,
+		.address = LTR501_PS_DATA,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_SCALE),
+		.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.scan_index = 0,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 11,
+			.storagebits = 16,
+			.endianness = IIO_CPU,
+		},
+		.event_spec = ltr501_pxs_event_spec,
+		.num_event_specs = ARRAY_SIZE(ltr501_pxs_event_spec),
+		.ext_info = ltr501_ext_info,
+	},
+	IIO_CHAN_SOFT_TIMESTAMP(1),
+};
+
 static int ltr501_read_info_raw(struct ltr501_data *data,
 				struct iio_chan_spec const *chan,
 				int *val)
@@ -1230,13 +1254,24 @@ static const struct ltr501_chip_info ltr559_chip_info_tbl = {
 	.no_channels = ARRAY_SIZE(ltr501_channels),
 };
 
+static const struct ltr501_chip_info ltr659_chip_info_tbl = {
+	.partid = 0x09,
+	.ps_gain = ltr559_ps_gain_tbl,
+	.ps_gain_tbl_size = ARRAY_SIZE(ltr559_ps_gain_tbl),
+	.no_als_support = true,
+	.channels = ltr659_channels,
+	.no_channels = ARRAY_SIZE(ltr659_channels),
+};
+
 static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 ps_val)
 {
 	int ret;
 
-	ret = regmap_write(data->regmap, LTR501_ALS_CONTR, als_val);
-	if (ret < 0)
-		return ret;
+	if (!data->chip_info->no_als_support) {
+		ret = regmap_write(data->regmap, LTR501_ALS_CONTR, als_val);
+		if (ret < 0)
+			return ret;
+	}
 
 	return regmap_write(data->regmap, LTR501_PS_CONTR, ps_val);
 }
@@ -1251,16 +1286,21 @@ static irqreturn_t ltr501_trigger_handler(int irq, void *p)
 		aligned_s64 ts;
 	} scan = { };
 	__le16 als_buf[2];
+	unsigned int chan_idx;
 	u8 mask = 0;
 	int j = 0;
 	int ret, psdata;
 
 	/* figure out which data needs to be ready */
-	if (test_bit(0, indio_dev->active_scan_mask) ||
-	    test_bit(1, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_ALS_RDY;
-	if (test_bit(2, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_PS_RDY;
+	iio_for_each_active_channel(indio_dev, chan_idx) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[chan_idx];
+
+		if (chan->type == IIO_INTENSITY)
+			mask |= LTR501_STATUS_ALS_RDY;
+
+		if (chan->type == IIO_PROXIMITY)
+			mask |= LTR501_STATUS_PS_RDY;
+	}
 
 	ret = ltr501_drdy(data, mask);
 	if (ret < 0)
@@ -1328,11 +1368,13 @@ static int ltr501_init(struct ltr501_data *data)
 {
 	int ret, status;
 
-	ret = regmap_read(data->regmap, LTR501_ALS_CONTR, &status);
-	if (ret < 0)
-		return ret;
+	if (!data->chip_info->no_als_support) {
+		ret = regmap_read(data->regmap, LTR501_ALS_CONTR, &status);
+		if (ret < 0)
+			return ret;
 
-	data->als_contr = status | data->chip_info->als_mode_active;
+		data->als_contr = status | data->chip_info->als_mode_active;
+	}
 
 	ret = regmap_read(data->regmap, LTR501_PS_CONTR, &status);
 	if (ret < 0)
@@ -1341,9 +1383,11 @@ static int ltr501_init(struct ltr501_data *data)
 	data->ps_contr = status | LTR501_CONTR_ACTIVE;
 
 	if (ltr501_has_irq_support(data->chip_info)) {
-		ret = ltr501_read_intr_prst(data, IIO_INTENSITY, &data->als_period);
-		if (ret < 0)
-			return ret;
+		if (!data->chip_info->no_als_support) {
+			ret = ltr501_read_intr_prst(data, IIO_INTENSITY, &data->als_period);
+			if (ret < 0)
+				return ret;
+		}
 
 		ret = ltr501_read_intr_prst(data, IIO_PROXIMITY, &data->ps_period);
 		if (ret < 0)
@@ -1580,6 +1624,7 @@ static const struct i2c_device_id ltr501_id[] = {
 	{ .name = "ltr329", .driver_data = (kernel_ulong_t)&ltr329_chip_info_tbl },
 	{ .name = "ltr501", .driver_data = (kernel_ulong_t)&ltr501_chip_info_tbl },
 	{ .name = "ltr559", .driver_data = (kernel_ulong_t)&ltr559_chip_info_tbl },
+	{ .name = "ltr659", .driver_data = (kernel_ulong_t)&ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltr501_id);
@@ -1590,6 +1635,7 @@ static const struct of_device_id ltr501_of_match[] = {
 	{ .compatible = "liteon,ltr329", .data = &ltr329_chip_info_tbl },
 	{ .compatible = "liteon,ltr501", .data = &ltr501_chip_info_tbl },
 	{ .compatible = "liteon,ltr559", .data = &ltr559_chip_info_tbl },
+	{ .compatible = "liteon,ltr659", .data = &ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltr501_of_match);
-- 
2.53.0

