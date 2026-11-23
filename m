Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446170;
	b=DnBEILBdBQVcsBJ0qCikLU261cRz8l/FkeZfO5OyRwNHDiP716UxOaNPMJ/KvFN2j91i
	 12Zl3Y2cWUallQm1FI0kmLVWrx/Gq3rzaL6egRPQMY/xOKg05YBq+hD5NwSKsG1v/fYFO
	 eClFRnyFa57hey/f3Ots8Hkq7wPvNsh2o44fHdkaeoOWuhMWSVo8BbePJ441XWoLct3Rh
	 Qu/pAtbI7DT3wexXzFdHIIIMmV1PsTzwFOT/jH7Zlf9gyA/celaJzHeOdFwr6nyPoWqg4
	 L/5Dj0RH0XabsZucCTyB1dL7P+IHsZvNmvVrQUhNjApu+gwxRT+NmcNBpz+75wI27nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
	b=5JYqaAC9LhS4w5KK2pswrgPM9OZnrmqg/VhYeNTTP1JyNcGJbXOEY/70J3I7CH8EhFgA
	 YLr9AFrXj54RO8brhs9+VpxOWjClBvoFDDWINlKlJy8kHuQiFkqdjj0E/WaUVUy0194nj
	 lbKhyvinfV/ZPcrKV6QNPt4xsvt9ZycGvlv61NcxRevP6DNoIK5mek+1fbmOiuGXkjPEr
	 tQ9pm7YzLdFOdLrQcP9sy0zeA8ZMRkBnvO8VNX+P7PoUZr3UUOdkA5CysAy8GiPV6nrPt
	 RQi22OQJH3VZ6MGkMKyb59TFt02EML2AQOaBp8PCS4Wxmt21/uUrJckuRMRwoT5ly0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xgRDaRR6;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD7606A6A4
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EDD7606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xgRDaRR6
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso705537066b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446168; x=1796050968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
        b=xgRDaRR6AiWu1uvekbWWw56DHIJ+VJTDZSK6uAo+Gi6MFXXP6Xd3HbI2XbKjrP2Try
         9jHUdy0UnyYxfNwOJNcH+vQ0IpngVnQ0QpX/wS8P7cGYQqQAGub5B6qBJxK4J9t81n0g
         Md//A8EXWx7kg13Z6EDENTwJvnIU0xoLW2MIi9v5WTTx9PAniKRmwfXg++XVSA7evOJ1
         bO/iF6LLPa3ltaOYUny6/VhiHHPlsVBWadg4dYebmjEJ49EM/KRIKyWV8KBDBROH97P7
         2PiVfNGoAtVj2rmNaTN2UVTc8kAPxg2wtKbg2s5Le747DAHibhMTuW8xLxxKOMBY8ZDG
         TvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446168; x=1796050968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
        b=kUIusVLUl7i5R8APIJWFm5odONqSs+M1Bi59qM/hkl8v3cH7QMrkumgkieNDnNzwvU
         YJCS1N0YTPnnsspitNU340ZfQixHlBUi45l/u0Vsm3cSDe6CO9OIV1cGqhzonUX7SyaK
         bBlhnFBV/bbEUYu37pvUYDmVUAvCOIN5fgHWs8PwuSsip/3aBil2fH7Hwdeijh3Hc83g
         QLX1/XFG5P3qWycJ9oOefoK8nJuvvHTGO2f625Wylxd8zXhyukom2JRqFjCZZ7ijiSa0
         3kqyvYksH3JDmHOPWzSvnDqkmLw9UuzQUc6ntvFgpwoN+Kzent/1AsvIxiIuDMIA40JZ
         Y5eA==
X-Forwarded-Encrypted: i=1; AL+hErHkhEbt3J1UZPm+iWnnvABfsPfQw3M1WeX1knpXnuyIrHr53SI2cPqS/O0brYfcI6AI0TXtzjIW+YGp@vger.kernel.org
X-Gm-Message-State: APuU4Z+U8S5Qv/TkAo9cn2jK6DP8IJjuRaTdnVGwGbxy0ZM0j01INZkx
	1zSaQVBW8LX17uMmPdEhrMeNigP3oSySkO0U+Q0UHb7DMPZ+ICSKuGm7
X-Gm-Gg: AZFdTZdyNX1OVBX1fbIpVZsPe5+V+mNREdU1Sg1/iIvqhYaMqgl+OYMsyy+Cq9lR9jK
	O2KhQ11UFipxwlfDXi4m69PIDSX8WSvj1rzT2Ozdw40Hq+ejFeYcRrAgEWQSiK/8002FyUrFgFZ
	43E732hqAVKPfKZbSUhac8B4OfgiXL/rKH2to2cX++gnDqZambnuAtCDccf+T6DMs6yE8M0bmSR
	vpzdf2HbvBl2Xs2CQZKQnvGsyr9cQ/IK7tnh7DRWnPwlbtftf32O7ypLovPRA2tctQDGb07J86g
	yJlMBAszuO8KWMd2Y/HqRhKBpQkxZptlDtXMbnQwVvTeqms6EQMMx/tw6Qo7/FYlyFlE/AHd9qL
	Sg21GMz9RRQ6V/rcRfUplLm+VkH97PBFy21p4s5srZTubPaTICmDV5FyQEMpMSQj80UEqstL787
	Q+1xZnNww0QRhejMxfpzsYtcYkG0mzuPzHiXXJ9SEM8krXR615z2ARmn8N1l9ZuGbBhsVFJhIZQ
	5ob3ogFFVfZeOs7HEzfi3wLugM2oSnQFSxLJ9ahyt1pzcxsACxEmFCnU9nP9DfU0JRxjSUF00pi
	JWTytHhsIS+Qcgbih5dLOInOrXfQmC06eYCbvqGG8hzDGZj6VY1wLoGTAOicVBpCDH9DEFQTZ6I
	98FikK1tyrg==
X-Received: by 2002:a17:906:9fca:b0:c51:8690:8265 with SMTP id a640c23a62f3a-c5186908490mr137322066b.24.1795446166955;
        Mon, 23 Nov 2026 07:02:46 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:46 -0800 (PST)
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
Subject: [PATCH v6 3/5] mfd: max8907: Switch to resource-managed versions of helpers
Date: Mon, 23 Nov 2026 17:02:22 +0200
Message-ID: <20261123150224.199601-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 140 ++++++++++++++----------------------------
 1 file changed, 46 insertions(+), 94 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index a0e0c480ff43e..f1cabb666d8ed 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -186,117 +186,70 @@ static int max8907_power_off(struct sys_off_data *data)
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(dev->of_node,
 					"maxim,system-power-controller");
 
-	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc_obj(dev, struct max8907);
+	if (!max8907)
+		return -ENOMEM;
 
-	max8907->dev = &i2c->dev;
+	max8907->dev = dev;
 	max8907->i2c_gen = i2c;
 	i2c_set_clientdata(i2c, max8907);
+
 	max8907->regmap_gen = devm_regmap_init_i2c(i2c,
-						&max8907_regmap_gen_config);
-	if (IS_ERR(max8907->regmap_gen)) {
-		ret = PTR_ERR(max8907->regmap_gen);
-		dev_err(&i2c->dev, "gen regmap init failed: %d\n", ret);
-		goto err_regmap_gen;
-	}
+						   &max8907_regmap_gen_config);
+	if (IS_ERR(max8907->regmap_gen))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_gen),
+				     "GEN regmap init failed\n");
 
-	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
-	if (IS_ERR(max8907->i2c_rtc)) {
-		ret = PTR_ERR(max8907->i2c_rtc);
-		goto err_dummy_rtc;
-	}
-	i2c_set_clientdata(max8907->i2c_rtc, max8907);
-	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
-						&max8907_regmap_rtc_config);
-	if (IS_ERR(max8907->regmap_rtc)) {
-		ret = PTR_ERR(max8907->regmap_rtc);
-		dev_err(&i2c->dev, "rtc regmap init failed: %d\n", ret);
-		goto err_regmap_rtc;
-	}
+	max8907->i2c_rtc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_RTC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_rtc))
+		return PTR_ERR(max8907->i2c_rtc);
 
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED,
-				  -1, &max8907_chg_irq_chip,
-				  &max8907->irqc_chg);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add chg irq chip: %d\n", ret);
-		goto err_irqc_chg;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_on_off_irq_chip,
-				  &max8907->irqc_on_off);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add on off irq chip: %d\n", ret);
-		goto err_irqc_on_off;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_rtc, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_rtc_irq_chip,
-				  &max8907->irqc_rtc);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add rtc irq chip: %d\n", ret);
-		goto err_irqc_rtc;
-	}
+	i2c_set_clientdata(max8907->i2c_rtc, max8907);
 
-	ret = mfd_add_devices(max8907->dev, -1, max8907_cells,
-			      ARRAY_SIZE(max8907_cells), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add MFD devices %d\n", ret);
-		goto err_add_devices;
-	}
+	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
+						   &max8907_regmap_rtc_config);
+	if (IS_ERR(max8907->regmap_rtc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
+				     "RTC regmap init failed\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
+				       &max8907->irqc_chg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add chg irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_on_off_irq_chip,
+				       &max8907->irqc_on_off);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add on off irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_rtc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_rtc_irq_chip,
+				       &max8907->irqc_rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
+
+	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
 	if (pm_off) {
-		ret = devm_register_sys_off_handler(&i2c->dev,
-						    SYS_OFF_MODE_POWER_OFF,
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
 						    SYS_OFF_PRIO_DEFAULT,
 						    max8907_power_off, max8907);
-		if (ret) {
-			dev_err(&i2c->dev,
-				"failed to register sys-off handler: %d\n",
-				ret);
-			goto err_sys_off;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
 	}
 
 	return 0;
-
-err_sys_off:
-	mfd_remove_devices(max8907->dev);
-err_add_devices:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-err_irqc_rtc:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-err_irqc_on_off:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-err_irqc_chg:
-err_regmap_rtc:
-	i2c_unregister_device(max8907->i2c_rtc);
-err_dummy_rtc:
-err_regmap_gen:
-err_alloc_drvdata:
-	return ret;
-}
-
-static void max8907_i2c_remove(struct i2c_client *i2c)
-{
-	struct max8907 *max8907 = i2c_get_clientdata(i2c);
-
-	mfd_remove_devices(max8907->dev);
-
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-
-	i2c_unregister_device(max8907->i2c_rtc);
 }
 
 #ifdef CONFIG_OF
@@ -319,7 +272,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0

