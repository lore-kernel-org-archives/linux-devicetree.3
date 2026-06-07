Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF9B3128DF
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845645; cv=none; b=Ed/w/FzjVcyHghCLGPC0WTsdCcwvdXuIAqLZOX7s5WphgdUrTwnQsSpqoS1NfPxo6RHoTh2UJggWgCDc1PQuDdHJ7TAE4Hv7Om2RgSz4jImEDPtCAVDjJbhBwuqtrL9/2GjZ7hlOHy0F/AOOXnugk2cWVNvw/zzJo+mzdHqvPIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845645; c=relaxed/simple;
	bh=wBP0OSpgAxo0/pYTGNfYoRXG4ifPdWHIBzYCnZGGwag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9MDaGunDvq0cC0PDeTN5MICajfNWuOorv/JXUyFpGMZCHzVteBgs6fBF2Dk/dWgmhTW8jiYkCrRg3dk+ywa/mSwWCb/UZF0jfnuaaplJuwpjjY+HvamA1uhsG+le85cgi9VLOCHRB6e7jz7fjNWGF2DFJLbLUai89uH01vh1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1TqVbGv; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1TqVbGv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso3411723a91.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845641; x=1781450441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1hc64Z/QAbKYaSOyZFcrmLRROVis1Ar462ZBj6enJU=;
        b=q1TqVbGv1ZMpvrXCjv866IQBMlZOruCRMm80J4ehBJd7WxWJpWx6jpEJDq2a5Omut7
         hnqwznZQOOYRn/xy8OucunEsqAgRYi3x4MwL/3ATSx7hp/qg6dsJwYYnXEWDx9QHp9Hj
         JGa/l/OBsTxHSRoW1NQpyktI2yF8QIrYruRZEIXlAdMlF8EoIvFvKlALy8LJb3i+/sLC
         YwJQPotAwEhZmu+BdT6wTwJlv+Usl7RD7Z12wTgJIofnYHL2t1JHy9nxhGQFTRNMtrHl
         cqL+p3ISJidtR4kPG6NP8wp0V/QLO7eQa9jLZAKddwvgnE6dJwQ4SD88hVW+clZyuV7U
         v2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845641; x=1781450441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A1hc64Z/QAbKYaSOyZFcrmLRROVis1Ar462ZBj6enJU=;
        b=f/eRaFPCqZkwCjpqT9Ct/HxRpIQwK3XQ27SAExPFvCyk12WWVpPOhwi7xTcSMiuGj9
         ELY+xJ2dn9EqUtBYq/G79x96mwmnRoC3B0FjhXTDOsKPq7jpEfelD+Luv8hn4y4QysLj
         M85pfZ/dyT94cx3yxtFpxkfEdY8KqcNNl1gVQXw56LsZ0WF6h5IV1nMb+8YXTwOEsdxw
         0y+J5ySeaR/pZpO8c6KELBXEH6dm9RnJVoGWQRefLNHh13rYl5ZWOA34WSnKDLbrgRU1
         wrj4BIdgY/gkgP44LR2anh8WMPsHI0zJjMwPbYzKt3y2XZw6yNSnBVO/QTYCyq4iMlq2
         Xr8A==
X-Forwarded-Encrypted: i=1; AFNElJ/k6y0aE/nu3AdYx+jInObtnU43t86Ta8k2hEWwVl/CbRH3J6EyLQSeo8jlHi62ejm57E1O0Lw8vMtu@vger.kernel.org
X-Gm-Message-State: AOJu0YyYszNFj6v63iPPGz7UFJO+qVUYByP+B8DfijQ02VtBD8mH4FKb
	Wk5tdDeWj+UhjhLOhz2sdIQgLmxT/mnp6CiFacmoUGOMOtVTQCaXUVGo
X-Gm-Gg: Acq92OHzJmeE4fdquKvuUW6xLDWYFOyQVRNg7w2FX4oMxN3MMs6JzVGU3LDdWAjB1dH
	wtCSjMcPae9FIzWKaKX9LXulkJMcc0y+RXFY/xo86V8M1uZj9Fld3ZTVPm2q/uz2Whparb3juQo
	zl72SuADhK03HqJbqVB1jHQM4TINvlT9LSJHTujRcj/DerEAOrjbLG0xgpEubSoD+NJ/oQwBuvr
	s3YZa+A5AoyX6iYKcqA+X3JkJEvQ0qafYmJd99d3oOYKF/RhKK75RvnjX/0YSPELe0OMtMPPQ/q
	/Xy1MweDA8jJyf0ludbtQuGxaOZZpfCShu8yqPjjqoACNbdNp5ezhg3j+h75NfRauuvWeZ9O66V
	Io3sfWL2+DDag4EahLd4ZyhQAddhNTP5mXPYwpUzq8PwK+ogwugKxTmu3TUmKzqSR+H2USps3OE
	Uzzg1241xPEnIOv98ttPZ0md+UxFuIqrtDhht31GMNesGE7pCCLw==
X-Received: by 2002:a17:90b:5109:b0:372:94b9:76d8 with SMTP id 98e67ed59e1d1-37294b97715mr5957208a91.6.1780845641361;
        Sun, 07 Jun 2026 08:20:41 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:40 -0700 (PDT)
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
Subject: [PATCH v8 6/6] leds: is31fl32xx: Move pwm frequency setting to init_regs()
Date: Sun,  7 Jun 2026 23:20:02 +0800
Message-ID: <20260607152002.446617-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
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
 drivers/leds/leds-is31fl32xx.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index cbda7edbfb48..b43879bffb06 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -63,6 +63,7 @@ struct is31fl32xx_priv {
 	struct i2c_client *client;
 	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
+	bool pwm_22khz;
 	struct is31fl32xx_led_data leds[];
 };
 
@@ -346,6 +347,13 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 	if (ret)
 		return ret;
 
+	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) && priv->pwm_22khz) {
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
+				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Set enable bit for all channels.
 	 * We will control state with PWM registers alone.
@@ -420,7 +428,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
 static int is31fl32xx_parse_dt(struct device *dev,
 			       struct is31fl32xx_priv *priv)
 {
-	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
 	/*
@@ -432,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
 				"Failed to get 'powerdown' GPIO\n");
 
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

