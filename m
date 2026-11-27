Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775872;
	b=PIYaTV+oxqirWNoUWd+uaCyF7FsCl/u2wi7UVX9CBhxtTzDn1l7LCtNL43i77SzR+qWg
	 1SZaxKTHPvhrmYJO5CQJS+ZBBlcnDe7hAPuQSAXdCilttr6IAIQ9iyW70/vuGRa0g1mES
	 gnfHTHNf//hxET6eTrreMcfEFQNF06VHAC71dg22W2/23WMuiKqPwKISvgDFXZ32sTAnm
	 TpXVEkIK7IRLCyHM2/GAx1s6d+V/WfmmLREsb82Et5mzrSvclcnrUX36IhBoyFfgmHsfq
	 cOVK73utPZxymxjvXlCrsXNPWJYq17zF7I6zBUWH5ERdfeAeKkjDqlkNgrS43Tu+YYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
	b=Q8JdGiI1NlXFpPu5VeUQpX9hc8hCejEDiaoeX/Zdba9+QoPtAvCVSgVkyvVD1Uhx0Gph
	 i88wCwlcsWf0+N5vXXSqgMZUkdaXoDtALBWHT8c4hXZGH9vtxUcni5uIH/l3ZhR4j8G04
	 QKNQ2JF2gmPtLEDspPVpQhPjj6AnNZxAuH7bc+32nGIqH79aIiXjiue4YvCyA6Yhd5ec1
	 wxC2UFUXdOT2NeOm38gj/O9Ch2CtsiP0KaTBPLh4Hg9rHjfvqd8YbW4eDUT3eOHtUQoIr
	 4Iu+AqnHahKQ3gFymsqZm4DKZDg8kckqr91HHcjyRnvu28jV4Tuh8ZSY1uS1KRY4psA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NIrCPSEl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E95606A33E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E95606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NIrCPSEl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so46190735e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775870; x=1796380670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=NIrCPSElnrFTxBATM+z8hoHRHYK88zwdJjrZqOLLwIDUT4P7tAb5EZq4qt7y8V8iJu
         PxiZ9fOFToBiWkzyNEh2URfrC6T9xkdK1c7Bii2OACATys34l4WEhpLUaOeW/e65DpzB
         tSjl4jyokPeLj7fxe2MXm4NfeWuFmLsUCyQ13sVnuObsNlqpN7InUfB3Fc6vYNZtLsNh
         Bu3CYF+f1Xbp/m/xMQdLbHFFpTZ9VjR1H76EESoWifpDpEjuk7h+xsuLsOREviwm/bsR
         jImlWjzj6l33e1ksM8c7dL1ECozjgs1wMfjhv8eYOIR5M2docacTWsEy5lpgbgDVWZon
         iVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775870; x=1796380670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=tC7ENlN1RyhvE+8i/0hWDdL5s6DIDmrNt/uj+Pp+2jYviBcNWk6KbuD7YRxCY54waG
         AjDANXBJZvqIImQ8bhEGKDgUA3XG71JmUpOBhNeUd1g8ESTOjk1FOIEccSQ75kDJYPzl
         +LRl9Iw3DhrfxaVMljZTmLBjmHfqAgvXHogmN+z/ZOijBOZy+CQKA3lggvu3OM4xnq1A
         eXARdxz25i3k1IUhGPfWjRMlUYSLw9Nd5EwO5dPfzRrtTZ+/A62Y32h1yzeEtME3NwsR
         A2xgUy63lbefT2T/k5+an2eVle0i/geMC/ZeLcLup/o0zp00ZumI/s43JNgUSaGTCOdl
         VwEg==
X-Gm-Message-State: APuU4Z/mSqRvZVx0VXPyBbGkH2hJo2+pMcZAacxsmGEXbs/HRAJQMATR
	xzrtCE1+DZhRB8gn1umuXkiOB4UCwamHjAJyxFCK5M8IHiy+z+qdfLLpXynYfux8X4E=
X-Gm-Gg: AZFdTZdxUZQXpvLF6lP2C9trzHvQHBFKCdtpB39nArhmtCpYpWOq5el0BwU/aSCeLi6
	cm7gsdJR3WBQy1nwgyI5Qs1lnzjtsJmISNvPUIiVu1zJHsWiyOmfo3Ul3XFbxDNPeXwPRm+tg5U
	4ge8riho+h+U1yKawUBZuEh7zC1PSyWVmOheNnKfwUc4QPeDrLUHDISgRYt+oV6UKHO2X0dnwRX
	7BnjbQhg2nDp5PuiLaBEcz207CsqbLvMl2ITnJhep6/s8vOp9+Fu9qTUG8ENdlkP0OGUiKZNy4Z
	dNLrCM2itgHB3PPDOz9lpT/jPA9gY2QiwPnPx0p3j2YosMND5w8YxSR5F+sunzCnrwnTmHe0rPd
	mKQAapxok73rzk6VDgmiK7I41YSnrTv62WnwogsxDvecqN2/9QQoXnW2VFDStfmXPCNu8UGcHKI
	uKvFk4Aw763xQFoqSU9zlrC9UYGnSSVdp3xPilMu9O+Z3EhKraD6+1iinByXhV8OU1c66IFOQRo
	bn6AOq8psLUzFCQyz2ur3bSPhi5UFgxMyx4mWAVhqqigtpTz6lJ1LdkXENDnfZCsZlFbeoCU4WP
	UTym3/dPgMpKJORanHJhLXZefU7oLsZDoQNs5WLaKD08//Dr
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr460358005e9.30.1795775870518;
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm714014105e9.2.2026.11.27.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:36 +0100
Subject: [PATCH v9 2/5] mfd: axp20x-i2c: Fix i2c instantiation
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-2-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=avi9IFPWiAVWFQGWnKZC1/X7ESTAnJfLwhLIKQW4SsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVVhMxhMbT/PLffc79DFJs35NFVq1YLVnuuebn1+5
 Hj3/ljHjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzEuIKR4XRDS7tcT3j0nqUL
 DoZpf2VVFhBW+DM5+vAiscvnzfeeU2f4nzKj7Ne6+M/bj72e8KFGMt3Ssts64egR05+lu+8LXXd
 YywQA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c device data,
which are not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
 drivers/mfd/axp20x-rsb.c   |  1 +
 drivers/mfd/axp20x.c       |  1 -
 include/linux/mfd/axp20x.h |  3 +--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 9ddc73b8af43..aac4fe03f7dd 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152",	.driver_data = AXP152_ID },
+	{ .name = "axp192",	.driver_data = AXP192_ID },
+	{ .name = "axp202",	.driver_data = AXP202_ID },
+	{ .name = "axp209",	.driver_data = AXP209_ID },
+	{ .name = "axp221",	.driver_data = AXP221_ID },
+	{ .name = "axp223",	.driver_data = AXP223_ID },
+	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp323",	.driver_data = AXP323_ID },
+	{ .name = "axp717",	.driver_data = AXP717_ID },
+	{ .name = "axp803",	.driver_data = AXP803_ID },
+	{ .name = "axp806",	.driver_data = AXP806_ID },
+	{ .name = "axp15060",	.driver_data = AXP15060_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index dfc665f696bd..e48cae751fb1 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
 	axp20x->irq = rdev->irq;
 	dev_set_drvdata(&rdev->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..de6946d4bb13 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..1badb4868d17 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
 /**
  * axp20x_match_device(): Setup axp20x variant related fields
  *
- * @axp20x: axp20x device to setup (.dev field must be set)
- * @dev: device associated with this axp20x device
+ * @axp20x: axp20x device to setup (.dev and variant fields must be set)
  *
  * This lets the axp20x core configure the mfd cells and register maps
  * for later use.

-- 
2.53.0

