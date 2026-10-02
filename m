Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3F0495029
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942590; cv=none; b=gPkHfyBY49so1Or1eYWAAgXhSvfJsNa0bu0g0VdLZd3Y0GUhP35AvlivXKGqWlS/oaMezUqp/rtEPm9vhOT50DV17t6irDT0zDS0meYsluq7cElqOKHOzCpoOElTtM1uCZp9gYoWQX5A+yje9QHzJ3BWcmYzOtdyD4atiOfP2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942590; c=relaxed/simple;
	bh=kw1FByO7zNHpT1g/1ClYusAxsLdovl7ftj2TJAym60Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gv1bwNcUXRCYUNzf6++iVlnhzg5hW/T5YWsqvKXE/n2vHLwLk3bIv2azsx2P8HNGQ08Qe7BXVN0p9GqU7hJ5EqKqKROdVRcJFl+ZeXjHuBWl31jTmlkJ4n4EAUu5kJ8G8Gqi+VislDS3PCd0zhvQi9LT/Y4qjttpDO1EawySQBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=eOVJqu3Q; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="eOVJqu3Q"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af929e59dso2872889f8f.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790942587; x=1791547387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UzygGSqYHPJCqI1F7PREosdXTbiYorvv88O0U724j+Q=;
        b=eOVJqu3QLmApQUDMu1EQYt9SFQio8c9suL2mlIdt9/TviOIilW6c69UcaKNFBbjXUR
         JO4t/vlOMGxRN96BUQzxv2mq0+pXOrkDMevCG8JqdXHHZp1AcJbNMPGtwA6AebVXVV4C
         SMZwDbijOwTq+TdS5ctT0CY+Y5Y9La10vslgs0JQsuKh99TLQoAxMQeWIImycw17ToqX
         6eYRU9mLrz7saBzOJOfPMGceHMCAVpZ0/OUAZvmuaDcwRRI0PqGUahGZtqAgT1x/vDVI
         3bwdGMIM7nHWlVwh8JMSZttZuaGqhAlL5pIuDMsQvlsVOq0JFth/NAY4ylgzbnX0mj4j
         Fc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942587; x=1791547387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzygGSqYHPJCqI1F7PREosdXTbiYorvv88O0U724j+Q=;
        b=J5CDKacVZajtIAOr3RHYtwOQxC3pVWnV1X6QvqOilIVMwhjXz57+qMUCT+hHbk8A1O
         mhQIuzUKN6Q+/5gh7nkvoQzQ1Xd/U+4mFdcbEgaTZyN2oq4pSQEgQI5huzf1H/lcMWJ+
         nIgEceSoUTI+gRNeLZTeuA0A5hlyxA91h9/9W6KU41MHHfKq+BldvllOd+5RE0NxIY8l
         yDjt9SjUUa4UP5P+mRac5zkIi3zF1E+DwdHwvEDjc6nq5B4OPTfi82ZtndnSL//ORs/W
         YIRtxws+v51CfVPzxLpQbghruqdtBp69JEU3+s3Aa+qD1LxmywNL6HUdEWEwlRltI5/8
         TwwA==
X-Forwarded-Encrypted: i=1; AKwUvBxV9yFyv/au5PttqhoZL989tHK7r5me276wKSkvBUl2WPlp74ZJatk5TcBB3afYtrq51z4Ja2l+aR51@vger.kernel.org
X-Gm-Message-State: AFq9FYKkRxHplEuiWSVInoFwBtWaXD1b72X1FuXMOnvjGQT1zwFa9DsB
	2uSMO9FXSCG63akmEj4LKbLnNdlKXYM3xGmO6s/fKHDGqBBwkrYnjK/YLV2DtKcNCx4=
X-Gm-Gg: AYBFou2MLqOkseuCKLIse0zoOB4eSD/ZR8inN2LlLCfh9CrWpMTdb4hBLa2bbN30TXR
	xHsT2y++9BLMmdS/cxy28iF1AKYmAAvld5SiOEACGDcBe3F0B80Zsqhe5Q9neioGPM9Xs0oGFyG
	SZXMUeQrwOx31oeXZA9zfTQTmrs9Hh3R6Tc+mjPnaUsQXYBQzenonDecCTTTPQmWSLpPhN70Al3
	cHUpobsWHmRfb6CZkjZFuqd8HB9TkDWt60fv4tb7OIGgB7DiGNWUThtVBor21lh0tDdEvkHx0gd
	TpKBJy4byeqkHv8eQQzPOS9D+mcwSlXX3w+0QgQwekc8lR4Pi8BshWPaLR5HUynyxwJ7s16gQf1
	H/vxMpXNBGp6rBkXXpEP5/oXVo0x/aXzKB/wDP1ux9vZF4WJtfKowCU5kZaUrgSDN84zYsfWRjF
	OX2F+TPxptgz+HglmM/V1sVNpgtMDl170a7oNUVvTC9jC0zImTYpzBoJhpkb4SOPhnsEcrdhwD4
	0FBrtphHW+4bowB
X-Received: by 2002:a05:6000:4809:b0:48a:fcec:2a29 with SMTP id ffacd0b85a97d-48b1273b029mr4842104f8f.20.1790942586916;
        Fri, 02 Oct 2026 05:03:06 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm5845213f8f.13.2026.10.02.05.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:03:06 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 02 Oct 2026 16:02:55 +0400
Subject: [PATCH 2/2] power: supply: bq27xxx: add support for BQ28Z620
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-bq28z620-v1-2-bdcc10d42519@flipper.net>
References: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
In-Reply-To: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 "Andrew F. Davis" <afd@ti.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3769; i=alchark@flipper.net;
 h=from:subject:message-id; bh=kw1FByO7zNHpT1g/1ClYusAxsLdovl7ftj2TJAym60Y=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtn1ssKZb7r76mgD+kySDhXXXfk7TICLmMDZ2K3Kluk
 0rm1q7umMjCIMbFYCmmyDL32xLbqUZ8s3Z5eHyFmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr3nGf4X83xiad64mPx9FUW8y99/Hj1wOKzs4XWnb3heCr75Wofz4UM/0uVH7J
 u9UstF7Cv9bv6YefzdhV/wUf3gqs175XKXe4tYwMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Match the BQ28Z620 under its own chip ID so that code touching its
relocated data flash can tell it apart from the BQ28Z610. Reuse the
BQ28Z610 register map and properties, as the standard commands the
driver reads are unchanged.

Keep the 10 mW scaling of AveragePower() even though the BQ28Z620 TRM
lists it in mW: readings on hardware match V * I only in 10 mW units.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/bq27xxx_battery.c     | 6 ++++++
 drivers/power/supply/bq27xxx_battery_i2c.c | 2 ++
 include/linux/power/bq27xxx_battery.h      | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/power/supply/bq27xxx_battery.c b/drivers/power/supply/bq27xxx_battery.c
index 17f5b58609be..09272249b4f7 100644
--- a/drivers/power/supply/bq27xxx_battery.c
+++ b/drivers/power/supply/bq27xxx_battery.c
@@ -39,6 +39,7 @@
  * https://www.ti.com/product/bq27z561
  * https://www.ti.com/product/bq27z746
  * https://www.ti.com/product/bq28z610
+ * https://www.ti.com/product/bq28z620
  * https://www.ti.com/product/bq34z100-g1
  * https://www.ti.com/product/bq78z100
  */
@@ -525,6 +526,7 @@ static u8
 		[BQ27XXX_REG_AP] = 0x22,
 		BQ27XXX_DM_REG_ROWS,
 	},
+#define bq28z620_regs bq28z610_regs
 	bq34z100_regs[BQ27XXX_REG_MAX] = {
 		[BQ27XXX_REG_CTRL] = 0x00,
 		[BQ27XXX_REG_TEMP] = 0x0c,
@@ -861,6 +863,8 @@ static enum power_supply_property bq28z610_props[] = {
 	POWER_SUPPLY_PROP_MANUFACTURER,
 };
 
+#define bq28z620_props bq28z610_props
+
 static enum power_supply_property bq34z100_props[] = {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_PRESENT,
@@ -1001,6 +1005,7 @@ static struct bq27xxx_dm_reg bq27621_dm_regs[] = {
 #define bq27z561_dm_regs NULL
 #define bq27z746_dm_regs NULL
 #define bq28z610_dm_regs NULL
+#define bq28z620_dm_regs NULL
 #define bq34z100_dm_regs NULL
 #define bq78z100_dm_regs NULL
 
@@ -1060,6 +1065,7 @@ static struct {
 	[BQ27Z561]  = BQ27XXX_DATA(bq27z561,  0         , BQ27Z561_O_BITS),
 	[BQ27Z746]  = BQ27XXX_DATA(bq27z746,  0         , BQ27Z561_O_BITS),
 	[BQ28Z610]  = BQ27XXX_DATA(bq28z610,  0         , BQ27Z561_O_BITS),
+	[BQ28Z620]  = BQ27XXX_DATA(bq28z620,  0         , BQ27Z561_O_BITS),
 	[BQ34Z100]  = BQ27XXX_DATA(bq34z100,  0         , BQ27XXX_O_OTDC | BQ27XXX_O_SOC_SI | \
 							  BQ27XXX_O_HAS_CI | BQ27XXX_O_MUL_CHEM),
 	[BQ78Z100]  = BQ27XXX_DATA(bq78z100,  0         , BQ27Z561_O_BITS),
diff --git a/drivers/power/supply/bq27xxx_battery_i2c.c b/drivers/power/supply/bq27xxx_battery_i2c.c
index 2a6b4534cb28..715ce8b6e401 100644
--- a/drivers/power/supply/bq27xxx_battery_i2c.c
+++ b/drivers/power/supply/bq27xxx_battery_i2c.c
@@ -255,6 +255,7 @@ static const struct i2c_device_id bq27xxx_i2c_id_table[] = {
 	{ .name = "bq27z561", .driver_data = BQ27Z561 },
 	{ .name = "bq27z746", .driver_data = BQ27Z746 },
 	{ .name = "bq28z610", .driver_data = BQ28Z610 },
+	{ .name = "bq28z620", .driver_data = BQ28Z620 },
 	{ .name = "bq34z100", .driver_data = BQ34Z100 },
 	{ .name = "bq78z100", .driver_data = BQ78Z100 },
 	{ }
@@ -293,6 +294,7 @@ static const struct of_device_id bq27xxx_battery_i2c_of_match_table[] = {
 	{ .compatible = "ti,bq27z561" },
 	{ .compatible = "ti,bq27z746" },
 	{ .compatible = "ti,bq28z610" },
+	{ .compatible = "ti,bq28z620" },
 	{ .compatible = "ti,bq34z100" },
 	{ .compatible = "ti,bq78z100" },
 	{},
diff --git a/include/linux/power/bq27xxx_battery.h b/include/linux/power/bq27xxx_battery.h
index 0b833c4bb583..731ea837aac3 100644
--- a/include/linux/power/bq27xxx_battery.h
+++ b/include/linux/power/bq27xxx_battery.h
@@ -35,6 +35,7 @@ enum bq27xxx_chip {
 	BQ27Z561,
 	BQ27Z746,
 	BQ28Z610,
+	BQ28Z620,
 	BQ34Z100,
 	BQ78Z100,
 };

-- 
2.55.0

