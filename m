Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8790B31353B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822926; cv=none; b=LKrxS6tzHuxbYyBI+5S0gbUDFrH8kZzx8EPirii85ziYpgS4f8VpEaEB09mv1kE1KzHqFAfJDLcTzfqziSyhfyf9ISxinbQB6Lp+Co+slmAYgMlynn6AvhwGB+/MqCHzo17w+3P/2cqiqu9Tnc25vBd64Ffa6FW4pIfacfPUkgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822926; c=relaxed/simple;
	bh=WKZkaR6hChcbvtz9fnQ2Xzs217Ktz7BqwB17pHAI4co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amrzvUVZDHBAzKoK7qAY981zfrWQqEwli/XzP7yCd6dhPO2kCiIeT8rT+GjIo/mjuipaPDhsnqn9CCStkPk5vosYoj/NGvXcA5ZzHa5/E7XHoXZiUt/cd6mSB+W/95m3+U0NBuQ1xkDdAyHbo/7rXa/CGR/vviUV6V5/tCrHWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeI+nPq0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeI+nPq0"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44509921fbcso7021831f8f.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779822921; x=1780427721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8YeelUo9iIehmhHQzzwQiFcrxsyE1qDmhCGrmArbqU=;
        b=IeI+nPq0366Nw3LT70q3fQC5vdYL3B1kg2crei7yl28sIV3Za3cDk8fK7wxOwIeXgw
         j0mhHXibwbIkM+c+SIABsPr61vrrcjUyEaAURvsNeMwOcMtwJQOHoRqK7oA3NGllGAKy
         bzBPGl6GZHfzFhxJgpSGTmN2HxQoQxQSDz5zxhSKkxowUV5SYBaoglnN7bJZS3wi3BaI
         67YH81Y4VNu/O9gGLZCpaE/isxER9TDlNrwJ+/F5HbSBycO+Pd7r4UJIb+1L1w8TShUh
         RZxf6JyylldCGevgIEsSxHTvTPT6LkaBCZfIew0vPq5nVBi5cCojRkYor1vYwOeU+4H1
         AsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779822921; x=1780427721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8YeelUo9iIehmhHQzzwQiFcrxsyE1qDmhCGrmArbqU=;
        b=CAB4Tz34rj1HfXG0I+xNWr/sxmC8QMU8td0odCpjs7dVNjkEON0BNzVKM11Ecvzmdf
         edTgBtf16DTKHlxq4OFMrsqhBRyhwWDdp18TNokx3ugbUmDwBJwdE7qMwuWA8aOC+gcr
         8F/Ky5IW3HXZ4oxnxJmE1Yr7prDQOa22iqiKBU0WueRqXMmHmW09hY44ympRPWhwoY3B
         XOR5D/N+GtqyC9Xnp/0VZ7WCKnbrEus80NuwyFLmWQP5xxL8+Fl1AePw8Oxfxca26GSh
         oTTQY1S4tFFSKAZMpsNo65sTefFRIKQGAcmwzp7qwvvIzbEO2Pw+t9fDhZObg2rYmkBf
         vwvQ==
X-Gm-Message-State: AOJu0YxMbH13F+l49avZSRziy0mXCTpsB1+AOIOzEDyJzIAWwkPMIvtx
	RSkfbGkLFVBu18unO/h4AmeBfRo4pDLP/u4w2irWfwDozZXqqBCW7o2z
X-Gm-Gg: Acq92OEqrGfc1rxmeBloVzU0ugq9MesLmB/s7fyUx/dA5ZO1vs82vyFqZ/NiUHbxROT
	/MSjyo35U6M1tM4Ms6l/oyIDysO/xQIy4UjKgVHPjHgTgd6Gn6uvPmTORbWr/F06VpI+q7GKfvB
	rh6ZW0LwSMEkhzoX26h538qTv5NM3rIIHPZIDVjcQwMHpzaePegK5CLpibmiFU4e0UWWvjiiACs
	npSQ3oE+1mD+KcLAySrPdCiQWkkG0XrbLbMJ07GSFhEiOdAJYAJMHksqS11idj3xZipGxHSXncK
	+bWuq+DZqJ140juSHzi6SzmLwSbgCei5KAf6F1JWJQbknFgkjn0yV1fGg/cOCbO9hjT+hckjshX
	EkZwV3QZRdf8uT51prKs4TUsdo28kD8HtIu+vuj5afkaBTHmSL6uEiJ5Yk0Ia1VnYQx9EieMj1B
	HFnfiV0SyGSFrQNb1ZXeVNnLLx+wJpJsuxFDOteOcT0WrZIfRex5qkj0BSIneFJVBAT5bCRpT1z
	s1MpRXqAEjlj7yID5MG
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45eb3673319mr35763136f8f.4.1779822920781;
        Tue, 26 May 2026 12:15:20 -0700 (PDT)
Received: from [127.0.1.1] (93-143-222-3.adsl.net.t-com.hr. [93.143.222.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b1c7bsm261529f8f.29.2026.05.26.12.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:15:20 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 26 May 2026 21:14:49 +0200
Subject: [PATCH 3/3] regulator: 88pm886: Add Vbus regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=igfFYzore1LEJO4dQE+H7uVZripYWsm4WlNjLV+7NNE=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJEPzpxHJ/LVK433y2g1engkYm9DaypW7s/bSubtMaNp
 bQ+RLS3o5SFQYyLQVZMkYV5qdwlvtTwiQ5Ftkkwc1iZQIYwcHEKwEScvjEyLAqcfM12mdiFOwUu
 IRHPP5dyCTxfpRVds+fonVbWo2v9djH8lSsy69m3sHprW7f7hQdOUm1rM6bcenRq3xPjaaqBLya
 ZsgIA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add support for the PMIC's Vbus regulator. This regulator is mandatory
for USB OTG support on boards using the PMIC.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/regulator/88pm886-regulator.c | 27 +++++++++++++++++++++++++++
 include/linux/mfd/88pm886.h           |  7 +++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88pm886-regulator.c
index a38bd4f312b7..039822e86ec8 100644
--- a/drivers/regulator/88pm886-regulator.c
+++ b/drivers/regulator/88pm886-regulator.c
@@ -4,6 +4,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
+#include <linux/units.h>
 
 #include <linux/mfd/88pm886.h>
 
@@ -337,6 +338,25 @@ static struct regulator_desc pm886_regulators[] = {
 	},
 };
 
+static const struct linear_range pm886_vbus_volt_ranges[] = {
+	REGULATOR_LINEAR_RANGE(3750000, 0, 7, 250000)
+};
+
+static struct regulator_desc pm886_vbus_regulator = {
+	.name = "vbus",
+	.regulators_node = "regulators",
+	.of_match = "vbus",
+	.ops = &pm886_buck_ops,
+	.type = REGULATOR_VOLTAGE,
+	.n_voltages = 8,
+	.linear_ranges = pm886_vbus_volt_ranges,
+	.n_linear_ranges = ARRAY_SIZE(pm886_vbus_volt_ranges),
+	.vsel_reg = PM886_REG_BOOST_CONFIG1,
+	.vsel_mask = PM886_REG_BOOST_MASK,
+	.enable_reg = PM886_REG_BATTERY_CONFIG1,
+	.enable_mask = PM886_REG_VBUS_EN,
+};
+
 static int pm886_regulator_probe(struct platform_device *pdev)
 {
 	struct pm886_chip *chip = dev_get_drvdata(pdev->dev.parent);
@@ -369,6 +389,13 @@ static int pm886_regulator_probe(struct platform_device *pdev)
 					"Failed to register %s\n", rdesc->name);
 	}
 
+	rcfg.regmap = chip->regmap_battery;
+	rdesc = &pm886_vbus_regulator;
+	rdev = devm_regulator_register(dev, rdesc, &rcfg);
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				      "Failed to register %s\n", rdesc->name);
+
 	return 0;
 }
 
diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
index 2c24dd3032ab..9e96d2cb92f5 100644
--- a/include/linux/mfd/88pm886.h
+++ b/include/linux/mfd/88pm886.h
@@ -2,6 +2,7 @@
 #ifndef __MFD_88PM886_H
 #define __MFD_88PM886_H
 
+#include <linux/bits.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
@@ -130,6 +131,12 @@
 #define PM886_GPADC_INDEX_TO_BIAS_uA(i)	(1 + (i) * 5)
 
 /* Battery block register definitions */
+#define PM886_REG_BATTERY_CONFIG1	0x28
+#define PM886_REG_VBUS_EN		BIT(7)
+
+#define PM886_REG_BOOST_CONFIG1		0x6b
+#define PM886_REG_BOOST_MASK		GENMASK(2, 0)
+
 #define PM886_REG_CLS_CONFIG1		0x71
 
 struct pm886_chip {

-- 
2.54.0

