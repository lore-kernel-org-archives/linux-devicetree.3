Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FA3AFD13
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758371; cv=none; b=bgENcr3+t+NwS5KnJTZBmPGxwM3m9Sy9M5tPNEtPr+6DH3CmJVccEVa4LyV70xzhFFH0uaWNPtocUrF5XyQf4RdU+d3WqA2mNfdeMLoL+yFn7r1hz5DcPJRHeaOIUZGugXwEyDy1CiAn407wOZh6q3OtM9rsA5woOD6DIPWLoDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758371; c=relaxed/simple;
	bh=nFcLkkDjWaxOXRUBJLHL7pv80zXwV4iH2ZXgfy2DoxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdCn7q7atvX9NK0CMMP7fW97f+4vlB87uUQ/vBxjNJxJEk0qm4D/prgSQgNoDY4QWKgd/BKYNqaqPPmlNbZ7Jh0MfDFt1fhcVDqAhs2ozXtm/dffuWyuiU4vfXjWKYSQDgit4nDQRxR1uexafi0p92Dd93LtSgE/vtZmVWkOQYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPy44pl1; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPy44pl1"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137335bc3caso3541426c88.0
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780758369; x=1781363169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81dfFkKztQoah8MdmOv0czHOW2LD9S1N5N4vx0SAF5E=;
        b=bPy44pl1pax1LmQxqOpVxNnHQaeT2nJFwNAj5hVFBJE9pGl/oTd36M26u0YfGYS+kh
         HaZeJm0WH4l0aZnCUw14gM2V1G1o/AgN6pu+bhkcdEnJ0/M8Ia+XcIlc4CtgkmVfmMjx
         5ZutVOp8FJDvA3nMLyw82vN9D9DraySrpo9p4hFmWAPLHwd5V8sEObfFwrjZQ48X1a9Z
         dbrVeR/ez49yypuW/kjOBkGLltRNCcSgSGlgpycwCc/7FSn7e/2oLnCWtnkxA4p8asL8
         zG3C9TKKwquaiKV5cIqDMfu0Hs5hG2RsbW8Ab5fRwGHFoLLB10vwjlzKIE3szlbqyyOT
         qw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758369; x=1781363169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81dfFkKztQoah8MdmOv0czHOW2LD9S1N5N4vx0SAF5E=;
        b=sj/qEBDFKHpGId6ducEFMEUCvu9uqqi4YikMe6qKa+MWQ0IiDic/5liTpEyX5Im9NE
         27JjXtBmXVzdCSylXmgK9uUXiE9R0pgbUlGo7+vpBMtuvMYSejnIBd9d/ty8fuf0M3IH
         ZUqIdgtgJzQASeFjg92oVBhjqFdjUjvqHjisLDei2ipW5HLfn/uEZf5DQl49ORDNhoeR
         Xi7SwEyYQe/WDd9Qi97vu9aDRp3fVGLP6WEhsvcwFBWYO6SpK0dEUVPApZvRwv9G9wML
         Ynu1mlPQZqq9iLIYzuDLoyUCnkdk9gc5CDDERJYnq2f4i7yrGV2r+CQ0V5Rb2y63oiPg
         sM/w==
X-Forwarded-Encrypted: i=1; AFNElJ+iw3RSgaXtR+Ptw7U3UJRH4rMNoUJkS4Kj31rj/DZUM54MQGnmVJE3ynZ2GNa+1htzR2oUkflTOYWG@vger.kernel.org
X-Gm-Message-State: AOJu0YwwMqz3C3aVFPGUQxC64RGSJdnZVm1vD773TgGh27mLQUUaHwE6
	ro3dL0ozmMq8D9BEWimqnL/MUxdtPP7O69tQ00lwHkz3bh1GPJT6/CiY
X-Gm-Gg: Acq92OGPUYoOdIDLZ/wQmy+NjZiAaFOMLS/fnk2YICM/F5h8Og1u1QOGF8svuqd3rE4
	372aqMKi3ZEhsQ9X12fNcWC5N7nCVVT38wdH6vQSErXDB9nViLI70L41Vn/tn5i8iG9gU3LBe4T
	0FaLwSFJbW1MuaoINTJN9JacOBgnB0xGv23XqmJ9Udh3nXnhHURo5cFBexODaCdjQ4ECDLq5LEk
	xRygWIKUm6KTWkeFJxeabOzIKg46SXtYfD7fOvSnyfsxBBF55OzPwbjILWlL/ao3CJytWMYk7zL
	vEJ/aMwvNWdXGI8k4QLfb+8VtTrZAPtju0Hmwm5sm9h4ayKeW/JucfuOJWfZRNjuOF+06DbHESL
	mES6qH5dr+tcU957yHkGYeLVTMmuYUB7n6WCRpB2+/fOZNALDpLnEuzWYbfhaeIGXomeeGaTj6F
	WbF38zQyGa3B4b55CWIPgo8z0rVB8MO2R0tORqkY4hTSVplcv0Zw==
X-Received: by 2002:a05:7022:423:b0:137:f2d0:da6d with SMTP id a92af1059eb24-138066dff7fmr4301773c88.25.1780758369026;
        Sat, 06 Jun 2026 08:06:09 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm8415607c88.11.2026.06.06.08.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:06:08 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] Input: cap11xx - add reset gpio support
Date: Sat,  6 Jun 2026 23:03:58 +0800
Message-ID: <20260606150458.250606-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606150458.250606-1-jerrysteve1101@gmail.com>
References: <20260606150458.250606-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some CAP11xx devices (CAP1126/CAP1188) have a dedicated RESET pin.
Add hardware reset operation to improve device reliability and
ensure proper initialization on probe.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index 686174722204..7015aa7654ce 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -43,6 +43,10 @@
 
 #define CAP11XX_MANUFACTURER_ID	0x5d
 
+#define CAP11XX_T_RST_FILT_MIN	10000
+#define CAP11XX_T_RST_ON_MIN	400000
+#define CAP11XX_T_RST_ON_MAX	500000
+
 #ifdef CONFIG_LEDS_CLASS
 struct cap11xx_led {
 	struct cap11xx_priv *priv;
@@ -55,6 +59,7 @@ struct cap11xx_priv {
 	struct regmap *regmap;
 	struct device *dev;
 	struct input_dev *idev;
+	struct gpio_desc *reset_gpio;
 	const struct cap11xx_hw_model *model;
 
 	struct cap11xx_led *leds;
@@ -452,6 +457,17 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+							"Failed to get 'reset' GPIO\n");
+	if (priv->reset_gpio) {
+		gpiod_set_value_cansleep(priv->reset_gpio, 1);
+		usleep_range(CAP11XX_T_RST_FILT_MIN, CAP11XX_T_RST_FILT_MIN * 2);
+		gpiod_set_value_cansleep(priv->reset_gpio, 0);
+		usleep_range(CAP11XX_T_RST_ON_MIN, CAP11XX_T_RST_ON_MAX);
+	}
+
 	error = regmap_read(priv->regmap, CAP11XX_REG_PRODUCT_ID, &val);
 	if (error)
 		return dev_err_probe(dev, error, "Failed to read product ID\n");
-- 
2.54.0

