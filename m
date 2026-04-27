Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFE3B47DC
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284623; cv=none; b=tOGjUqZfd9FkMfFnYUHkKwlZfXCT6VBG7NUYtwuNmnLRRqieSGjPmiEA1AotwPACI19nB5bU+GwJ44uKU2daOGMwe6dsvrftRmGlAK0K2ZVesMrXlrVc/iahzTUBqVlIjrEVzhqGJt5x1wJPax23oLC4xItNGdUMlwtZt1brwQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284623; c=relaxed/simple;
	bh=blwxWP3h9amTde2/60twniELsnmcE0y3nMKAe9J7CRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qX0VjCyWcThEoJ10BjNOWPljEGnNiblW9sqYFPTHshrOl0tlhIc/PaCuE1qSl3EHD4pzcQQKLLIvIdXo7dcNVrxcanUPi4IHjLpsRINf8C+oQXkgv0anO1cilGS93OClWHOby0Xlb7YVEV51o3ckgDUA5B6KmpQDQlE9gcItuwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHFi/5vs; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHFi/5vs"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83177129e28so1645441b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284622; x=1777889422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErQtAdu2cnmpY8o88AkDpSJug3ccvxHHCZ8c7OJd9d0=;
        b=dHFi/5vs8j1aCm7U98CaBkzf5T87T+290C7/cQyTrNNwIQke+1qohmAjOeXjJu9KCN
         uOmj6xXTxj98LjcloaoaXpwTcdFWxPzcZuluu2jA3zbTKzarhCSjoIrL99Kv6ZIcsrRu
         a9baiqHm46shnl3HSTM3gOKMmU9f6vWL0SJZ6B3YEmbfTKJSZUlLMoCJWBSmIJ7vID5H
         oKKOUJL0DjwLrGa7QXJQlG12I7uS5P491Zs+463GRdedqPsFpad35dl4XBZ3u4CWqE/+
         kXznIyv0/TMLBoDxy3pPvhwbenZpqMCL68UFcxMqac78qOHXq97P3eesvNubPz0uGFPj
         apgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284622; x=1777889422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErQtAdu2cnmpY8o88AkDpSJug3ccvxHHCZ8c7OJd9d0=;
        b=l19UhiUg91DBQEKNz6udM33hSRodRloWpUCcsXI0q/FtejIMJsSSRJiPvqH7RKedA+
         l3eI/f1cCO6Qv22UxjZilisWHM+empcrkRVU0+03oa7TFPYZ0EvmHKBEohxL8fhwdXLc
         nGznMJPRR/LbqekYSfGZYEos1Jq2/cimycj0wT3aW1X0REEAW5mdLf0xGZZ4reDDLaC2
         s9FgLTxxmKO0EcLErLhcr1pfI075KomfMwZC/lHOy4YRRzkHXIG67R3Z7ztE/zJGoqlG
         wbE03RqC25uqzImdoizrudeZiHSstHCsP/z20m6QgeSHPL9YBmg0CZk8+zQnV76BVzin
         GlUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8B3gtEch1RQeMLI5S0N+b9HHV21qp2VOnOevrVkdmT2fyW65KOxuJw61RG9CrCIP5khzF9BeLksdHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YySF3lnn1eSDi0NciM79bdXLDN5mY7XjcXJuQTXOL3ODuBovkQn
	6IFhNmRVojqrZATj3aWi3i5pFotMPVZxLU8peyhiLyxvFa9lMT3VvAg7
X-Gm-Gg: AeBDieu0jRdYTtkS7vx8OAGyyFuJM87L/y796RebGeH01GkWwLwrRezhAIiFoSYFBOM
	TUV6lnvkETvTy05ytIePuqonV01jqC+ZCGbC96WjroNura2IWyvZR9BmSt/V/D6QYT5C1oGsD/+
	uM/ZRAvVbfB8pHL8f1nO/AgHtorc8rW1MuXzPyqIQCMwNZVnCort/6/bPBn2Qjsp7x+PtAGpgl5
	LJ85C0xrG4LiHdYkZAO7k1qAr5K59i2gIoPzk5mwOM+tCJH1gOVx7OZHzC6UcAJQMytFVqtYyWs
	PsdQMGV/HkEI6mK2eWDNuEPJoxAr6xYqj8e+uhIGeBIxjVn1alA9VrPHxrjiLXmgy9yFttMFiKw
	pV8J7qC3UV3A5v1anGsTdcjP5JspPHD2CiQQAGwkHaN7TmTMUGIPyDlQfsUecWnL+3RZxLtHBOg
	Z10jKefrk4Phjmt5/BbsQQZlYWa8uKTTnd0l5AP7ook4pMXb0vSX2o01vB1Y/KKfNIKKiVaPKXW
	ZQuH+i7v2cvITPU7izagxPQTJyDlqCzA0SgDhaR+FRynxktffbagcjEPdGP
X-Received: by 2002:a05:6a00:439b:b0:82f:8696:5a75 with SMTP id d2e1a72fcca58-82f8c8bb700mr44837198b3a.28.1777284621666;
        Mon, 27 Apr 2026 03:10:21 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d016:e577:22da:dc9:7f6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39534225b3a.38.2026.04.27.03.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:10:20 -0700 (PDT)
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
Subject: [PATCH v4 2/7] iio: adc: hx711: move scale computation to per-device storage
Date: Mon, 27 Apr 2026 15:39:33 +0530
Message-ID: <20260427100950.33936-3-piyushpatle228@gmail.com>
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

The gain-to-scale table hx711_gain_to_scale[] is a global array whose
.scale fields are overwritten in hx711_probe() using the AVDD voltage
read at probe time. When two HX711 sensors are connected to supplies at
different voltages, the second probe call overwrites the scale values
computed for the first sensor, silently corrupting its readings.

Fix this by removing the .scale field from the global table, making the
table const, and adding a per-instance gain_scale[] array to hx711_data.
Populate gain_scale[] in hx711_probe() using the device's own AVDD
regulator voltage. Update hx711_get_gain_to_scale() and
hx711_get_scale_to_gain() to take the per-instance array as a parameter,
and update hx711_scale_available_show() to retrieve it via iio_priv().

No functional change for single-sensor configurations.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v4:
- New patch. Fixes a pre-existing bug reported during v3 review: the
  global hx711_gain_to_scale[].scale is overwritten on each probe call,
  breaking multiple sensor instances with different AVDD supplies.
---
 drivers/iio/adc/hx711.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 1db8b68a8f64..0776a23bf59b 100644
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
+	{  64, 3, 0 }
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
@@ -388,12 +388,14 @@ static ssize_t hx711_scale_available_show(struct device *dev,
 {
 	struct iio_dev_attr *iio_attr = to_iio_dev_attr(attr);
 	int channel = iio_attr->address;
+	struct hx711_data *hx711_data =
+				iio_priv(dev_to_iio_dev(dev));
 	int i, len = 0;
 
 	for (i = 0; i < HX711_GAIN_MAX; i++)
 		if (hx711_gain_to_scale[i].channel == channel)
 			len += sprintf(buf + len, "0.%09d ",
-					hx711_gain_to_scale[i].scale);
+					hx711_data->gain_scale[i]);
 
 	len += sprintf(buf + len, "\n");
 
@@ -511,7 +513,7 @@ static int hx711_probe(struct platform_device *pdev)
 	ret *= 100;
 
 	for (i = 0; i < HX711_GAIN_MAX; i++)
-		hx711_gain_to_scale[i].scale =
+		hx711_data->gain_scale[i] =
 			ret / hx711_gain_to_scale[i].gain / 1678;
 
 	hx711_data->gain_set = 128;
-- 
2.43.0

