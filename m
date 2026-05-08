Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC1E3E275E
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245931; cv=none; b=cqvM4K9ODBEUmUtDD+ig3TauI0WcMuI9zJ5tt2D4+q5AmSG+80DHJRqR5lpPqbOWhL+KiBoBI+uHxS6O5Q1tnzEhZTkv3tTJEiXx6pXGn7wv1pFKRgLE6rDz9o+4TNS+H2Aw8sgqPO9vGK6Tlk2ciBuXx/zfZURbSEtV9AhL6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245931; c=relaxed/simple;
	bh=E8KHLC1Nbi3NBLgVxLEsG0ZdvPc4VF3KSVAQfL9DEHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uP7RULhfQksvl+/PO3cxcAiFPKYVmG8fjCIbK+EU7b/JJGsArDR9la/yWNw+unQHoE6+Iw1IlCBMiSTTpT9mW7Eg8jRvwnRZW4iu3SprnfgBfEqVws+k2S7ljMNfXk7EmB0kCSzX+sbDAc1jms/v8ZUlN5lk3E+KMbqE+P1tzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VluhlOnQ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VluhlOnQ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso57422eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245929; x=1778850729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=VluhlOnQGbnwreYd0K8rZIWDk5ygm2PxfJ/paaHeopFsdugyavawDZyc93rc4aFpli
         GaP1Q/CO7sxts8DJlff5Tr4yNcC94/8WLNpJS56YSXwXwWL8Hp2Brqv3lgT6xx5rfn7n
         fu1fHtSD12B6PB4Nz2N1qzIkssqL7CIj7QL14M0CUHxpBpHh9tpR3LsHe1cQ1dv4KyXc
         GBj3iMUTNJaJaHgI/AgtnWGKwzO56Sek+jWL9+peH/tsteHlQa9quQc2vbQjEX6TPEjn
         Q1V/LqigGhkAaHU7PR5FVHd6wHEdmDwyJrX44ff/IC3rzomMkrU9baK0c5/W31rLm9dl
         omMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245929; x=1778850729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=DrrKIJlQb+J15zFpQ3SBO8sWyhHtDMK6IGElF9DoBr+DBXHYSkwPcBiwRldYgftEEC
         OuZY45/rfPVxboXqS6R8WZP6KBMkwHfyugZg2v3i1mZFg+I7VGH7uELrk+/w983RJYC0
         dFRt63dRXXQvxo4RvYcvVz0SVx6Lv28Mb1YOdzktZI3tQkRKktg666cnPGJM0B1ZQlP0
         vidC4elA/SPQlRrxkGfzNFKYf0jlJFRjXw7hndTz3dSRJQQAYbnduQY/xXVDwoyM6xk/
         U8uyDpmRisSs2Ka9ZLB1iBQda1s5zqpVRolKiJubFoaIxRgz4jhzkjEe+0papkcEYwPT
         R/Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+aUEwWvNx3yW711wYF1IRUuyNXMzP3hlB+28oawtDtu0uh4ztpdOxIotKAXZ46ttJOlUA4WCwpo15s@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqolePTQSRPpmrYpv/nuWd7O4QrvJ3bIKtqg5gHs1kRWzNwWl
	ZFuCs/B0vBJwsM5vcf2MKilVQmzBSrwqXwPNOTM0P4f5wHy0WFYL9UGz
X-Gm-Gg: Acq92OHeIuchoSqB6EiQYlSokPWL/pLs1325z7DZB4AY0povSjPIBxC1AboCsr5Fhpu
	4Xe6WcQGUZev6nuIE7oNJLo/01vcIQ43DBvxcNuy+fgYtUSeVY3tw0ul5B21P8Bnw1nBKMSFzT3
	fT5EfAp5fFeGlVmUc54P3v/qu0Dgtw0BCAQA1CmM+viTo5O6aUTzHDxUzmmBdSGJBJMgdzabSDe
	fJeQUUSvzN5svANG1yIWL8yOROyvGsLhoV3eLB5MXPYgrdNuKNZOMuLsSKnbDLLX8xRsOOzxiTv
	qgY2wePf5nMaR0pg/VjL63vYbvIJBp+M8obBaTfH44meHoDJdxZJAjKdSkXOhECfSR9W5lklQyV
	iSwvmMUeHagiCHvowBts3kV60kNEoipXnVmB3jyRL7VB4V5L900z8PsKO64p4Izx4jiPel5A0E9
	wcgYgU2QnjjSBbpWEAqQ==
X-Received: by 2002:a05:7300:a987:b0:2d8:7302:d21 with SMTP id 5a478bee46e88-2f549e6b1d2mr6307684eec.16.1778245928826;
        Fri, 08 May 2026 06:12:08 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:12:08 -0700 (PDT)
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
Subject: [PATCH v5 4/5] leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
Date: Fri,  8 May 2026 21:11:38 +0800
Message-ID: <20260508131139.1523597-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
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
 drivers/leds/leds-is31fl32xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..57d779e07a62 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/gpio.h>
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
@@ -421,6 +423,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
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

