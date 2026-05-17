Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8A31354F
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003818; cv=none; b=MMyGt3xwsVx5pRbZK1mkZrhyQMIzCuOfrIeG6z0QRNQxL0yAn8ke1abZshtKbIZk0sfonUebTOgRnMtUW09O7QUwoKpQvAZ/qNCq3Yvcz5+Vdg0JInerS4eVqEf6xC1fgEbDpG7KeDkSch8fJBnWwu54onzO5RtfjUOYyY7DiBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003818; c=relaxed/simple;
	bh=oH4r5AK/iPEQl02poYMM4nYKVOSVc+BYgsBQehbqz44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PT7DnMdqK8AtCnm3CEHBF+rHv8VIcR/E9SOzfb6aT28htbTLKTxFUWb8fZ7cnEoZYTLRw++ZNSBsnxkqM+YNFzduAvGr05DZxSWOLs5rYqUpLjZGDJQ7hdhilnAZl0ofyEehPxnsY1jvIDcJxAusJWniy47QiXwmQ5FW5oBrpPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLMRetIP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLMRetIP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-459bf19e87bso598521f8f.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003815; x=1779608615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCgjDXarYti7vTNUFmsGSYACwS96Ny5FHsWUIJ695K8=;
        b=PLMRetIP4UM4g8nu7qtTeUoNZnfGz3U40p0FB9Mw+JtAUo54isiMoEqn985F+GA8nW
         xJJIjVVQeNUXMCMKBd8xi87QGbmHgQFwz8oLGzAC2X1CtD8DRUu4YrMzIANQEDAZQcqB
         akNFYK1fxsT+FK9srY8Atjm/D/+uqR+/ZpkitcJvaeESTmErJSdNaYGLbjUCXzYPx8ra
         iAF+TJC8Ke+9455cRHV644vkFOVRForE/KUOphvgUlg17x4ZdCSmqT1D/QJLXLghwDz6
         tJ5p2MmN/1Rg8+afj0k8p11Ikn5gJAJW/k7v47I6mGFS/eNWCQZVQH8hBiLLq3voDNfG
         UY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003815; x=1779608615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCgjDXarYti7vTNUFmsGSYACwS96Ny5FHsWUIJ695K8=;
        b=Vdw183WmftB6ibTGSXottphDNuAXzM9psllpJlnQBJnLbY0nrb7kGGxICUDS88eA1I
         lXPVxQPZMO5f3zYiUFfiz+PPEay16HxjFPvoG/7NM0TXcV3KNUBPF7c2VnBggXoYkRRR
         p2XHyGDtKRjmXgXV11747cPyypHMioX/c//xgtvDqQDWuihKNU7Q2q+wQnK9eAq6cpQ9
         3SM48b4u7XvfB/xUlMwuuMxkB+3dWwaHZJbD6yc5UUZw145brlYLh6IEVt5OOPJrPyLc
         rUjHs0yDlml/hZDn00Dkxpwr/uoVdrm3JWknmTK9AK9WM18ECt/PYHMUi8aDKDUpY4il
         STsg==
X-Forwarded-Encrypted: i=1; AFNElJ9++L/Yu//xdULdpGgOYY5SyruweZhb/35ogVYPzbq45vlbbJnJ+PDGFAGn63vEpbmIk1L6e1N0lqZg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk1uiG90O0BTV+0umjycDn2scjgRCkOiJBW7bFYO9ALaKpxfA9
	ZqTms7yKuNLoDXXt6I71LSnLqTKTj5ZYmdVqDPMYCMbz/lgelPlLQxGg
X-Gm-Gg: Acq92OGqKrQOoq17IejUjeYnOEIPYHE+n68g8TaMIRMCUmjxshfq8b2kdaysNp2LfDu
	IOy7vlvU9b/bwxX251p66y+U3sKpjgMQfFusr/F6awcoAN3c1935V0p7vamRtTVCHQQ5O6lS4Ou
	0eV/9Vc0XXLpzpI13H7n4uXNZ474K88kHAcWr+XhH5idIZz83IkdFsZOKSHCuqKU7ux+AUmkDdZ
	ATlkhy1aMZxRgOiuQlPnON8PDpPK3DWjZwDWeyMfuPZpErm40NY6HWjzLU98iPpIU82WxOo4sYG
	HGaZoFlD9qUhfp6LVU9awHQccE93IyVp1T1VN60AGkEf02uo6poD3WrC+Kk+jTatA7JBHP5WXub
	8u03TRvzaEBRXnf/l0cb7J9T3IcaBI9UV/IY5VlTPwMcN73kXGMTaWI0icBvr5z1BerR/Yp7i1k
	b3ZyiAjdzwcb5m
X-Received: by 2002:a05:6000:25c4:b0:43d:184:8aa2 with SMTP id ffacd0b85a97d-45e5c589d93mr16397649f8f.16.1779003815037;
        Sun, 17 May 2026 00:43:35 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v1 3/6] mfd: lm3533: Add support for VIN power supply
Date: Sun, 17 May 2026 10:43:03 +0300
Message-ID: <20260517074306.30937-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260517074306.30937-1-clamor95@gmail.com>
References: <20260517074306.30937-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 22 ++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  1 +
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 83ebd780f39d..131eb1a1c8eb 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -173,14 +173,25 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
 	return ret;
 }
 
-static void lm3533_enable(struct lm3533 *lm3533)
+static int lm3533_enable(struct lm3533 *lm3533)
 {
+	int ret;
+
+	ret = regulator_enable(lm3533->vin_supply);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to enable vin power supply\n");
+		return ret;
+	}
+
 	gpiod_set_value(lm3533->hwen, 1);
+
+	return 0;
 }
 
 static void lm3533_disable(struct lm3533 *lm3533)
 {
 	gpiod_set_value(lm3533->hwen, 0);
+	regulator_disable(lm3533->vin_supply);
 }
 
 enum lm3533_attribute_type {
@@ -331,7 +342,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 	struct device *dev = lm3533->dev;
 	int ret;
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
 			    lm3533->boost_freq << LM3533_BOOST_FREQ_SHIFT,
@@ -453,6 +466,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
 				     "failed to get HWEN GPIO\n");
 
+	lm3533->vin_supply = devm_regulator_get(lm3533->dev, "vin");
+	if (IS_ERR(lm3533->vin_supply))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->vin_supply),
+				     "failed to get vin-supply\n");
+
 	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
 				 &lm3533->boost_ovp);
 
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 3aa962d4c747..e355a3ac982e 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -28,6 +28,7 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
+	struct regulator *vin_supply;
 
 	u32 boost_ovp;
 	u32 boost_freq;
-- 
2.51.0

