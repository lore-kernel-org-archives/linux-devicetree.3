Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A912D12EC
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845636; cv=none; b=nH8YS2XY2x82ESbYKLdnftUGVRI3nABhbiBggPf0/gYLQAAw6XwrhHQc/4qqQR3DtY5YHGk2eFjPTHNHOEhIpzwiTRNUw1tZG69KViHu7HS4fkACFXP6ocODCYm1iyQOVcfRhl8nbD/0poyqLxSdoXcLA4V1VpHsWBsjAWJxrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845636; c=relaxed/simple;
	bh=e/H4yzSTRx9v1FO/nY2xDM9IAIIvMAnlcw/dCWJpsew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kc4k3VCRULSj9as46G7LIXPl7k/BeIbnS3pOMboKrVbGz4g+m6j9zjVYPcyii7iC37Q2cuH+MNznulpIa9s723P89tl2Jd1F5lMMB8NP0iKKBByUgocNpeS35OjWczsYGL+nz3CRUE4sTazJU9LTaMGMFMuRUUwqQhF4/uhSEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9m3Kaak; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9m3Kaak"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso1991660a91.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845634; x=1781450434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r66DUruGKk6cGeKPaPeTjn7wW8sOwdyE3f6CXLHUbkU=;
        b=V9m3KaakBwuzCXKKTDhwblaFRzmkYYUm2AZ+bRBLeDlbduzVukpD9J9Ci2kk5yDj/I
         zZi7SQn98dWiBuFFeeXOIB4ZrigXUA7ljuzlA+5BgUdOd46TzNRMHNkIWvZ/+D6q0Ryl
         Zb3CVE5PCFk1EvmZPI5Xhxx14S4vA0IS37M0BIb0JBQPJSq9oM8qPnBvsq0JzcL+MRc5
         DT79dSZPYVteBav44R33tOBM+JL+4DDfiYtZkzs+4g/VCZwdQb6aJa8WUJIyBBoQHyP2
         PmhJTeHpdOMNCqlRFMZcUXCpEaMthbHElJErPWuMxSn2voSZAVQ4UXEU/UnzzhvxyKFB
         xXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845634; x=1781450434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r66DUruGKk6cGeKPaPeTjn7wW8sOwdyE3f6CXLHUbkU=;
        b=j2gLcn6D1hguJlbgJL38r0bW2Uj4FiummxNFCXF7tWD8D8/I6t3DPJfZtXa1Q8CCvm
         +/uKAYoASKGnQg+LdO8p6xgwhnXCfd0qOmKC/DlzBtyRTx/nefuvuoRownLLgosu1enk
         KipyEcaq/jSF39mVRD2Ltfd51LqMNPy1ImilaGC/VfijOV3hyF9E7c4qr7qNBvMCOY63
         2bRtRTD66cRrxS9ZIIDy6uubno9ajiwcy6KAYVi6RU9OiMiI2zrsCkdt8yI2siew3PWN
         y59/RvBuxsGua8+TWxMTgtVHdpHoeLuWtC2j4jkD4jYmqoc1y3V4gyzFtyWNxBdvu6Xb
         ebLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+N9WEzDTEDjilHzzBLyUvLmPqub+FBHBtDClJOuN7+prg0mj+u00EEd82AMYJ7NigKr1tr1wY/Z5b/@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSoTg8o8D2OfFoTEIXizUsIZtE69qjGVdUL3YsCraVVZTzwaD
	xCDwxmODJjZoDudgF3DAxZ/ytk50g+m9CVaYjRgSTkoHlrs6DjWr7LNn
X-Gm-Gg: Acq92OFXGDTnzaQgufQkPCYB0s980Rjag2rHOyxY5n4jMJNV94Nmupzid0BZXwZXUf7
	jjT0ezrasvzD/ngUew7a/4muMbhTSaBiFOwBeTKtjPMmSf/B4flKlHwG+qUpEEfUrqyBjXCLfdF
	kwJtAzO7RH9MLhMrl3i/+x69vDvnTWz3ZdguE4qqH8/bVRbzdAsx1IPAFDU8HsITySkryjiWkOg
	ZzYWBOLUVtzYuK4r2vkJDJKGvHS/opELJslWposEaT4e3yjf24SpxJMkQtYYxy/IYQ/kp6XpQJU
	o6eIuh0y3Rs+6lq/p81UQIbX8WCqfPgeQnOi9eH0atYiH2O+LszzumCwQ+AGnD1Onkx1ED8jsY/
	VMqj/Bp5X5wPKZA06yhZz9Rve01PeBMQR+Y1fhKRfTrRgIfFJ2R4cz6b1cXohZ26B/JOHusgoy+
	upoHLCoW3rHUf/EIGt6JCba50ph+U0c5zW1O9BzWHphy9yaZFrGQ==
X-Received: by 2002:a17:90b:390e:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-370ee82f93cmr12620623a91.3.1780845634053;
        Sun, 07 Jun 2026 08:20:34 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:33 -0700 (PDT)
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
Subject: [PATCH v8 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Sun,  7 Jun 2026 23:20:00 +0800
Message-ID: <20260607152002.446617-5-jerrysteve1101@gmail.com>
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

The IS31FL32XX series features an SDB shutdown pin. Driving it low
(active low) places the chip into hardware shutdown mode for power
saving, while all register contents are preserved and registers are
not reset.

Deassert/assert the pin accordingly during probe() and remove() to
manage hardware shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 6c8d6b833260..b34fcef2c173 100644
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
@@ -421,6 +423,15 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	/*
+	 * Driving this GPIO line low takes the chip out of shutdown,
+	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+	 */
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get 'powerdown' GPIO\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
@@ -609,6 +620,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
 	if (ret)
 		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
 			ERR_PTR(ret));
+
+	if (priv->powerdown_gpio)
+		gpiod_set_value_cansleep(priv->powerdown_gpio, 1);
 }
 
 /*
-- 
2.54.0

