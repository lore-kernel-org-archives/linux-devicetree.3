Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8281230AAA9
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 04:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721902; cv=none; b=So1nyF273PZQxlUAcFKGo+QrlAeCM/UZAP8KRLrl/myyU9UhEQRXrRXg0vc/ddRWGMSKMoxF0xfv5Z8Jd4O6qgwMlw4VB1IMqIjVTFWeWW98GoNr0T9eqxHb+1vdQaTJpsQdiE34MpuHLIke6jiopAXG/R+Za9TSPP2O1BLBD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721902; c=relaxed/simple;
	bh=YRqN1j/Uc0jI/GiT/Eg6MIuncKpETtLQTmH4/MsCOmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3SyNg7B0cqGJpfa66CxXJA9HmOHzB5NptIm6+uMyzb+ZAKEs9XWJPdcGew/Vjye/fo11bLIeS1xfUcw/eCyyroHBILq+19B3SXF0pNEudcrvgwirjEOCeIQNexdaCeNpJAWlJM4Jngb2vy/6H0RSITZ4BAH5l76QAL23Vnou9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGpYP5Ht; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGpYP5Ht"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bf046d4da1fso267301866b.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 21:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721899; x=1781326699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqXfwtTZgGLv1WLyA0/ZZTY8n+25azMFw/42UfL9a9I=;
        b=GGpYP5Hts8BID/r58VqOnLfMhLRly5Vmj8qSNLiDFFwEjswkhc4HCDjOXeWFWatmP9
         yvLiQ1jQEV19MU+UnmyL9bjo4v5y3gJoOHPfBQgkHeUe62rdHtEALKm4HQ9o6Si4sewa
         hEfT4buYJVM0PY+PJlsvN1354HUW7TXzqzBDIhoEeZbYJ/TMUAZbKw27D9x3BdJhHJha
         yRa8K8xdVm4riCMEmGygbHMNB14wxud/CeMNz7FKnrc/y9O3g1yTkTMfnpbCWVqjj7ex
         ZXqJM5TGr5fp9+V0M2ui5TvCWRVoLnSwr6aLn1iV5lmcHyjyeU8qFrU25Xm105gdl6Q9
         Dwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721899; x=1781326699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YqXfwtTZgGLv1WLyA0/ZZTY8n+25azMFw/42UfL9a9I=;
        b=SRbPgRHrq+ZQBi6FTMQCZ1jNFyhdtp85NDpR/t2nLvSUR35DjYm8V0FH96y5aYKbtB
         E4dzErR6vX3mWytRfCCg4PWewXIuqMWhLMZrn/wWc03KuwZC08dmJB56AJ3zZELQuY2U
         v7uye9X372FLhkNTQUeMR+E63ihuAH4xjAMGjgwPGUThdAI6Sjgpk8So+DGSB0FEm2rS
         UiNAB3+d1LWWhz4RS7FM8OsOrKAwYeHHx1UahWei8Z6Fyp3MGqhYhk2Pq84HtEKCu/Yb
         nmNvNWKk54kv1hGTacuNLEiBfHXDbyv81UKOrEcjwNMoOgy6NAhsx2/PlgVX9kBlcKgy
         793A==
X-Forwarded-Encrypted: i=1; AFNElJ//CxscvvaqNe02eZ1i+Do1hUGKKPCo4+uMufBrFMBaJnpMdyl56l2fNLZtuu6r351QeKpm9pFZkAme@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSYGz7btN3ObugYKZI9RDMF0uPZxvBDOAS1bdbgsBqE5410Az
	Oj8H94MDU9ama0inUPlThy+Vv2k8qRFs7hqwvNaVBzu8EJtgEmwCSq5f
X-Gm-Gg: Acq92OGj+7uEkOdPEYxIJTa7QpaTs05ctekY6LflzfsGUajx+OZJzEaozOD9BKrZZ4y
	/SvFYmE5rm7VzBuNa3vLX9sYi0Zjh5tSJxnuyTEvrwxhgl7i5+e5SEoNaedngf6YQNwdp8uqFHB
	DpXLQZMMSUDqQ+vgmr6aVG1LfZl4/b5COkZ6tOyBec96LIu6zEwk5NPieq2Srg0IV1cJUJJb3R0
	QBxmHYZ2wPxOxfbqXlG+ieYqaBucVPb1h+9hueYT8a7c3Nv2HnR24hIHdN5ykFS1G0rKLweWxcR
	N7MiuS8fqfPAR9AvSWqh4iiqHjQhVTW/CNQYGx79gLP1Gwn3bqv6UAuhnRMlndcfqfLAvjdPQga
	4wP0cpwuQcUoix3Kuby3360vOMguFuV9dKpaYpsKS3nd8i56378UIDYmFKn+P7nOzA7em0ShUn/
	zjYvhom4hRsFSkknJqeDRTbB8=
X-Received: by 2002:a17:907:60cb:b0:bee:4562:32fa with SMTP id a640c23a62f3a-bf3708686cdmr334213566b.14.1780721898847;
        Fri, 05 Jun 2026 21:58:18 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:17 -0700 (PDT)
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
Subject: [PATCH v4 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Sat,  6 Jun 2026 07:57:29 +0300
Message-ID: <20260606045738.21050-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
used only in lm3533_als_setup. Incorporate their code into
lm3533_als_setup directly to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c | 51 +++++++++-------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index a9af8e2b965f..c4035d1c8d57 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -708,54 +708,29 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
-{
-	int ret;
-
-	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
-				 LM3533_ALS_INPUT_MODE_MASK, pwm_mode);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
-								pwm_mode);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
-{
-	int ret;
-
-	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
-		dev_err(&als->pdev->dev, "invalid resistor value\n");
-		return -EINVAL;
-	}
-
-	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-			   val);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set resistor\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int lm3533_als_setup(struct lm3533_als *als,
 			    const struct lm3533_als_platform_data *pdata)
 {
+	struct device *dev = &als->pdev->dev;
 	int ret;
 
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
+	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
+				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
 
 	/* ALS input is always high impedance in PWM-mode. */
 	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
+		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+		    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid resistor value\n");
+
+		ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
+				   pdata->r_select);
 		if (ret)
-			return ret;
+			return dev_err_probe(dev, ret, "failed to set resistor\n");
 	}
 
 	return 0;
-- 
2.53.0

