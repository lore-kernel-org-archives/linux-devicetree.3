Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8393E2F7F0E
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360474; cv=none; b=dGMdZnchyTRn7zb8evc15m9EGKQAEidNbi9o6ihSiQZ5skyEnzNNm8qirYsveqNbCMBVj1DTwQhd+jrxOvRgfzTEmh8HBp3Vx67jSXEBYqxkMxrlGcMlsuNsROfzdvyivbga0gKsF4KewcH0PaXnkXUE9ExxPhfZRCJFsYxtQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360474; c=relaxed/simple;
	bh=9yJu2dJxEoG69r7armkn1uXO0+LbbsdYRkSyhvXQmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ym8Q+tt/jo6to1OZE+1Immxu/eZC2Tmr0Efyu0FuURmoaoMdbi1DXyTDbne/sVr8cZRRW8syWpKVP0PNrAPNXwguIlpOwCLLJyNG0Z05gtwUglS+iLq3Ov71TJY1AApTByK+YovS8k7eAENNi07xup0AHcwIuPkP+cy2mhQuQ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzoyJE2g; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzoyJE2g"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1652513f8f.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781360468; x=1781965268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scBpgkPwRJRRB0oOaefOk5GQsdI4UdFOs60BEKTsuNo=;
        b=ZzoyJE2gLRMksNzXL7fl8/nhIi9Fr7QtCS3NjHsASE9UWLW6dLByr+5YQ32k7RHU4K
         3smlf9GUUPIXOYN/2EICetq/abo0pa3MfSU0syzhtC+xEJHbeaylXNDoM2q8GA4UopAH
         3NkwehSklW9Cau0Y2EMNR4W0W8OcQLw/EP0IeR9VQRGef3arkc66/k2VWhcp/CodrjaF
         /KKyJ4qti5gHzs7qFpKtucBjL2MxcAPmlTxYB2xD0HhM70U70ycmSoGNnOVLs+CFP1vj
         0S9v0ZH/Q0fYg8lYJIGMdQdH7aqY9LOq2461/oh6BOJU1K3Juw4N/xR+WonPv39fDqkG
         AXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781360468; x=1781965268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=scBpgkPwRJRRB0oOaefOk5GQsdI4UdFOs60BEKTsuNo=;
        b=MfIoHDWcFgzYBzhVcmeIM3ei+MHVd3S8+w/+3ltM0gknNi60QwLXnoeKom7XH1Ed+G
         eTgFi4e81s0EEFJsxttx/xWA1CW5wNsIK4riouLA+zfBPjbc13d2zVV5r/+3bKijdTuY
         nWpkjQ2jy2xx5h1OaIY8e0L5Hdzw9bTVbsoUFfqa5jVna14Q41KcQ35KgpmwO4iV/0xU
         MkOtOFfP0Kye46AfeOcOB47TcRa5fniYpaNeiZucfPDTHtSZlm11jpowdWEGTkXu1r2e
         P+6WGE1s4VedzdGJZ/Kubnc7qbkyOVPIr5+FU5RYeulvXS3jb1huYKG48HXD3QNH6RUQ
         Dbfg==
X-Gm-Message-State: AOJu0YwThvapk/ZUVaSYotwmxA+uXfOd7UJeogw7sRVe845m0saQrW83
	acEA3oTBp17TUjkvEuTwkp8j5z4xkRNveU6ytqcNX3k93LUhgJEgRCAQpQ4Wlacc
X-Gm-Gg: Acq92OHPFKYcLAkjtMPImxwVZBJaka8G2mudfyQtbsXrHawzj7/Uq7SOYZU0v/39P94
	5ETtO8eD4RBDL3mP+5R9V3UHwTvluNW6uX07nB+WkMAv3W7Z+0bhSXWC60VfKY3RFVTHnIb5JUl
	7IIXIAXKdckM+K/r5e1H0OYYmBca0Ngs1SPrWVqELgK5q2ZknYbj05a7lH21Ed14oX0t3ckvGMS
	PH8d1IfM8qURCk2BEcIMy694f9XjSSdMY03dl6fBzw/iTL3DEq65HP9zuuv+KeGAQ+Rb4SmGUgd
	Ege7cYBCOBQLL+kLwR1jdZXLoLj6j5bkcfdfNrUQ9Jazy1Nof1kvOmEzyBMPjXtZJHxYN4nsPlu
	HDCo0RMzOnd8sga5YcQieUFxnrLH5K+SdRgC3tkO3BjKHnFsRp95gTndVKwDhbkvzOQbtgbDxzZ
	tjdYCCEHYsyAfj145IUzB5MdbirGEhWnFOp9+/ScheCedmNKDQ9jMuouwlpEG4tGHN39O8fVPJb
	3WXxG+bhZzhLW1dLAAHZhI+cg4AZeuNRw==
X-Received: by 2002:a05:6000:2210:b0:45e:ee20:b897 with SMTP id ffacd0b85a97d-46074a87ca2mr4494885f8f.6.1781360468556;
        Sat, 13 Jun 2026 07:21:08 -0700 (PDT)
Received: from [127.0.1.1] (93-143-178-20.adsl.net.t-com.hr. [93.143.178.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm16827223f8f.5.2026.06.13.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 07:21:08 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Jun 2026 16:20:54 +0200
Subject: [PATCH v2 2/3] mfd: 88pm886: Initialize the battery page
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-88pm886-vbus-v2-2-021dfb02c6bb@dujemihanovic.xyz>
References: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
In-Reply-To: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=XiL7JAqbG0xv8gwNjEHmXefx65ts53pGI9Kg5zOFbVg=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJ00wNcGY/d97eYK+uj+U7/Xerz0AniXkVpUy6ue/Fi2
 4ETNyzDOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAEykjpXhv4vz1hpFIVX5863t
 nxi/d4i0mN44Uf548axnycomKRwSuxn+B10ri36XFlA/oSv2r+pirSuzdDTCF2Tv71w4kcdoC28
 sHwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Initialize the PMIC's battery page. The battery page registers are
shared between Vbus regulator, charger, fuelgauge and camera flash
blocks, hence the commonization of the page.

Reviewed-by: Karel Balej <balejk@matfyz.cz>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v2:
- Reword commit message
- Reorder pm886_probe() local variables according to RCT
- Initialize battery page after succcessful chip ID check
---
 drivers/mfd/88pm886.c       | 21 ++++++++++++++++++++-
 include/linux/mfd/88pm886.h |  5 +++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
index e411d8dee554..f8401d5e6dbe 100644
--- a/drivers/mfd/88pm886.c
+++ b/drivers/mfd/88pm886.c
@@ -16,6 +16,12 @@ static const struct regmap_config pm886_regmap_config = {
 	.max_register = PM886_REG_RTC_SPARE6,
 };
 
+static const struct regmap_config pm886_regmap_battery_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = PM886_REG_CLS_CONFIG1,
+};
+
 static const struct regmap_irq pm886_regmap_irqs[] = {
 	REGMAP_IRQ_REG(PM886_IRQ_ONKEY, 0, PM886_INT_ENA1_ONKEY),
 };
@@ -85,10 +91,11 @@ static int pm886_setup_irq(struct pm886_chip *chip,
 
 static int pm886_probe(struct i2c_client *client)
 {
+	struct regmap *regmap, *regmap_battery;
 	struct regmap_irq_chip_data *irq_data;
 	struct device *dev = &client->dev;
+	struct i2c_client *battery_page;
 	struct pm886_chip *chip;
-	struct regmap *regmap;
 	unsigned int chip_id;
 	int err;
 
@@ -112,6 +119,18 @@ static int pm886_probe(struct i2c_client *client)
 	if (chip->chip_id != chip_id)
 		return dev_err_probe(dev, -EINVAL, "Unsupported chip: 0x%x\n", chip_id);
 
+	battery_page = devm_i2c_new_dummy_device(dev, client->adapter,
+						 client->addr + PM886_PAGE_OFFSET_BATTERY);
+	if (IS_ERR(battery_page))
+		return dev_err_probe(dev, PTR_ERR(battery_page),
+				     "Failed to initialize battery page\n");
+
+	regmap_battery = devm_regmap_init_i2c(battery_page, &pm886_regmap_battery_config);
+	if (IS_ERR(regmap_battery))
+		return dev_err_probe(dev, PTR_ERR(regmap_battery),
+				     "Failed to initialize battery regmap\n");
+	chip->regmap_battery = regmap_battery;
+
 	err = pm886_setup_irq(chip, &irq_data);
 	if (err)
 		return err;
diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
index 38892ba7b8a4..2c24dd3032ab 100644
--- a/include/linux/mfd/88pm886.h
+++ b/include/linux/mfd/88pm886.h
@@ -11,6 +11,7 @@
 
 #define PM886_PAGE_OFFSET_REGULATORS	1
 #define PM886_PAGE_OFFSET_GPADC		2
+#define PM886_PAGE_OFFSET_BATTERY	3
 
 #define PM886_REG_ID			0x00
 
@@ -128,9 +129,13 @@
 #define PM886_GPADC_BIAS_LEVELS		16
 #define PM886_GPADC_INDEX_TO_BIAS_uA(i)	(1 + (i) * 5)
 
+/* Battery block register definitions */
+#define PM886_REG_CLS_CONFIG1		0x71
+
 struct pm886_chip {
 	struct i2c_client *client;
 	unsigned int chip_id;
 	struct regmap *regmap;
+	struct regmap *regmap_battery;
 };
 #endif /* __MFD_88PM886_H */

-- 
2.54.0

