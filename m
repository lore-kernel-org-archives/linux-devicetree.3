Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7910396B8E
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426169; cv=none; b=KAhbO02Uhd92860Ete7HS9pLD2XmAOy5M6NYoSRaU1z+HpoBznpbYJ4pyRk/vnVWs17QVgopKDvyiU0WStBPZ1AMCxGHqEqEJ8Prw8T0XwPyJuf61oXMplLsrF63Z1rAlkJUEh1hRPJSZXHhF04s2izIoL8DnWx148I3qFn8BTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426169; c=relaxed/simple;
	bh=2SoN076WkKPP9dslU6jI1ybrIMLHSTNOhkvnyADFEu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7CN+YoX+YO9XS/x+/RBuBkiBcVszlFlE5WbaAlYrJX/vFA3VwT/a/L5t5xRKxL74sCSpZ6FCVZ0/EGxja+MYvkebTa1PATye2RuVifE96zT5nr6IeB7gOyc1e7U82bH6S+gQqSGM4b2h4Q20q+/icZelNKfFdHACdT2Nk+eG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3Q+OsQr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3Q+OsQr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so634464e87.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426166; x=1777030966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIsBkEhxNk5zSXNzbm4OjEaayYLvWVn1IlfYzqWmAY8=;
        b=U3Q+OsQrqFj9zxxhBl6l+pnWu2fXBHRpsTivXAo2KmD6I6Fsl+1zwSkXerpJ3ipzoQ
         kuTU0/5BJ1Mbwxao5kHb+iisUffH5NlLjfUHdryWZMTZ69QDqvGRTyfFrEEUkNs9Thax
         pdwKThk8niYPRacMEtYiJVd4+/vKzs+MWoUnM8EgjHGEYQQozJUzu7V9Uby1I0hiwxcV
         BS+q9cNcIBMGxg0euq7sSZQzSqnucIJMyD4ML5NqpyLoQYOLfsMXGTcbxFjYJGtXcmBE
         NjfTjohpTdpUuWHXBxPcJqtBezN6Oa9nYT/XJ5I8EaTvigflklhEO4ukE8nuQX3INvCj
         MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426166; x=1777030966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIsBkEhxNk5zSXNzbm4OjEaayYLvWVn1IlfYzqWmAY8=;
        b=U+cgPCCDT8F58fXJjxmd+cbAX779u+u4ohJvjxTtmDAjYPr7wQ33Abxrh7ud31pWMy
         nrojSWw7EwC7UnhUg+PIolNLsMRTDY0jxGP9S2pps2BSLpTfAjuvtzkbhvGKdwinyKaI
         27HgGXAbGcog3pWyL6UtfHkCX3McLfnrGE6J9abfkWKNZVdRTlQvDTShWINF8SmiqBXN
         aQT+5YIM0hV06fzaRpZCP8AnAnkfL1pzUHQfVbz+xBEhg3dkenwWBUW0f35BQK0SXNcS
         UxqbA/PD8fwPCbjPmexnDkN4tJKsaXoCq7BsgRjMlBQIHYGEU4NyAU+RbkEjGPjdwOyp
         RNDw==
X-Forwarded-Encrypted: i=1; AFNElJ9ti6bMFNhW6rpHH4Qu3iZifKCH0KPK/VEfi/ggyYqRiWzNgp9nhKBvKvIsNM4GVFvy93HjvtgG+tzV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoh8oTCJozU2j2cibntsL7s60YD038nnqM6ywPtgTTXsYn9WaF
	xgYnOX9yA7sPmx4LdLdoQ1yY8QL3luy+xeWNTnDtT3kfGLlx5357K5yz
X-Gm-Gg: AeBDieviFcY6vjNKB4WhRzSd9BvvsM7Jr0xeUWGP+n9omZWVD42XfONlnzbqp3Rrxw1
	eU2se9pd7vRRky07w5LZdvilPB/bIMMZoIbLoTw6ncQdU8mJ/vn5hlyaFBEDcQxGiV5LB/o3gfY
	pvIdoLqPq2cVO710WjuElaQaP0IqrpwSw+Y1RDNb+wkJsF2l9kJBHhVJPmZ8yBmc4bE6i5Dsj70
	8CzozfP2IKuyOjwJ1FS2lLlsF0/zBb4Q10/0awjgtJH57zgBgEs9kLk81UQPFLVc0dipfP2rGXB
	wkxSy5cq+nurKKfdPRBKMZBz4Dq8Nu7hHtr9EHPpWbYzwiM12tOY72MCoSHqdNSchgIYlixvVNi
	z4Lej0HdKI1c+X+nq9YVFdBAj1khHf7iThOtlNtYJOilGd/DroPjYEKDrCNBpyLpOnLJJZ70beC
	3Lz3APguAQ742tjwQY5/kxa6k=
X-Received: by 2002:a05:6512:3b8e:b0:5a3:ff73:29d6 with SMTP id 2adb3069b0e04-5a4172bb921mr657348e87.7.1776426165787;
        Fri, 17 Apr 2026 04:42:45 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 1/5] media: lm3560: Add HWEN pin support
Date: Fri, 17 Apr 2026 14:42:22 +0300
Message-ID: <20260417114226.100033-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add HWEN - logic high hardware enable input found in LM3560 to ensure its
proper operation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..e6af61415821 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -11,6 +11,7 @@
 
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
@@ -45,6 +46,7 @@ enum led_enable {
  * @dev: pointer to &struct device
  * @pdata: platform data
  * @regmap: reg. map for i2c
+ * @hwen_gpio: line connected to hwen pin
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
@@ -54,6 +56,7 @@ struct lm3560_flash {
 	struct device *dev;
 	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
+	struct gpio_desc *hwen_gpio;
 	struct mutex lock;
 
 	enum v4l2_flash_led_mode led_mode;
@@ -425,6 +428,12 @@ static int lm3560_probe(struct i2c_client *client)
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
+	flash->hwen_gpio = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(flash->hwen_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
+				     "failed to get hwen gpio\n");
+
 	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
@@ -452,6 +461,8 @@ static void lm3560_remove(struct i2c_client *client)
 		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
 		media_entity_cleanup(&flash->subdev_led[i].entity);
 	}
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-- 
2.51.0

