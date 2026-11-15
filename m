Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733122;
	b=St9tq8OkUQel9De0CuSn/HpLCHwNKR1V3gwiw2//XKe9d9gBqiXTUdT8pInVr3pclGJd
	 eLB3lwiBatMm8XLzS/T12kKT2y5aVMAJXatZxFHHGm8KBPoQJAhnNbfH/pdN5zwM7zRqH
	 oMiI8WO5xoRwc4pJz63F7b1nQZO7JfKxB0hNrVBp+lALywvtbuNk33uiggnJ5RC8Rwwr0
	 xQ6bVksj+5p8DG8HPzpn44aF1gM/VFhVf5pQrVYrSQYkdhA6WJCiiexUCo6dqLunv05t/
	 LF3uPSELMmx+HOiGdWx6Lra0+2C4HYXxyQITOUp3kLJNSb1v9tNWRtI0oXnzvkhTg3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
	b=eZ902y5RHhgmdQIX9Xte5QnabzEfuZP8St0p3VM9EH4xSOWFmUo1rsfimRgxMY/FC6cc
	 Psehm1XokKmz2MnrNiJR1Yal3qAgnmJCcehQrIOmTymqJC6tvuFIpXlh7EvbMESEY49Br
	 H5dSbMsOxeUty8VXJ85pHmxsvKA6d2nASl4i3E4TkteZoPHUhzJ+dqL65VKnE0pSrU15D
	 SCgSDi3qORVdYMYAQlVNfBnaXtfPZKwOzLxXeAxhSmIzGnQrFcE7Tvv1DADucLetvKflM
	 8INyZh4phTAbZGi6pLjHpXXqQqITLz4LysH7A4IvYwxT/Z2yxiLIkKWnt9DV1lVVQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOSgHpl9;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A039D606A33F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A039D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOSgHpl9
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50604721c8so430244066b.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733120; x=1795337920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=fOSgHpl9GXgR3wKFs6GCGj4bkABY634J8kNAEkL6MydV2DQjJfhj0F3Vl3JV650N3z
         lZ8G0Dkaa5BFPtwTQ3WoUUitg1e85iLEsRZYs/euJV0jjhpzuIYy3b+dpyUd7lVG3Mlj
         q1KVFt6adpKceoZXRyIpVZQBxCXpMF0NIlvlkzHKz+eppMiTAWQLngLgH1fC1nq5B5bP
         B6h6xiVbNo7lQJG2wbY/2sIFL7Ari28PKJMRGflte1ebNW2BFwj3sP92AErsDIEQX53P
         PFBpoC5S1HJj0loHecPjmj3pKrVvgeQ+aouHRMAOM/BsSlpv7Wq1ZAOMm9sTCp+Msc9R
         dCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733120; x=1795337920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=ER8SekFOHtVR8dc8ahVXmxtvJp279JUWfEPcwHmR6GTx6Mdwdw7nd3bsgqCVCFPaB4
         pR/uU9+nxDRC/uswnVQxQV8NyhBvcRq5eAIMHOXZdc9vusRxXGCB8phnAlMJxU5Jh40v
         xJXgHQqJdU4pjyosr/YPCcmYZlFSTolyQ6koF/7uv/hiAJHZbHDdXAcYo7oVEwGjCVpX
         d/WYGH5PksTypHGNE+5RzbiS7ckss+7Anbt3NsmRLeiwGjhaxa7MJp9+FqkEcO/s1fMW
         wyEBeUU8AoM/2aPcGzG4DlHAYTJ7mKtZkW6pKgQcoYe/oUAlFSmW+lrlJkkphXlOF9a3
         GpjA==
X-Forwarded-Encrypted: i=1; AL+hErE/1hbCdnZ33CYec9VqvZdBlvov1BSsOFCx2BHhqWPHJ2ty3cbkY/MkeVhii34CgK7e6/XSreI2uClp@vger.kernel.org
X-Gm-Message-State: APuU4Z+vOKhyKz23oH0FyF0+nVDvU0Ch6Y8nFN84VqI3sK5H94WGHopc
	v1BoFgnXgHUrgUBcgdIg5IeKmAnrc1OB1ZKE9RPCxgTal7Rjszp4svhC
X-Gm-Gg: AYBFou0s9bqX5B9XLBJL3vv1k0eBESijsfu+mrZ++sNeygP7aiKAEKZeDbqpyjnRN2K
	D5hIcLGw+xovbIb4EXEDg/pjnjTtfnsPOdSz/bmOr8l8fIkkuyEf+pd7HbiSjiWA1Y66bXa08js
	RbOsE3P37aR9CcNi6gm3AnVR+EnjKYYPYSmiBNrjUXjzo+n/4TWh2CXtnQVWdYDsS+5BcZ+547h
	e31LllDZUbODugD8qH51/CptCDQc94WA3l1WJSSBA0RYBNb0Dqsc42Jo4HZ0iAwyud2VbUkIwbS
	GSD6qCBYYt2PI8EYdV53uMgjDYd0JqPVSnQheCsuMOkK6aulWMW7tNrPiH4FHIhb6/Oa/hMOI/b
	Q07yEb8S3T/dIiVxM/NasF4gUHXS62RBHYMa2XHcUCWeG5Ljgsn6aMv9LLnyif6ucYktfrqUD2T
	NG5/PZBQ7RrquoVe4YE1nohqRILFick6ZDbiHzYGJA4FHC77tVU9+O/o0lGYGpBaAEdEhxlWUDc
	19O5Tc09nloCJaoLHEjZBWh1I7V6qrmkZ7PMozYUDdfN0X40CMtmgsHJJQiZCQ19jkVnXWy0UOb
	47c7628NF5FfQfnkA17RusKOmqT6ExHl0vU1dHHEKr9SZSS6fUwibElpOhRGHAQlI5lsJdV6gPF
	Dj9oP5GyYV1ZTpAPuR4C2b3M8lM4Xh0g=
X-Received: by 2002:a17:907:3f20:b0:c41:4d5:e97c with SMTP id a640c23a62f3a-c509640f665mr613525366b.37.1794733120092;
        Sun, 15 Nov 2026 00:58:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Sun, 15 Nov 2026 10:58:23 +0200
Message-ID: <20261115085826.89641-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 5af36d3784f11..ea955b55bca18 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -20,22 +20,9 @@ struct aat2870_bl_driver_data {
 	struct backlight_device *bd;
 
 	int channels;
-	int max_current;
 	int brightness; /* current brightness */
 };
 
-static inline int aat2870_brightness(struct aat2870_bl_driver_data *aat2870_bl,
-				     int brightness)
-{
-	struct backlight_device *bd = aat2870_bl->bd;
-	int val;
-
-	val = brightness * (aat2870_bl->max_current - 1);
-	val /= bd->props.max_brightness;
-
-	return val;
-}
-
 static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
 {
 	struct aat2870_data *aat2870
@@ -69,10 +56,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
 	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
 		 bd->props.brightness, bd->props.power, bd->props.state);
 
-	ret = aat2870->write(aat2870, AAT2870_BLM,
-			     (u8)aat2870_brightness(aat2870_bl, brightness));
-	if (ret < 0)
-		return ret;
+	if (brightness) {
+		ret = aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (brightness == 0) {
 		ret = aat2870_bl_disable(aat2870_bl);
@@ -143,15 +131,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	else
 		aat2870_bl->channels = AAT2870_BL_CH_ALL;
 
+	/*
+	 * The maximum number of brightness steps is determined by the max current.
+	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 */
 	if (pdata->max_current > 0)
-		aat2870_bl->max_current = pdata->max_current;
-	else
-		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
-
-	if (pdata->max_brightness > 0)
-		bd->props.max_brightness = pdata->max_brightness;
+		bd->props.max_brightness = pdata->max_current;
 	else
-		bd->props.max_brightness = 255;
+		bd->props.max_brightness = AAT2870_CURRENT_27_9;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

