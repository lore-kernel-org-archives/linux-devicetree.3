Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27C3EDAD8
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352311; cv=none; b=Jb2MKzukGu6gN7DdoUX5dOFoxiMW+vX107NV3A4Ve9j9SuA5WNlmt/Jmyr2p6N+F6pf0q8/O2LJfHXWii9dWsOZQHZaOVhUNVbPk28LR9B3oreFjAo30jKuyxrfOYb+P9LQMjOtpxAf1kUyqXbss4CLZIOVCXWOvNlPZ36vHjSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352311; c=relaxed/simple;
	bh=DcG8KW5Fnk3rc/f7uk3dyHKO5i3tnn1nAb2IeSenCzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aV6Tr7b6f9ymh1YD8rLvCDr96p29TwMOjbOK74ZqpmI7KhqAgENcyUZeve9lBSbbznJNUchYeltlIqZUnRWWuWiM8qRx7jgPFfDl64cRgZWsqJF3IoWuAL8pGTMRhLbA8aDCdMg1oNy2wgRviFeXTokCCputRbskiVVxqb7ZjMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=vNKDZEjy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="vNKDZEjy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so1008046f8f.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774352308; x=1774957108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCpuZJNVNsInRc1C9w8uAr8XhXxWVpiElBj6DPaFINQ=;
        b=vNKDZEjycG/LdeTJ9wbuWhQQp/Mqyk1skRDVv9wXyU/Q5qk/ByhovZFDOQZAr+5OVG
         8Aox31IQmm6FTnfLs5sla3z5TEW+06nQdLb+N15OkWlIDsNXMvt2W5q7GrkY9PZbiVdh
         dave+OIvgpNJS89M9GJNK7Pn+OX51REBZ0sVvpIvai1uccf/PeJ3Vo0a5VV05PxjEXZA
         30PDkr+4wS0i8Xo2UjHREcCV/lCVRVYAJNGXkeWh+C5gJ20Tkp9Dh7Arqex4iwzN4fu8
         kcNJ1sEJKaRaCKwNJZaPnElRpJLY5AO4dzqTRMBgsMkNyVWeb42Uoo/m9hr7Fop+URk+
         OJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352308; x=1774957108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jCpuZJNVNsInRc1C9w8uAr8XhXxWVpiElBj6DPaFINQ=;
        b=Lydv7S5TCob4Gl8nFKyqGV40270qyWAqX6hprVgaUTpAuL4RlceypGKTjDJMtNpTZD
         2VsnaO8FMmX2Kt8dg45fcacJdfyNth1a4MQKhM363hj9FK4yu8c13ul0HdzjMH8iJSKP
         6dI+DOzYFIp3/UzL0Lvg73nCOFbEYoixsr4YPy9cPlKr8vTTaNrMTGa6AjkRvyTbGkUi
         iJoK6K5Ye9ORBbqSfN52iZp83QTeRiutqBWGgynuPchSLkoYbdgyzwzRNa+8qDDT04Mp
         j05I0o49wIfduEx9kC2l8xEDYLSM4tg69MQ23KUO1veCSGcRmwxeXtp5gtWXdVGQHcSw
         svwg==
X-Gm-Message-State: AOJu0YznNMWUmHtXyb8nGlCUrzhrZv+vRkufFMem9ZVI/rJriXC42Sng
	yGurTp/ftE96pVUTI+UjqFMomHR1Yu2D5mD4iAymV8/4tUdsUMkBA5pOB7JixGCBuAM=
X-Gm-Gg: ATEYQzwErVIHmVY+4tZBTw/dhM/dC/g2KWw1ljRzobmtPhW83hStfk3o/wZbDRe8y+F
	bsoXFmAkJmakFvxW3JS+HALEtluFGjFau6CSvE32M1GE4J4AeFvn5LcmDPSxcaJ374bzl9MNE97
	4CX55zgcELJqqnfxz2rjzE46hbiZBRmzyj7J0ZSnEEZ0zjnVu4HDQ2poWgvLViCl3a3rHoh08Ah
	xQ76fuwu6J4UqOJd4D1vKxiVYOTcTDNI7H6jNHIa8G3BbZy8j10L92ZqVTQxRaNDeb4gJ8AyQfx
	D1uD7Ge8ysF24ItmYF8EhD5r7S0LzKp8hKOZENiWwDDo2tryspsfpKyUvSMmRVxwgHOWrlfMRkd
	J5U6llus5DaTRCG42t5VKK+tcmwtKJU84fg3jU/XxG3vRYfRQ8gAnKnPWswqPQX1Z+6Yt/GiC1O
	RFlH0E9D2LNoYzl6NLShTvkU0cPFPWWDMsWyLysyXC0D8IH25MSectZqtEGMS9KY5e/mkvisJsS
	fj37Q==
X-Received: by 2002:a05:600c:3f16:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-486fedab1aamr219446515e9.3.1774352307887;
        Tue, 24 Mar 2026 04:38:27 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm20846715e9.1.2026.03.24.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:38:27 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Mar 2026 15:38:07 +0400
Subject: [PATCH v5 02/11] regulator: bq257xx: Remove reference to the
 parent MFD's dev
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-bq25792-v5-2-0a2eb58cf11d@flipper.net>
References: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
In-Reply-To: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2756; i=alchark@flipper.net;
 h=from:subject:message-id; bh=DcG8KW5Fnk3rc/f7uk3dyHKO5i3tnn1nAb2IeSenCzU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQeKl8rViMv/XX2sYXax7y3pAv/Xhd8nDVQ4jRHkl9/f
 sZSh4q1HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEz1tVsM/6yei39g79P+260asTuzM/eh8i7OipfWLFpPXhpdE2ea1s7wV1CiYaH
 Qj19ysyI9eWfpHTqz4WkQX//jY7+btA55aT6u5AQA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Drop the ->bq field from the platform data of the bq257xx regulator driver,
which was only used to get the regmap of the parent MFD device, and use the
regmap from the regulator_dev instead, slimming down the code a bit.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/bq257xx-regulator.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
index dab8f1ab4450..812938e565e3 100644
--- a/drivers/regulator/bq257xx-regulator.c
+++ b/drivers/regulator/bq257xx-regulator.c
@@ -15,7 +15,6 @@
 #include <linux/regulator/of_regulator.h>
 
 struct bq257xx_reg_data {
-	struct bq257xx_device *bq;
 	struct regulator_dev *bq257xx_reg;
 	struct gpio_desc *otg_en_gpio;
 	struct regulator_desc desc;
@@ -23,11 +22,11 @@ struct bq257xx_reg_data {
 
 static int bq25703_vbus_get_cur_limit(struct regulator_dev *rdev)
 {
-	struct bq257xx_reg_data *pdata = rdev_get_drvdata(rdev);
+	struct regmap *regmap = rdev_get_regmap(rdev);
 	int ret;
 	unsigned int reg;
 
-	ret = regmap_read(pdata->bq->regmap, BQ25703_OTG_CURRENT, &reg);
+	ret = regmap_read(regmap, BQ25703_OTG_CURRENT, &reg);
 	if (ret)
 		return ret;
 	return FIELD_GET(BQ25703_OTG_CUR_MASK, reg) * BQ25703_OTG_CUR_STEP_UA;
@@ -40,7 +39,7 @@ static int bq25703_vbus_get_cur_limit(struct regulator_dev *rdev)
 static int bq25703_vbus_set_cur_limit(struct regulator_dev *rdev,
 				      int min_uA, int max_uA)
 {
-	struct bq257xx_reg_data *pdata = rdev_get_drvdata(rdev);
+	struct regmap *regmap = rdev_get_regmap(rdev);
 	unsigned int reg;
 
 	if ((min_uA > BQ25703_OTG_CUR_MAX_UA) || (max_uA < 0))
@@ -52,7 +51,7 @@ static int bq25703_vbus_set_cur_limit(struct regulator_dev *rdev,
 	if ((reg * BQ25703_OTG_CUR_STEP_UA) < min_uA)
 		return -EINVAL;
 
-	return regmap_write(pdata->bq->regmap, BQ25703_OTG_CURRENT,
+	return regmap_write(regmap, BQ25703_OTG_CURRENT,
 			    FIELD_PREP(BQ25703_OTG_CUR_MASK, reg));
 }
 
@@ -137,7 +136,6 @@ static void bq257xx_reg_dt_parse_gpio(struct platform_device *pdev)
 static int bq257xx_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct bq257xx_device *bq = dev_get_drvdata(pdev->dev.parent);
 	struct bq257xx_reg_data *pdata;
 	struct device_node *np = dev->of_node;
 	struct regulator_config cfg = {};
@@ -149,7 +147,6 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	pdata->bq = bq;
 	pdata->desc = bq25703_vbus_desc;
 
 	platform_set_drvdata(pdev, pdata);

-- 
2.52.0

