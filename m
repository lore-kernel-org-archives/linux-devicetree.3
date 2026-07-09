Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5094F3A5E72
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572790; cv=none; b=KfvRng3abRUvHPqRYv8BuzqDwlwwN+TyPBL11mXluaWIdIJaxjcz2Fnlm54Nb21Al5RNZGYGdO8Y23IJByzIjWYIBZwgStdWwFXcT1Ulicj+CRSjpjy8diajm9YpHd5W48q1yWoU4Hy/lyvLcDXo6SOtiHvtSDBCGZQios4gslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572790; c=relaxed/simple;
	bh=fHPwrtX4op12Jr8tj5bxl18gZgVoc8iLeh7ri3WZ/uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZ27aQH9ByHhmD8Xu4jisYV0jDjCmbIy6G/6IR9kdh+//VWtUPxfaYIclthWC+Ofu10KDz2/PwzpymjxKxmFONbYj/Q8mKu41jyhnyOd/zuU48y310LQ1OBD3Vl9fvLlZ6jdhXVlq7hIWxPMN7MYsS1xulKupDLg15wYTQ5B7bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p09bvlLQ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p09bvlLQ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1080776a12.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572789; x=1784177589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K26mBfWTEhCgyKuaP+D1jacUWyTXVy3FDjUtVm+Ftzw=;
        b=p09bvlLQbACxhaAoa7ryXaxmkJPEVZF/qCVQZYmQNt1FRM1n+iHOrUw+zpxKbNq1ah
         q1Ub5ztgJnBkzk8dN43ZbdvVy2Mzz6eBfQnuSS6XIM9E2L8iIPRAsWTnuSu98drABlKH
         Kx3kruT5+iSHDRbcK30eyjXTHREkTi/yuYakrI0ENtzIgKOgNQwrvXav0g+iyInKpOrg
         oED1oaBeztPc+sZZTeA4thqbPrCjMoD0vrMQ2iIaonYW06ruLQo76tvygMT57dCd9NyP
         AefdyFFA03TQrW8pukbk3G63QdwVnWVRznc8vCqS5yOYTWdGfmcVgZa/DVoXUrDUQ4p+
         lA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572789; x=1784177589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K26mBfWTEhCgyKuaP+D1jacUWyTXVy3FDjUtVm+Ftzw=;
        b=Z8Y7e5TCGjdOCq3QXsAJyofB94m3C0V9VeHIbsD0185Eo57G/JD3dLFAuilWkv3Xml
         x6l5GyIuYfOn5JOt8yAJAFnZYX1f+eAftasmmuUR7RE0qyjxG+AOzzSJDq2u1cgfvhD8
         Ba/fLA+kqF9SFVG45ar1gl87iIcBipcoAfa+puErYrNz4hDdBZrBgwFITxIEeD+Na0z6
         Ub//bWyR3cl9PNMF+XrvArCahN+OCXiSoG+cZUrsQhTOimrlzC2YhbWwhRlSC+Hqzzn2
         0IrKEWPk+S+RNMZTO0dXE+GWq53ANTqd8R6MfcxQOIHNoTzBWRawTZ3mkZH36o5JRuC3
         luYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Rp3PtJJqLVEc2Iz7WnWSGe+HQ8xcBMqwSX6xiOeqc3eRJ/r7HTBPNVPUV22aNiXYGC+LQCKINiEu@vger.kernel.org
X-Gm-Message-State: AOJu0YwXk8gIUF6QC6VVsYwzKNteuzfYMlamLzUT0ex4fVCoril9x3Hk
	Qh/WFOJ/IARFNQm6355nslSIPcqKRNYW4UL+OdCISwf/8mXjdeJ+Ocx6
X-Gm-Gg: AfdE7ckTSP/reuCLj9UWUnVvgiYDXO782eGWD/RMmYTA4Zvra3kKDARYjYI7Ui0zof2
	Jgq9P+VkE/QkFohve/kd8kRpSQS1NQQqpxAdmNjqy6tpz4qZJSfdcgmWLeu9G/rvwNU+oEwQdvB
	ZkSTRY/2QZdkYH6OPOrPpVUjg1dRQxujgp/5aolidmkkobljav4HU6xpnITisDzYzGzBrOu4NF5
	fVmb5rv0jH5wcQLOQJG949kNVUHcG5RhHUlQGkjwDVxOYPmYM4G8E/55MCsmU4mwXzNCzN3oPEA
	QgrPdwJwOi3S9r+HlNgN+3gE4UVjaM0wAMgLKsbsrNSKfNzSyaG35TSFd9c/xpwEnmCEInydutf
	+rdK1MSQInKKUc00Yi78DgHH02vphjEmc+pJqkldkwEco8b6Bixb+1ZRpHil8wm5TEFHY1wCnq1
	Lqmv7YvXdTTzh9kXfWM7sM64PlNG0dBEN7qjjfN1wGcM3qVwRpQMrcs9P8UgU+/qjNfKfJ/vLUO
	Ut3
X-Received: by 2002:a05:6a21:670b:b0:3c0:9c19:65b5 with SMTP id adf61e73a8af0-3c0bcc3ae41mr7443493637.61.1783572788693;
        Wed, 08 Jul 2026 21:53:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:00 -0700
Subject: [PATCH v2 02/11] Input: samsung-keypad - handle compact binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-2-3c6ed4c9b3b6@gmail.com>
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

Add support for standard matrix keymap binding (in addition to the
existing verbose binding with a sub-node for each key). This will
allow easier conversions from platform data to device properties when
using static device properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 130 ++++++++++++++++----------------
 1 file changed, 66 insertions(+), 64 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 17127269e3f0..b9d4ea5f202a 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -231,83 +231,83 @@ static void samsung_keypad_close(struct input_dev *input_dev)
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
-	}
+	device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+	device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
+
+	error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+	if (error)
+		return ERR_PTR(error);
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
@@ -316,18 +316,17 @@ static int samsung_keypad_probe(struct platform_device *pdev)
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
 
@@ -391,7 +390,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
 					   pdata->rows, pdata->cols,
 					   keypad->keycodes, input_dev);
 	if (error) {
@@ -430,11 +429,14 @@ static int samsung_keypad_probe(struct platform_device *pdev)
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

