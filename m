Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842042749EA
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591284; cv=none; b=L2XA3fKap+SQ4qUJeTZ228ylEyJ7nGTNU4pDc1ahbeLJ3LiirMLHD3pFzO1AJ/J5idx6B/rn4YAaVHnRE2q1EN/yFFX1IxhdP9IdR1ny7FDrftn10Vzs0Np0SwClzeXrjHar2hZqO/b7qvewhn+JU+RL8ycp6fMx/7P6hAerpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591284; c=relaxed/simple;
	bh=AaqElH9zuTNCv1HJ0+GB1hU2qCY3xf1+6Kn/cjf0+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MaFLiBcYOtPJPyL4ol0Rybf7qzAk59Vm2ld6HdTecvseCGLjFdJbaeEvvuZ+abY4rnHf1SqHwq2y6BbJ2IToKpHdJJ/DwBrQX0Eyt2KgLS5SApR887XWbxdcStG/sC3GsuACmAmyl1XKiFu3g8jW3brgelapobH1UvwiLWj2x8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKYD7h5t; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKYD7h5t"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a337552604so2144979e87.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591280; x=1777196080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaoyCyrMENabXEPbF12o+TCRZ1+bwFFYGgCjy5VoZDY=;
        b=KKYD7h5txO1H9kd7zkSNSeEt91dMvR7KBLUVn8I8MLa7b1Ocb5jD6BJp0neDROBHie
         DNVmlPyzk4s4WESUYGuBE9HUIsIdmoegC+A8ywALAQFmdE77V7CTy3ukzXSQPBJwchQ8
         qSTUVlLeXTmGdMD0r+di7eIIYqWF/DSVbzOTwDOmzDrIXE8lrdZqUye2mr0xApYnuRo/
         KfdkCZGg05GKRN4RXif6K/v7umPGVZ3J9M5RFDAPl2os0P8pvywVGppNcAUwP+2+kaTh
         QPS9drRFjcmrir0I56tFSV29uXlYNckP5c1IwPHfHCs2KRPK/jwizJd5qi+0oLCVVmYH
         p2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591280; x=1777196080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaoyCyrMENabXEPbF12o+TCRZ1+bwFFYGgCjy5VoZDY=;
        b=CaOAcCmA4z8Dtg1btMvA4ruhmcDpekMg4dTIbwHhdCJ3bccIjA4B6pWHiSQeJaUE5V
         pgIPbDgcwRff9ZZxh0Ch4xtBwUVFi+hEW2aDU23MEOkZDIbRgXPPmRgUPNoTAi2x2DRs
         hYUw/nZ4QR3sAVUA0c7SnDKuugfmrZKqIt+V/dfYSKwYCeKXeKO/kUkT0xo1UDMmmZdm
         3AxMAfiEQroT6XY0bvzES/mUgYi0R8UM0XLJQUIlYXUONuCzyHy/pHZkOuEiq0SK8D2v
         XVIredcl7PaVs5KZVPyCO5sMzwJInTy3/ExDUTVWKQnvHTWhD2ycg4BYQVmIT5ZfnRvi
         yzDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FbWv+goDGJO77xwdYev2RrmgYwiYr7XwmQB0FXZyFC24ur6dJsARUi9T9QddLaqNX3lw0i83FO8P1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2GAWmTYuZkdI76iBdQRGHHIpxGk3BLAObmql5m3ykp6uJi7gi
	YIqx3nJnImcyN29on0aDz+ipUHlVGxR2XnDILnO4MJfC7+Y2pUEPF/Gx
X-Gm-Gg: AeBDieskOJyLvt0y+CQSKmF60W31vNgwJDo1U3b50tnlqPhJ2K/0Cy7fLLuNOqXalU3
	t3ylOd9PZ+yqNcqZrcXGfXoTHgoQn9lfkCvZDNoVPYcYDRnvn6iMBgoDMAUSsFqzEq/3Vy8v6Rn
	a2RuOBiSQhYFP88yqzFlUIFxazVbJbUhCv2Y03AO/6tajeGVU7lSmaSnae47xs48mzvnK3ch8N6
	1qc5eHaFCP50TitxIY+rex/aqQvDPL9GKBQv3RNPtuLodwDEoehvUplBy+KGQF1nyh/tSpROOtN
	FicoMA6JT/AiSZXxD+jTZsBNcIbpiy8EKy2lPhqdhFpN6jDlD7ns4SJ6bypQC9+9j5W9r65xl+N
	mKKJhORqAdeISbApQkqhZs0hX/Nu8re1N6fHIa4HDtcfPr8y5XYhHj5Z3SRYnAlsByP/DP4pQSa
	aiK9tPnZlZ8eh286m0HvycAOziQ7Zrb/d5ww==
X-Received: by 2002:a05:6512:39cc:b0:5a4:ab6:81ac with SMTP id 2adb3069b0e04-5a417302144mr3422597e87.34.1776591279593;
        Sun, 19 Apr 2026 02:34:39 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:38 -0700 (PDT)
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
Subject: [PATCH v2 4/5] media: i2c: lm3560: Convert to use OF bindings
Date: Sun, 19 Apr 2026 12:34:11 +0300
Message-ID: <20260419093412.40796-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419093412.40796-1-clamor95@gmail.com>
References: <20260419093412.40796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since there are no users of this driver via platform data, remove platform
data and switch to using device tree bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 112 ++++++++++++++++++++++++++-----------
 include/media/i2c/lm3560.h |  15 -----
 2 files changed, 79 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 5cd22c2fbb64..022a6a76befb 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -13,7 +13,9 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
@@ -43,22 +45,30 @@ enum led_enable {
  * struct lm3560_flash
  *
  * @dev: pointer to &struct device
- * @pdata: platform data
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
+ * @peak: peak current
+ * @max_flash_timeout: flash timeout
+ * @max_flash_brt: flash mode led brightness
+ * @max_torch_brt: torch mode led brightness
  */
 struct lm3560_flash {
 	struct device *dev;
-	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
 	struct mutex lock;
 
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
+
+	enum lm3560_peak_current peak;
+	u32 max_flash_timeout;
+
+	u32 max_flash_brt[LM3560_LED_MAX];
+	u32 max_torch_brt[LM3560_LED_MAX];
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -269,8 +279,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 				enum lm3560_led_id led_no)
 {
 	struct v4l2_ctrl *fault;
-	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
-	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
+	u32 max_flash_brt = flash->max_flash_brt[led_no];
+	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
 
@@ -295,9 +305,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	/* flash strobe timeout */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TIMEOUT,
 			  LM3560_FLASH_TOUT_MIN,
-			  flash->pdata->max_flash_timeout,
+			  flash->max_flash_timeout,
 			  LM3560_FLASH_TOUT_STEP,
-			  flash->pdata->max_flash_timeout);
+			  flash->max_flash_timeout);
 
 	/* flash brt */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
@@ -339,15 +349,18 @@ static const struct regmap_config lm3560_regmap = {
 };
 
 static int lm3560_subdev_init(struct lm3560_flash *flash,
-			      enum lm3560_led_id led_no, char *led_name)
+			      enum lm3560_led_id led_no,
+			      struct fwnode_handle *fwnode)
 {
 	struct i2c_client *client = to_i2c_client(flash->dev);
 	int rval;
 
 	v4l2_i2c_subdev_init(&flash->subdev_led[led_no], client, &lm3560_ops);
 	flash->subdev_led[led_no].flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strscpy(flash->subdev_led[led_no].name, led_name,
-		sizeof(flash->subdev_led[led_no].name));
+	snprintf(flash->subdev_led[led_no].name,
+		 sizeof(flash->subdev_led[led_no].name),
+		 "lm3560-led%d", led_no);
+	flash->subdev_led[led_no].fwnode = fwnode;
 	rval = lm3560_init_controls(flash, led_no);
 	if (rval)
 		goto err_out;
@@ -377,7 +390,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 
 	/* set peak current */
 	rval = regmap_update_bits(flash->regmap,
-				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
+				  REG_FLASH_TOUT, 0x60, flash->peak);
 	if (rval < 0)
 		return rval;
 	/* output disable */
@@ -393,8 +406,9 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
-	struct lm3560_platform_data *pdata = dev_get_platdata(&client->dev);
-	int rval;
+	struct fwnode_handle *node;
+	u32 peak_ua;
+	int rval, reg;
 
 	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
 	if (flash == NULL)
@@ -406,36 +420,60 @@ static int lm3560_probe(struct i2c_client *client)
 		return rval;
 	}
 
-	/* if there is no platform data, use chip default value */
-	if (pdata == NULL) {
-		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-		if (pdata == NULL)
-			return -ENODEV;
-		pdata->peak = LM3560_PEAK_3600mA;
-		pdata->max_flash_timeout = LM3560_FLASH_TOUT_MAX;
-		/* led 1 */
-		pdata->max_flash_brt[LM3560_LED0] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED0] = LM3560_TORCH_BRT_MAX;
-		/* led 2 */
-		pdata->max_flash_brt[LM3560_LED1] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED1] = LM3560_TORCH_BRT_MAX;
-	}
-	flash->pdata = pdata;
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
-	if (rval < 0)
-		return rval;
+	flash->peak = LM3560_PEAK_1600mA;
+	rval = device_property_read_u32(flash->dev,
+					"ti,peak-current-microamp", &peak_ua);
+	if (!rval) {
+		switch (peak_ua) {
+		case 16000000:
+			flash->peak = LM3560_PEAK_1600mA;
+			break;
+		case 23000000:
+			flash->peak = LM3560_PEAK_2300mA;
+			break;
+		case 30000000:
+			flash->peak = LM3560_PEAK_3000mA;
+			break;
+		case 36000000:
+			flash->peak = LM3560_PEAK_3600mA;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
-	if (rval < 0)
-		return rval;
+	flash->max_flash_timeout = LM3560_FLASH_TOUT_MIN * 1000;
+	device_property_read_u32(flash->dev, "flash-max-timeout-us",
+				 &flash->max_flash_timeout);
+	flash->max_flash_timeout /= 1000;
 
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
+	device_for_each_child_node(flash->dev, node) {
+		fwnode_property_read_u32(node, "reg", &reg);
+
+		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
+			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
+			fwnode_property_read_u32(node, "flash-max-microamp",
+						 &flash->max_flash_brt[reg]);
+
+			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
+			fwnode_property_read_u32(node, "led-max-microamp",
+						 &flash->max_torch_brt[reg]);
+
+			rval = lm3560_subdev_init(flash, reg, node);
+			if (rval < 0)
+				return dev_err_probe(flash->dev, rval,
+						    "failed to register led%d\n",
+						    reg);
+		}
+	}
+
 	i2c_set_clientdata(client, flash);
 
 	return 0;
@@ -453,6 +491,13 @@ static void lm3560_remove(struct i2c_client *client)
 	}
 }
 
+static const struct of_device_id lm3560_of_match[] = {
+	{ .compatible = "ti,lm3559" },
+	{ .compatible = "ti,lm3560" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3560_of_match);
+
 static const struct i2c_device_id lm3560_id_table[] = {
 	{ LM3559_NAME },
 	{ LM3560_NAME },
@@ -465,6 +510,7 @@ static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
 		   .name = LM3560_NAME,
 		   .pm = NULL,
+		   .of_match_table = lm3560_of_match,
 		   },
 	.probe = lm3560_probe,
 	.remove = lm3560_remove,
diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.h
index 770d8c72c94a..b56c1ff8fd49 100644
--- a/include/media/i2c/lm3560.h
+++ b/include/media/i2c/lm3560.h
@@ -66,19 +66,4 @@ enum lm3560_peak_current {
 	LM3560_PEAK_3600mA = 0x60
 };
 
-/* struct lm3560_platform_data
- *
- * @peak :  peak current
- * @max_flash_timeout: flash timeout
- * @max_flash_brt: flash mode led brightness
- * @max_torch_brt: torch mode led brightness
- */
-struct lm3560_platform_data {
-	enum lm3560_peak_current peak;
-
-	u32 max_flash_timeout;
-	u32 max_flash_brt[LM3560_LED_MAX];
-	u32 max_torch_brt[LM3560_LED_MAX];
-};
-
 #endif /* __LM3560_H__ */
-- 
2.51.0

