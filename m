Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808F2D12EE
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284057; cv=none; b=EL5nfsakyYjHtyAT5wAAunYDAoI30z6b1HYRZ873d7b3mGEmvLMgqvX5c9WaLBnnT43Sc4HVGoQfNGhL+rqSck7jTa18ggnaQCnBjH8h1jWaTOx3TqWrtDHOkNo0CPMe2nS5CN6uIDtA7I3IvcCYqBc7l/RYjjD/1PzP1Z90UmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284057; c=relaxed/simple;
	bh=Ad8yPDRxvnBjx/qpAX9cAhi7tpYDFaAo7GPdeLtpqzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlwhC/uJTO7T5LHra6JXg3k/tnQRUWLfP+klJixfbIT8TylRxOBrGPHBljXI4q8I4tVkrSEU5h81AYe9sb0fWNrSAlwBA/kbcJ49FH239bllYhXIF2OLR6PvFFVuA7+UYR9AoxMPmKwI+EAQrMxc5uP67MeCXToWVzRdSIOaMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkJ3nSos; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkJ3nSos"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69d66968655so183509eaf.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284055; x=1779888855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnWJZvYMA6qN0Zy8jazbsh97hf1g91RlijsDyV35hD8=;
        b=TkJ3nSosm6Kv4W+E595AYiW3Swq8Shawm6ZtaWLx2fbcCLEEeAgEjJ37QY+0agXVm8
         6BtPn50XvIJN6q7eFyF6J4lTUecUMiGYt2lQ2dhbat1p8S7Ifb02mplQjwwQ9ImICKUS
         Wi1lpljRkFWcolCOcSZ5ohUO0LKe2LEem+zgLp2hX0Z+NjMwyQOIxSBbKfazqGf8xXxS
         9/D4GYih3O7jPj1BzjdPxduCI/XUxp/ubOE7RBLUL2asjvEZYOlb/JK+CycjhfHOhNRT
         x9zrlNRAqYZk+PvcbQV1JqOP1HbxBJJ71VUCdmP2KiX8+3RsC6YGhdlZXmCiupbjdMbC
         FbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284055; x=1779888855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnWJZvYMA6qN0Zy8jazbsh97hf1g91RlijsDyV35hD8=;
        b=nlOl8uVwZlVGzAHiq0paS8xYk1YxWi9nycBDRjnNz3pUBFQy8EJyTAtBMaNfvXdxZ3
         xD+NwfkwmIqSBTRcygptlG5xcG06peIGkIM418Hth2ATeZZnHUucrfwgGlnwUapbJhhE
         8g28G8T2XzTESLEagvxhhrRvp6znzGC5kaA7SeYS9F0s5DmzegKzpr4eQ2BS12UekEdc
         YTCR1lT0dK/R/dOUS8XBYcSYkYGhZX0hEPkIERMsKX2NiiLDMokIYnPH+zKa/CN9wHzA
         7f1UfOGFh+/GxjDzEdDy4Mf1UpxU0UPm3ovs8e6yveRV/1VVIm33nmztaJzB/vT/6HlO
         PWTw==
X-Forwarded-Encrypted: i=1; AFNElJ+bdT5RR/gWdzFoD+Jx0uByk5VffozZR79WlkGLVaVj8tkPx5c4GAIE//Ls7ZrsQzqtPQzWEhH+g5Ha@vger.kernel.org
X-Gm-Message-State: AOJu0YxBO8TOiZjgz5/RG2+odN17jQKuCVQ8e8L20a/AruwocEYX9Yx9
	wOIabwp2KsRT4cnlyYxrQu5ghvXJE7Fzb1EwO6Ul7aTYk4o4wugDMa9K
X-Gm-Gg: Acq92OGD/+lXBUbfGzqFxYJKy9oWqfi+XIXeXS6EyZR4sXmfeFOMiaUWNPqXErrmdFd
	oyfsM7bMIgvxt4oFxacO/b48l4xu/QpIUFPYA4nTCz+k7NpVJaPaSzorYvvvp1qDZyoBfq5qcPV
	SADIjL7ma3dlr/Z0sEcp6RDfrqTKxuYjhXwm5hpcucdPtPJiKhCUR14ifvdzZvaKX2sP1o21Sax
	my4xLE49Yf/ZfSOk128X8Ym1uxqMFTxcwrZY+uEYuckQoZPK9JBOHgLWzMJt/6n8fOHOYMI2C7y
	kvf6srNr4ocMQ1ugE9ShrMZpl+UXNmQTbhlP0AaSTbdzuY0FQwxjnNZ/IlQO08SatUzYtTTkiRU
	GO5Q+vl5kX1wz4D6fGzMcqKlTVcdI5IOK0oytV4HYw9iC3R4Zeh+oYBtU1LhIeMBx5+H/z+vf9o
	B7MsJvwncS8yZpI/UK6FnVbRZkeLQ8WqGT8pRnLCE=
X-Received: by 2002:a05:6820:f005:b0:694:9fda:6366 with SMTP id 006d021491bc7-69c9429333emr13992078eaf.6.1779284055178;
        Wed, 20 May 2026 06:34:15 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:14 -0700 (PDT)
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
Subject: [PATCH v6 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Wed, 20 May 2026 21:33:41 +0800
Message-ID: <20260520133343.1423946-5-jerrysteve1101@gmail.com>
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

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Deassert/assert the pin accordingly during probe() and remove()
to manage hardware shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..b5207ad6ae96 100644
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
+ 	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+ 	 */
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
@@ -643,4 +656,4 @@ module_i2c_driver(is31fl32xx_driver);
 
 MODULE_AUTHOR("David Rivshin <drivshin@allworx.com>");
 MODULE_DESCRIPTION("ISSI IS31FL32xx LED driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL v2");
\ No newline at end of file
-- 
2.54.0

