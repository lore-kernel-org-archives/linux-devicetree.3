Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC9132BF24
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442714; cv=none; b=bL/C10fZ58NI8B5YmdSA4+QQwLAKQiut9F8W4uyksSBrF8JDp4/VsDfbgeEbwevHOISpZ7wXemqN/L5PWs4Ytp9OCJkKASmn6PiHNAqrtqV7ScuuyWdKezzA5IO0D3hbhbZBNUeza7oZNjC/FRTyTzTbpUDi8TAivYLOuuHk/lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442714; c=relaxed/simple;
	bh=cr1rruskqrpDMm8vtb6PFZLYjH/f4H9vvTNeJg/pD6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q50ZnDr3llATGlOM7uoovBoAbgAERm74P//m7UYXwTaXjMJ4ykJ0QeO7/R8DdmaKsLwXmxNShn3UxX8wkSBwzXbyZDJ6GH7UEMC4b0wHiwRBbkJrsZkGNUqThX/ITV7ojRY3tEsPmHCTunewT83j9/Kojuun+nWxKvZI8PCrvLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXZ4dwtu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXZ4dwtu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2baca4df358so20892315ad.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442713; x=1779047513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVRBNZkgMu/b9a/cyt6U9gVtDXz/XCuTMVxHEa5XTmA=;
        b=IXZ4dwtudzrd2aNTOYi18P4OOjxYS0kx1KQuu61DtuCaa+5OGa4Pqpud4iwIpjsRD1
         NhNPLcS7IjWSZ3ZKiMMWtc0uUnUFLunnFCmMe3oLKeubPjHnaN/Uh76w2g/B+uEz7udP
         iBPxy7gE5CwOUoWRe7GY6PJbW/jXzt68viHlRkuFT9+EtH6ZYbGOn2zUwfbj4kFitL5G
         wGTuAkeiN+3urvYJkxjtX8muP61ziha3s2JYdgh3qE+YqVbJBvz5ueG2V5Z89kcD1+Zp
         xYPKjDBwTkjshiAUXN9J+RMjuX4M+cppkE/KZ6yRhxMeZ5DBfN6CMvBSMjGKOPcmtncE
         E+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442713; x=1779047513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OVRBNZkgMu/b9a/cyt6U9gVtDXz/XCuTMVxHEa5XTmA=;
        b=eiqYCqwxG+FfOmEYfcKXVaxrCVXDfWFdA7dhYJA8AaEiGbCPgd8vD+w3aXyoaPhlfK
         23ZYVLxpa9cRtZ/TYP+MYMFnSJS0kStkNSD1NTfyQ/x9iq6vroaDmQT+FDDExB+O1Ayh
         h7c1G3QZqXnTXfMOiIpRkjqPzmmHWVscLTmqJ0/PsAZxNeTARH8dSfNJ89gwrqTlZf5I
         F6i0qdD2dAysQEpfT2hB04nEDJiAsixYcC09MkMne0Vzc5BSRg2CC/16HlJPGN3wEzqS
         6cXHkGggYDYige/jUXuL7X/mFd0TyT/idCmDR+Oks9gi6gjrQ7wwRyPvaf43tCq5Tcn2
         JELA==
X-Forwarded-Encrypted: i=1; AFNElJ+qp8ze2D21qlsJMEVct0YtjvNTpitvyuVmtUzhNZ6H3jWj6H8FwsVizlrkPugp2pdpSmADeUNHwurf@vger.kernel.org
X-Gm-Message-State: AOJu0YwObI1ux0OKiHVRMlICjn05xqjOIy54g9Z81vUo/3L5tXZ6Ip44
	/e+cdhWrUXZvLdRdschTGUMC9NL6f0QyOd6igIG/SHDkjVhSkXY2GZqt
X-Gm-Gg: Acq92OFtEZSHMP3NwRB66FvJOd/YMzrNu0z5bBCkA8GBOaRxoSmuuxLFrExINKmXG0Z
	w1IloEV1NePXoPHoa1IFdByQ+6lEvRcUqLmJpoF7qICRgpv1uQStX0xbzPPoReggiyKvnbAsILJ
	Oyg5ZwYbG9quUEFC5ml3GAvUSd/y/9gPKNYPy+NAsTIPwPTHkd8tZ7eM3kSprXjZg6vjlbECKLr
	2Srp4NdkWMhRNNblqJMHGJlnPSM9m1Bw/t/otpRMP5xM1nQuEJgwY1rei+5Sn11jGswSJwxqyGj
	ieFmqImwReAbumb+1skyV9E9ib2zXlWQHn+olZaKDjT9aGhyTMw94q4VwbT4+xOQCK7tUI5hy7T
	9Ez/8wXJKr41QHMCKewAh+x4ipMBybsWc4RGqsHMEEz6R3G7Vp70yznZbzeP3dS2NVdb9Id+/E+
	uHr0XBAm9YESDqP1GTInWfrLioEH7HluLz8w8fq5dPbXPzibZBaOG1NLHYOJKlQMxswYy+tMot8
	k6+gJgZnfuCSGp5vkk2oYGPu+t8SjZe01BtLnz1uSK83BOUXa1wMGpyNvmr
X-Received: by 2002:a17:903:28c6:b0:2b9:4eaa:7153 with SMTP id d9443c01a7336-2ba79c0b87cmr147797285ad.19.1778442713070;
        Sun, 10 May 2026 12:51:53 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:51:52 -0700 (PDT)
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
Subject: [PATCH v7 07/11] iio: adc: hx711: pass trailing pulse count into hx711_read
Date: Mon, 11 May 2026 01:19:29 +0530
Message-ID: <20260510194947.31997-8-piyushpatle228@gmail.com>
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

Move the trailing-pulse selection out of hx711_read() and into its
callers.

This is a preparatory change so later variant-specific code can pass the
per-channel pulse count without adding a separate read path.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 331d47e1bbc4..24be690c371b 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -155,7 +155,7 @@ static int hx711_cycle(struct hx711_data *hx711_data)
 	return gpiod_get_value(hx711_data->gpiod_dout);
 }
 
-static int hx711_read(struct hx711_data *hx711_data)
+static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
 	int i, ret;
 	int value = 0;
@@ -174,7 +174,7 @@ static int hx711_read(struct hx711_data *hx711_data)
 
 	value ^= 0x800000;
 
-	for (i = 0; i < hx711_get_gain_to_pulse(hx711_data->gain_set); i++)
+	for (i = 0; i < trailing_pulses; i++)
 		hx711_cycle(hx711_data);
 
 	return value;
@@ -237,7 +237,8 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 		if (hx711_data->gain_set == 32) {
 			hx711_data->gain_set = hx711_data->gain_chan_a;
 
-			ret = hx711_read(hx711_data);
+			ret = hx711_read(hx711_data,
+					 hx711_get_gain_to_pulse(hx711_data->gain_set));
 			if (ret < 0)
 				return ret;
 
@@ -249,7 +250,8 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 		if (hx711_data->gain_set != 32) {
 			hx711_data->gain_set = 32;
 
-			ret = hx711_read(hx711_data);
+			ret = hx711_read(hx711_data,
+					 hx711_get_gain_to_pulse(hx711_data->gain_set));
 			if (ret < 0)
 				return ret;
 
@@ -264,8 +266,8 @@ static int hx711_set_gain_for_channel(struct hx711_data *hx711_data, int chan)
 
 static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 {
+	int trailing_pulses;
 	int ret;
-	int val;
 
 	/*
 	 * hx711_reset() must be called from here
@@ -280,9 +282,8 @@ static int hx711_reset_read(struct hx711_data *hx711_data, int chan)
 	if (ret < 0)
 		return ret;
 
-	val = hx711_read(hx711_data);
-
-	return val;
+	trailing_pulses = hx711_get_gain_to_pulse(hx711_data->gain_set);
+	return hx711_read(hx711_data, trailing_pulses);
 }
 
 static int hx711_read_raw(struct iio_dev *indio_dev,
@@ -349,7 +350,8 @@ static int hx711_write_raw(struct iio_dev *indio_dev,
 			if (gain != 32)
 				hx711_data->gain_chan_a = gain;
 
-			ret = hx711_read(hx711_data);
+			ret = hx711_read(hx711_data,
+					 hx711_get_gain_to_pulse(hx711_data->gain_set));
 			if (ret < 0) {
 				mutex_unlock(&hx711_data->lock);
 				return ret;
-- 
2.43.0

