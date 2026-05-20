Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79563E275F
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285454; cv=none; b=khLIHnke4Py7oEHSXzXfUzeXViWcY9GpG45FRtbtMdHgRa0vPb6qrjkgSg2jSPaZdDDpPRaPoIdXL/p28Ej/Sn6nUBBBW1+RWQ05SbLETZNwYPhZZMtdw2aTvJNj0X/014WvI8JPAVdYZ52qpCLuVXlr7OPBnn4QQCK5xT8AwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285454; c=relaxed/simple;
	bh=7XjhlBWu4XXe0BsTVCSVyXR2X3GDDIaeGLbqNNSVFeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdvXctw3aFcd0moL9TLn0Re5vDLvVxzIWVcb/JLmIu2zzcsAQqT1TkEA+zpCrOgZrdTIaydjeHQLpIA3+yzdg6J2O1IAYVYtJaFa8+9Tz2LtlYLPXVXF2lOkGqiOwCqloj87Y3PRY26PiTZWESapgyKktSrjOnn+sh4VyYdjLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOaL2KKT; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOaL2KKT"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-369002b26f4so2606023a91.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285453; x=1779890253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrfdgV6HPj/62pzariFhyLS7uZIzNERwa95bI27/Uww=;
        b=WOaL2KKTDIPe+NfVguycnQHkUnVjRQenF1jkZ2h5BbLrm8j0htL9NjUktjAtV6jKNH
         8Yl+JIKLLsXP0ZcQSsGhflJih6UVmE3+UlclECnAz5kQr0hgJj3y3R3zc5DuKfkYDY9z
         31TAxXRgmIANt+1G5MNuPbN3OeKnZCie86MZJI4tjkIFBTz0/nmqfP8Jszt5rk4uJEvj
         T0ZM0StYymgkNJjRwve2LIOL0GtqwatpKZA0QtAYdXPOwBD3rDJ0PXOHnFpp7YadBZR5
         X1kjgPiUMhqtbSNOPTc+m/5V2UGpCaenhqemxR0AO0mdi2XW1lWqO/+An4Cew/CRPfke
         nCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285453; x=1779890253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qrfdgV6HPj/62pzariFhyLS7uZIzNERwa95bI27/Uww=;
        b=jwtmLJQa9l++fzQUnIIK/cDZIsz2b5xlQyaKY8slgbZ95fPjKFhZABv9Vuyz085tdn
         0UFJg70JGQTZbdW/HjJSbti1ytHXQ9SNuw7HK81bfepLwXpCQfPEwwURlj0xKjei50ch
         FUSEX2j87eixQAB/z5MfAAuBYw1yZpSXqpRaGBqbY/CrTBbqch0MDMAYXI9IhYGYOlY7
         L4Hzke+wauPiawApwT3mDgZAxJzARUusOaZsmApvN20pJi2nFp6Pb5fqpJ/3FEZ9N70F
         cYNIHDCmjSnP+vII0X7CBaTNT/7sW88qSfMxz7VhxZ0SS3gx9l+qBnWL0MQABkbbT485
         yynQ==
X-Forwarded-Encrypted: i=1; AFNElJ94714EhCMWkeSDyaK6GqVGLCKIhJxOqTwbXE1vJ0TR8Fig01EcJSjqhC351Cem2WAQaVtoCg6DoPgc@vger.kernel.org
X-Gm-Message-State: AOJu0YwbY4qYuD1eK8GnGfQLpaxqrrACxp9roEr895drJG8PNYyB38kD
	EcXBf52A/yRMJwreu81anQv0Mg82mEoPEIfdaH2JAdD6WrHiNocDPrR/
X-Gm-Gg: Acq92OFSRuvZvJShjN1oCNYEHRPpVEgyA4aLyzDgI2R2plNbITyGKifxYOZCG4xSjkm
	IcnGVJFYHnLYuODHtyhUboDIp2pVUEhJndhvxNLvLJXnooinVMt1Ft6oNNniESliuShEqwyJhgv
	QCdpgzZRnFZjnExdI+Uk7vq7/iUI6RRY4rNDM3BMIt59eIVQkRCZCG2fvNijh0FVDt15kjguxA7
	QgayQ75J5gMkHKyvm34xNtIHm+d1z6v2s1yAJJLbSJdCiUQwyjs0475wcd5F0XBY4ZRFKh+gkpR
	c92dzRN5LVcF98/On8yMypxkoLHKkD74qMuf6RLakEdy7O7jWSTWEPPxuOwSXnwx4Uw1wpxDxUM
	gljwURsdMM0v0FqVhUm1wXDC86zfCpflqtEq/K+3KYKDe0vH1b+IpWPjr9at15my5i6SbpVa42b
	lISyRjgRiMspvXmkZspuuhLTiDque/mr1spbTn5jI=
X-Received: by 2002:a17:90b:58c4:b0:367:b9ed:665f with SMTP id 98e67ed59e1d1-36951a6cdf4mr22271562a91.13.1779285453029;
        Wed, 20 May 2026 06:57:33 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:32 -0700 (PDT)
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
Subject: [PATCH v7 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Wed, 20 May 2026 21:56:57 +0800
Message-ID: <20260520135659.1430008-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
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

Deassert/assert the pin accordingly during probe() and remove()
to manage hardware shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..5b9ed5a1818f 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -60,6 +61,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +423,14 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	/* Driving this GPIO line low takes the chip out of shutdown,
+	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+	 */
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get powerdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
@@ -609,6 +619,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
 	if (ret)
 		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
 			ERR_PTR(ret));
+
+	if (priv->powerdown_gpio)
+		gpiod_set_value(priv->powerdown_gpio, 1);
 }
 
 /*
-- 
2.54.0

