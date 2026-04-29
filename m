Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8833F5A8
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441576; cv=none; b=rvudRq4DJUxXnN5HZLUWZUujv29JWjWRHy1n6Pst6lQBJBB2+SMc85ECFfqPnS4HA/sUwWEMB7wG1NipaKGTQLD7QYyiihefeAjmWWLyx55rtphHYQmdfg8u1dvgz5jpwY0kK5y9ExNgI8XlCsiSkGqsleXGmaDXpmojgQz9dmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441576; c=relaxed/simple;
	bh=DK+4iAJQPI8TVOZxQTPKT+oWqZk7F5L4jn2U7XBUkuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUVJbNerm1nc8Sb8gvlquCg21ZIBxCVpxyG0pEeUqIB9LshhHBSTWOmTtM7tQ5A8XitG91VNvW2i96wC4UGud0miT43o2DMPOA6M2HtJ/XeD6sVrTLqW1YjKfGuV2vHV3s9duxkNcTDBJ8D1rLIk37SgRd2eft4Nl3TIbLPMpNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssN+vjnF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssN+vjnF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b24fede2acso80310585ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441575; x=1778046375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vPzZS/rZf6EXGV3veckeRDfcrkozmb7gGv2DlMOJnk=;
        b=ssN+vjnFSi6pMox6RHDhif0guGovZQGKzzxiaX84zTL0qqSQI+rK01V8Wy2CTSqdN+
         mntT2sFZhVAhfIMc4OA2Iyzh3T/K9KBMdf4egzfsTWN1RmEB5fqySqP6w5SzkuAMjjS1
         FjLOtXeSCTgs7YB2ol5fiYtlXNtP+CY7B6wKsUwULvMW7jZ1iEFWwreKqKsBx94LdmKx
         WQILxwM3ONXbWxTiQh7bn9G4ezN/YU8LxDgGQZzrLeXHLiYI4S49qTC6hRq05ld/koKb
         JKO6NxMdpJv8oS6ufA2oNeu8vWWxUs6svvGFe1A7zNFef5NRann93kGfOQdR2rPzXHTl
         HPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441575; x=1778046375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5vPzZS/rZf6EXGV3veckeRDfcrkozmb7gGv2DlMOJnk=;
        b=rXkxZhLauAoJfnUfHoDAzfLy4HiStHZ6XrG3xPvaG0NqE8RfqnTWYzEmKETMwukqhA
         x8sJRS4uDWarEoo1mqerFdcfvuhnfAJPnPMDCc1WlCzNRiVrnwnKmFA3PntmKq7RRq+l
         QhqvMcXowAJp5SBOo7uTCtNyejeGBc4E/RaRHSwUvqAwpSReaHFISg1xp6cthOvzA+0l
         h3i8THKMWKFwtgASE1U9ZkWNmz+XZC8OjL5RjWzqQ7k/nBNOyWC2aYgIqbfEfdftzH7R
         zf1uTWN/IPpCBEjF6v22pDSCfT5CfvlbA78O/rPGU7GQNxglHYolV/t1YhprrAj2RCZ0
         6zdg==
X-Forwarded-Encrypted: i=1; AFNElJ8nHeRWtrI25+1E0bgSmutFkDgMyprQ5d5jviE1D2DfjeofwWYhxH0iFdJLQEJFJWe5e6ypKRW+8q8g@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFn1v0mUWjmavacDiHPuWV77VDLrcBd2fRTIRyZ67Q4kTUaPa
	2irEGskQzJi/mSZ5HQlyrrAfyt4uH1iGQsvOAKhOpSMw9x9RWMlI14hWm568Dg==
X-Gm-Gg: AeBDieurRzpE4QhPMACb1u66j5IceuY/YErT5VJq89Y12Fe9djOrHM0l+taWgIh9wYO
	THI7B4mO4RyXnhcbfl3M11H0nBRFHBbAn25MhTuZa4FGRd10ombKqWgNhYTFoh4x9Wgxf6Rkpmu
	GLk4O1oKkHD9dgJB4iDvsMn9x3wfAk/TK1rNap8UT/t3acViPpbobIyXrPMVZDvQ76eczhC11Dd
	tIFajC2PSU76v452Tz/hDrsV6reWyL+GaXHE3A0dKLYo21vax+TEP7iVUgrg2lE0cHy/645H6cW
	I9PCqxYxRjWGVK/WOlpD4LVo8tgq+A+Y52Ur0Auu6gNbautNIWUQhDMFvLe+wqIfYwIPFNemkmv
	OBvG0JBa9qLbRgxfbUVsgWKQXFz/TFLS6nor7JUhPotzrJve4kIOLsfON6YlI6pZFrW48tVXXQk
	PAb7z4X8/OLHpu9i9oD9cHuGNBf4dexrqSWcD1SIt2ZizRolcSQgTvlUrFZqRLONenmMY9yCYG/
	jaxBfhZczHxs80prIF8ToU/oksmSji5j5sMHRrE6j3mMNaj0A==
X-Received: by 2002:a17:903:1ca:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2b98747085amr22502565ad.37.1777441574553;
        Tue, 28 Apr 2026 22:46:14 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:46:14 -0700 (PDT)
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
Subject: [PATCH v5 05/11] iio: adc: hx711: move scale computation to per-device storage
Date: Wed, 29 Apr 2026 11:15:38 +0530
Message-ID: <20260429054544.123862-6-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429054544.123862-1-piyushpatle228@gmail.com>
References: <20260429054544.123862-1-piyushpatle228@gmail.com>
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
Changes in v5:
- Add trailing commas in the hx711_gain_to_scale[] initializers.
- Keep the hx711_data declaration in hx711_scale_available_show() on one
  line and preserve local declaration ordering.
Changes in v4:
- New patch added to fix the pre-existing global scale mutation bug
  reported during review.
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
