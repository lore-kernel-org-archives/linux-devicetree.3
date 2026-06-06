Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80330C153
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721905; cv=none; b=uzQJw3GMltmMrhchJzmKyePMMfEwXhZujC943yvYPpG9wJw9ZB+pxX1QDBjlaR5NVxcQ97nSld7IVqIKTV92S/3A5FKK6B9Dl/jqJqO+/BBh7/sJW9JBdsyTmmF+N5cBp0H719Jr4+mmGkZBLCe1vlaY6bA5PgcXlhrcA49n6rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721905; c=relaxed/simple;
	bh=4z8TZ1ZUPM43BFkNRD7i/+Vv36ZfSXtks2zi9DysJhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC3CoEyeYWieJzwgV13nK7IBd3NRkbWpGC6w7ExrGu1d+MOwMDN9KObsfTBdzuutgMh7r6bnHDxyG8Q4l8kpXXaQVx0hP8epn4KtL0YERI6Ul+tegigImAgK22ypfNnA8eTKJTy7hv6G/i3jb0Dlz7Juy2tiU4jCrRZeOsl+3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1+nCZh9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1+nCZh9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec423a5265so419969866b.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 21:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721903; x=1781326703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS67jochwubseohJgYpjn1pYUwemo5z+ytbVISXPDzc=;
        b=l1+nCZh9V7/wz6JtkQQ6PBnqXL/wtVrqwMlhOqOaVMYkob9Wpupqqjq0mZ0KpL26B9
         y4b4hPJFKh5sDnxM5QFJd99qkzPoMCE/UKzvL714iLWhyhdeDSnnXugP8R4JYN3d9EcJ
         ySja4FYQ7zoU7Duh7m26VxteXMBx81fYQSihfnZZGaaYPq6edxOQpzHZQGmM+fBWPg5Q
         oP7NZmfCcvzd0RH6m6sujxTI1jXn0aqUxv3ttU4o092DZoQryryUlo6M9y/rSWuwWthG
         V8FMQPaUZiK9ajYwkKkEERFQv23w7jGIsa2b97/FQeca89ief8a4ePr2tTHAOKAPGWXh
         /fDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721903; x=1781326703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wS67jochwubseohJgYpjn1pYUwemo5z+ytbVISXPDzc=;
        b=iTrq879JBWpCo4xnv7kDwQCeQgnEolU6Ethh99O2T/1A3VBn6L6v8dglZnm5DmsHZY
         u8NoU6yi9rippRiIYbTt0BzhNy91090sa1j6OXEsxuPQ+wYKnW9eljcQW8kCxA8/1As0
         5w1hjwoN/CUD67Dag7eAeFe+L/9h7G+oOEeyYUNqPqF/Urdt7NHkllPsdE6ZI2vG1x2v
         cj8bRFkWfQ9bvTB4TGcHpR+LrWb6D/MiECd5Pg33dKZN+mizGktvW3glgiu66P3ep6xh
         g53dR+hU4x6OMCCRlJTsP/l03OBj0PJqCiBzZZMnuD1seGBnNKfkhcWjSfABLt6YNQ1h
         6OxA==
X-Forwarded-Encrypted: i=1; AFNElJ+QJZvFWCAKXsXL0cKDZWQmrgaCoRQKGzLSXoCKpo4rldy8gS6cJ7BEnavFrRWGOMIFPWbyk+8lSWlw@vger.kernel.org
X-Gm-Message-State: AOJu0YznU/A7S+qAkAQ3JsXVv6XYwgM/oX4qIs0PWRI3qz1OrOWdvHaR
	Gc7t3ehKx5uFnbhru8bMI00BC353kQZc9dx6FyfYSm93sNAP7b7ETRT4
X-Gm-Gg: Acq92OHR2AGWxDzMABwSHpMZhyb7McqbXi1olfWpxWnzqYMZ3YkL5XJlmT8GG7WE4zi
	WMUec1aOcYaQl4u8t25Y9+I9mjXjw0VyCrEtIIaZNmATk2/DVSLokzRYprJp5Onz1C/bCNF2++0
	Eu0WLsSThm/v1BDC1TfOCXsLeY78vxvhaWEA32jZcxKiJgLvyErlBPaUO/00v849qgLYNrBISqs
	uPqjIvlABG4vQhQ2c45HgKkkuT/raX0wPTofkoE2MCmJ4NT7BjP1KJ11VfMYz7W/UB+g5SQXqLr
	/9AlOR+4ZrG7gMU2a/yEmYhT5drXhB1oKC+HcFlnWqeIvPuCV6Zkek9if2oJLTyRZc6fSvF1UKI
	ixsCPR3iCs36EHlOgDPkRrJ0bp5EajNHpg8mFbhSa2I9ex0dqpU7VCpchiwxGliOQJHo3ux+vxJ
	TeuLwz8GdUfTfTC6jevrbMzHo=
X-Received: by 2002:a17:907:3fa1:b0:bdd:378:3f2a with SMTP id a640c23a62f3a-bf372d28da4mr313211866b.38.1780721902322;
        Fri, 05 Jun 2026 21:58:22 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:20 -0700 (PDT)
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
Subject: [PATCH v4 06/14] mfd: lm3533-core: Remove redundant pdata helpers
Date: Sat,  6 Jun 2026 07:57:30 +0300
Message-ID: <20260606045738.21050-7-clamor95@gmail.com>
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

The lm3533_set_boost_freq and lm3533_set_boost_ovp functions are used only
in lm3533_device_setup, which in turn is only called by
lm3533_device_init. Incorporate their code directly into
lm3533_device_init to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 57 ++++++++++-----------------------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index f9bdc0a1d9be..45e7f7481aa0 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -80,35 +80,6 @@ static struct mfd_cell lm3533_led_devs[] = {
 	},
 };
 
-static int lm3533_set_boost_freq(struct lm3533 *lm3533,
-						enum lm3533_boost_freq freq)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_FREQ_MASK,
-				 freq << LM3533_BOOST_FREQ_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost frequency\n");
-
-	return ret;
-}
-
-
-static int lm3533_set_boost_ovp(struct lm3533 *lm3533,
-						enum lm3533_boost_ovp ovp)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_OVP_MASK,
-				 ovp << LM3533_BOOST_OVP_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost ovp\n");
-
-	return ret;
-}
-
 /*
  * HVLED output config -- output hvled controlled by backlight bl
  */
@@ -406,18 +377,6 @@ static int lm3533_device_led_init(struct lm3533 *lm3533)
 	return 0;
 }
 
-static int lm3533_device_setup(struct lm3533 *lm3533,
-					struct lm3533_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_set_boost_freq(lm3533, pdata->boost_freq);
-	if (ret)
-		return ret;
-
-	return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
-}
-
 static int lm3533_device_init(struct lm3533 *lm3533)
 {
 	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
@@ -437,9 +396,21 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 
 	lm3533_enable(lm3533);
 
-	ret = lm3533_device_setup(lm3533, pdata);
-	if (ret)
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_FREQ_MASK,
+				 pdata->boost_freq << LM3533_BOOST_FREQ_SHIFT);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost frequency\n");
 		goto err_disable;
+	}
+
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_OVP_MASK,
+				 pdata->boost_ovp << LM3533_BOOST_OVP_SHIFT);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost ovp\n");
+		goto err_disable;
+	}
 
 	lm3533_device_als_init(lm3533);
 	lm3533_device_bl_init(lm3533);
-- 
2.53.0

