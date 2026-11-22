Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334915;
	b=UG72+ocGncuzBflMTRpHJ2Z4bhvVlWBcs4d6yKBO+6PSa6nPI0SIVTIyXrt/MUvuqtvj
	 93u/9LJGDFl5frhy5DT7O3i1viCCagunXm2q1ZfcNul8fR9oRfL6WDPrRDpiqJfDQ/Bf4
	 RLcsbivChMNh2lJN08HOwGrmeb6fFAnZPvi5C2VTYXnv+A0NVGBqGOIvo3XcQzxdPnOfq
	 ggXIL7uRKHi76hWZmCo3BrtlS93eJxrTc2Y3iE+Fyewffs9RcjYaQq1Tn2TXvF0epVcS/
	 uI3byjIFRREptOQ1+8xBbbqSWUXZpQf+AhpymcKJHe8MNpREKRZ/JyyYot6epmGD6xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WxmR7ztyeDAM8l4U5mjs6dhsdQ8TeTXXL+OwtJ6NUO8=;
	b=SdXP96aIQWeZ2+g5uohsLLbSQkrOeBgY/t7IpHcR9c+7eR2E6ctJMMTIHUekbnWQAi1g
	 CWTOHOIIMSJHOKnZsBxAxko1NG9dYjGERv1rAA8K/TQrb2CbaRaPLCLRS34lsnZOVYd2W
	 am6TRIzBxdQHSdea4ek3WS6TQBA1LrbHC6mb95kNhhA32wd0arJfklRbaA7M9ow2t+727
	 uQDY5VX/Ipb+a6m+KbzZgvK6CFGQYrW5voqhxtHVlCw1boaji6bIgg0GeBvZFsnGgu65n
	 hfiSGvLW+Ns4DHUYkVkDCfPItI/39qkFr2QVlJYrX1Keq02RvYLGHjmClAMcOlmzd8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtdtwJ1P;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE85606A33C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE85606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtdtwJ1P
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so2783274a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334913; x=1795939713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WxmR7ztyeDAM8l4U5mjs6dhsdQ8TeTXXL+OwtJ6NUO8=;
        b=CtdtwJ1Pb+/xE47wHtFE7BGKSoTPX0717TTaBptkIDetzjeX1GFUXZyaq61Z7h04GS
         SyUvknLFVGLAIVQ2pY9JX3EETkbObFND4Z9h2mtAa6Cu77auBPBuzBUWE9UmWPIy/E6C
         U8ECdkhV9s7qN3lbARlKs3GwveahqbCh1ZFZh/t2vojhZ/oOK8qK2wr1/imyRwA/vAmk
         Jr6nEDejOcyWi9H4/4+6r1zy5jlmNwva8y202M02F/T2RqUfsvvH2jc21zbFsoUdybq6
         QwRe31VOZ3rGo1SYoh2qtZxaHl+IyArWJC9CU1TQME+FN1jGCB32+FHSl7BNIXqqLLdD
         +Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334913; x=1795939713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxmR7ztyeDAM8l4U5mjs6dhsdQ8TeTXXL+OwtJ6NUO8=;
        b=Ho6xqjSYmgVia4AIi5+2FtGdyTNLX0m5HIyUmsoN3xB1JYrzN4iyht/R6nwV3kgVk6
         drYxbb+TOVKOByY/BY6pA60PEurh8bE7YQhhDttjzt7geFeHCTuwm6CnqbU/hVY+NODV
         aBQy6xGjgz+gsgxkASRHl2/FjYVtIoldTpgKj0jLhWpJIKIpZMB5h/cFh001nv+11/Jg
         72CUj3nRSppoYGWjr5NOeid32nbauqw/dRsI8tG2/ELmTSh6yJb4j9cHEaLyj7z4Un6k
         p45wuOUO78NQYA+A0112/Ke6igXMSGlyz67Td4n9bRpBAomMVi4sBzhk++lw8Tabtq6M
         IyDg==
X-Forwarded-Encrypted: i=1; AL+hErE9bf0+OMzQP72JlJUfIv+g94Q9OJhZWiLro+VqJqh+DtkOoyGAlcRy8MdIH1UV2IksuOfxBy/tS/KO@vger.kernel.org
X-Gm-Message-State: APuU4Z8P7ddtKU/1/wvB2vYN0w13cllp5WRrqB0yMh7jitLiHNWbwedh
	Wh2Nz+OmKh90FBBQZ2J19igFH21SxiIdBD5JrLl/WFyuEDCBAX59SptK
X-Gm-Gg: AZFdTZdZRQXMAQd9Dff3mi++xqM040UkqjK/z6xfrzrigm78laisQDj9PlIG4kjC/rh
	xWTajQ+gaqbZbgzqprgiLGnV6TI+5WgnFpaEcXtvM/xaQYgbTGGTtxZHxcuOL5Jz50rwKlrBDiy
	Y5EA2cFJR1CbdXdjH724vD5/37iTWmZbsvrrjXlrY8EKjRDZ+TPkCVYRMcBwDYEHCY4IgHwgIQt
	Rxyq/BUjETh0gptmrarItm0yY7RMyBeJ/SGXy+Hy9zM0sDSe5MjxR3j727KAT/NYWkSqqGy0p+Q
	WGd9o5rDlPiYQH5zo9eS5Wq59LDkim7XniTxbUFjaKqS1hCpKv1cPQb+71Q3jFta8B19lq8s287
	Cobcdj2WUc1+66GgTTetQA8xl9lOerGIcoRWbIctqVBhucuU6JWwfxW3W50ZouyFJFl9wzs7CgW
	pWqIapxqp90uwPsVVWpqpKtN0bt7pOs+tjdjIALOy85f/t8w5OqmcdiR/BYuTcifKt0pn9XkSr5
	BWO9/dGJhaNYWOHqyMcqhmL3s30Q3TCKup1Ly76tYLKFQeTguxwbsXTX8euV2G4Ahg7MU6Fww+z
	fR8ncoEp+6DPY0Rwmt+w8s+CXEhTBkrcNU/V/Xya0lO1SYSqPQMvvsjZPP7JUvQ8wdynUrizWll
	uOWgV+hEVGg==
X-Received: by 2002:a05:6402:1e90:b0:6b5:7d7b:8e9b with SMTP id 4fb4d7f45d1cf-6ba37ebe4dbmr6234640a12.39.1795334912857;
        Sun, 22 Nov 2026 00:08:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm3596014a12.27.2026.11.22.00.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:08:31 -0800 (PST)
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
Subject: [PATCH v5 4/4] iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor
Date: Sun, 22 Nov 2026 10:07:53 +0200
Message-ID: <20261122080753.36349-5-clamor95@gmail.com>
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
index a471c90cf0a75..37682e7067b52 100644
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
+	unsigned int si;
 	u8 mask = 0;
 	int j = 0;
 	int ret, psdata;
 
 	/* figure out which data needs to be ready */
-	if (test_bit(0, indio_dev->active_scan_mask) ||
-	    test_bit(1, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_ALS_RDY;
-	if (test_bit(2, indio_dev->active_scan_mask))
-		mask |= LTR501_STATUS_PS_RDY;
+	iio_for_each_active_channel(indio_dev, si) {
+		const struct iio_chan_spec *chan = iio_find_channel_from_si(indio_dev, si);
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
@@ -1582,6 +1626,7 @@ static const struct i2c_device_id ltr501_id[] = {
 	{ .name = "ltr329", .driver_data = (kernel_ulong_t)&ltr329_chip_info_tbl },
 	{ .name = "ltr501", .driver_data = (kernel_ulong_t)&ltr501_chip_info_tbl },
 	{ .name = "ltr559", .driver_data = (kernel_ulong_t)&ltr559_chip_info_tbl },
+	{ .name = "ltr659", .driver_data = (kernel_ulong_t)&ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltr501_id);
@@ -1592,6 +1637,7 @@ static const struct of_device_id ltr501_of_match[] = {
 	{ .compatible = "liteon,ltr329", .data = &ltr329_chip_info_tbl },
 	{ .compatible = "liteon,ltr501", .data = &ltr501_chip_info_tbl },
 	{ .compatible = "liteon,ltr559", .data = &ltr559_chip_info_tbl },
+	{ .compatible = "liteon,ltr659", .data = &ltr659_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltr501_of_match);
-- 
2.53.0

