Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5DD3CC324
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683274; cv=none; b=CIBrPUB6Hhlq5CPTASgSXzC0zMymeSQWTlEQ9Vy+xVBii1yiDeEo2ypnH4u/1Z3S7E9bD7l+YlNDlb1hTYG012czt2m6aEbCUI+r1VySFXRCujudwZqWO1jslbPblMULqxUqYFUlM3YFE2NK+RlTbrtCEWC5O3d7DToX/+31oqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683274; c=relaxed/simple;
	bh=Ls0b0vD2wig6OC9g77u6/BGQVzYqGOsH2nEh1F6Jtno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t58OBnQfK2DoZ12IGxLPIOv+pF5qI1CMpWvo0FEzWY5natidn6fvAMNCCfisX+2MU/SulGFpoF9ZwiNnu/wEstO+7jeI2CUbKuNFxuKJ5Qbu9QlRzCjj6Ud5XQATjMwMtl26B8buz8ImrY9024/6+vR9IM3pFIScei3vr0V8iOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j55C8Dpw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j55C8Dpw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso796516666b.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683260; x=1782288060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTLq06Trmxaj5LKPvLHLVj78rBrJr8ohTB02upYl/fw=;
        b=j55C8Dpw4JAjpowjX5MRGoQSu11jbYYeo6Zl4jngfa7KhsF/kDxBkNiNIbB3DDTU1M
         wPSA9RLVxsiaY1PpRPGEzt5DVTEr0KecZ+S72Qac0e98lOmV+U62TisaDvJRbgQ+0IQI
         S3hhEjGK+bz93ZR9xIXDP8vPetOaFqWE19npJqo3Fe8DWRDe3hu1+iVpCzJ8bePJETXB
         NNDicfx7oQGavFEabaO8h/fF9m0Mpj4JEsuMdYNFBJE9tptyGMwJs8V/s/6DOGGWm8Je
         PKkPTUxBYKuBCoLElUszqDDZMrSn7hpTKsL1EqbeB6vT7Fn/j9YW7Xm7B7uxqp5+fGJ9
         JZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683260; x=1782288060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iTLq06Trmxaj5LKPvLHLVj78rBrJr8ohTB02upYl/fw=;
        b=AjkwH+/0m+knPB0rdKfpba4th0lzAXSVIkjWaDqSB2NJ+C2P+1dHEaK2o+oTjITTpg
         AsrjmcRE/bleRwy1b+rIIhDLLrAm6dbRkLAatQVpTRgfr2oGybNH3r3UJWcvma3Cpgpm
         y9WySVj2BuufX1iTsrGIlHhKBM562UBtj5RyP33/8keErg7RxkZdtnLcGcm/HbxG4WF0
         7fI6k/R9FstT5hdR0VZ4IJQn9t63DcHKvR+Sxq5MkMaHeSTi40Q+VaRCh3RI5i3oubP+
         oljR7lWr0vMberfDwZFFoaS16Nr2m0+/yhWi6VKMjEzH8slLbyyz6w74ZTmmqAU7+6XS
         XYVg==
X-Forwarded-Encrypted: i=1; AFNElJ93Xu4cs4LlC0yzdr3SYOlC9049vJq21t4zY8xIVF1Mzjb+Fi/SFtNKX+94QvRLB/Z1Tk47xNXohoCl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvrt7IvB2pgUStdluKuPdsg8JkGrTnzEAbDD+AsKFkDEBAQP8p
	EGWltjdB6mdz0n5WwpktAgBxtm0l9/Uz/oLNYyCPx0hDwUIxw71mI7X3
X-Gm-Gg: Acq92OHoE7hMR7btaZvGeYCwovG85qhxj4L9sQTYxnwNfBz5rKllV1Lf6fxcG/DnASk
	+OqtJ+fPYDvCRBYJmnpuZsS8lRrYUjeBbLp5kdQzVNbw0e+CcoFyxe1+/iNkjhRxCpNQN14DIno
	10ttr9PUB54DvM3aRWDNFNnIi8lGCgll/6RKEZ66i8q41wAtlOsJtSDpzJnMwPcqnHMc8rXLG42
	TksndL2Ph1zNGoWVEfCFBTtgdzY6DN2n1SrSimHluB+KaVO/nrg8OqU8hujbfQLFYV/DzJXNNJD
	F9n1oGodN7PJgpD3gqtjUtKpYzXWvKYpPsGoDiq5bh6wKnr+XUi9tYaQ61MIcdFhMMIMYKSdti0
	6dXIZVDQBELTBUPMvcZI51Exs3Jey+CjTACVyUW2JF8BFu4gkfIxCJS+vJZIsFN9e+K72aTmnEp
	VLAw==
X-Received: by 2002:a17:907:da4:b0:bf9:ad4f:4437 with SMTP id a640c23a62f3a-c05a6105803mr189014466b.3.1781683259392;
        Wed, 17 Jun 2026 01:00:59 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 12/14] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Wed, 17 Jun 2026 11:00:29 +0300
Message-ID: <20260617080031.99156-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 9eb0db640948..d003d5802508 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -37,6 +37,7 @@ struct lm3533_bl {
 	u32 pwm;
 
 	bool have_als;
+	bool linear;
 };
 
 
@@ -231,8 +232,14 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 CTRLBANK_AB_BCONF_MODE(ctrlbank), bl->linear);
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -286,6 +293,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
 	props.brightness = default_brightness;
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
-- 
2.53.0

