Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131810;
	b=NxsRC+Ji5ByLUIYdKgaroh8AcKDfXx4HKifV3unEuRQXTIwBKk1Dc2MGIs/oT7ffLjTG
	 VC+YdKiZG+f2MXdVC4DCPQB8FTNWjyV7gRed7EFAM8+ihz1VeG/P/9ez01NuWXTAHotog
	 IWz2PqYSqCgi6qznaNhYZmxqogAnrZbzyHAAn0fkm2/1B3f4ICe8juB/hlrflRftQg/s5
	 KrUgEq0oYQS+6KA3rDvXaQAE1eWn6lgNeKPeFXwbd6ehMAjqFU4MVAOeNw2/6sGSIXLIB
	 dKvR1TE7La0mS2/Et0m94hoJZvJoSHJ9O8UkpHA/hBCfBxdeRXSXVP5zR67UXt/IrnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p6kiBv6zjBalaEfamZSBtL15hKQnhy8TcPFlXlhrNd8=;
	b=R2YZzP1VnmHjvV6Dld/J1Gv7yP/yhQW/f6tANtn/srrtOZFyzl+lvne/ufiwz8GvmAWe
	 YLFwQrcCRR8VFRLbRRRWETr2HVH61ypPEdfCeI7q1hQjCp4nm0/MF2tIHCTl5OUxh3do5
	 A44DIUy3s3e3gmYymLjny5N4rnXELx3EjEFnZTsOd+D3GksBm8lB/lw4EGixlI5Mfk4AG
	 +aakPcm1lQ6o4bFYEb+5nrxToczO9O5JZZiDa+X33Ao6K3Mh5M2z48ZaDoVpcI9zyG1Lf
	 dDQK6U+L9UAmnYWXnqY2uDtzyMDSxXnxZOSNgKoQuDor0kFFuIocYFLG+fB9W+d+1lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmKu3G4D;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F8C606D805
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F8C606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmKu3G4D
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1886366b.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 01:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131809; x=1794736609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6kiBv6zjBalaEfamZSBtL15hKQnhy8TcPFlXlhrNd8=;
        b=DmKu3G4DwDSMwYRut5KansKrEsc2xTW0hLZk0kk9bxyimKYLlu2dSNY6Mh7GSoyniD
         fPpzDZyugvazyeFNMiDPl1fuSKaN6+5zEqZjtxS6Y0VoD6er9HfCuL2RIFr1W0aFJNNq
         eeOgfXr/fffK9aDmpV2720HF6M3z0hcrm5apUAk8l51WHh/3lobPfIVvgZbN1bPIRJTA
         mfnn4zxMQj681B9LZD8pWx40cfrfSVRAkO4M96Zes+9ymBI2Y7hPsx05I5bYCcRneD59
         onCj3EMoH8E7PqHKKivIB0ugU5ki+80cZiwDb28Q4Lroiq0IqukhXlW0eQQnNc4PWsi6
         sE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131809; x=1794736609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6kiBv6zjBalaEfamZSBtL15hKQnhy8TcPFlXlhrNd8=;
        b=M/Rsi/yGEkSkNEf38LQrFPN2CiPFQvB5Kgfa2+J9c+PiNYJKuw/acf+0ucmyOJvA+w
         sKdaY6eM1C7MlIgIBgcIVazi+WhCQhx0eDtO5k3EHcqZhYnrnP6G65/8sAYbV1Y5A+gi
         uoXSsoTTg1/6PA4pnHYydCML5I1mA7c0BKP4PS6jwfP9jF/P3AVqcSM3WGI9oSdqK5IT
         R6ZDvP6ALx8BCnOYAeR6DbwIbbOmgrRIkOIW9S37URT0DdEVwlCFUtJxdvOulookG4mV
         g54E6GENtN0/C58m9AkXJt6WneDduVL0He0itGiZskuhZWsLOy0ihETI4Ei7CwOP/Ecx
         Ax1Q==
X-Forwarded-Encrypted: i=1; AL+hErGh17J6026R5M9MBZ51XbHOQdq72UBAGtew7JkIsqgyucGfJ7LrmpQn+I0bcke5NZUBnfm7Qh08Zbq1@vger.kernel.org
X-Gm-Message-State: APuU4Z8rkPjsTm3Otohmu9/HVD0RQREAdeLzk5nq7jWfIB+MJgTsULpp
	Xo759eGqMvbzGUMsE3b2h2Q4KB3HoFvK0Is98+3XjTh1xUN5oOuEBW0F
X-Gm-Gg: AYBFou3N8U94vwxhIlW6O/Cjqd43eO881Pgw2pl+rtkAY2Jjx3ddb52cBpD3MS7MTUu
	iTp458oq1lGvIR+J5WuDtEWu3xeaeeyV6zsb5TY/CU/+U+lSgUCZBSqV0C7SObG4vYDrMcUbLcy
	1wmQu9ZX8JihLXmDd2DkPeu5CvxFCPPdNtW3AdfMWVDIdkeTRDuTp8B9O8kDrx+Q5RTLBFU0ZFg
	OT3GLh+5lJyuQkwn2nix5/Wr4De4/x3Mx8EtmcilsI9zfmX4bpo+NgHEhyBHUk+zEAkzw4DetWb
	LNPVZYici4mxt9UmcVIo10wcTNWtbdTDRNrzEENLErXjT6yZiNEwaB+RHyRIBfw9EVGrez+0Kt3
	mQzZmpanQ4I0ubMl3IHijPXmgPeA0SDAj8ajDFrRQ4bL+rQeyvvYREMUw4y+C2Zze2s6uDmTa2q
	bbClweFSVJXiVI0jWxyMZFfQXbxCwBdP3vl22HeIqBH/yQ2l9wGnFlSKOe8tsbmEyb6u0d/P6cy
	pN31vURigfTFbsl2TCq2Er1Ige989GsYocDUPJ5hflVCOo1E8fSKsynzi0Rg3pw3ezg9KlE0/as
	uFZnjqIf9DMMUmPSGXqkmJg4aJiFNhr8E7KGwfn9OZhjez5wf7QpQCi6A05+BChXHqwJMuijQKY
	aA6G5MGe8lA==
X-Received: by 2002:a17:907:940b:b0:c41:1e13:8896 with SMTP id a640c23a62f3a-c4d6db6a44dmr84814766b.28.1794131808651;
        Sun, 08 Nov 2026 01:56:48 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 2/4] mfd: max8907: Add ADC client support
Date: Sun,  8 Nov 2026 11:56:32 +0200
Message-ID: <20261108095634.100517-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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

The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
support for it along with its regmap and interrupts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 74 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h | 53 ++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 826d7768fd8d0..86579729111ee 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -113,6 +113,48 @@ static const struct regmap_config max8907_regmap_rtc_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static bool max8907_adc_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max8907_adc_is_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max8907_adc_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config max8907_regmap_adc_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_reg = max8907_adc_is_volatile_reg,
+	.precious_reg = max8907_adc_is_precious_reg,
+	.writeable_reg = max8907_adc_is_writeable_reg,
+	.max_register = MAX8907_REG_TDIE_MEASURE,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static const struct regmap_irq max8907_chg_irqs[] = {
 	{ .reg_offset = 0, .mask = 1 << 0, },
 	{ .reg_offset = 0, .mask = 1 << 1, },
@@ -175,6 +217,20 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
+static const struct regmap_irq max8907_adc_irqs[] = {
+	{ .reg_offset = 0, .mask = BIT(0), },
+	{ .reg_offset = 0, .mask = BIT(1), },
+};
+
+static const struct regmap_irq_chip max8907_adc_irq_chip = {
+	.name = "max8907 adc",
+	.status_base = MAX8907_REG_TSC_STA_INT,
+	.mask_base = MAX8907_REG_TSC_INT_MASK,
+	.num_regs = 1,
+	.irqs = max8907_adc_irqs,
+	.num_irqs = ARRAY_SIZE(max8907_adc_irqs),
+};
+
 static int max8907_power_off(struct sys_off_data *data)
 {
 	struct max8907 *max8907 = data->cb_data;
@@ -220,6 +276,18 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
 				     "RTC regmap init failed\n");
 
+	max8907->i2c_adc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_ADC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_adc))
+		return PTR_ERR(max8907->i2c_adc);
+
+	i2c_set_clientdata(max8907->i2c_adc, max8907);
+
+	max8907->regmap_adc = devm_regmap_init_i2c(max8907->i2c_adc,
+						   &max8907_regmap_adc_config);
+	if (IS_ERR(max8907->regmap_adc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_adc),
+				     "ADC regmap init failed\n");
+
 	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
 				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
 				       &max8907->irqc_chg);
@@ -238,6 +306,12 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
 
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_adc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_adc_irq_chip,
+				       &max8907->irqc_adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add adc irq chip\n");
+
 	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
 				   NULL, 0, NULL);
 	if (ret)
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 35b2ede54f856..cf304afc782d6 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -153,6 +153,51 @@
 #define MAX8907_REG_MPL_CNTL		0x1E
 
 /* ADC and Touch Screen Controller register map */
+#define MAX8907_REG_TSC_STA_INT		0x00
+#define MAX8907_REG_TSC_INT_MASK	0x01
+#define MAX8907_REG_TSC_CNFG1		0x02
+#define MAX8907_REG_TSC_CNFG2		0x03
+#define MAX8907_REG_TSC_CNFG3		0x04
+#define MAX8907_REG_ADC_RES_CNFG1	0x06
+#define MAX8907_REG_ADC_AVG_CNFG1	0x07
+#define MAX8907_REG_ADC_ACQ_CNFG1	0x08
+#define MAX8907_REG_ADC_ACQ_CNFG2	0x09
+#define MAX8907_REG_ADC_SCHED		0x10
+#define MAX8907_REG_X_MSB		0x50
+#define MAX8907_REG_X_LSB		0x51
+#define MAX8907_REG_Y_MSB		0x52
+#define MAX8907_REG_Y_LSB		0x53
+#define MAX8907_REG_Z1_MSB		0x54
+#define MAX8907_REG_Z1_LSB		0x55
+#define MAX8907_REG_Z2_MSB		0x56
+#define MAX8907_REG_Z2_LSB		0x57
+#define MAX8907_REG_AUX1_MSB		0x60
+#define MAX8907_REG_AUX1_LSB		0x61
+#define MAX8907_REG_AUX2_MSB		0x62
+#define MAX8907_REG_AUX2_LSB		0x63
+#define MAX8907_REG_VCHG_MSB		0x64
+#define MAX8907_REG_VCHG_LSB		0x65
+#define MAX8907_REG_VBBATT_MSB		0x66
+#define MAX8907_REG_VBBATT_LSB		0x67
+#define MAX8907_REG_VMBATT_MSB		0x68
+#define MAX8907_REG_VMBATT_LSB		0x69
+#define MAX8907_REG_ISNS_MSB		0x6A
+#define MAX8907_REG_ISNS_LSB		0x6B
+#define MAX8907_REG_THM_MSB		0x6C
+#define MAX8907_REG_THM_LSB		0x6D
+#define MAX8907_REG_TDIE_MSB		0x6E
+#define MAX8907_REG_TDIE_LSB		0x6F
+
+#define MAX8907_REG_AUX1_MEASURE	0xC0
+#define MAX8907_REG_AUX2_MEASURE	0xC8
+#define MAX8907_REG_VCHG_MEASURE	0xD0
+#define MAX8907_REG_VBBATT_MEASURE	0xD8
+#define MAX8907_REG_VMBATT_MEASURE	0xE0
+#define MAX8907_REG_ISNS_MEASURE	0xE8
+#define MAX8907_REG_THM_MEASURE		0xF0
+#define MAX8907_REG_TDIE_MEASURE	0xF8
+
+/* Regulator stride */
 #define MAX8907_CTL			0
 #define MAX8907_SEQCNT			1
 #define MAX8907_VOUT			2
@@ -165,6 +210,8 @@
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
 #define MAX8907_MASK_POWER_OFF		0x40
+#define MAX8907_MASK_RST_CFG_INT_REF_EN	0x01
+#define MAX8907_MASK_NREF_OK		0x10
 
 /* Regulator IDs */
 #define MAX8907_MBATT	0
@@ -225,6 +272,9 @@ enum {
 
 	MAX8907_IRQ_RTC_ALARM1 = 0,
 	MAX8907_IRQ_RTC_ALARM0,
+
+	MAX8907_IRQ_TSC_STICK = 0,
+	MAX8907_IRQ_TSC_NSTICK,
 };
 
 struct regmap_irq_chips_data;
@@ -234,11 +284,14 @@ struct max8907 {
 	struct mutex			irq_lock;
 	struct i2c_client		*i2c_gen;
 	struct i2c_client		*i2c_rtc;
+	struct i2c_client		*i2c_adc;
 	struct regmap			*regmap_gen;
 	struct regmap			*regmap_rtc;
+	struct regmap			*regmap_adc;
 	struct regmap_irq_chip_data	*irqc_chg;
 	struct regmap_irq_chip_data	*irqc_on_off;
 	struct regmap_irq_chip_data	*irqc_rtc;
+	struct regmap_irq_chip_data	*irqc_adc;
 };
 
 #endif
-- 
2.53.0

