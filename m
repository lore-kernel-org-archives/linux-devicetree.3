Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F06367F40
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822385; cv=none; b=BXf5l+3Fg+cpkO8GA1wv2zw0kgHpC4lDzuvzu/HRTJy3+SS7bvE/VMtPETEF8zOnyTlDBzYAkgfOtvx92CumCJunAZEa94CelYF0hyoVAu7vsZN5FIOPTlNGjkBbsksQTbWpnUJM/+u/VlZ+vYYuLFhG5SuukPCreCYgzGTnRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822385; c=relaxed/simple;
	bh=Fg2KtAXDCXXyltSoF8WHknhmYOpPlfFwduvTzcAsQoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tUljSR+OjhZ4KtLahvr8muE/pdowOx2iy1MWXVSkZ337cEweRGLFsNVUk2YgRs+wWojTXIxD7RIMsqhKf9nQXZ2Zxjx+Wns51ThHlZphZZ4PGYDt298vinOzl7EIU2hjsTuj/OGlowYGjXWPEL01l5yFVLwJU+APYdLpQs+vrDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAF/kEkJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAF/kEkJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso2365264a91.2
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 19:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822383; x=1784427183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKukckWpY+orPNsziCIsLI7E7zxitxT1NiWuLx/R2I4=;
        b=PAF/kEkJnwurFstloIClJLTZVjQ02VAMtSU8vtyjucVKlgAaYTNVPhwVI5udfBUah3
         l8GrzBMpKWeTpjn+9GJYhwLy+pJus1kTX3H+p4L6pEv54klxINi9M3i2mpaN3VyWY2np
         FtTg/A8gRte6hUPXemZ9m8Vs7fwoYW0iUEFddU3b8c+JXmi/MehDeagi+yqXptUiX23M
         G6gHJnwVyqUZwi5uHAK5AThXpm+O7e5AuxuqgPAlcKq6U9YEvZ/WP6SOzv+iDMQ3Oxxw
         dxd2rF4cVF7qcxU8GBrLZduu8QRdSHOv4IWaMiQxIM1fugKmaolXDi64gnEmpg9r8k+C
         e9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822383; x=1784427183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKukckWpY+orPNsziCIsLI7E7zxitxT1NiWuLx/R2I4=;
        b=PQQ1lIrrvkWdx1lufQUl2lqvMVlFF7Uw0/fTf7uZm0GXtjK2gQxIv2457+si76JCAd
         yC05QD4ohLPj4VZQKV9rJEo89RG34PlZ7YR4QR/PQwV+dkVxjGADTOPNFmE7n4NH8REk
         9bq9BuEBRH3wWMkPlgeF+6Zh/HBDyDpnIVLZCxjpC0Ik+0FeNP/VnkZo+6q8oiN6K/pq
         Li9vrZ8FFSksS/qhtPzxB3kgpmuXHuFs9FjWXU+gwYNwxqrFt8ihC6tMGdj3TOD3g5K/
         HsHIukmOi7JygsD6d7AvSX9inAXyIcj0yKug1KL/Mm3oBIBMZ3AEYARv31mDwfXMgs+R
         FSbw==
X-Forwarded-Encrypted: i=1; AHgh+RqRm8iGZEcp9MC0dcU319PpKHrwpE12by1caB0ruv8dwK0NiPJA1dazB80H0mBCi6kfQ4e7qofEgeff@vger.kernel.org
X-Gm-Message-State: AOJu0YxdOLbUlNpc9vXtrFkpsDeLnv3lmZ1hiZR33KOeu1kDTn9n2yqo
	GhudnnF7aCSk4EFyjLcbQlKkQCsn/4PaXhI5k2eN3k0/B9/MXUbbxSnR
X-Gm-Gg: AfdE7ckQ9Pcm8c2t/A2HwUi+8wctaAg2lChCE1WSwr/GS2fScribp9lHuPcnsXUcUF9
	NJZORM7g/NseE09DALq+uUkW/gCsfaLObq3Ad766OPIIdeFMvAGwbdKOM6zX9qAgKyEduaHgo3O
	M0qrtxQgCSt7MB30zTUNcyv21JqwY4EFMnp/kGtXuiVF9e9hS593TEhfKSMUxRnHWuv0u+kvVC4
	ElpvlQBp5VYw3QJsOqrKtY9iPZEmmykAxiGJw2PqVf/uxwDfWI+hRmttyAL1oQvH/kjNUwLQLaQ
	XiyqlCGomFOMY/tmThFUcZh/OPeTRwl9MBpr5VkNaZrPrvUDcWjQDqAHrP/umQ14DT/53DiKNK3
	59Ykm2oYs6lspHPHmFPrDc4RskxxbTREZ9e5vNKHsUj+cn7i0rTYGHkSAAjD1/Zjy76UHVBdnTO
	H2244ivmoTnyYuvCvm6qQWELADg7/ceuSoMm4wam4Wdp+9UtgfFJP72wmgTILzXk+msJPFpVY8U
	9o=
X-Received: by 2002:a17:90a:e7c9:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-38dc784ae88mr4308970a91.43.1783822382978;
        Sat, 11 Jul 2026 19:13:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:43 -0700
Subject: [PATCH v3 02/10] Input: samsung-keypad - handle compact binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-2-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
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
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f

Add support for standard matrix keymap binding (in addition to the
existing verbose binding with a sub-node for each key). This will
allow easier conversions from platform data to device properties when
using static device properties.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 134 +++++++++++++++++---------------
 1 file changed, 71 insertions(+), 63 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 17127269e3f0..cc34f0146161 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -231,83 +231,89 @@ static void samsung_keypad_close(struct input_dev *input_dev)
 	samsung_keypad_stop(keypad);
 }
 
-#ifdef CONFIG_OF
-static struct samsung_keypad_platdata *
-samsung_keypad_parse_dt(struct device *dev)
+static const struct matrix_keymap_data *
+samsung_parse_verbose_keymap(struct device *dev)
 {
-	struct samsung_keypad_platdata *pdata;
 	struct matrix_keymap_data *keymap_data;
-	uint32_t *keymap, num_rows = 0, num_cols = 0;
-	struct device_node *np = dev->of_node, *key_np;
+	struct fwnode_handle *child;
+	u32 *keymap;
 	unsigned int key_count;
 
-	if (!np) {
-		dev_err(dev, "missing device tree data\n");
-		return ERR_PTR(-EINVAL);
+	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
+	if (!keymap_data)
+		return ERR_PTR(-ENOMEM);
+
+	key_count = device_get_child_node_count(dev);
+	keymap = devm_kcalloc(dev, key_count, sizeof(*keymap), GFP_KERNEL);
+	if (!keymap)
+		return ERR_PTR(-ENOMEM);
+
+	keymap_data->keymap_size = key_count;
+	keymap_data->keymap = keymap;
+
+	device_for_each_child_node(dev, child) {
+		u32 row, col, key_code;
+
+		fwnode_property_read_u32(child, "keypad,row", &row);
+		fwnode_property_read_u32(child, "keypad,column", &col);
+		fwnode_property_read_u32(child, "linux,code", &key_code);
+
+		*keymap++ = KEY(row, col, key_code);
 	}
 
+	return keymap_data;
+}
+
+static const struct samsung_keypad_platdata *
+samsung_keypad_parse_properties(struct device *dev)
+{
+	const struct matrix_keymap_data *keymap_data;
+	struct samsung_keypad_platdata *pdata;
+	u32 num_rows = 0, num_cols = 0;
+	int error;
+
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "could not allocate memory for platform data\n");
+	if (!pdata)
 		return ERR_PTR(-ENOMEM);
-	}
 
-	of_property_read_u32(np, "samsung,keypad-num-rows", &num_rows);
-	of_property_read_u32(np, "samsung,keypad-num-columns", &num_cols);
-	if (!num_rows || !num_cols) {
-		dev_err(dev, "number of keypad rows/columns not specified\n");
-		return ERR_PTR(-EINVAL);
+	if (device_property_present(dev, "linux,keymap")) {
+		error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+		if (error)
+			return ERR_PTR(error);
+	} else {
+		device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+		device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
+		if (!num_rows || !num_cols) {
+			dev_err(dev, "number of keypad rows/columns not specified\n");
+			return ERR_PTR(-EINVAL);
+		}
 	}
+
 	pdata->rows = num_rows;
 	pdata->cols = num_cols;
 
-	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
-	if (!keymap_data) {
-		dev_err(dev, "could not allocate memory for keymap data\n");
-		return ERR_PTR(-ENOMEM);
-	}
-	pdata->keymap_data = keymap_data;
+	if (!device_property_present(dev, "linux,keymap")) {
+		keymap_data = samsung_parse_verbose_keymap(dev);
+		if (IS_ERR(keymap_data))
+			return ERR_CAST(keymap_data);
 
-	key_count = of_get_child_count(np);
-	keymap_data->keymap_size = key_count;
-	keymap = devm_kcalloc(dev, key_count, sizeof(uint32_t), GFP_KERNEL);
-	if (!keymap) {
-		dev_err(dev, "could not allocate memory for keymap\n");
-		return ERR_PTR(-ENOMEM);
+		pdata->keymap_data = keymap_data;
 	}
-	keymap_data->keymap = keymap;
 
-	for_each_child_of_node(np, key_np) {
-		u32 row, col, key_code;
-		of_property_read_u32(key_np, "keypad,row", &row);
-		of_property_read_u32(key_np, "keypad,column", &col);
-		of_property_read_u32(key_np, "linux,code", &key_code);
-		*keymap++ = KEY(row, col, key_code);
-	}
 
-	pdata->no_autorepeat = of_property_read_bool(np, "linux,input-no-autorepeat");
+	pdata->no_autorepeat =
+		device_property_read_bool(dev, "linux,input-no-autorepeat");
 
-	pdata->wakeup = of_property_read_bool(np, "wakeup-source") ||
+	pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
 			/* legacy name */
-			of_property_read_bool(np, "linux,input-wakeup");
-
+			device_property_read_bool(dev, "linux,input-wakeup");
 
 	return pdata;
 }
-#else
-static struct samsung_keypad_platdata *
-samsung_keypad_parse_dt(struct device *dev)
-{
-	dev_err(dev, "no platform data defined\n");
-
-	return ERR_PTR(-EINVAL);
-}
-#endif
 
 static int samsung_keypad_probe(struct platform_device *pdev)
 {
 	const struct samsung_keypad_platdata *pdata;
-	const struct matrix_keymap_data *keymap_data;
 	const struct platform_device_id *id;
 	struct samsung_keypad *keypad;
 	struct resource *res;
@@ -316,18 +322,17 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	int error;
 
 	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		pdata = samsung_keypad_parse_dt(&pdev->dev);
+	if (pdata) {
+		if (!pdata->keymap_data) {
+			dev_err(&pdev->dev, "no keymap data defined\n");
+			return -EINVAL;
+		}
+	} else {
+		pdata = samsung_keypad_parse_properties(&pdev->dev);
 		if (IS_ERR(pdata))
 			return PTR_ERR(pdata);
 	}
 
-	keymap_data = pdata->keymap_data;
-	if (!keymap_data) {
-		dev_err(&pdev->dev, "no keymap data defined\n");
-		return -EINVAL;
-	}
-
 	if (!pdata->rows || pdata->rows > SAMSUNG_MAX_ROWS)
 		return -EINVAL;
 
@@ -391,7 +396,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
 					   pdata->rows, pdata->cols,
 					   keypad->keycodes, input_dev);
 	if (error) {
@@ -430,11 +435,14 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	if (pdev->dev.of_node) {
-		devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
-		devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
+	if (!dev_get_platdata(&pdev->dev)) {
+		if (pdata->keymap_data) {
+			devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
+			devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
+		}
 		devm_kfree(&pdev->dev, (void *)pdata);
 	}
+
 	return 0;
 }
 

-- 
2.55.0.795.g602f6c329a-goog

