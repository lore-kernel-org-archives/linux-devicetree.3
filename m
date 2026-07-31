Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222843F7865
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497824; cv=none; b=uEssWLUpbX/JWiEm6KEhX3Lh5ozDZ/k14jXCLRvghj8SES10FBTnD9NGcsENKMNsVhy+T6IV14WnEMXVUbey3rve3OewBEYCMPgdKmZS3oeWkIsA3ivfgbK02Dbp2IzjqDhlI9ZsDHFfYurnZ7m+IQRbHw/Cs8go7HdvZ2pgN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497824; c=relaxed/simple;
	bh=YR6/oGVbHnlemUZ2JFQ25LTccScQ1moNvQCqFBjDqAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alXuLDiUnhBLgWMMIHE2GrKE+s3uWQRlxr9G+mEwqqQ6OVTxuTDOtNrPLVrQ7lGzylLN/J0cSMkcvgWE0QesdX8an1di87au53q1dvnPEus+1w6n5yEfTN9DAlkG4JPhZM08s1b6CafNVFRA8pKLD67hZg21DHMAjJmSFewCuEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IteGXC1X; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IteGXC1X"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso897873f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497820; x=1786102620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88fGtlotIiUSgMJVrGrIa8cGFo+gZlVN06W7NwNhiU4=;
        b=IteGXC1XwQXgaXvH8ygrFkBREy62eoKbFBOpoelBzO3lRLtBmbcmm9EGK7nGQhLNkK
         Xfm2bjceyZ6ZCeXib9DCBZv+eo7a18kYhD7MHUd4LISjfmrdx1EiQsBRsNVXIbPCjyYh
         X3C765O5qLdu0mSyUgHBjM2xuNuMiPieCLIRpHEO05e5r7KGoOOCsYhnxwXKa0lOwGx7
         UALEo0YRZGe9RGrhGDxmld/ckX9cZNgxoC6NIG1eWtD1TE7VyOKfnz0rgkTZZkAKem3Z
         GB9iiGFC5c6rtrSKMmBQ0w3w+23fL4AjCpl8aN44s/318q/HeTygOMap2CjxeMQj1/rn
         AJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497820; x=1786102620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=88fGtlotIiUSgMJVrGrIa8cGFo+gZlVN06W7NwNhiU4=;
        b=cc11fbhDqDoUK+MP/loeCmj+suWbrYsLSt1ToFA94rintEou8AibYq6sHWiFxNLANt
         FUPrtlaybsaR0+5mhTIkHliZoGS3mNYhhxJYQnmNzj8TGVhTKJ7l3DdzSbcW0xwlWT0l
         uh/vVnffG7ZsE6MzCvKV6dRsMuAIQxUCGoZIhAjI3eEGLK/FKwhVlXe6kdGWksmzQBBG
         bXgdCn5zYZlAknQr7gnOtPPoG9pKSQ6CJsfRyApZo/HU1bD6X6tu7VbFQ7Wm9LS/6JIX
         kMtPr2l1emfeqlB4W26tMBgPOQFITia92mKq1O2EEME2N6pMTkSKZhYwKVOi0z0umjj4
         +0pw==
X-Forwarded-Encrypted: i=1; AHgh+RrcmadJlwjjuyzq7hu1oDSg70PQZsxbB0pmWyN8CLTW85k07q94Bw+2zsjW6vmyEgN/OvTqipuVnsme@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6LsowqF/o/I847OVZ0G0mDHQsOzTmqKLw6wYUgBxRXfXCI5eG
	KyrSL2bb3xBN0pmNBLQAF4kNUV7Giai/03++eCtMPBWep2w5enPVxdRw
X-Gm-Gg: AR+sD12DezXAU+CbL69LQObwvVPiXhtd9Cokt/iKsxo+wRHQk1XsICJs9ERDKusCUsr
	PBoeCMlOUZTIYjSmyErB3jf6nT5ygdZe2/FBtsZuCFq2IrDBpU+isDSrhK9vjZvJ2MMe7WfaGVi
	UbOGhHElWKS2OK06qCKEjR3C1Pb7pkADnzw3SaM3Do5DuBcjmadMbMhqxYSLYF9xfGSx8fPwsNp
	Ky+DLRoUydYICI5jSoRZcS6Q54zTzMG/eiHUkyR6alG8jt7SyDvn6wPTnARpV2hO+n1WuEu7ytm
	z6FgfDFs1hNd8dUxbiiqk/H9bFDbOzbBNfpgVXoziCcrEg35GJWXJ3OTqtwva7GjLnKASozHFQz
	wQ4hedufxVc+6UIBXGgW+MOHOvzb4vcWNjeHNaoMrtSs4BrwylkQav/avTK3Antjf8LiFPOGA+P
	MFfQMteXhWex38wdOBfgGJcAfRWKeHkWt+9/au1fFPncQSUTblh3wXN9g0t0t7ziNjtpKQff7li
	nhdILym/w==
X-Received: by 2002:a05:6000:41e6:b0:47f:9171:c59d with SMTP id ffacd0b85a97d-47fd2b30babmr3903817f8f.32.1785497820326;
        Fri, 31 Jul 2026 04:37:00 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:36:59 -0700 (PDT)
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
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Fri, 31 Jul 2026 14:36:23 +0300
Message-ID: <20260731113632.158440-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lm3533_als_set_input_mode() and lm3533_als_set_resistor() functions
are used only in lm3533_als_setup(). Incorporate their code into
lm3533_als_setup() directly to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
---
 drivers/iio/light/lm3533-als.c | 56 ++++++++++------------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index a9af8e2b965f8..55c35018704c8 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -708,55 +708,31 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
+static int lm3533_als_setup(struct lm3533_als *als,
+			    const struct lm3533_als_platform_data *pdata)
 {
+	struct device *dev = &als->pdev->dev;
 	int ret;
 
 	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
-				 LM3533_ALS_INPUT_MODE_MASK, pwm_mode);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
-								pwm_mode);
-		return ret;
-	}
-
-	return 0;
-}
+				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
 
-static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
-{
-	int ret;
+	/* ALS input is always high impedance in PWM-mode. */
+	if (pdata->pwm_mode)
+		return 0;
 
-	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
-		dev_err(&als->pdev->dev, "invalid resistor value\n");
-		return -EINVAL;
-	}
+	if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+	    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid resistor value\n");
 
 	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-			   val);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set resistor\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_setup(struct lm3533_als *als,
-			    const struct lm3533_als_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
+			   pdata->r_select);
 	if (ret)
-		return ret;
-
-	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
-		if (ret)
-			return ret;
-	}
+		return dev_err_probe(dev, ret, "failed to set resistor\n");
 
 	return 0;
 }
-- 
2.53.0

