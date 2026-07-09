Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5173348866
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572805; cv=none; b=swWXLdhdEkxh1POpSucTPeLDYdjhWYOZv+iYvgX7LidbaTQE5xciJpXBTOLRY6we6KFmFo1rbwlGLzBS/qb+Zh//5BA2PlhOvmgjhqMUn/vD+8wepGSUswmsURTWdp0wtxa1eCtLwTpYLQgE8sDpQRoZVSzJ0EPxAfHS78sK3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572805; c=relaxed/simple;
	bh=Svna67/rxF6DksoFBUX9w6XOFyVVHvkbN2umn96QZkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYa9V9ZQpOQYIeWjVoa/sg4W2Io2zQo1I943TMiPVTcw2XxJC5aAZRLiKUZ2paz9p4OuBlNhrUJdmM46ywetkRK6nMW8vDLXL239lAaxx9iX214yWHY7mOIwbFCubpJCHK47K/V/xdKeW3a65kzo8y0IDBwNEIJiLaCjJWt/VI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9lyiBHk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9lyiBHk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84847f60deeso469899b3a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572803; x=1784177603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2coInV2uMlLIpeqglM0vcfoc2SKHKrxAU98gxOM5VA4=;
        b=X9lyiBHkzjSoaVCFPY6NCEE+xP4jCuH1+IZ88hd7nkE1CoaHLZSnKEGW5t+CAy+ZnC
         tbeIZ+VXfDsgeyXYNxeyYd32PKOgbWeYH2OoFNIKzZVEpI9q/J3oXM9lHs4i2FFDsgBy
         s4d0mZXMNqQCcNgNPN8UKNv+jzwxli8Ha9zH95GJ3niAKf/sUTKnKQ4hwTTDCxZcB+12
         oD1ZlPcf2aH7mAvSTfyni4pXwc7PnHocPklyrBnP3//LGD3c3cpJWwVofkSJM6NWZZik
         iMgQ+MWc/Cb9BoEgkB4g7FL3liRoy5LQrwSJt0pwTr+uD8SfpkUv6Y2sRPutO77yfY1G
         ppcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572803; x=1784177603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2coInV2uMlLIpeqglM0vcfoc2SKHKrxAU98gxOM5VA4=;
        b=KEiry3vWVN4H4hQujZM8oI8FlxjNH5TPOyWpAvsMwYyQdg/skzHv+giCemK4XNyLW3
         zXN/YbFs4NrwfUOFkxkWoPG07uwpDOh0fOWc/EORy7R7j3pwxXb6MUQngoHOVsF+EK6h
         dI40g7RAMF7JNh68TNj+mG2eFP03v7e8uTsRSJ3WSyo8wtt673Ny+PxNZeq8TLfLiavE
         966NOksZtZHXI8UOI4PN8w+47ZeaXrHsdezMvhsfjYOcwacUU+AxCo1/uzTsNmDDKpyK
         JYH59JBD7kSf2RnlIrisDjB+j3aYnhc/mnBQ6FQF+cGltPOvNbDbTISr+jmwNTqoRoPQ
         Gpeg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0wf0dQQHGW92Q5bO3q9MdhHROSsc1RZHptfHhJgfFp18SZupzRbEMYfUDXjIUb03f+AvVXyTZAWDY@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR8Fn+CnRvWIxps5wMvUAD7oW1Ae156SGpTvzMTE5HyIlpXww
	jOGCX3ratdpMChM4z5vDabfSEIhfEDhFzN7PnDKfkH0JQaZkada39c/E
X-Gm-Gg: AfdE7clmgfLaGkAi9IXIWaSJ/E4YnIUefFPLOA9+j94UUH03t5FBypC5XlvfZWfmZhi
	npf7kafguF9HLvl1j/FA1JCA3iVaST5X7vjFrn51+EMl8X61+ScC0p+xzJOABGRMJOIKeyKrgIp
	bsSraLlPy6QTGm0p3jVzsUMDVsd0WOxV9ZijOg0V6YrN7c3On8rhj5Sv75KJ3/9Epe7/llALFvg
	KIAB9lFNfVEdMiTkmRg7boIIdwxDhFlySjHRHPGRIGthBwTjucRoA/yYLc2qWAVQy9hQqzu2bzm
	D8tVlZwM2qyo73z2ipeMCNj2pwVzfsyofcSa6vjHhCz9IYKSLTj+EM8GgnpqBeY6WEO73k0UKbv
	I6p6WPgQzahyXIRuVNsXAB9zqpA4vBbVQhdiB6QRmQ6kpUeI5tiVOFbWNHXHwVWjj4ur1bjzC3h
	XAmv6NJoAENFtbA4mS+hvQRbOdzEV20xhjUw7PGael6wSurkglIknn85P4Hq5V+bLUBnDLBD2nD
	Lm3
X-Received: by 2002:a05:6a21:6daa:b0:3c0:9acb:3fb with SMTP id adf61e73a8af0-3c0d6a8ab01mr1403688637.32.1783572802842;
        Wed, 08 Jul 2026 21:53:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:22 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:07 -0700
Subject: [PATCH v2 09/11] regulator: wm831x: remove legacy DVS platform
 data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-9-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f

Now that the only board file in mainline using wm831x buckv DVS has been
converted to use software properties, we can remove the unused legacy
DVS fields from 'struct wm831x_buckv_pdata'. Also remove the fallback
logic from the regulator driver, making DVS support purely
property-based when software nodes are used.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/regulator/wm831x-dcdc.c  | 22 ++++++++++------------
 include/linux/mfd/wm831x/pdata.h |  3 ---
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index ce43c51c0170..05f49b2f5bad 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -336,15 +336,10 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	int dvs_control_src;
 	u32 val;
 
-	if (!pdata)
+	if (!pdata || !pdata->swnode)
 		return;
 
-	if (pdata->swnode) {
-		struct fwnode_handle *fwnode = software_node_fwnode(pdata->swnode);
-
-		if (fwnode)
-			device_set_node(&pdev->dev, fwnode);
-	}
+	device_set_node(&pdev->dev, software_node_fwnode(pdata->swnode));
 
 	/* gpiolib won't let us read the GPIO status so pick the higher
 	 * of the two existing voltages so we take it as platform data.
@@ -352,7 +347,7 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	if (device_property_read_u32(&pdev->dev, "wlf,dvs-init-state", &val) == 0)
 		dcdc->dvs_gpio_state = val;
 	else
-		dcdc->dvs_gpio_state = pdata->dvs_init_state;
+		dcdc->dvs_gpio_state = 0;
 
 	dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs",
 			dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
@@ -362,10 +357,13 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 		return;
 	}
 
-	if (device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val) == 0)
-		dvs_control_src = val;
-	else
-		dvs_control_src = pdata->dvs_control_src;
+	ret = device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val);
+	if (ret) {
+		dev_err(wm831x->dev, "Failed to read DVS control source for %s: %d\n",
+			dcdc->name, ret);
+		return;
+	}
+	dvs_control_src = val;
 
 	switch (dvs_control_src) {
 	case 1:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index d73a04c82ca1..c48333552f5a 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -48,9 +48,6 @@ struct wm831x_battery_pdata {
  * I2C or SPI buses.
  */
 struct wm831x_buckv_pdata {
-	int dvs_control_src; /** Hardware DVS source to use (1 or 2) */
-	int dvs_init_state;  /** DVS state to expect on startup */
-	int dvs_state_gpio;  /** CPU GPIO to use for monitoring status */
 	const struct software_node *swnode; /** Software node for properties */
 };
 

-- 
2.55.0.795.g602f6c329a-goog

