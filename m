Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A12F3C22
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343674; cv=none; b=kmkvBNfVs1Yi1dEiZQ7KfTwN2HVkxiVCbiaW84+tcUUsGzTvS5zhDN6hjlrew3xBf74JAosloMUFKjHl01BwVKr9UTZnALwhdcjLjEYdluVbKNCKE9WL+Xqe/1zViEQ46go4scg1dKNRB0qIU5p3NA6ztNZ1ELkyVcZJ9dRaXvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343674; c=relaxed/simple;
	bh=Wj2asEhQquK+fSwcH/j3WIHVOoV8HWt1sMZeo3rKa6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7Wczdi45yJ4TGF5/JtVmNxUycckMhYhg1g1Gt1FoLgNt3yNFMronsicGkeq5SgqukREI/DD25d0GUPKd+EQo3Y3PzGzPGNB0kcHJX2CpIhOkDdSvVWCPBbMYYvAuH2x0WRUUM/RzYbQFDLK/jNKvV6KpBMQuxjVJV6Bi6/523g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky+fC/NL; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky+fC/NL"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so10361241eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343672; x=1777948472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=ky+fC/NLy5lAiw9mqH/QUNzVh20IKI6PP3yK/krabai14jX3CeNujl3HuYpJcuJVAM
         rbpHI3VaZHasnd7YVrzI2wSjb5WA7WQhzPlqhuiGi8eDM0bzRdqZx7uq6jyomjQkjp7l
         O7CYrBCMBDSyNC7e7C5ovOfM2BDo0v3x21ZJ81aXDWpW2rWeSOBnnoY4AU99czngB/mR
         rsCbcI/cv036/7S4IZPatimyTFLN/eF+GRKU7AvP+sf5ZvDTawDbmyH59qXZOoy8UPnQ
         Yuvt157+kmCss+Auy1xVN1HkMRo6zJuF2cqlZVjYamTiAAFCQvT+Dd++13nGy5zHPaUx
         4mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343672; x=1777948472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=rFqDO+gwE8WPakXXupGZbZEX6XeWl832GrLHsc1aFL3WJqAwwi7xicGRnJkpOyTB5h
         Oz3IVbPCzWrgH8rv/pFGtrKxa5YDfF9J14hfsIpQAgdIFu+Uc9DGqgrPZwTQEooWGpY8
         S1qFe99o2Ysv0BVTm8TEbbFWTNUW/EOdG03Dn3U3qec0RspFNSHNeZ05C1b7MebIp96O
         MX/pFTBh1NSc+5SF4eA9nyDtyR4BRA3T0chVj1AC8woa70yDuJYEVyzKM9PR0qy2TYEZ
         yS7xoNmVknn3yer0zPTTbLocOwLk2Hvu/S0MjiKHr/BP/PWAta5yRnrZrmOzJQ2FOoAT
         2xCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Sxiripo7NXwNwmGvkKFch3EBYpK6MSyizEGOld3VwRrdJAbdXO1bY9mTMZplWbOEVI9hAQFvO4xwS@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzgL/mAX7qGtKKAomT3cNDzIo5HIMOh2vTdWlPrrzLEMTyqDx
	vIxm+agwloJDCEz9+309Knlwny4cuxZuiKWMbmrZpq2Kj77gf4Zvt/Q5
X-Gm-Gg: AeBDies+eBV/tA6gPew6y+ALfQOxo9txaXhGW4JgqsYzDYC0iSxCtDYzGXamxglPGzF
	UbcPY6UcP1uUzzzzTK051Ipqu0GrpfqG2aCUE2VG/YULQKP0dw7XYMmOuOi6M+D3RkenZUe01Rd
	mEGLFV5eH7/3V7n3Vih6PJJsBB9afWEhH2MjqainhXASCMt/Ujf7eYvc/HLR2W5kuBkLhnKWJ93
	xzKpUiv9KdJSM66RsHjVpk9nZ7jxaJB9rmrFdpAPDWeETcj5gW/GhdUN7T+PWusGPU5K51eBvs1
	TRkXRcgbmnLo7QkgWmiChe7DWZBsqSA83hniS585zRETlAIAPJqGMJ5rCAplcf5JWu28Ugoddb4
	lk+bIOzZZ9dX3tA3akFs1RfVZH1QZ933r+2aeN8ReZUblhxUZL0WK7ofc4wixzyX8a36Yj69Jky
	s9iFkUEO6RY3/6U2mHliWB/11Z39cq9K8fiPdJHyiswA==
X-Received: by 2002:a05:7300:bb07:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2ed0a0ee88bmr621869eec.26.1777343671664;
        Mon, 27 Apr 2026 19:34:31 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:31 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 4/5] leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
Date: Tue, 28 Apr 2026 10:34:00 +0800
Message-ID: <20260428023401.330308-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware
shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..d2be996dd4ea 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -60,6 +60,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *shutdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +422,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	priv->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->shutdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->shutdown_gpio),
+				"Failed to get shutdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
-- 
2.53.0

