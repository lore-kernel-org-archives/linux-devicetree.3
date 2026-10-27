Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100778;
	b=wrF+xmi328pkdcwuroVOdAb5m0nvplx4fODkLHkTnM8btmwFelBf7chHmXNmfEYd5s26
	 pnQEUYcZHHGUlYp4q+US4M8td9ol/lVZxuP9P7iVvo73k3LVB88+Ew15CuqJFstPU7Dhp
	 MJL2pIHUv7Wrwrgf6jn4Um6z6Lx6/hXTJxqfFH3yE9I84SwpkpaQFfq33nF5Ng3Mv3Mty
	 /Vk2tE1UH3eXt4pH1GjCZEg4V2nda/g00gznm+axWqqgrm4GCt1Ee20fsPDWTmVrO5yrQ
	 4whHjRsP9YOY+Wp+k8WJcY8JbgNsvYDVM7A4E2dX945m8ElVxM2PYHSTe23rIa1I3wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
	b=0Mtujhp62QDEJTqI0lHOx8iuN8q82Nv2hv06AnnHzaQCCLbChKJEjd0HKLuwQVSVxii7
	 1iP+rUTL1CHzleWMfJrrxQypThBfBjjZ7a1/gHE1EMOXs0pDbQnI+LNSXcAvI5BPIQqYs
	 NsBVOqrrHD7dF1gLf9VWbIpPBnU5I8GXr3a2Xw/qpCHZR5It4QbKV+JRvHpbnGuLe4AaH
	 xG9I0lDMNVF6LyP/jTSfAxhl2Ufz/p4j8mSxA3g5Y1Ky+M6PLokFakQBBvVKgE3tUK1x0
	 yMKed951erjM6hC0Q1toIUUREVrsRJy3TmMWrOFAqy+36p2ePnYsZtD2eM8uvUG6Clg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McUPc2ZN;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677A60A380F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9677A60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McUPc2ZN
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c414e5d282eso469572066b.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100776; x=1793705576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=McUPc2ZN2aivcQ4l5tOOBGiPLL+Gr9rSzpYH80ieeVbvD4G4q/IbNcWuqBjIz42m/6
         80b8xn/DgVTwcYdsvPzshoVOoLegZeY1+2peDLDUoBGFP4AAz7I2HZ1rifvwj9uv9ZdW
         sgZrA/xDqxMiUHIhYs1SlCGA9QsQJVOm8CtTjFUl5u+OXqISoH694nMDxXibSaoqwlW9
         t9q2MFlrcQC0iR+CaYEJ3QDfetJfz2sf4wqP1fBeGmFtBzuiqMGiQUMi89VvLEKkf1FM
         gfmVMW39WZxDrAES66K6HlarB86IgQr50FXRThVp8I9q4EKz2xivJvjKsEDenPGlMHgu
         eE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100776; x=1793705576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=ueDg7sxZ41AfP+GpwmCGqpsx/u864xu6Woy+xCswTuvMVlmXruaoD7Gjx45JfqNNrS
         YY4f0wqzTfvuedgdnYbhXDJfvjwJXuHNGMH6nG+A9Dyh+2r/e6yJ7iBEewW7oOSU/nbE
         RTkDW5coOZ4uMJeg8PLKE7DFIBk2KLUnlXZoDuN/X3TfJTucqVPNGjg3A71hmM8EmckC
         /+TIYl1yzx9V7ZTmeMtqqybRaJR54iZYeiKLKbq0TpLv/xIoWf9oNOovwJVcYZ07qCBE
         S0GnYIp+g4OiKpjyMpzftb9TEUNzNpQAcWaJ3NAdFEqRvm94c646P7dgq9NOXd4LDE75
         gzug==
X-Forwarded-Encrypted: i=1; AKwUvByrn5QIgbondvqLQ7NAdqvxb0eXa+7kkXcCmq8720H5y8Go1Q9OLKkTYALc/LtgjC225otJ2xvMkOAO@vger.kernel.org
X-Gm-Message-State: AFq9FYIF8JYgEeWxbAyyx6kNNQY4336XZuIeuMWMsDRu2PnsFyUYUmAn
	CUUQsbjDwuLFTfxWYz89MIQbG6tCtOWDqU4rkG0pC9g282dOPssUDr/6
X-Gm-Gg: AYBFou3OQIz+N6wtDvxncKs4i8yWJzmu78cOJdr2H2xg331WhLYpLdoWm4DvfI/Ae6t
	ToGPXfMtDUHLAbsTnNRb5czstE8U4EcnOE7tmcdmfHuJAKFWjhRWDwguKprCbFPdaqqcV3mns7a
	7UmVq+AJSVtOlL0bpzHtKve17pMYs3+b3b56OF8i6vWDd32ioAbcYcicv9m/NQu/Bm4kzwcf7oG
	wn/R3/88JC/uRleumv5Gqfld7YRdiY7y9v5I9YVxvrbhrASpqFtvwHc13m5WbSTbQHBmf7Jm9j/
	x/3LZ3JGMPB8ONUqW6ByTkBbtfXUvAcR50p/CcO6LV/uyaXNNI/Akgl4SjG7DykYPUo/idLaiWi
	2zk4I7WieIIcGAgqdtJTNaJmP51dJNNMyVpRCg2KW6VxmusFgmlRbYX+s03bQbtbTIO9xQ1HwJ9
	/Ro3aDkYZI+5HCFZ5eP+x21e/G/Jw34Bk55md/ob3/J3nYaGu6q+ZBQ/ed7oBVVOmBmu0DDeoe0
	+DxDGWdKPhYh5GbPkmSTcWx5/ilwdVcr2zF26/lqgOnX3oHThpbN8tCfZ9ewkW4LZgLD1znIFwD
X-Received: by 2002:a17:907:720f:b0:c46:7fa4:922c with SMTP id a640c23a62f3a-c46bde3211bmr1016964866b.24.1793100775923;
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
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
Subject: [PATCH v5 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Tue, 27 Oct 2026 13:32:28 +0200
Message-ID: <20261027113230.47538-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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

