Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375AF5304B3
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914992; cv=none; b=LHNK2Zi0/BRiZCZpk4c/N8gvZkufUiXBYK3e5cgESahA5ThzuDzqJG0dWmA9rRk0Tmo8uboog3fiyjN+bkgpw1zurXWSooyKy4MT3n36wJeb6LTjjbruGXMzIaefzg7B+qbMne61uCHur2snLahf6QhOdj4pBGUkvGMWwtj2a0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914992; c=relaxed/simple;
	bh=8u6UgmlMcnxZT0MDTxqLLP61U4irzqcwFndOVAUV0ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhNdaeTs5NY9h27NjPC35bRW4M2V+6mXL1JgFziPWVYX2ixFDQ2x0pJR1o+ehJ5x4JWvLGR3aXHyOyifb/hnRWPyWV6b2rV9+orX138X3Xtu7QDWWPin5xsj9cETtp2gS2vjANNW6b+1v9D45fFU1RFkfPf3dRmAUcd22Q7PoMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehTjJOfO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehTjJOfO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1905501f8f.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914988; x=1792519788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwqTFwjGa56BYbboUIBQ+4BPXdstI8K16QSmTD6KIFk=;
        b=ehTjJOfOrss17auJzVtlsVV/Hm19M0vOi0Y9Sp/KAA5Hsqyv/U4ds+FBz5dUnD+EjS
         SNxc/UME5dlMFuyZJtdhubruE2JTxufmHpqlGbaTOtK/BAVYgZN03cknfrPZ7mHYL/OQ
         aL0YRQBZONP54gsmMbPlwnSNeIsv6L+N30XYu3adMejoqo5pMgchz/frxST9urEq1hSZ
         kJBNPBFqIE9IIlP1mcncUVuA/cQ0nzgsqqEGijR6nish841rH1ZzNWkuvFtB+PWbdC5/
         0AfHzQQ6E6KHSk5h1+PIOL3AHcjoQEaS8WM5UFRVPfuQxClZUA4J2fz/8OZMX+IfOQXZ
         Ha2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914988; x=1792519788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwqTFwjGa56BYbboUIBQ+4BPXdstI8K16QSmTD6KIFk=;
        b=iXim9z9uJw0r0Gxw36PoLLTL1yGk85IvBYR+2GAjcMBJamvTuQ8zfSA80DvxMoElp1
         aFsh+DG/gEgAxpBwM7M1uybGxw3rOoeL2HlHYjiE1NKwOcFOvEPE+ZmRCkeNdrwtd5st
         tvJgFs5rnjs7drVecznNNLslgk0Q5K8yKVE0jz7EkJmay6VRj2NfbtfV2MbQGQRXd0Ky
         YDnhY0VZINrhjYYnuc8edXRGNZkLA/Mj4ohE2vQOCCoGfkahbGCA6GwmY/JhaEDN+46W
         igqE6T/YLL+z7bvpCt7RawAWNWAek3s9bwWWLaE+Eo8yogV4p6tWWrPLU4FrIabn10rM
         vOqA==
X-Forwarded-Encrypted: i=1; AKwUvByGn+vOl54qRYfG7wWr7WrCjSYlGwnMUh8uIsvFQMKw25uEwoPnZN4POm1wd5XnFAoP2lt4WpU0E87G@vger.kernel.org
X-Gm-Message-State: AFq9FYKLKb0b+ALFmlBYrfagRk+Yn34LOJSessEmRQDoA9+2Ehlhk0id
	mmKbRPoCi37FkyK1QzX152E3FZFkLWB82cgkLy4jKky94tLy9UmKNZPC
X-Gm-Gg: AYBFou2Zb1Ma9NjpSTXfxfth+UWfj/cpj13CRo9vxQrIAHmG5cNNCCeAR4YEvspazrb
	XZ3ZFoSVJua7WtPaQ/xSX8hOPFUziPepoj7sCcjnckXR7nnpsAYcszEGz7r52r8k/kk1UWqT2iJ
	iMtkxHS6aKdoGsYqdfaw5+axsa88tCZu44FL/EzgqZgxoOanxBa5WCl+tAaQsua45x9dZqlMYYO
	rA8atjJWgH1T4frcS1Uf5mXe2iPXkiGMJmw1pDFDQ3AlORaFprqWB3GiInIfyl2rTeT+gmistQq
	U8wUCaDA1EwfdDFm3cBuRaxjTqobaY0FOchcJd2gBkVBXW8Bl8hgKGMqBDU0ZFQqknDRTfLu6kX
	+9fsUlGDKVv201CfCCfu0jjbRkFwDHEhnrhx5EFQVlE4bZt7WSWECfybBuNeZno2QAXu7M/vEKR
	E5GG4wgGLTeRxNVpkYgxSalye7ZHwl/oecpivPgts7lZ68LKfjaK/RsQCmBA6+FJDYkzLWVGKL5
	J/VjncgTmzz9psp1CE=
X-Received: by 2002:a05:6000:481b:b0:48b:11ee:de66 with SMTP id ffacd0b85a97d-48dbad1217fmr23545543f8f.34.1791914988401;
        Tue, 13 Oct 2026 11:09:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:47 -0700 (PDT)
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
Subject: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
Date: Tue, 13 Oct 2026 21:09:31 +0300
Message-ID: <20261013180933.487013-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
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

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..eb686e315921d 100644
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
+	bd->props.max_brightness = pdata->max_current;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

