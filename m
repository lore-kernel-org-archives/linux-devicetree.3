Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181D3AEF3B
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810234; cv=none; b=l99jO2mwgVbsKgCDeto8rNxaw8g4H3JDygMmTka661CN8P8LroO9cNc19d6jQtdMHfpOgdIeZOJz/t1nTTkHT8xBc7hlVxSiYGG9RSKncRoVV3HdVFWY5dTORPQ/cIJcQF9AGJ6+mTD8IYbgGMg+8134I+UFVSOhoaVqRDk73nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810234; c=relaxed/simple;
	bh=ylW8n+3nBTxndY7wyyCr9T4MnyutJEvsTrv0G8YfuD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0JrdHzRNqwQLpXQ4y04dCzV9NhiTucDYhzlINdGxNuMrS0x0j7dEkeu1AoE2N9wsswCwTfcoSRE4PDZK8dFZ7LgFp1wu3Vy9QKDx9obzW9vZZpPCnAG87gS20dogwnpOCPZtp6W+OGFBR65v+Iwi6pyk+tkn+m0spIILJiXFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhFYEkao; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhFYEkao"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f68b3aaf7so1292653b3a.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810232; x=1778415032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2otTEOsDaP52zBAfyZpVIM43mGdZ41h/RQWV0sgQWtU=;
        b=LhFYEkaoYSg4u/kkZ5B9Mkhv31N2OrXGBiAmk9pqmxyfU4zAL4Ftv+hfKBAu2jZahs
         wPPNTwZBu/6USO3REqC28WSIc1+W2JNCPV/eYk7m3LyP9WtblzwMhBUUMBZm0Wxv21JA
         WXTpp7lKpLqKRUHz8Xb7NolSV6O72VRMhfoxjy4I4rrMw5rTfywgDH7wKrn7Z1vDYYh1
         v6vpHctOgoq/MChfCnFkcrjqGEYKEjT7A11GuPZBS6M1WiLq7wRQrIorrPXzyXULNiIa
         pbA98urq3jzPO6Z7lg9/i0ec/5DFgm2QbXh/0oxw0DFTpQyy+XBvn/y6clbMqxPFRCrn
         LAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810232; x=1778415032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2otTEOsDaP52zBAfyZpVIM43mGdZ41h/RQWV0sgQWtU=;
        b=ra2WuOoIAViulw1YdebdQcj2RENUecnkHTeeT32MdJL7K8vqEO9+AO8x/THWFR+UeP
         Jo+wtzkNoqNZCtgLBYzBBr7IZfMC2RaOyb455OUspuCcODMfoVLTjB3uNTWjd/Gibz64
         1wxytFoLsfturIv8lTSKmRiaMwgCToFxaw7u9Upm0hpFNkB0lIb6aD3Tulmr87uWoKOB
         AreyRBFNRiD7unb1zWzo6LONV34eAoCHV83MQJuA3+GOm++KV70rBTiJksrf8Wwr7fV2
         AIYFUg+ROme4/YJ4OFPJtU+aTiX7ZwnnugzxLL1GFDO4FkYavz0CypEAy+7AGAiU32bd
         uthw==
X-Forwarded-Encrypted: i=1; AFNElJ/ExJK/ZoFqvlcpCQBGpMGfLS45Rmr4LfHFNS2IHZLUUn7ZAM/CkT/PHzwVD1EzGE0Jc7ia9WobNuQG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Wb7heK8eEr1J4dqHi7B5k+NiADakoPo6wneba2ETGXHAcVAM
	MeWrXXx5PHzI8fKWP3wgxL1FEzgGHq/+6KjHL+/uCPrSL70LJG/qdQsV
X-Gm-Gg: AeBDietNpzaPeFjfuGWV5r5Cms3zRPolgCmlt4HXq5s/lOY4DgPnAg0e4KWwWdv62oJ
	nBUMcfIZu3E/+YjVBN0TqvDtEDZZFtUPmTj6PsqJYb/rYn9dd1Mqn9crs1mMq8mNDFBZdlJ3TVl
	0wFb1lRxnML4I5QgZTks8zKWoRLEI1K7tN4dQkk25ekVhGbR0hdjch3EGHpw+qi8jAzW/79TuWL
	cQ0xm1/AsqV7WnuI+vQcbHQCOUJvWosiRu9tCxR6zW+1UnwqA/6bJHUctlZsZkWhNoKlm9/bmjU
	lCyBFpR2y+xndco4xseSDepMjuCeirG2PcbLdGHOqqOWywHbr4UNqm+mN/MEbIHe93MhkikYioz
	UAZa2ngudlXMkpftYH+mrqa9yaEMgiPUvlxpknOmQOnjXH0WEdrpaV89vr9QsHuyxKaV+W1Z1on
	RyvmMs/YSzFfa7yVA5I+Ewes24SgJIOLBxT0h5OR/q4qPgQutnDfZFlF+THeWFmBaiK8+sZcjkm
	TAcRdyBWAymUHeLA5u32eFkB2f6tI1hCkKt0rubSZxXWMqXnb8g9+XJHoxKagyQVrWwWvhCuAqG
	65CIyg==
X-Received: by 2002:a05:6a00:3c8b:b0:82f:9aa:d63d with SMTP id d2e1a72fcca58-8352d345a8emr5731659b3a.49.1777810232089;
        Sun, 03 May 2026 05:10:32 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:10:31 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Andreas Klinger <ak@it-klinger.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/11] iio: adc: hx711: move scale computation to per-device storage
Date: Sun,  3 May 2026 17:39:34 +0530
Message-ID: <20260503120949.80292-6-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503120949.80292-1-piyushpatle228@gmail.com>
References: <20260503120949.80292-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gain-to-scale table is global today, so probe-time scale updates for
one device overwrite the values used by any earlier device instance.

Fix this by making the gain table const and storing the computed scale
values per device in hx711_data.

No functional change for single-sensor configurations.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 drivers/iio/adc/hx711.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 1db8b68a8f64..8485e18c949d 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -28,22 +28,20 @@
 struct hx711_gain_to_scale {
 	int			gain;
 	int			gain_pulse;
-	int			scale;
 	int			channel;
 };
 
 /*
  * .scale depends on AVDD which in turn is known as soon as the regulator
- * is available
- * therefore we set .scale in hx711_probe()
+ * is available; it is stored per device in hx711_data.gain_scale[]
  *
  * channel A in documentation is channel 0 in source code
  * channel B in documentation is channel 1 in source code
  */
-static struct hx711_gain_to_scale hx711_gain_to_scale[HX711_GAIN_MAX] = {
-	{ 128, 1, 0, 0 },
-	{  32, 2, 0, 1 },
-	{  64, 3, 0, 0 }
+static const struct hx711_gain_to_scale hx711_gain_to_scale[HX711_GAIN_MAX] = {
+	{ 128, 1, 0, },
+	{  32, 2, 1, },
+	{  64, 3, 0, },
 };
 
 static int hx711_get_gain_to_pulse(int gain)
@@ -56,22 +54,22 @@ static int hx711_get_gain_to_pulse(int gain)
 	return 1;
 }
 
-static int hx711_get_gain_to_scale(int gain)
+static int hx711_get_gain_to_scale(const int *gain_scale, int gain)
 {
 	int i;
 
 	for (i = 0; i < HX711_GAIN_MAX; i++)
 		if (hx711_gain_to_scale[i].gain == gain)
-			return hx711_gain_to_scale[i].scale;
+			return gain_scale[i];
 	return 0;
 }
 
-static int hx711_get_scale_to_gain(int scale)
+static int hx711_get_scale_to_gain(const int *gain_scale, int scale)
 {
 	int i;
 
 	for (i = 0; i < HX711_GAIN_MAX; i++)
-		if (hx711_gain_to_scale[i].scale == scale)
+		if (gain_scale[i] == scale)
 			return hx711_gain_to_scale[i].gain;
 	return -EINVAL;
 }
@@ -82,6 +80,7 @@ struct hx711_data {
 	struct gpio_desc	*gpiod_dout;
 	int			gain_set;	/* gain set on device */
 	int			gain_chan_a;	/* gain for channel A */
+	int			gain_scale[HX711_GAIN_MAX];
 	struct mutex		lock;
 	/*
 	 * triggered buffer
@@ -290,7 +289,8 @@ static int hx711_read_raw(struct iio_dev *indio_dev,
 		*val = 0;
 		mutex_lock(&hx711_data->lock);
 
-		*val2 = hx711_get_gain_to_scale(hx711_data->gain_set);
+		*val2 = hx711_get_gain_to_scale(hx711_data->gain_scale,
+						hx711_data->gain_set);
 
 		mutex_unlock(&hx711_data->lock);
 
@@ -321,7 +321,7 @@ static int hx711_write_raw(struct iio_dev *indio_dev,
 
 		mutex_lock(&hx711_data->lock);
 
-		gain = hx711_get_scale_to_gain(val2);
+		gain = hx711_get_scale_to_gain(hx711_data->gain_scale, val2);
 		if (gain < 0) {
 			mutex_unlock(&hx711_data->lock);
 			return gain;
@@ -386,6 +386,7 @@ static ssize_t hx711_scale_available_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buf)
 {
+	struct hx711_data *hx711_data = iio_priv(dev_to_iio_dev(dev));
 	struct iio_dev_attr *iio_attr = to_iio_dev_attr(attr);
 	int channel = iio_attr->address;
 	int i, len = 0;
@@ -393,7 +394,7 @@ static ssize_t hx711_scale_available_show(struct device *dev,
 	for (i = 0; i < HX711_GAIN_MAX; i++)
 		if (hx711_gain_to_scale[i].channel == channel)
 			len += sprintf(buf + len, "0.%09d ",
-					hx711_gain_to_scale[i].scale);
+					hx711_data->gain_scale[i]);
 
 	len += sprintf(buf + len, "\n");
 
@@ -511,7 +512,7 @@ static int hx711_probe(struct platform_device *pdev)
 	ret *= 100;
 
 	for (i = 0; i < HX711_GAIN_MAX; i++)
-		hx711_gain_to_scale[i].scale =
+		hx711_data->gain_scale[i] =
 			ret / hx711_gain_to_scale[i].gain / 1678;
 
 	hx711_data->gain_set = 128;
@@ -574,4 +575,3 @@ MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
 MODULE_DESCRIPTION("HX711 bitbanging driver - ADC for weight cells");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:hx711-gpio");
-
-- 
2.43.0

