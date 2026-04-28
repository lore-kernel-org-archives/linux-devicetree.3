Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821DC2741B5
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336505; cv=none; b=NHGj/PzKDM4C1SaFb31AcYnL0YQbW+7vzAk+JnQIqDw283sNqkx5sEikuyHlIscQIepykxaJHBBgzBadNmWlSHqW6sYJXvpKa+yxqXNXVS6Y+3MmMolstzcAJxNqveEbICvG2y0CArTGxl3LDBsMkv+RkSNkmz3NalZ89Mq6jB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336505; c=relaxed/simple;
	bh=Wj2asEhQquK+fSwcH/j3WIHVOoV8HWt1sMZeo3rKa6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pk2TnVGDTbyw8ua7CJpfmd+eMWzOyXnBTFNRxmJIUuzlljNdAi0y/N5LPmTkCKTwkS1xq53Eu4eaXIr67b4wfek74cvBdLQnsfRpk2qagPTXy/y5PRTOnrjygg7b8pCy5YkroXBzirhySIqMZgSfLUUHcvzHPEB5MvcyBigs/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NanMr6mW; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NanMr6mW"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c726ef332so15029534c88.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336504; x=1777941304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=NanMr6mWfnGmC5Vq7FW/HSVGG6u4jWjX1wogSJRy046DRqMc8CsGHkEXEAYOH3jpVk
         s9O8jfNNsO69YEW1aX64j/7qSHkSgsjOEyLCKwAnHutW6ukvK8cGMJW1oQuH3gAvtnAm
         dwnajfznIhFU7JRU3GGzuQKyieEqPsQvYML4dSWILznDoUhT4BbhY/VasZJvXZVSurTf
         Givrvqai/JWEjwv2kawSDGu5OGofFohwNaEb3ZsTZROJ3ulTdIkF+12+yfVAMEtpHh3y
         JGbX0f2p+27486F0Bt/xhFXCiaTk+Decmg7/sXg91wDpl1XCL6JyfLt1F83zWnXpGv8T
         20eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336504; x=1777941304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=YcaM4tRJSnxs+9KVGYcIl1d9G6TYidqhfct9SxJWaUs0u72JvThIgSmXscq6HidRD7
         6Dvj1PjwNmFjqUfB3X4wU9lnCOEXLDWF5jS3VIi260dDhVgfJrjK/rpzewu7ZrK/bgjc
         0/CrwHuBxvLLjEwx7fmoqfczo1GA9hhnALiMvD9fFPbEjoq3lWNzfLtSlYXnzEmMI/lh
         6XbTGMm9pJVcAzq8gRrzyI/8hwLL9E7+JAFJeafRuj2IICZYrGFOj+5SppSWjw8gxpRo
         D4HfD9rHXQPZDtCxOzOYsBA0LUNO5bPoE4mo4GzAGvRN0Cp4WZw4YMOVWtWroGC745rQ
         B+rA==
X-Forwarded-Encrypted: i=1; AFNElJ+5ojiB/gK8pNgJ11aOpHABXw6eHGziZlomwOrJhV1nmQgms8UXQkMnG/6aCduL1nA5W0BPD5o9cT6h@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1bJCo8BXOA3/WUmHBbFfuNbiuU6b4qP4QMbOzIFgmRO4fln51
	NRsGyAWrbUMY/bzLYHDMqX6D4HsOFqtsES3nekjYRyxBzFpt38geOa53
X-Gm-Gg: AeBDietHm12Sq5oR+IdTKYWKHqRoA6ZSMzgcf/LQl9tg92yWHoGMpjDXUZf7//bfloQ
	tn0LABBeEgh1e7MO0f13LK5YuBNYwxtKK863xeh+/MXNADkQcwh2ZJMyLqwXpnzLnF2fKw/tEY/
	IRIm0trqHW+f7txCM5as6RT8IaBO72psQvZ7bDwnbDKcevzBaBKiG7yFDCO6L919qOtwztC/T8y
	NVNVEqi8kTkY2gCzUjc1NOPf6uAHVu5vH50DkJi1YR3Dep890R+1qERcUudfb/U6wSExLtmpn6s
	vjWkg22xteKEfnyg3GIUmfVOKvRWrp5kOjW9K6vQkMxMluytuD9ViFGl3RUKMazQnHvfosIbRSN
	Aj286VsDDCxPipNBSbtSiYTLEcrqK+bSpqmBw4RMRqGhwVHPgKp7VjBnlaQWmb3UM+XbS4YJ4gm
	6GgghNOll6GQfeagO1QMdcjPsei3hhMfc=
X-Received: by 2002:a05:7022:b8d:b0:12d:de3e:be87 with SMTP id a92af1059eb24-12dde3ebf44mr75138c88.35.1777336503539;
        Mon, 27 Apr 2026 17:35:03 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:35:03 -0700 (PDT)
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
Subject: [PATCH v1 RESEND 4/5] leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
Date: Tue, 28 Apr 2026 08:34:11 +0800
Message-ID: <20260428003412.322032-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
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

