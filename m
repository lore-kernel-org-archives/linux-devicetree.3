Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8723859D7
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477513; cv=none; b=jrVFPoPMS7HmB8QQyi5D6gFAuqVQPnjm/B3S0MX9GRvsyCMOcZ3ORAIGD/4OMT1++r7MnVtaatvUNvfOMaSC8LK+U94QM/zTDQ1CHuVif1soPbtyonPHjs3qxGnlVaPg4rXHCBJf6tjkOaSWkopQ1OcVOopjPS6obJSNHAqPpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477513; c=relaxed/simple;
	bh=fdv+qnDaJ6e9YQM8+aAyraCAienhNROQ1xibfx8bR18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBZHgEV5IpMQfl6s6wQ4x4BiAuTvKYLJeRqUHlMNQnKq73XeaKnUIveBwYIl8oxdv4VaGVZbxU+fO26EmZl1CXVturFoWua/hjd8jEbr5J7i32hTBooRClYY1GSNcgCrCCKPhJRmd+D+B8dQacT0dj08iqzxbNqp93fNZfNGSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQrP/eqL; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQrP/eqL"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c8f9846c8so13099498c88.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477511; x=1778082311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UAJ4/YxLNK9emKJjm9XoQD+kWFNL0hxgMOdt9XSg/c=;
        b=hQrP/eqL6H8ndusEPmS8NKo+qjG+ejk377ayMY1l9Ao2pW2sRqObkA7lTArG3azpWL
         rj3l4OG9Z0OBfmdnIbIkWeztNGGwn5wEByDbf7Fh+hFvTxCuGHxthiR1DMxhiducKSkW
         YZv+U2b9XS5o5Bytg+dVFdt8/p/SZItetQy7qsU/ZqMHmgsqMAgDIGRd4Tqps77uzh6j
         /Ww0se9tqNhSj1OUH91yVs2cyAIod0r4uLgEFaUV1KPcBkQuDYJrgRMWnjwLM03/B2e9
         LbjAymVx8jF2Yyme7lkRTXZPBAwhujR3oLLvp4tXiV+dPOmjj6WOFLVZ9thWPVqO0e02
         VNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477511; x=1778082311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UAJ4/YxLNK9emKJjm9XoQD+kWFNL0hxgMOdt9XSg/c=;
        b=Xgj8R5Yw3XFRyZRhZ/iri9RYCxjlyBz2igyUNLA+oulgRxTiKI1rGV3mpYupB8xFmH
         mmoNs7GRZKeBw5L12sDwML3qsmrz73jt/CZeOgX+S8hzT4ZibSPPpMumyk4kVfdptynt
         jDxtISehav7rZ8sgZ8LasOXnzugeHbsoLrFfCw6/nS8/2sapSdE+apmoYxAzsAhDjtXG
         Vfsiw1xl+2JFEdkSYB0eAA8cYyisYu+tyEmZBa6UFLN8Bi/eCm6JG2BAC7h8EdQnnLoI
         EGzrajHBDUDsmNbkqE+Hb+DVyq4r/ExVKOIZFkYskC/GrIjpMqklRVtzDQzHKo932e9G
         mLTw==
X-Forwarded-Encrypted: i=1; AFNElJ+kN8Tn27u7Bp5HlzoqErZ5ACOCVt/Zn62NbgRsyZN3lJ5CjJip+t54fwNAKLvjTxsm1u/VL9NUFTC4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/lJbmX1nA3uCy41zdrPW3qb5/EsZ1c2msHoqVEuDQPUnQKoUj
	wp0iGbbWp7PJUGCyRgHgoAcZkfIPxuYQ4ckCy6SCumQlv9TAbwV4qxfK
X-Gm-Gg: AeBDiesS2rOl5gFMdPKzcGnGdwR6VoQxfe1y/Cgp8hZVCaCJh1a4/VkPDARhgtFi4jc
	PYAu+rCVOcNWwNXtYcIkobc0v/Q1zAVpP8RvdUU8piBBAlJqq3jyH3pLfM2kOlyeryPAtJew7OZ
	YWgfuiUtxhE+2DX8SzGh5qHt11W9g2YKcX2YKc+lJq9CVH7BcnpVlI6a39rIg5ssm0d2JjNM3ss
	7uKFJ3eyWyiU7g+uwczozP47ovJ4AlsDzybyUMslXQjZJguv5tceyZSluwvUwettAeD/4AKTRrg
	dfXZ612XLyBjP7bknGM+HoRz0T0BZjMzwBGsGuBVq7KBj/JL4OzXWFvCwyqbYpOZ0WswTTFlKUX
	cM2cn/2UoGhnS4Wmk8PCIUTDE9AG1Zthc/626qANGuZB6yAZssG/0E5qSgdJggfaVoAGv1iHJhH
	zZ8HY7GitP1gMIFS1zPO9AWgZJWHS6mbA2OT6lgYLXiA==
X-Received: by 2002:a05:7022:e1c:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12ddd8e059fmr3574801c88.0.1777477511309;
        Wed, 29 Apr 2026 08:45:11 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:11 -0700 (PDT)
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
Subject: [PATCH v3 4/5] leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
Date: Wed, 29 Apr 2026 23:44:48 +0800
Message-ID: <20260429154449.730880-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware shutdown
mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..801caf2b2e71 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -60,6 +60,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +422,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get powerdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
-- 
2.53.0

