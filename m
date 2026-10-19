Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA544CDDD7
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404587; cv=none; b=oQxYvFh2gdUIb2bJxgGa/s0plyKoavk1aZTyersug7rCVbTY/aI5E65QbQjZ5LwWlhshcTmILpKpyDLu/fcty1lv1+lbVPZr9LaBW2D08Jao5L2/7lurjv7rEEiGsCN7MC+04OhO2AD5YzEggj4mRiz/817McxPxUA2b5DiMlPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404587; c=relaxed/simple;
	bh=PkwePPbuzVu9fbzReX4tE5VcjsQsyH/gZI5uyzCeZOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+NXKawmCw/WFVeAjZwbEW/IVsecOVG8vd1DoB7FQ4rjeiBDDMLk403/ztqaqyOsQKse03QrDVcpYrzEFlUbo4111Yz2nJZUAJcFP25l8uQRbKBuScQjd8B7bNW00yA1IljWfWsUx7hkFAVXE6wKtrkD/xWNkh8xF6iEguJVm48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4hrPBmh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4hrPBmh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso933203f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404584; x=1793009384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/trV4jow8NDaSDq91x2ETJmC0OZjy2jDwgvKC6ameE=;
        b=r4hrPBmhqUjTPiOJa0j+vGxGTczI9XmY5BAra20vRCr89VY/BKzAQYgL0/+YjjJLCB
         pKdClt5u4RcNM3fnNO1giuNDyNke368fV/IF1/L1s569iEcCC286aI7uZ6QHHQuuIxnd
         1yolac8AMMOJLHUs+TGS3EoOaODfNicNi3pBntu1DIbaI0+ycqT6CJgq2X5hj13ft8K6
         gtKzbQgxSQ1QWrnmSLdWNTscsZVHvPHOvh0rFjFL8rkmnmaXA9pHZUtyCap4RGluW+VU
         3GfbxpWeCy/ilLbImHj4mv2rkEs2NWnb4QNkFfbwI4bo0rFpmDz+7WJ2M+BvtIEJfm5I
         nbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404584; x=1793009384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/trV4jow8NDaSDq91x2ETJmC0OZjy2jDwgvKC6ameE=;
        b=UHEKGo5lKfIUI4kB94ZI3aqQXwwPbZXpbyYcJNJwEVS6ns12bGcNS2+dvU/3TEQ0Xg
         3qoocoG5iud6GEgWfTM1nAxsqbbJLUl0Y3UgYHFr3gNIQ4YKhQ0em+iNKCrTW10Gmp/D
         ArhHEEyqNJlEL5eMgZcNlEfm8tYecvRl17BRSSkppzF408TOx7Avl48UtLVId1Vgh4O6
         XWSfN/fvwvn5PdXzT/kK0BLbs2r0yRCJyK9QqQPuXz9l6xeX0Jrx5JICCz6b6xnrE9cd
         Zgbw01sJS8Q6KIIod/dPoOAwkxZfqbfOlDuWaAKwFcE2WwW/4dct7GW04MtJnQ7+yo/k
         6fHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5YVsXzAtJcdAps0eXP7qNVH5ZKzbaQ+I7ceocFo9p8h8hWkeLUwrlFkBJjNtTPs5UTgSspdoSHTzq@vger.kernel.org
X-Gm-Message-State: AFq9FYLmfWyVGVsv8l/ExPLcUl/DywNBWpZSQWrG00WMjjOBX45rDJxm
	G4j30GafPhPOcZkDbdsi6k3Devh0MA/MD9ks3ZWTSfAbEobsp+9z2F1Y
X-Gm-Gg: AYBFou3K+v9CKHDMkPRVLJebMnFqh6t9lRkpkOEXPUOkSuipOOa/rlBCXqNfTSqUrpy
	9c8bvJYm71x9HYYvUPaO6o64fiUDRpdIyONp9h6niO4kGRCllP780xYT1wI4Ns8zhegGd5SIRGl
	Jvvb0ywgk7EiPZzUIqOddolaW0R7vrtj1TQ1NAh75U3zFeAD3WB5nJzUiAe9hNAZUkG8Nm8Cx63
	Vi/reoKVkNJ8PzM9JbyY8Yy25YpvqMhnx3zknQGPOsHg4rLNQ9A+bLOccUWfP3R4MVoNA4OkZSb
	WvZHJbvimImUtRFhDILr1RatBCfD/xbq9tTc81VvfHkroeJnRMvL3ONFkvmEuj76qP+CKMMuQ0A
	pcC8CAU59pUxiNVQX45wcVDYW2TauN7A12SJCic61Y0uKhTz9H+6Tl+xugCErWASTWXFTOBjP0N
	6txc9MPNvj19gLnTIq0WL9L83SqINZUTU0pcdUlrB8SqirgVKINCQS8lCQUegKI/2SHFCaOwDPr
	g4t6/uNWbhwkXadP2M=
X-Received: by 2002:a05:600c:3b91:b0:4a1:dfaf:f43e with SMTP id 5b1f17b1804b1-4a1dfaff680mr129256885e9.1.1792404584307;
        Mon, 19 Oct 2026 03:09:44 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:43 -0700 (PDT)
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
Subject: [PATCH v4 2/4] mfd: aat2870: Derive brightness steps from max current
Date: Mon, 19 Oct 2026 13:09:28 +0300
Message-ID: <20261019100930.110954-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..c9e764a94a238 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
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
@@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
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
@@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	else
 		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
 
-	if (pdata->max_brightness > 0)
-		bd->props.max_brightness = pdata->max_brightness;
-	else
-		bd->props.max_brightness = 255;
+	/*
+	 * The maximum number of brightness steps is determined by the max current.
+	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 */
+	bd->props.max_brightness = aat2870_bl->max_current;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

