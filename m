Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE44C3E9F93
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706335; cv=none; b=NPa2+HlFluU0Wtg+JOnmJ8UX8O4mVIeZhVqWfkNW7/+mjKWtNaaeW0kwVupmB+akHDqxhb9vofOUM1RlA/P83S+QcYuOwBXHZyXN5oxrOBaPrAdvG1IbeGCkHnjKmfSXNp/Ur6m2euY7FZJssNAufum1Iqv7TRWylPKyAQtQIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706335; c=relaxed/simple;
	bh=aTUwaw1cZjKNO7pd1qP0S4T7HG4+2wRyJbUWydgN08M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKwHpkh//oSOfQE8TMDWCb8iFNzPI7hnqm9BxD22y96hBM+U1v6DQebvUOerxXkZRYYayVJItShameIYfCN+7ACa0l5Nm8SSXJ6K57Blz8WyUcXy+nISTxlvxrlvMv5qiLKgZlqWAaKVIajCPB7lAhCQI5jK2rWON4vsV8WWKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g26pvKJk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g26pvKJk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-369002b26f4so5366877a91.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706333; x=1780311133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4zRyyXIwuf/G23ISEa4BernDl6SyQJXsQmJd0MnDOM=;
        b=g26pvKJk8kJkKq4DB+Ey2H5NxktwBMySmxYg2LknZX71pD9WGl5QnLA21aq66PIbOE
         lo89xOMrZsrNjWBVd7+n/UE2Y93gYr8m29p5muRUknrKSA3aGXxapxWnRjuf42Qv9hbB
         8W/JDt9s8VVj3/KILDK/605zz7xFcMzZZsTd4d483hXxCk0bkslq4gtViW+awgIi3GGw
         Qo/NwKfsb/japKCVN+5EIgnv8/O/asGmROBG1DyB3FSvw75DV2p2QaeAM/LReCc63W7A
         mOph3eSdXqm2u+zVTe9+HXog2rObT+sT5Gblednrddr0wWjLaRt/pskLm2IoB8LuhM6/
         ncMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706333; x=1780311133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4zRyyXIwuf/G23ISEa4BernDl6SyQJXsQmJd0MnDOM=;
        b=JB+4s5bi+IiZckt8n8PZ22KKgcRtFZqXIvu/mwxfPDoq7wSSh01Cqunl+XBNOqlOJB
         aXVgXxWNH+jKlTSbxjxdqo1u47elUMA7xzfgX14bsWqDx0lkRtgc/YrsS40Iua6V2tcC
         qu7JcN5yUgHaDWwCB7geg0NZopcJP9uDlrGOrNxtx0NCEoAa1ZwJO3wx3XGWiMq9DyTQ
         wfa16njHfDP54IriglhdO6BL+UDaJ9GenC8DWrIMlJULwOPOY0WipEWHo4kSXWqDZTYF
         nioBW915s+OXaIEPm0cE1owDxCnXZnNyPaadT1Rvvr66YvdQqAONqb035FdKXfCe70sd
         ykTA==
X-Forwarded-Encrypted: i=1; AFNElJ+56rkFwAsBrOJS4uAYdR5mcPnvaIyLgx14hm2KOzpkT3dY4mvrBop56Jlto0KchmAxWfLA1fICMZPe@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRnsG8MesR+ljX+7RfPiuGGvS/dpA18tMl5HGKVS06rgTDnEa
	C8RO5trIIqlJr674XDCJgzGfmKzkLgSLiia4OofVdW8kIEpwAY/zN9Oc
X-Gm-Gg: Acq92OENW15HHwW0Fp92DnruU1zlrANfdhv5mPty2EI/ItGr711gbYH3kWUM4eYSHAB
	wsnRt5dQJacS7/NnTgC3zNVWJcLZuWLukEjo85hE8GaOq/dvgy2b7ueEYH5/QfAHI3mAkfkU1qk
	f2Iiuj4wH1Lhv0vfWCz/pM3trSwXBKzQAJK356zBRFz1hNSrUNh+JHoIS6I9vV08oxdnoHIH+2h
	+asifI7woKteqsD3Y6/7OEafHzOROR6iZcJwY4yp9acDKhUlf1wDBq54zRvVQkJbNo7ZN5VhSTI
	z17KEbD88XIGrW3UCn8HwPdlGCfiFW433c25wiMxHXcMPGPxfCbqTlYwjUXiP8yEJkqVI1yyu8Q
	Atr3bd4J/ijo3KBIV3d1upQ9ddgF4QucPSEkP0AlweZn97zVTQfoCMc6lad62RKq6Op4nL1V6nT
	XFQ+LjJWKmNzzXrhranX3A4k9tyLlYmxDYuhzbHoSSihSDATIu+wVBdbmHoWCyilE0J8QCnGPQu
	IuHGQ2K+3a+9dVq4ROzTqXkLtlgFwx04HpBZUy3TNHr/hpUat+J
X-Received: by 2002:a17:90b:3851:b0:368:ddd7:abcd with SMTP id 98e67ed59e1d1-36a678a1050mr12493640a91.27.1779706332818;
        Mon, 25 May 2026 03:52:12 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:52:11 -0700 (PDT)
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
Subject: [PATCH v10 07/11] iio: adc: hx711: pass trailing pulse count into hx711_read
Date: Mon, 25 May 2026 16:21:23 +0530
Message-ID: <20260525105127.180156-8-piyushpatle228@gmail.com>
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
index 10ccc69f209b..30e1ce321747 100644
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

