Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B989546AF08
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521494; cv=none; b=NKFFFtH+Vuk4URMnVhRcpuhhA5nXTgFUUv5V9SQgX0VJHOFzN2TUqDFrPqnSfoBI1Vdg5ngATLWGJPMTKFI13lCp32e+9J7oSBroxqgSxSgO600R2H31rc9DwWCAgudHqG31nOwXxdHr2i9uggKL2EgVrmMnFFZJVkBuMVIr358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521494; c=relaxed/simple;
	bh=jqPYoYhLKYYlSYtUJdzENTM/X/PaYeN8NKoJ7tNg6Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwO/1RaXhZWJkac9+O9m6CDSsRRquzjClRyzpr1krjN7SeoawQ0QSfHQjmH1tCw++QBM8Hjdb7xfTr8k4+Kr8fyCqIwGr678QvuePAkAuX0qoOvWzetcJIMSnWh1csSX0iCSrjfq8RtsIhD0Wf+ZTM5GVTwgJvNN9a98yA9vfLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f66b8AoJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f66b8AoJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba4a1a0325so32828795ad.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521492; x=1779126292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkXrBYxTI0izj6VrJvaEKI7ARZ6dKBgJhCCnnbAo+Vg=;
        b=f66b8AoJx7tb87aKdW+8k5iWW8HH75LCZTJoyff8cZ88msJWgDU+Ifv00Tf21wCSiu
         NBukjrY/JG360f0+Ad/MJ5TQOBvem9YIPtNlboVj4tXTaeHtznsvviWnW42TodGol28z
         bfDHxj6q+EykLfWP1mGFOg8KdadvIMpanmQr6dqaMyJMIFg/qDFkAB7BPtJHeeqGOdSD
         zNyuUuAssh++7E5K8mcXUhQAvWoEtlvCzjOeoq6ei768quFww73sZ9gl9gwgFc3RnXIw
         zsUU1gWW8m0nQr8Iw5gEgNPJikukqkufnk2ZVtY74hZa0YhRmr2HYywxIxGu1UJMwtly
         lDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521492; x=1779126292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wkXrBYxTI0izj6VrJvaEKI7ARZ6dKBgJhCCnnbAo+Vg=;
        b=soh043nG7Ug7j149MQnAKfIwU7+N5vfCw1zTr+qVErFhU59u3etTjvUapfh7FB60uy
         reZg8pFu/gArrfuDKi2DS39s3xJNGdzvGnLKu0ztIRLOSWetlKDccopWFshF0JyBkIU3
         Sq7ZJi+KQdhtLbjzs6pdB7+eKn0b5n65NA/w+Vew4gMgA4sZ2MDGfuhB7gfjIfj6Gtli
         us8y4bWAABclH78G9bHCvBgggqk+4bsEr9UQnuZU3xGjHEw1m1H5du86dImdYGFA3J+N
         84FWS0JxSNXjylDSuTy9DLOT/DQTSEuepTOruDv1rJKhUIwSdjD723syjot72JCuxuHB
         qv6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8v6qwqni2c2sZxftTA1xX2Cmcgle9GPCL+XNWQjcIfrFxsz5lx2bCDItfIoBju6zubFGBqzamS2S4X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5JArzxkdJ8C96yuS/hrhewZqictFLPXP4R8FmUglB4Q3zBgP
	fdC36xF3Ms6SU6A1dseBiY9uq+K5IlHukTbKmxu0XkxwDPLROn8ukgNZ
X-Gm-Gg: Acq92OElcy57Amh/UV1MsHNFjECue1pXc/phaY9tWJhAmS/uxSLozftHturFJYojnWi
	4r/UJKDOw7MP/aQfiPK5q5nPhBCt6+0ue7imsmtwP+dTRmr4KJc+ZkOR+vUSl/K4kXhg2cCT6eM
	tuaYbZpUEtKUCmXGJ5qypyqbA/tZl7KB1FrU5tO3kSXXd9UwPwEdfv+0pFWIe4TZlurSaYS0iJS
	OSSPjSOc4c22WPO5Lg7SSkbd1PSNbH9nXdF/XiBE0nF22x+gAuyFURTkA9uTOxjhD3EgzlQO6V5
	9FSpRMn60h6g3w25PLbyd7g3Vuwt24L7L/yPkxnc/kY7wKD54HG2lw95hRggtjR5te+hDt7o/L/
	FYBi1M6ZeMdCuZLk5guEe3y2QhetgXg7OdFw5AyqfIwkLUNqa81opA891kAfXZ1Broct3jM76+9
	sPJnwFqU8F3qaEAR3mzffc7nXUD5nSTqhRF5wuwI8ZSYTSXsPQJk0++J497YT+kR+I/K32scsS7
	RdqGnkftUubWuzsQ3PHQTXqB7nw3+/YSothLtkPjF6RlaSF9cHt9YRA1FM+
X-Received: by 2002:a17:902:e74a:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2bc7a97bd76mr117818805ad.6.1778521492108;
        Mon, 11 May 2026 10:44:52 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:44:51 -0700 (PDT)
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
Subject: [PATCH v8 v8 05/11] iio: adc: hx711: move scale computation to per-device storage
Date: Mon, 11 May 2026 23:13:30 +0530
Message-ID: <20260511174342.123820-6-piyushpatle228@gmail.com>
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

