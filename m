Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCEB3B1EFB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 19:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822922; cv=none; b=eRKpDazOehDk7HNfn8t56B0Mx5NKe8fyppoz2vyIesvoZ74erWfLoV2A2/kJRB6Gzp0QpMJPTsNOhw8BBdTSOolUJ55x6TBJR9pksYjV01Ke5actKCtFmPwycBrtsHhm3sckJ6uFoa30sF3s+Qi0/l2XyjsqYVzpJVrFnV3gqi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822922; c=relaxed/simple;
	bh=O80sOveWh7+q8m49G2VDuDRHgugS9eQUKZJ0tgqKlaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FihOXiTobnGrFzaCej2ghdgMZAAmvSf6p/aogUtRw9FJWOs5V0FkFnVF5wWLezSTE6ygs/R2LOmeq83ZlJXwzcvLUNBTfwgv3dV3B8sHBtBjhR+qZVkD/c4bgsZaosGIWJkqfdaycgtGClfDJv7U1jq9H3mxmWLAt2++L4Vgpc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTSuzArY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTSuzArY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so6485966f8f.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779822919; x=1780427719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSkiAAdOhxILHP16mj1+mW4P+CxLLoXpXuUjc9FKagg=;
        b=kTSuzArYYWiwxCfsRq3vXIUTYz96Wab10G+vBH255xeF3CkB2w5i9CohxeBSyUS+KG
         ad/FDCX5EIEdLkh9Nkx48MB+w467Xg0fyDhaNdzgHyVqT0pu7yWE/nfMVuE191WK3God
         7IhMq7rQuqEt9peBD+KBB/Bk+zGOp51Z3esKvc1HFOpmFkkmyc+dpzj3+DimFADklGau
         u6Ndhf8pGzUKaaPQl+OIA0k2Bn8xzx0lSauBLdLmpG2Nq7K9K5LRd+JKCgqKa6DAn+zp
         SoGRzCfPzzXtNemZ1UvloNDdqILLq80ErtH0D3jN/fvyZbBR365pDnsMMJkazz1YSPq6
         CI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779822919; x=1780427719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSkiAAdOhxILHP16mj1+mW4P+CxLLoXpXuUjc9FKagg=;
        b=goEXb+vCpcsQFyUovkeGhxVbGmwlNsXDaBgGknLTz3m7PxabbaYEBvKCOP3ioRBywz
         gwCX0Usk0e8POojZYXnj0LyvzajIRJa8YseHaWGPhMl15B5nzzrKBTXv5kwnL1HgynhW
         jzL+fhH9XBVgF9EdvmfpnxlhFaEvb0c5A09BIUSC3uqxrMgbXvhGi4lII6z9TJMgNpLN
         ionYuv0ju8xZZyofW9pNFoyBjGRFxv/aqYnNJHCWc3L2nu7XNG3Zb46hCgOLPSKIQIxx
         OKytBMHT+TdSvNCGKIPpFJLXnWTSKx+2YZPpj8WBK+zVSv6TZt4wzhTSk9sOWHkd+ukW
         /Qsw==
X-Gm-Message-State: AOJu0YzcXZ2W11HdfKwc8KyZnWxv6pOcxz2vt4UJ7m1QksKbHcqUboGT
	l3wUxbe8gq6eMX2daG8wsN4Bhedi3xiB6o06DxqzA4ItcKE04DxMtQWA
X-Gm-Gg: Acq92OFi4snz+DuJpjb9w7Jpvp2ivE+7irfQGSaEHszHkUkAldmmjSScgmrq2ljvDl0
	iWtqAiWZIDfOoaqxssL4/V3zrFgc04RWwZRknChklY130XKRseLf5pboUEBkthgyiN+iBbP7STW
	cwf5tQGqVJZv2k/RXd2kqJ502PnMotHc1Ma0CP7e/6ZId0eP5Cu7X2uxIF7SYgxPHly64a7HwXj
	so6KB08WrlS8bzPlRbv4OmWQOS53ayb+QvBuubtaz0sjGfD7BVnjegNwd07RofGMJ7B1U94+k5q
	adifi5yylUDSWjXCOvSqRmvIBqqgdzrl1xKuAwglKaMXgGn4pA0sj+7ACkwiUrzvQDQS0pQZ4gn
	us31fmvEz+isWNddUZopsfLC1xJPhOtH5iI3LFt+27Mtdy8TFUz78sR+BObxJ9LNpgKCX139don
	LcnDce9EW7jh127oRknjEkntEphttl5iGwwT7SkiUjhKqNJLTMi7VAZRhXbljwB8iw0cYPX4Z86
	tYGAwwveP58hpVG9677
X-Received: by 2002:a5d:6f09:0:b0:452:3677:3fb3 with SMTP id ffacd0b85a97d-45eb36920c4mr31129992f8f.1.1779822919477;
        Tue, 26 May 2026 12:15:19 -0700 (PDT)
Received: from [127.0.1.1] (93-143-222-3.adsl.net.t-com.hr. [93.143.222.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b1c7bsm261529f8f.29.2026.05.26.12.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:15:18 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 26 May 2026 21:14:48 +0200
Subject: [PATCH 2/3] mfd: 88pm886: Initialize battery page
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-88pm886-vbus-v1-2-f2bd1fd3c19e@dujemihanovic.xyz>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
In-Reply-To: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=VEK817YRLY8v3pwJAur2aKRdqAXnVfcCXyzWnj9CXEY=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJEPzpVezi7+EnX3Uv5naH6yG66wldhY0mdpa5vd59TL
 pos/Kmlo5SFQYyLQVZMkYV5qdwlvtTwiQ5Ftkkwc1iZQIYwcHEKwEQirzEyTGV6Neuseo9NU7bi
 qpDbi+pMhSKj/s3f2s6tyLNA+qmfDMP/4mC5aD+jL7WnbvxjNHy7Pvb34vhJP5ZIrve75Pnl6vz
 PPAA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Initialize the PMIC's battery page. The battery page registers are
shared between Vbus regulator, charger, fuelgauge and camera flash
blocks, hence the commonization of the page.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/mfd/88pm886.c       | 21 ++++++++++++++++++++-
 include/linux/mfd/88pm886.h |  5 +++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
index e411d8dee554..73102e638eba 100644
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
@@ -88,7 +94,8 @@ static int pm886_probe(struct i2c_client *client)
 	struct regmap_irq_chip_data *irq_data;
 	struct device *dev = &client->dev;
 	struct pm886_chip *chip;
-	struct regmap *regmap;
+	struct regmap *regmap, *regmap_battery;
+	struct i2c_client *battery_page;
 	unsigned int chip_id;
 	int err;
 
@@ -105,6 +112,18 @@ static int pm886_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to initialize regmap\n");
 	chip->regmap = regmap;
 
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
 	err = regmap_read(regmap, PM886_REG_ID, &chip_id);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to read chip ID\n");
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

