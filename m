Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131013;
	b=pF9Kd6p//Z6EgPZn/Nak/n2ptBXmfQJ4IwmBmYCh7v4O7l392M+nl07gS6QZumeLEAbn
	 J8mo/q+gqZsn5TA9vVcJbTqfO5/P6MbACOVnrSY66SsNB84sgXtMNc6fz5XNn1YdnxFFx
	 XEDNE/o3BpdjPHvevlhBh5LreCbKYiB3O41VQ1wSNjD/wMOTdlsQ5VWQfguwk3P+4sTlR
	 cl5XIEhZM65OP5fPmAx8AsDDzrBS8Vx5OaJSfe/OujkDnlmKZXfBWQ35PLOV0WjNP9OPp
	 AaA35Hjk6nuxhZGmhKvgcfU1Wo86gWtV6Z7qZ1+791r3GLQi1pgQfzhQ4560uGOEC8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o3txUQbGmlLlC/W6WkzGi1vXNK5jT1AVFbEBwBiKJh8=;
	b=kgcfyXSKd9QXELD62akp1kOoD1E8kJjFTTMJXaO8tIfNQ/ShNmHimcpoMWVGdULmDlll
	 3P6YH7AbdAOiwLOqmRZgPGnVm9IL8hzQr5ciOa7ua8rO5ilPGAyl0oYhOFHiHoLFE7+JM
	 g1ObETym6zOjzd1WcnpoJYFCi+yf9RW3eTpFhtS/Iw7OXd/nLIKwvdv3bP2wrZr8tfjFy
	 UvPNFDin+QPfRKFSKZOTTN437H4E9EQGuCv81XcXtG+/4VBke6qh1FSMFd3VAkbCAFkBX
	 YbucAo64Pdb7P5UdvdfWLOjePO1q9bxNG5bcXTER8Pml0E38c4kO4NJ6oh+NRwPixHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+2qtOWg;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D23B606A330
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D23B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+2qtOWg
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so76226a12.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 01:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131012; x=1794735812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3txUQbGmlLlC/W6WkzGi1vXNK5jT1AVFbEBwBiKJh8=;
        b=p+2qtOWgDXyYsw2NGoEMBkaCwK/CGliQMa7LeJ5uA/J/+XJmwnZYmdHso10YvTom7A
         SyIZoZsErvIfgtcMXnyIEJC2cNIHuo1AXxgrr4bdXEI9GWGymhq30Eul4j4OuK85s3dE
         OayAW//g+00+ZUNFGncYe0QzC1o/Y2szxt8c4UGWL+2yE6zCrXGTJmQBnb74PuZdm5BP
         i4lyl39wWivebywC3BHAICYCC+uMl9kowsclpzYoznKGHIAyf0ZSvS8qiw+1cL/2GFST
         OHKe8k3/qPPvtmjEqKCo3gjaSlxM3DfmCOEFw7JjT1MhUmGL3bxu3+hDKsEq7NqaOMKX
         c/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131012; x=1794735812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3txUQbGmlLlC/W6WkzGi1vXNK5jT1AVFbEBwBiKJh8=;
        b=sMEHckBklPfaOoueES3UncS/zvB5wjyRdM4gHY+g/R+PUY7O+dYjcDQFnpoHBgIZ42
         dGUflTphZ3qVna/9Si2m64TnjdYLGOxOlGyLEMiM0HAkXMUN2xVINTMMznXssT3EKpJ2
         OuIyQIrgn6QKH13yKY6k5HG2UGSaQ1nTM14d+vUjk/DFof5/YEpE9FZrggSDhaLVS+uG
         8goWdfy4N5/oH7j0m4LID8REKjQI6g7E8O5mKVIpkKyeomTy4ci+4AqwoE+F2OUR0gnU
         RBT+TUMgyUbfh9UZ3Tx/K80jbXETgm/Lz/nyEkpd1MD4GiJPFxcBorObgmXFfvVoRGHd
         itDg==
X-Forwarded-Encrypted: i=1; AL+hErGazkYvEWkKfG2DQl72jEvEILYYHPRDcV1/kwMhdoMLCotWtae3yuGWEpLuqjzhcgmhKOa+cq7p4ubN@vger.kernel.org
X-Gm-Message-State: APuU4Z/s2rSr/+PlnFaei5/62NzK+ZlKNMhRQQnyV9pRKe9wwWz+QRMT
	2O4jTrKCxX6iWIAErCKORCuhujNXOkT3YI/k3pHiYTsO0qTC28kCl//4
X-Gm-Gg: AYBFou1zzadzRAAguPl88Md41uYRbjFHWv7kQ1mHT7WZihPKXCllNKd8cmDIJj1uOG5
	zGr2dyWy/DBPft/1IyfLob5DcRPaWq8Qi1Fj8Q0kxlQH2k9IEg34fKd/lNRnv93q6SIbDGQs2y1
	7MIhN997Uji7IROFWLnPA7RcrBA1I/VfgSFy1yub0u6tH8n0nq4tdjwmviEldlB2HoaGFukJgSI
	eYzLWBFO5o+9xkghfrMv4FeEDusMxJkOhpaq1gFGTyM7KjftDtgdeM9hTpu5W47G1viEVsy8yHK
	gVeHxpSvIa4flqB5lvqkfAZQV3Fjs7kVZlIU2mWy78QF9+RV9nUMlOBbl3jWtB50Ugk8mPCh2tQ
	yVYM6KW4Xs67Bb5UyBv9/navb6FbfWy1TD26x5Qq7rfRxaIjxEJPPvGVZcUr2hZkW+DRpy5AtBY
	++tI1HK4n+trEfIQxF/AaTsoq2VwSeEH7+0f4ch32U9HHaF0PyCZzhBmqO6/esuzN3BoHiY4NpP
	CibcPj0J3R9PETK7QFC8/Qoj/F16CB3Py4ZyidSH7bP44TpHSGFbCeHCT3y0O1VFUI1fDTt90em
	IlTmoE/irfh9mKOf2O07FgFI76hMF89vAw7g/fddOTP2RmMl75weL89Y2rRf0g9iL/omX7IF/QE
	R+AS764O6Uw1m/HWucBNvu/c9bBNhhHY=
X-Received: by 2002:a05:6402:1e92:b0:6b5:76bb:4522 with SMTP id 4fb4d7f45d1cf-6b7223732e0mr708896a12.2.1794131011650;
        Sun, 08 Nov 2026 01:43:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm436321a12.8.2026.11.08.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:43:29 -0800 (PST)
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
Subject: [PATCH v3 4/4] iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor
Date: Sun,  8 Nov 2026 11:42:53 +0200
Message-ID: <20261108094253.83899-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108094253.83899-1-clamor95@gmail.com>
References: <20261108094253.83899-1-clamor95@gmail.com>
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
index ca6c8cffb4001..b97b8da98e86c 100644
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
@@ -654,6 +655,29 @@ static const struct iio_chan_spec ltr301_channels[] = {
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
@@ -1239,13 +1263,24 @@ static const struct ltr501_chip_info ltr559_chip_info_tbl = {
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
@@ -1260,16 +1295,21 @@ static irqreturn_t ltr501_trigger_handler(int irq, void *p)
 		aligned_s64 ts;
 	} scan = { };
 	__le16 als_buf[2];
+	unsigned int i;
 	u8 mask = 0;
 	int j = 0;
 	int ret, psdata;
 
 	/* figure out which data needs to be ready */
-	if (test_bit(0, indio_dev->active_scan_mask) ||
-	    test_bit(1, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_ALS_RDY;
-	if (test_bit(2, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_PS_RDY;
+	for_each_set_bit(i, indio_dev->active_scan_mask, indio_dev->num_channels) {
+		const struct iio_chan_spec *chan = iio_find_channel_from_si(indio_dev, i);
+
+		if (chan->type == IIO_INTENSITY)
+			mask |= LTR501_STATUS_ALS_RDY;
+
+		if (chan->type == IIO_PROXIMITY)
+			mask |= LTR501_STATUS_PS_RDY;
+	}
 
 	ret = ltr501_drdy(data, mask);
 	if (ret < 0)
@@ -1337,11 +1377,13 @@ static int ltr501_init(struct ltr501_data *data)
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
@@ -1350,9 +1392,11 @@ static int ltr501_init(struct ltr501_data *data)
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
@@ -1579,6 +1623,7 @@ static const struct i2c_device_id ltr501_id[] = {
 	{ .name = "ltr329", .driver_data = (kernel_ulong_t)&ltr329_chip_info_tbl },
 	{ .name = "ltr501", .driver_data = (kernel_ulong_t)&ltr501_chip_info_tbl },
 	{ .name = "ltr559", .driver_data = (kernel_ulong_t)&ltr559_chip_info_tbl },
+	{ .name = "ltr659", .driver_data = (kernel_ulong_t)&ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltr501_id);
@@ -1589,6 +1634,7 @@ static const struct of_device_id ltr501_of_match[] = {
 	{ .compatible = "liteon,ltr329", .data = &ltr329_chip_info_tbl },
 	{ .compatible = "liteon,ltr501", .data = &ltr501_chip_info_tbl },
 	{ .compatible = "liteon,ltr559", .data = &ltr559_chip_info_tbl },
+	{ .compatible = "liteon,ltr659", .data = &ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltr501_of_match);
-- 
2.53.0

