Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7973CFF44
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683260; cv=none; b=NA+jYFr4d/jJIeXMpFhn6k5qZqeMNzj6KFFcqWjaSPYN7nHj5JcQ534vzTV6FFdt6jOwdy5tt0mc4iipNCfef3gjz8ttpyedatlH9tBbNziNaSI0+R5dmo1FENXPRNq5SmzIN4GsLbSbGPxeLG1GnUyekvoRfYirldeDgkg7+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683260; c=relaxed/simple;
	bh=BwWYKnYatgp0/f3D570qVWCNy9eZh1sTktWSktle2dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgG8tqoz43tB93RIK/+ASjNoGPv1jOQyGSL4vx90hOW+hjEvpl3FHGunOM13jSUdp09tyiYvwakfh7paGuTa4PPC3+ahn/XvTG3PVCIhIbdc3kCdiW+FhObzU0jSNOpX8Qhp4U1iO+1OYgB+ZHSL/E0Fp43n807JYOGbesPj4Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5FvIMP4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5FvIMP4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bf0170c80f7so929882266b.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683251; x=1782288051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8y+i4Wk6Q8lVb7K/zxazYX8oolr+QPONOjz4+CZ6S0=;
        b=q5FvIMP48mll3yVpjAuWYJ3T/u8Cg5dIq6l67h4fvUg3PiilFeHS/nBCe7KHm8M2nM
         Uw6BTGaGfd8U7E+7yrdpvDibkoKmSW1uJaJbWTDZiicaqgBvJG6suX6gkT4ul/q1vY8a
         KwvRRXWHUAY3HgPapPfOu6PCw4Bo4quZLc1xxm8bLDfeabnMf+CYz3z/KqIMjp3lcU0m
         d0YAQhg5bS3P9346WFMu5yzpdSeMkQRrstkj+AlCbaAQBMgFuVRvanArFdAz0sFbAjkw
         Madl+Dx5oaB5m2CXiBeH64ew2UakvEOt9V0yJ43GlGY2wNHo1TlyN2Y+YE5emmm9bk6u
         wO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683251; x=1782288051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j8y+i4Wk6Q8lVb7K/zxazYX8oolr+QPONOjz4+CZ6S0=;
        b=l3LZ50M3390qoTqQEoS0DqSpOdZmm8bpq+woio5QnGZiSRukuKgWUUBrUhYttNB+lM
         crA1qMITIFTtin2Up5SSlbxgPfD17WiMQ2MCAJmWppwCtAVlBHN7+sDxSCleihD1C/0x
         Z5KVErlXBUiIl9wK7xgUTJlk8NaoNoBuMDGS4ZuXuwdLdsl5vmpP/ewngOlLWwqJN/PR
         0VThvrPlDHI0IurohuIl0k/ljbQNI+6WtNkq3EK471tpO8/CrseQcQ/0TjnpP10JBcCk
         E/2rqHxNo4wilrHFNxnffRfCGXnS3KhwGoib2NpD9R6yYzAlb4zuelEjWgdZ9+6bYYeA
         LFfg==
X-Forwarded-Encrypted: i=1; AFNElJ9cKDL4fWD8nh72E9SvuUKpxifKg8+I3b1CzSDBjy8Upif7sUwCqDWryNHlBf4kw3t3x00u/NLpAD58@vger.kernel.org
X-Gm-Message-State: AOJu0YybLgQcOEYfkAQIXXJ7h174cbJy2p/89vG55zBh8d9q1Scz5udW
	3mNE171ul3UKuETg1uSCIfj7cZpzc8IupnY8FkxuUaG6dI9XuOBbfdqimU/jXLHn
X-Gm-Gg: AfdE7cm0YfdNjJd8EdYk8xSpvwhDJYG0SGK29o3wYG7oc3WklMLcIQHWlaafuzQg+Gf
	wKgkJp06OvxmaQi0L/f9WzVhYSO3DjcKFfK4Gn79Q9d8L8GBFoMo62TkmFl7skbyd3KrXA5z5MS
	KWGd2Fu9mcig0UCEXtfeih3fkAZ91rAiD78MUNep4j72rfx5gLCZfcyBFk5cgnVZeuYJy3pQrNL
	DBLe3wvDHhl2UJn76/cs+Wo/Fmlb8IQGA+s0LmtIOAQbT4PFTkZ0x0Y7NzojUruyGDN2w2HR9nB
	VvQPpE1IgbD6VhPBzEqMeQebHuzuZSEWbK53GSpasTmuJJfssHbJcfF4bl4V9/IBkh+CDqD0Crh
	XMZf+/n7GvSLx1CPWk5DVWMNGRu1e8LFXObCuiWy0RDBvX1+oppeqVrhW3kysvTseysgcETfFOc
	MpFN5zUMa1Ud/W
X-Received: by 2002:a17:907:d02:b0:be2:d66:eb4d with SMTP id a640c23a62f3a-c05a7abd063mr208115166b.44.1781683250733;
        Wed, 17 Jun 2026 01:00:50 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:50 -0700 (PDT)
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
Subject: [PATCH v5 06/14] mfd: lm3533-core: Remove redundant pdata helpers
Date: Wed, 17 Jun 2026 11:00:23 +0300
Message-ID: <20260617080031.99156-7-clamor95@gmail.com>
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

The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are used
only in lm3533_device_setup(), which in turn is only called by
lm3533_device_init(). Incorporate their code directly into
lm3533_device_init() to simplify driver readability.

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

