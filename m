Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043A2D94B0
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284067; cv=none; b=OZzXGTbGm6GL5D5oRhEGQd3lS/ehfpFrGJnUIxeybx3sYtvXna4qo4mIjNNeujH8aB6aR3R/7ZU6ixPfkzP45wHLi6QtaYlIDZJtOWXtPfG2sXnb5zgTe9tdEIGfCQzmoqvGlJZ91QPAQoGiD2kpGpZrl36eMXU7sEQv0VwZjMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284067; c=relaxed/simple;
	bh=33+ik9qldfzElfwEbUFdDRSw3s77jyByMHu+q2J05gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcXL/kPrn1tfhGtXWVf6DrHWiBRXkHG0Ra59sASY1OmkLDHGdt3cESqkaAaJJVMlXV4bgGJwNKsDNad7rp7kFucHMbqQUo8D0SsZYDwB8Uz7h84gNQTdoJX44hj43JRGhQhdCDTDvdRLcjNmeRdFIP07nxhqDZYLKfIqrgy2mm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGQkL1Tj; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGQkL1Tj"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-484d3c0855aso1766928b6e.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284065; x=1779888865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDbe/ecn+aILq8lwi+Q4VCno4aximoHPHL06TCJTUbc=;
        b=VGQkL1TjfYqFkDOBcz9/aqaw3XxRpnBGYZLrhrtR0RcVLgAhX76mrx9dJAWhh90XhT
         d8yp+vCO+o4U66bc18nYe1u378LR+s6cE1kEOvifD10kI+S3nXr/0/crP/FszsJ9nSrQ
         YdaW29FY1gIcEej5szMCuFiexjLR+udmIQlBBdZRW1lNuzYkjpjf1kf3pR2QOloUChHv
         yMTT8fphMroh4Sj5IAkOI+KZx++4dFssSNImWPxCXjl1babT7C4HUqrzWNZE0MRgeZ7a
         lCGiKseoPWu8CdVcUh3hPF5F/DPw4Bw0YOD5bFcwNCiZ5E5mHmusySyQ9OkvQWrwomjT
         thMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284065; x=1779888865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDbe/ecn+aILq8lwi+Q4VCno4aximoHPHL06TCJTUbc=;
        b=PSA9UtPeu6t8UMy/gfeIGrWTeT2GLBdvX2rlLo2XN3nCuT5JrRA3cPnklFl0jWxulb
         mcrE+KSrT7JXVI///KwMMJd9zVL5dISn+VoWtvIG0ef2F3ZmgX4rkOGEf2VU8l1CF6Ez
         eOOr9n7e62h4KHY3X6WeSdunt5IxVrC/h6dQAFD1RhbMdGgQatb0rRk7MXPxbpBcvRPp
         DUrhMhxgMz/EoUeqUNQHt/wSZTKotouYvoG5NLdXEDaYjEcdKHgWst78tAKgIME0aoxB
         1hStg3o9/6pHsDYgvd7t86mXm39c6v4X/hqIOVep4h0v1VOVhaE65u0vGK7P3gT8lcrY
         6uhw==
X-Forwarded-Encrypted: i=1; AFNElJ8HtvZx29yN6cLoBedGrjBZgTGHYZyf7GF4blyuzlZ+20KB4grkDXAzlk9+RGzdgKeFW5tSFxPnSY+M@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9T060AcMosorWWXxTVH//5QPJnx5Pk/TBaYjydFswObsoUGOy
	8wQ5M0Iw6dhm1fqFeiY3KupvUHnPVUgMsR8/V1SOnL6PTil77KlifH/u
X-Gm-Gg: Acq92OHuZMwmlUTprKjBfvH4E1tTeqTgsxYqKqJzVTTkJ0Ze8Xmn4Wq6l86Dg4Nv+d6
	WRr6QgVy/92AiaOECh+awYaA4Sexv1Q08GQQ0Rpc0UMPu3WLkp0ExPuP+bgGK5QpeMwPOnkqNWZ
	o2jO/msDs1DKUL3iwVsp+/HxZVQun1Rp8ppDDxmjmCPC15CM5HOdHGuPrbxEQgrWAiTyhrpxTIE
	9RB/4GSyT5TeRaOqxqdixdumtx4wfhT48lvemNzVUY8Fb4huvyJ/KfP3D/ZqU6so6yQpCgmkYUy
	H7ertjt0x8E61kHEBrIUhn6usRfOBF948loBl972Ybq+2TNih7bS2CCcoNXK09Y+48eZQWAAC1K
	GqNggKvGRlws5d8qRrhT/TPFNKcgJlCPDZ3FjUtOCS2vbfEqmiar2b2hWlPGIjXpMv9q7T5wyeq
	74modWJJsL//e/AW89Fk4+B+9E+Ldc4+2ExZMlzlQ=
X-Received: by 2002:a05:6808:3986:b0:482:dae4:23cd with SMTP id 5614622812f47-482e564d54cmr16908898b6e.10.1779284065074;
        Wed, 20 May 2026 06:34:25 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:24 -0700 (PDT)
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
Subject: [PATCH v6 6/6] leds: is31fl32xx: Move pwm frequency setting to init_regs()
Date: Wed, 20 May 2026 21:33:43 +0800
Message-ID: <20260520133343.1423946-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a18983b95a61 ("leds: is31fl32xx: Add support for is31fl3293")
swapped the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs().

This causes the PWM frequency configuration programmed in
is31fl32xx_parse_dt() to be overwritten by the register reset
operation performed in is31fl32xx_init_regs().

Move the PWM frequency setting logic from is31fl32xx_parse_dt() to
is31fl32xx_init_regs() and separates device tree parsing from hardware
initialization.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 5678c2273bbd..3e86e414c532 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -63,6 +63,7 @@ struct is31fl32xx_priv {
 	struct i2c_client *client;
 	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
+	bool pwm_22khz;
 	struct is31fl32xx_led_data leds[];
 };
 
@@ -346,6 +347,14 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 	if (ret)
 		return ret;
 
+	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
+		priv->pwm_22khz) {
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
+				       		IS31FL32XX_PWM_FREQUENCY_22KHZ);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Set enable bit for all channels.
 	 * We will control state with PWM registers alone.
@@ -420,7 +429,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
 static int is31fl32xx_parse_dt(struct device *dev,
 			       struct is31fl32xx_priv *priv)
 {
-	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
 	/* Driving this GPIO line low takes the chip out of shutdown,
@@ -431,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
 				"Failed to get powerdown gpio\n");
 
-	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
-	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
-
-		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
-				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
-
-		if (ret) {
-			dev_err(dev, "Failed to write output PWM frequency register\n");
-			return ret;
-		}
-	}
+	priv->pwm_22khz = of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm");
 
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		struct led_init_data init_data = {};
-- 
2.54.0

