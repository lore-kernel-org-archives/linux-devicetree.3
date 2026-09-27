Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1778F3D3002
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524694; cv=none; b=CW7t/+5o4h8nGlDRlaZMaui+UoYoNI/5wY7RmqI+O+ECQ5jTJisbeB0+V2jev+5iLTqplbjMYdh3+yUYWEFi6xm7pGFRw8+kPolbQQoby530Gfib1Fbe4rN8vw9fm2D98jID10/emuVLXyj69/m+IpX/JNlbsTmeswei0W/aE7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524694; c=relaxed/simple;
	bh=rBTDTnXA47KWca5ByUBPMKJKcdvVfMOrQhxxEmNQ9lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbxXNEp06PHx1ntc4cYSGwaRcth96DqSu7ILtxaWuwJ4OvRe4ud1DbFzz1R/4Vcq2HWeiXf46ZaUdUqWb+KWgecn+yGBm13QwXCd2iLXM5H13qu7U4zOX7LURtLKGg9IoB4nWtEOiJO/KwPDEg1aCWcA0DRZgDbPY0vd3FUPTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqyQjG0q; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqyQjG0q"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso1316082f8f.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524691; x=1791129491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTn/cHN3s2yPPF9gEgjAzLW+xUByQWmQpTOnwkpxBoc=;
        b=qqyQjG0qE8kzOMU79AvotybwEkHZBHMQQ64X5xp5f3kM8UHGIOsk4DqixWDob49Ykw
         ef5kayX6reybN4Uln5oDL28el7DU03a8N7g/qv6PIsmd23kvhevf3+5KvSgsfQ5XvzX6
         boO3kfF9dE8C1ijXfScF7Lrf/gLQNNKxvwxFu4V5zimblELXGyYfft8nfr5dAe9fdkI3
         pKXfIAm8L2D+qCSXWPsNHNf/FaTsQq/W8xC80hw3WNfOUOa454p+DxlqP5si0UFDgBor
         XPMf3duaQ/9rGKSyLUPAw8554G79p0jSWknbj6/fj6U7pQg8yPRYFx9vrLlHX20F2ROg
         ih1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524691; x=1791129491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTn/cHN3s2yPPF9gEgjAzLW+xUByQWmQpTOnwkpxBoc=;
        b=epjjfjwL91fMBa9qwIp9S1rqECXUCynehWr/i/DOsv+y/Q+1i+/K0sxQCkBhEoAwDR
         wLUl0kJ85vW6xTE2T6dpkmQAv483Np7XxtDTdGHmPpX0MMl+zntU7DCyCTwDvPGynLPg
         oI9EZc64+KelLIPyMKJspf40F/QID4Uf09d27y3LflF/PSbaH56MAz97YOQmllGRFLZj
         7+Vblm8YH/Dh9Udk1aQee4mLEBuHoqnXfUXVEh6Uw69j6e/ZoSsNmRxXkujOudMEq3oa
         XYPFBuJejkPjYqRipkNF3PXWEZryqOzgK7lKYwX11aAfwr86RxLt8WGsQOB7VeDeZt9w
         P63g==
X-Forwarded-Encrypted: i=1; AKwUvByiSjVk1wS2SFDxxBZdRyzobBeXfvpZtYbHuMOD57QHG+/eCj9Tn9ravHgqywirklyizHoEcyB8FB9F@vger.kernel.org
X-Gm-Message-State: AFuF++knGAK6ut2QsU2UL09jkawhEpVSm5iOAMp/mIuCzauUl1J4usiP
	HRofldumdiPHZBwIPrfkjKH79Gu2/N/2z0o2+oAeAOAAIhqjUOWGuciY0i8gPw==
X-Gm-Gg: AYBFou0vrWTFGGP9MHyJEkdVzdjuK+uaj33AenCTv6ng3L8iYRp7GjyXtk5XWi4TNmV
	7dzhauCCS5DVeUfbVk1JfRzH3/ggs7vC0IjSS3G4wWXQQi6jIKIgkz4nys99CmDhpHu6WYyf2SG
	2D9akOzFVkPyvV4BX6kH05uVwcKgXMwUolmV0s1CaNoqCzlBv76bQz7XSkLbB5nC1V+d7lprnA9
	vEQ/0IrGCyqEhcoGr5cHa61U+RMi/EKOkzLI97XaoWWKmlqvAixS2Id0eF6TWuBrAY6hebE0FTZ
	tUB2lO4mjYwWN41AxvEAgJSXGmWXdi5pBt7tXKDMm2SAAHbzZ+HDPC15dVV/0iWwQgKh8E3EXd+
	C/WIWEr0SohDqFI9qGACOyAYl7sW8a7djk6M+LIwpPkUEmSNceVlgX63qCLE6PIZBeAY1h7/uSZ
	flNv/+oIbmyA3FsioLptSnzwgeIAM/lh7fdv+MUK3S/9JH4ikGStnDPaavlJrBZ45q3RFvVNo09
	QuG+nV0nBrW2BIcJos=
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr126988445e9.33.1790524691256;
        Sun, 27 Sep 2026 08:58:11 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:10 -0700 (PDT)
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
Subject: [PATCH v1 3/3] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun, 27 Sep 2026 18:57:44 +0300
Message-ID: <20260927155745.187758-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927155745.187758-1-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
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
 drivers/mfd/max8907.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..0cecb53b62078 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,19 +174,18 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+
+	return regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				  MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
 	if (!max8907) {
@@ -204,6 +204,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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
@@ -250,11 +260,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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

