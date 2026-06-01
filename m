Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A43DCD8B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327150; cv=none; b=TsA+3l6/R5WAqYCrGkdfRKbv0bigF26WmY16FklFMZ1mD4Z3KPCMUhy4IhcXjy3v+SPqGS/r/+b398HqCvMwc1cZgVlrX9o6fr+3Z2lXOMpfCIV9ofH/XeAIQGoQcK0fjYm41CFrCSw+G6vm9h4hMDUb1B0+dCZDLL3sRN9+Ga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327150; c=relaxed/simple;
	bh=UtPscoMn7/+u3hgCsxGsK5x29OOmOoQ7cGtI5AS2sAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JV9WBWyxciaTUcV/BUxlJdwTcZB3xRBNcTzJyYn8QhSeOb0N34uMDD+Bc/ZRaJnXBz2IA9nVvicz2boTqTy016ldxv/BQT2ZWGnnrsR6fvkHuyhbq8xsIrLDJIxXubCe2Ce040pw40VGPb2VEmyGbURCoJ8UzWSlzzzeh7m0Tec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiszMNeP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiszMNeP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1690639f8f.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327142; x=1780931942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y382WZZPSXgqkJt8F6mrSdOVSYmocK83eFeJ1TSWQE4=;
        b=XiszMNeP4wUTqUxFlUnFLah3PuhRurrdvgYAUaNSfjnBlvvHl4pqWSxVXYji1IkvFB
         d/yKXKPKYdhAClOQR2tK7rd6MK0PKTeG97Uq4lP711I9N9hCNI2BFP6N7qWzvyjHc9In
         al2CzUtKFUSIaZNGOZIpI8FLH0E4BJUb5YmBDgLKILvJBa+bbu4E4IvcnkuvDSFQnaHg
         nYFpMdRKzuUytJchtXBfPXAil8EeAdG9FtyAHUiXh6o0PV5OWMnFdXvXhATbuPKKfPtG
         Z1EuUnHfzPSCc6uQzKa9H7DvHB5/7IdKsHlpFTWKT1lXdCDdKXCd043ftoa/GPZL4lGk
         G50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327142; x=1780931942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y382WZZPSXgqkJt8F6mrSdOVSYmocK83eFeJ1TSWQE4=;
        b=NXGKcpEsL1bMshqDDg0kRxqMJ1m0aXXlyGn5vweYtaDxWaOnv3rD/vmxSo4nIL/Pb6
         kktmpUZLXVf61ZVA2MOz8WXNE3/5c+juvaKSguNTv/S9hWGsj/cKcoSqHl60RLxJm1K7
         1b5TqtcIOD49NDbU37J5Dua603NoUpdn1NIcjQ2N/92SSo96H4WQiD2sNu7cv+Nk18b5
         KUWRT64rcqEDRmtflD8mjIJ7sheMs1LI08/c+zBsMwNi2lXTB7xGg/t+ZngYe8KYERo8
         LADZ70M78ZglKWbhHsjgyJfz4gNtK4XbxqNRX/Q6DRQXlwwnFesYYSsedODUx5xLPNqr
         x/jA==
X-Forwarded-Encrypted: i=1; AFNElJ/xJ9gRCM7rwz01C6p+f3qA0lqKJJpudmHVOvgnhHHlrHpXPfMJSbHnS0pxe/2NP03SQ8arYj+ziGNa@vger.kernel.org
X-Gm-Message-State: AOJu0YwHh7a7xkzMYcBywRz2QaOt5Nhv/8yMMtV/Pek8uv5Hg4h2y+TQ
	+fYM9stujH1zfwhNuGBycjx8nU+XiSVJJmymVBLHsYzj0zuftzRofMPk
X-Gm-Gg: Acq92OFAiqbku8l5cGt8oH3bTyLqDZzyrOYDaal1Lfdhn+v5ESalgnDoS1VW1WHPyiR
	oUJoqKN2oWiBl0MEQ6pkt3n/Lxm4yrXHB+qUaxXZYXQbGEAFbx/cOnOS3fEbTeevqkj0+W33B05
	W/ndmUw39jZmNPmjGHCsoRAVlvwki3cVtAsg3yxPccJBRN1+QORapYl1eYExZoelY1tVEUp3YMe
	zJV4cn51ItQUhm5W8MUKX82nL4HBwXZy0L72uDpD2FUFr7728gZ9ZZ/aBgkmqfx+ztyH4oiOGOj
	OEuwIUWYCoz8DM4Pl6A+1Qns1IhznTdKFhKf8mK4wgs7uCscImpJl6d7wattFCyH+GQsZb+ieSf
	h1t6XweLkPNX2SqJRSiud1OEYlYwmbY3JMh77pTOMNjZv/3f4BPWukUQWkYipi5srGc7PTaoOKy
	/jdImZhr8DlaHqPjOl3ML+0tw=
X-Received: by 2002:a05:6000:4c8:b0:45e:ea3a:47d6 with SMTP id ffacd0b85a97d-45ef6b93b94mr15555475f8f.32.1780327142357;
        Mon, 01 Jun 2026 08:19:02 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:01 -0700 (PDT)
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
Subject: [PATCH v3 03/11] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Mon,  1 Jun 2026 18:18:23 +0300
Message-ID: <20260601151831.76350-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
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
 drivers/iio/light/lm3533-als.c | 61 +++++++++-------------------------
 1 file changed, 16 insertions(+), 45 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index fb61904f110f..52136ca1abc9 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -716,61 +716,32 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
-{
-	u8 mask = LM3533_ALS_INPUT_MODE_MASK;
-	u8 val;
-	int ret;
-
-	if (pwm_mode)
-		val = mask;	/* pwm input */
-	else
-		val = 0;	/* analog input */
-
-	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
-				 mask, val);
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
-	ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
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
+	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+				 LM3533_ALS_INPUT_MODE_MASK,
+				 pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
+
 
 	/* ALS input is always high impedance in PWM-mode. */
 	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
+		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+		    pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
+			dev_err(&als->pdev->dev, "invalid resistor value\n");
+			return -EINVAL;
+		}
+
+		ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
+				   pdata->r_select);
 		if (ret)
-			return ret;
+			return dev_err_probe(dev, ret, "failed to set resistor\n");
 	}
 
 	return 0;
-- 
2.51.0

