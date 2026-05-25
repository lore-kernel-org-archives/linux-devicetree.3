Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C153E63AF
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706325; cv=none; b=uB2Yl4p4EiqDgJo+BgZR4GXDsB3JLoLAvgJb9WQ8UZK1V/7KoiwNkikFlbB88/3A9KHu5lGcy4DHVvD6YqCFhpcDfpFwd3XXJT8bzwOBIw+2H65/ySXDdJ2liovKQTogEopBaxXOxFKM2eMocxyFoZ9slA6HrBzsn3nbJIrK1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706325; c=relaxed/simple;
	bh=jqPYoYhLKYYlSYtUJdzENTM/X/PaYeN8NKoJ7tNg6Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/mVR/I+0iZ6SlzCjeF/6+3PQ/36PYudI3VMz7C4mgoS+bxPEtfFcnGfylla0NlOuBXTx3c16Qy/YBRLUivBUhiz/Hzwgsgopfn+lU1V/vCj6F5X0ZZYiTO6CFLl0rLTGcQVrK+wNOMcjZI2gHc2PkaumAg4QEFKeqgDShvDPLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raPianl2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raPianl2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so8801344a91.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706323; x=1780311123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkXrBYxTI0izj6VrJvaEKI7ARZ6dKBgJhCCnnbAo+Vg=;
        b=raPianl2aAU5SCgXT1HVAAaAbEst5RjcHjMgZMSXqTLot7y0CWP8Vg785j+ofSEHyf
         VE/E0xxZn+tKg01sy4UX9Vg/Woa6znSPJwk5e6UDE3gDKooskW6DohxST7/tHJ8s+yKi
         wNiaNRkzNlJDvTl6km/J/XyKabykRaM7y0imw+FDMEUIzVkv8EYeCXlUNG20pyiZlkHh
         leSvsUwJTU7jiKozkflJMBGzA+nJGpBUK1iIotWRdyw6nAh0FrROcy8YDRoQq5JuWCfT
         mAumT1LMHROhK+MZ9LZq673gFw9OzP3tx9pBoSw38rsZ+97PJ/4sNrFuR4KzOaiHd+L/
         9+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706323; x=1780311123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wkXrBYxTI0izj6VrJvaEKI7ARZ6dKBgJhCCnnbAo+Vg=;
        b=PQRLg/XC6dKb365UGxrOpP0wjoglFRVcyXn+83KhSEdVovoibrPmip94lyw3hh6qjI
         IL63L+64ecNvWGXxUTNH3ECJppRqNVfvdkvDICJdTrsS14gk50pYk15Nhm0pv/4VWY19
         iD1ln0cuISgKfKKvYi2/GBLJ1pBgzbGfcZKnvYzcqV4nz9aES5tFdKdjusir87Ba8SKv
         vc7tSgaxR1Eo9tMH5f2gT3HIBeAzmLqJUIFqgZCCIVzKsYxCxkqiIbC/9N77x6Uu91ko
         mg1Cacs3mFb7SoBQlTBoXnyiDnyDsuZGSPwu7ldR4XXClTwmQrHU/eghQGbWqj0tK3DS
         Er5g==
X-Forwarded-Encrypted: i=1; AFNElJ/yf9ET06myXC7yHkw5jn0ucHJcqfz2FgV1U4s44el2XyC214vYyQTGYMxVrevMREyDXwI+gMnR9rRT@vger.kernel.org
X-Gm-Message-State: AOJu0YzdgwCNK/NkaRmDMY/xIrXwfRdyz7ysxVrUlyb61i4hn3lBJeBG
	79/4NZrhnejbTqbFWlvsWnwIT+GulBARuvXy4unhqQJ6el7uM+4+lAnE
X-Gm-Gg: Acq92OHdeDBagndrfv7NpNN6slKO6JusgTyyog+kGp+hPOcaOOSLglO3A0LUEiBI3gx
	6ysg2ZWZUyLcYY4/zUCAHVQ40kDLX8GWeuvrMOqKnDYM/oRJND8o3CVAiimLqw76n/4xHi2PWH5
	zD0MvNY87NLbNC2sC29vDyu4Z27rSOD1yRdE/tIoPRCkGi+XnJqitOBE1MwLtZPkCaPB/8g2mcw
	93LeFHltI2prRE/6Vxgpwd0koYjOCzLjuJ0I6v8Xf8hLj/qCMA1MwhXRYREiF26UgsyTMNh4VsF
	LhUGJvaBd6mEn17ZQsVEQiwhyvHROm31eHio2ilwiEmBDL39T752aeR2Q639GMJ3Rkw6dtPTBAz
	43RfBS0Npi4p4MOAKQ6vvWrm3GK3pPsFFtAmtiwfs5GumMM6yoVI7iG5n5DR9i8JkY2r7xj1tYT
	8Ofugk6QYMVT6sX8aF9QB3Nt1E9xPs7yFSbK/3HlYepztD/ln4Jt1wzgOYSD4Bww44azdwqwEyL
	2dAyVaxOS+i/vp4D78tOYKAkaNcq5WdyJtZBSrWyA==
X-Received: by 2002:a17:90a:c88d:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-36a67616988mr14689661a91.22.1779706323154;
        Mon, 25 May 2026 03:52:03 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:52:02 -0700 (PDT)
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
Subject: [PATCH v10 05/11] iio: adc: hx711: move scale computation to per-device storage
Date: Mon, 25 May 2026 16:21:21 +0530
Message-ID: <20260525105127.180156-6-piyushpatle228@gmail.com>
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

The gain-to-scale table is global today, so probe-time scale updates for
one device overwrite the values used by any earlier device instance.

Fix this by making the gain table const and storing the computed scale
values per device in hx711_data.

No functional change for single-sensor configurations.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 1db8b68a8f64..86d2a70dd3de 100644
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
+	{ 128, 1, 0 },
+	{  32, 2, 1 },
+	{  64, 3, 0 },
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
+				       hx711_data->gain_scale[i]);
 
 	len += sprintf(buf + len, "\n");
 
@@ -511,7 +512,7 @@ static int hx711_probe(struct platform_device *pdev)
 	ret *= 100;
 
 	for (i = 0; i < HX711_GAIN_MAX; i++)
-		hx711_gain_to_scale[i].scale =
+		hx711_data->gain_scale[i] =
 			ret / hx711_gain_to_scale[i].gain / 1678;
 
 	hx711_data->gain_set = 128;
-- 
2.43.0

