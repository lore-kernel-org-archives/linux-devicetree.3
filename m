Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CEE4E3ED9
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980169; cv=none; b=ZyUKxJyg7e/uygkYn+UMLfe53OdWRBdlsXKYiO1KE7pmqCZMftMgbh0RCMtnoUuq5WW6Li4Rdsx+UME+QUhhpDb2I1p55iEZLxEhto/GTCOThrtVXgtbyQUMhQaaD3bjCntRUU3WSw23LYSlDprZKBrF6VDG91c1klqBuMlybF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980169; c=relaxed/simple;
	bh=KQQfKGP3gaA4IHCfke4mkG2Sh9hJChUtdoHtqWoQYAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBjbbJWjh2J/NHGZffd87LWi3BpDTBrS8TB3ZZUlmP0xDedxJTxoctdnVSEV21mI5uny1O2C/pD3+mzOjRKMJIRvz1az7Sy/JNEvOfuTJcdvUUfLeX+mQ2tdX6p/5SnqLSfSqL0bu404uc5EZ0YkxA5wCIvic9GKsK56fF5DXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrahaQjD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrahaQjD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso333096f8f.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980166; x=1792584966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=mrahaQjDFUe26VZZD1iMlfxvrcTpPxTeIx9DrEMnyIQEFnrQkS27fRIwOs25nTq+Qz
         JK2bxB8s7NcU8Pe/iNu8G+2ecBfxmJU3i4subXYguzv6SQUZUm+Aakjjciq+xHB7R+YV
         jMKDNAuWpUkeTSl0kq9RwPQkvg+TGJ0r+EdricCJ1cUq1dDGWUsnb4AATOn6JZPooZwL
         jgeTnWmsT8wWCSR9Ia2HZfPasPbSrRM2KU78nQ7Gk5aFVrYjlnDJHE7WL/2fOnhPQjht
         0LvKJqPOERHonnykFC5CzrxuP3Zn9CgR+SReXy5IzmSBm3hIH8ZIc3+O5aymoXlprh2J
         +eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980167; x=1792584967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=Fn1TYxGYYhhdrPAyv/+ufB3aslfkgoHlP1Rnp3y7yPzcWFVfBFpqSBKkGWUgvKSkcc
         pu0UFazCZKTsic20ovwqA3iEKiu9N0BzJavhk8gx+4jGOAZFEqaDRKXXvtLIRVJkbGWK
         Pioj7G+EwCL2UHGqID0jkuqoLCUAL908RkkFN/a/89Ez2UIJHK0pXVF4XKu8XwICa8zG
         uZeYCjW9k0NUserMyVpN/jnEdwkonqtc9+oCD2Sv8zKQ/le1kvSrKNKgD8ujk0EYgewk
         3BJ9gP6FWs+GKEDys2IOAqddaSRUn2VcigtEZo67s09a1B4hq9dLw9RlWeBL6qsDTN63
         xmfw==
X-Forwarded-Encrypted: i=1; AKwUvBy/bj78lOKmisKTUE5ZEa78ishtI5/L2GQOhxUugpfAar3lRHawbzNzGG5lYiL8eXPChg3Kae8ARjtj@vger.kernel.org
X-Gm-Message-State: AFq9FYL65wfhp52c3FCRNHRqWvc7bOJz/AmQ9k6hJR14Rgay3gxeg48e
	lq0FtTBUyoB1zvPTqgzt+HdZ0FhTuFMBO6oy7lQHJZZqlwtzFsSmX1i1
X-Gm-Gg: AYBFou3UNNztXnwQMkhUeW1FkVLD2/trkLi93GUkT3ns7wz8EnRdykb87Y5avQTXRUG
	fhw4sR/2G38OzEnG274flRDw6PdiZxhuz9bnD8xqaKCu29jHAZnfSWJafyXRjmUftQTlD8Rtg64
	ROjhNghXg8J/Hf21J98ELr85Vm5p4aNuFTY8Rm2djUvJyqsbydn//Cr4Zvf6oEYZwKssWl9WRgy
	iy6MsvG/2MP6JMPFHAwLA2N9c7qX48NAQut6mRoCnuVf8SWyGNjKCtenhCEC3oVhgtnuLNxEUUz
	ER73tm5e97utaxbX/UUqcZGoPfM/kT8APvxL+/36UGRNnjrJWxUb/Nqk9dEwOrh4IVw06fRBdUU
	cZEMDRu0gaJkBmxXOlRK2QNxzl+MJdqPCW5GlTJADQA1MRg4IZyGMfCSn4/AYCe1DrzfBFy2Mtl
	ni0Swcnc0xndSnwvMH0NY/grigXBwkC9cqG/q+vV9hxMaTPera5orBT87mxsY7DTybVTieBkZ7L
	8pQOBxtlac/BRCfVyg=
X-Received: by 2002:a05:6000:11c3:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48dbaaed106mr22506007f8f.50.1791980166578;
        Wed, 14 Oct 2026 05:16:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:16:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 3/3 RESEND] mfd: max8907: Convert to use device managed poweroff handler
Date: Wed, 14 Oct 2026 15:15:44 +0300
Message-ID: <20261014121544.138958-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014121544.138958-1-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_sys_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..9c40f0551a8ce 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,19 +174,23 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to restart device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
 	if (!max8907) {
@@ -204,6 +209,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_regmap_gen;
 	}
 
+	if (device_property_read_bool(&i2c->dev, "system-power-controller") ||
+	    device_property_read_bool(&i2c->dev, "maxim,system-power-controller")) {
+		ret = devm_register_sys_off_handler(&i2c->dev, SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_DEFAULT,
+						    &max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register poweroff handler\n");
+	}
+
 	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
 	if (IS_ERR(max8907->i2c_rtc)) {
 		ret = PTR_ERR(max8907->i2c_rtc);
@@ -250,11 +265,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_add_devices;
 	}
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
-	}
-
 	return 0;
 
 err_add_devices:
-- 
2.53.0

