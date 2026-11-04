Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795853;
	b=5Xa4yiMpYSv49ikHXeeXPttSWQVyeM5Df+AO//tCrqY0Tay1ppvqfiCUfg1GN+j+TQnU
	 HwsePUCoScAP3S33ttCOEbys6ZtelV9plqMC3XPYuq2P/nfYn6bfGoWadAxt04MPxUC3B
	 z2JGiHJMLLW82fm1Y7hLn1FDvxN1XO4DYWjKA5F7kT+MPSE20U1xflZKMkWzRyDKD5qI/
	 S4RHJMKFwS8ZjppBFVyvYlC+PamnlskfNA2pC10fHGxsTjXwgGUDlTbjxsClFrWRfV6bU
	 7sjo+dVUxBEnb8Q7+yVVJ/n8LCEDgxCZAootaXGDTvGeAqRtzWfER/QFVr+0HuUbxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
	b=uuN1K+InokrS+pUO6h7yrYy+AUqlwbvuX4fQbcfInIRXRnnzJ/gAuLDCf2ZDhs+AE6K5
	 mJkGBUbOcjV/Ktv/+Ki6kp0tUMGVF9NN5Cl2nibzvv1n8VlSyzzgQm0OlO3XQ+C8L60Ar
	 onINFDukq3Sx/8299quX9PXG6lGDXSpYU3MK/K4CnIQlshir4hNLCTpDrGx7HK/bfjY6Q
	 9ZNHfQIKiX5AOn1UBsjgB12vF2Am1+Qxv7Ksg39c/LLPWHBKAhXzWjcq+TWWepCEarYNI
	 KdFDaHm+jXbGhw5e2rUJdaeDtwBjNPTVz11JyBSwHDqWQbFITb0++RI6kJaujHNb1kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5Y1OxfR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF07606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF07606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5Y1OxfR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4406945e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795852; x=1794400652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=Y5Y1OxfR3iKK0ypVDOdWcQvNfthHypgwkGVNzqCHG2plZTtuULAlXt3pqae1J2hJxB
         hyM6SbdNzXrIDnEVDU2s4Mc9TN1SnHmMkXeiLTEqQ8psc7UrRXxUd+AiXCVVObAwyDHH
         dTyVeyrh4gBUQSpyuTzZzWJLW0ZNlW3xLETnR0SqouXCNNN2KH9e5otVd8dRL+TTxoGm
         viI+HNNP1ODZ0PxpihCigS6B4QFgTNxUyAs67tr7AdhrZTycCcYfhHvksjgmfsGqaa3I
         2hvjhbpWq3zOpLXIMzLCi2nFsehfjOWhW+/8NkETtgtaU3SQKNLE3Z//HkMULMxy8Msz
         mnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795852; x=1794400652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=Apd4IARd5ySVQBgEhuYr8iDvz7FVHbvEmxbM6w5AYY+G/u3s2ZjqhAQh+EqhD0DlPX
         UYyZxo8RUkkKi09mqvU3zFimYFSEunAqlXavPngbfpRSmj0rZvE56XS6ozuwkFDe/wCr
         QwntPP29nUcmZDFwB1LslMPjQJHJHd2ustO6WjCL5yx/+mvxg/mvS+I96kPwB14ritUZ
         RsLWgilnM296KV9OwipFcUxx1NZLnkqSYSmbF0W+nwzGXGCQz3Yb6IA8zq6FBxQgFMdg
         fpS5oWdLFm5MJSUAdH0FAqAxC20al7elZjaFFH14KMCgDdj4TpFzuHCZD68riZpJfz8t
         tL6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtVRUfGtNDfk4Dha0gSoVLcXtMSBfb6KQpc3/OJx3nqPM1WUUW0nqvIx1JJxClSSGzLu2NN3PjWzQ+@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yg8MGu4HFKTSBwxy74nSqmPOwztul4eYDg8ZPGjonjbeZQaiv
	jBpyVgnxgAQUbDRJWNmQVMkXyURvta1QJnlvCdN6nJnoBRbM/W4PJAIe
X-Gm-Gg: AYBFou2RjTLgxB5NC8CyrLOBlPK7XCUAzrBmxIAulLhh9Ud7Gw/Q4+7OegEwJx4qhfV
	iOcaqexuqdcKoh2VoNWmoMHP+VK4ddB3cOeskT0vtSWMYyHjR2doJ/tMweVACD3nG5DZRn70MX6
	3ffZO2/XoHtrmjUVHQrgYWmirnSaQIkK484uAr3pEe/gxQLFaJ5apKZu82ftLottDCZMJ3BvjAj
	I72T+pKgEslNh/ncqjn2n8hOEl+RrDCkxe4SkjCxbkh7t7qziHhIntoXuGr6N+1vBC3Y5BfxlAZ
	d5s2hMV/mdv2olhkXyLKKzraKRznTYS7EkBbLBF+brYE63nn/tjZjbHZCJXBoYCv7pxzXnApJEd
	J5vgW4MRsff91m6uBEEV8nZi3Ml4Suguu5EQ3nENhfEFY6FTcXRGa5z+DCLiQ0mjGiZDRf2jc+2
	3xiEg1UXuA2xhP4IxH+CWimzV2VidfqQqZX+/VGSXu3knxradYm75U5ySO5WtYd23/etJDJljFR
	/O/MJltgVg6p38TANpKj6FFTdbEc+27VAZAMNU/EQ9/DSXqLg3FhAeLi6EsCcpXK6Y1k2Zs4Uts
	tZFmED04E9zMZpIy2B0dltaTzT44sgHp0XuTejwcMM6a+6v5fg==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr367279085e9.27.1793795851589;
        Wed, 04 Nov 2026 04:37:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
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
Subject: [PATCH v6 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Wed,  4 Nov 2026 14:37:12 +0200
Message-ID: <20261104123714.234634-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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
index 8b790df1e842b..e85f2b4d81068 100644
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
@@ -145,15 +133,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
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

