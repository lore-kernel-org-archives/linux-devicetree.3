Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF0372045
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449644; cv=none; b=KLD3H53Wl/2uf+iJhtb5yDOgI26hIRUtZoXdI8W7h8srBMhH1kwb0bjkMcrrTyRjYtP4823hiWsMcvLXuGUgAC3P7B03qa202zT7EglwT8FSl5R7ula1FhIE0Vj6iXwPBrdq6U19u4t378L4okx2pZzoDi9+rWrOdBgu4kvkD2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449644; c=relaxed/simple;
	bh=vDgOlQv6FzujsfychEOLmAjWb25wMYpKFPP65TROnWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OpuXrbi4RH/7npKK1jBl+zbPVcKFc/AJd3EpuAhc1D+CZWa62dfOP5umNI7o8kVIuZF9jxZakVmzIf8eI3mgrgfFjv382uBnI1T45bikvFHJAcCzx+NoOppSaAgGO1uDNDechBu4bmssp/kgFfdlWPLi7GqCH1m/aTWzbmKwEAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTqL4vbo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTqL4vbo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91a931f66so16155255ad.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 22:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789449642; x=1790054442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8TVm4cn1wDfmlEj2CvfM5IYkdGS8p7xy0hVf/rLN4x4=;
        b=HTqL4vbofkz94c0ePl46FkzrlUD2MyivjNG4DLHHd3X3oOkEsBnirj0rvRbOMHXmLj
         CRPbIE2Jx3s56bI5YuDn7IHy20LOqZqOJbnxxzEschqyGLyflZ00POlrd5BloqJPWe8L
         LTDNopqkRvf6oX8Vj2Qwm9GgnqaoryqZ6Y2Hq7GgCzb6OB8k57Trt2Nb5yF6Zm/Vvb3k
         qfNyCKr0b/ICmAbnajWXrlwq34DdUVd+kxxlk1LCIyQrwEd3BjFpRhaEds0lB/1G4zk0
         56oV0zYfgeDrfQKm0MuHCR1NC7sCO3exYM9D8wHy4OneW/VjUfUWZkwqrzjpXBBr5qaH
         cPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449642; x=1790054442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TVm4cn1wDfmlEj2CvfM5IYkdGS8p7xy0hVf/rLN4x4=;
        b=o4AHp1ZSH53Ut1bCu6ajCwv8IB03vr6m9gLtbmT/Ey3qIJjhz0wjaxUrProc5oriMx
         m86uClRKg2e+LYF2L7YH9DhnLBkyu5P0Ho+/Ez7QvXjfKM5g03cfvXeZlQshKzNZoBkD
         BXv3G2SWGQLOdErkH3aWSGlycm912PcONQWHXsIGxn6P52vMBoP31Vfxrp6ajeWZjLOn
         J+iC9aiqbGkKAr7itBCUCUPpaSPIIcXT1uvgQWL/HlBvdD8H0i/AxPS4EKVpRMAszOuw
         OV8sRqipbYQYukJdhB+yX2sK2amKdtY0kV5JDGIelUik0wmX7Gi4Dr6qYjSxfciLcHST
         5y6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwM5tqCHeSwx+fsEso2bVK7n5vLjtgqja+jJei4IiL+/D2zqsMi4YZPVTqAnmY/+uIn43cgiCNg/5+N@vger.kernel.org
X-Gm-Message-State: AFuF++nZ/O22ffcamOg13tiUaECFXitHQnqPcM4hx31xL5Jrlrva3+bF
	ER7G6slLA4tnsfsrYgy8ccL0uEqB/giCyrOx+7tiyCEl8EWOL8hbW1vN
X-Gm-Gg: AYBFou3V/WyeUezJbC5Wev6RmQBdOpKcfrpymtKWfw1edTino2td7VWb9gIrQ9c1HOL
	Bxwu3muFWXEagV8ag/wGiDVndz+47ch3YjMOZ864Wm48XhS+G4HUUX2GITtcdsqDYsFCkdObvaZ
	T2BXlfY5HFOjxFvh3ZuP6KpICd3JDxDmUCS6eFwMhggn1e/bPaWDzDp4uqU22YhBWJ4FjGXiVMS
	ilQ/MQSOm+cGG1tfRXLWKsLuu7Xc6M0ccrBaSmj5PNPdy1ETEwBjdbgIXD2M0DgZ8MOL/gVT8Xc
	8opwV38bI4oRlTNwOio2T+eGdNNlGCa04sD0B6q6ueVjCVagUMAnnKHctXNsd2jXPnucdNpLK/r
	9x7qBFrYa/2BSQ9qCP7GoXp7MCIF63yugsxDzObgpV29rCGaAeCYmtfdllVA+OY+G5J89A0zQNk
	QPWgPV3k5uDXS8NtyneD6sZ5X8JCYGpmHtBw3z/eXM476AYeEucxKWkY7yKyKoQrPvciY34CaGp
	AaWX3iBmgNhn/esp/li0yqhNSC2c1ZJMpMEVgZAmVUVlmMhCgdrReWRgm8xhlPxAdwzx0ZM/hOA
	FQ==
X-Received: by 2002:a17:903:b8e:b0:2d8:d4d3:3fbb with SMTP id d9443c01a7336-2dd6c73445amr116491865ad.15.1789449641912;
        Mon, 14 Sep 2026 22:20:41 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e33c-d873-100e-5074-5ce5-37a1.emome-ip6.hinet.net. [2001:b400:e33c:d873:100e:5074:5ce5:37a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce959b3sm60562575ad.22.2026.09.14.22.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:20:40 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
Date: Tue, 15 Sep 2026 13:20:20 +0800
Message-ID: <20260915052021.6959-1-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

The Nuvoton NCT7715 is compatible with the LM75 temperature and
limit register layout. Its 16-bit configuration register shares the
TMP112 configuration layout.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
v3:
- Reuse the existing TMP112 handling for NCT7715 configuration,
  update intervals, and alarms.

v2:
- Use the standard SMBus word representation for the NCT7715
  configuration register, removing the NCT7715-specific byte swapping
  and updating its configuration masks accordingly.
  
 .../devicetree/bindings/hwmon/lm75.yaml       |  2 ++
 Documentation/hwmon/lm75.rst                  |  6 ++++++
 drivers/hwmon/lm75.c                          | 21 ++++++++++++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index b48bf3fd721f..d55b8b7e49c5 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -31,6 +31,7 @@ properties:
       - nxp,p3t1750
       - nxp,p3t1755
       - nxp,pct2075
+      - nuvoton,nct7715
       - st,stds75
       - st,stlm75
       - microchip,tcn75
@@ -78,6 +79,7 @@ allOf:
                 - ti,tmp101
                 - ti,tmp112
                 - ti,tmp75
+                - nuvoton,nct7715
     then:
       properties:
         interrupts: false
diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index ca46754e028b..fac0b8f29ddc 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -150,6 +150,12 @@ Supported chips:
 
                https://ams.com/documents/20143/36005/AS6200_DS000449_4-00.pdf
 
+  * Nuvoton NCT7715
+
+    Prefix: 'nct7715'
+
+    Addresses scanned: none
+
 Author: Frodo Looijaard <frodol@dds.nl>
 
 Description
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2d2d752aeac9..1a98ecb142c9 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6626,
 	max31725,
 	mcp980x,
+	nct7715,
 	p3t1750,
 	p3t1755,
 	pct2075,
@@ -259,6 +260,16 @@ static const struct lm75_params device_params[] = {
 		.sample_times = (unsigned int []){ 30, 60, 120, 240 },
 		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
+	[nct7715] = {
+		.config_reg_16bits = true,
+		.set_mask = 0x8060,	/* 12-bit mode, 4 samples / second */
+		.clr_mask = 1 << 7,	/* no one-shot mode */
+		.default_resolution = 12,
+		.default_sample_time = 250,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+		.alarm = true,
+	},
 	[tmp100] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode */
@@ -417,6 +428,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_temp_alarm) {
 			switch (data->kind) {
 			case as6200:
+			case nct7715:
 			case tmp112:
 				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
 				break;
@@ -486,6 +498,7 @@ static int lm75_update_interval(struct device *dev, long val)
 		if (data->params->resolutions)
 			data->resolution = data->params->resolutions[index];
 		break;
+	case nct7715:
 	case tmp112:
 	case as6200:
 		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
@@ -848,6 +861,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
+	{ .name = "nct7715", .driver_data = nct7715 },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
 	{ .name = "pct2075", .driver_data = pct2075 },
@@ -972,6 +986,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "nxp,pct2075",
 		.data = (void *)pct2075
 	},
+	{
+		.compatible = "nuvoton,nct7715",
+		.data = (void *)nct7715
+	},
 	{
 		.compatible = "st,stds75",
 		.data = (void *)stds75
@@ -1129,7 +1147,8 @@ static int lm75_suspend(struct device *dev)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
 
-	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, LM75_SHUTDOWN);
+	return regmap_update_bits(data->regmap, LM75_REG_CONF,
+				  LM75_SHUTDOWN, LM75_SHUTDOWN);
 }
 
 static int lm75_resume(struct device *dev)
-- 
2.43.0

