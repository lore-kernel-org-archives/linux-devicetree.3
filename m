Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03BE31F9BB
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442685; cv=none; b=polYMQ0DiyH4XtVmb3ZKgTcXCICZ32OaH64unSYEC2N8ghbFotlNw+Q/dnCsRSQDafALI4B4yZXv8R1e1R9bFkAPyFRl/oz43vsyngLU6IXjwTI0SKhIxrX40FiHX1WLSkseQY4Ux8hU6WtxWZBld4qkDvunvFXF6q0wpvsMHC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442685; c=relaxed/simple;
	bh=bhAlegkovFkwJTJxeT71YFHTPPIyYvD35U+P4pge5j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3K+IQ+Aww92Ktipy2uuogKzs5Kl64QSeGSi9CPEPasN0GQE2Uu89lckwGG/GIpSUABdeNDmXNziBE+FZOdKSPNPK/8AZqv/6kIH00glwi5e9F5ycrkLF4fLhMKInFN9bu1fHig9UPe+S+s1pw9dZiFDgFoqSh0aTrHL/VgtLOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyMcVEcl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyMcVEcl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b788a98557so26557785ad.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442683; x=1779047483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJwisOEN3ob5Rkf/2eM2QOSlejeWPelQyp39rV+wcvI=;
        b=QyMcVEclzcTd9Jyio30QOn1K6JfFMFh9DUqejTG8v0iFogp0oLf6CuI4vEdQLS6LRR
         BO3tbk3t7z2BmyO47JxzQ4CBiSsRWM7zYgrW5tVoMs8xiWGjokt8fza6j1/wqyCIHdpG
         3rpj8QPfVukoqBjlWKaeruwG8hRIyELX1nHs8zFZlZW6Lrl1pXBTSKKBlSVqGgtt6KeP
         EioWENCM2iOWrMXUYQOY+ws/rGwQz/V3BPJS+IIhzsqzcJXxuvSbl2ALH3KWduLO+L9V
         fwMDLxsLmopZS5YZczaBFcpgF7T9+rMgecd9yCtbymLXbVX8BSIFf03Re1RfwnB0hl8N
         95pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442683; x=1779047483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJwisOEN3ob5Rkf/2eM2QOSlejeWPelQyp39rV+wcvI=;
        b=ONLBcCVbgkZwoP8ivko0WY96W8A8Uet3pc5paRZPAQyRGUfb8eieX5vNH8gPGl993l
         f0tC9HoPg2SGxvwEolGTINzcbnusEt6fGGoKGYTC9Dwu3GDWstN5nhDIOjemq3vjqMpG
         Bq97XChXP49ziubnT7dkcfu4vivbqn01GCjDX1R4knwwNlmt/ugSMk4pVzFe41c5PnBH
         zlHo7lVcricAlppZ/4pLqol5OELgWaRQPMAuggyVI1cNdstu1By/sH8ws6kY2sWSCzCN
         hogO10+ROrM2oq5Jm1QZqlD7+ZPUHx8zJM/HxRKbR/ACnznCYCNWEdrqHXy813hqukFE
         JCDA==
X-Forwarded-Encrypted: i=1; AFNElJ/TJQIqLNLPFyxgqWCpd8wqsuMyE/q1TQivV69LHi2D7nXKR6cOCBdrveJRjVhNmiKbReHss+o17OUi@vger.kernel.org
X-Gm-Message-State: AOJu0YyE44DlteLoSap/hcAKloA3n3Tnzs0BKqjXqom2dWOi0cfmbjl1
	foFuh8e3wBlthW1lFEA868KnQ9jrgApR8ZPtehgC3JnusSngmrZ5wSTp
X-Gm-Gg: Acq92OGnaSgJjLKDZK5BYIpk0rGglVS8Ll8uUywYdnQOxfB4L5fx2Pyz/zvgoMnR6gF
	4Y0XTRzwNajESkOEszvhu1EZzMegFaXrsA8sn3qToQuKPMxYBktRx95uEuhEmRIOx3CR23hqSjP
	AJDKI8Txs52aYB5ZAYr8PPsg9G/ntyU5ue8aOJXVcYszPEd5/M2DmPdAYI2SXU4IHx3m3q4FUGt
	KPUEdFqjlEokUcVGlyeiPuJdsgac7NggbXEHj9mq2RvKGx5PE75ydnW8DojjZbuMHymtDZk9aku
	vQPLyNSqMbYhs2hmK0JzBKzO5Zs4kftolvWGy3wULPBFA1NeGhpbwDEcX1P1nSKT88UVbQfJFgS
	y+/LnHbuKyp6xnR6eqW2d3u9+z76Uzd2IfcXzDUSls+soMZb4Ldyn9xxc3EBWP+aIGhiuSHbtSr
	789hl8cA5cJ0egX8gYAd0escilXXGLLyaKOEqeZw+jux5ZX71/zgczpaGjQioPJZLs4SAcsiUO7
	0NzMVC+2gJRfFv0uLN0KjfJq/YUrJod79eav50hptjYqYrOmxDGl4qer1hn1wKcS7xPPeQ=
X-Received: by 2002:a17:903:1ac6:b0:2bc:cb97:8ab7 with SMTP id d9443c01a7336-2bccb978bfemr8417845ad.25.1778442683090;
        Sun, 10 May 2026 12:51:23 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:51:22 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/11] iio: adc: hx711: move scale computation to per-device storage
Date: Mon, 11 May 2026 01:19:27 +0530
Message-ID: <20260510194947.31997-6-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510194947.31997-1-piyushpatle228@gmail.com>
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
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
index 1db8b68a8f64..01097e0fb848 100644
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
+					hx711_data->gain_scale[i]);
 
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

