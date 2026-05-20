Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E73A3546D5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292564; cv=none; b=rwkIv93VqdJdZYQXkYdpJYMDQHyIzj7o88W7Dzt+PlrIdA16FWTAjPuooIAA/XTQWGT5sEzkiaDca+JitIHAKo17PC8oy+V50BE42AAQMFhj9Au82zQdRx7SQVd8N2vAtWtM7ZHDYzL/x1PJUydnCGscZ+9zK+xYzhwPVnTuI1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292564; c=relaxed/simple;
	bh=iniF0tSViInEh1MMLv25tzxSwqEs76/kr8afwqrlSZE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFzwW5OqWr6oZLWlbxkCxsGHjI403NczOK3/p6Ctl0kOqXtUp2id14JwiGS86Xhcf/RBWDt5hH2I7QGXVuiPhbzayHUo5PX2E3lCfhaEGBZbQrj3gLtwtLjGCp4PTOla9DCR51x33dXLyPgk6uS+rXpxDI1Xr1VVq01nA/24vms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndaaS+UJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndaaS+UJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso38133145e9.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292558; x=1779897358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOBI/76zfymmsnLabP6yGWPMsg68pHJzFMjvw0nPsIU=;
        b=ndaaS+UJIAe9BdRlwI6y/W3cFvKweYZALty6E5poY/Fm5/Lc6bJtEaNsX+qL2W/vC5
         MqYrnCH4crW/XGLyGoXNViGxNh0Z6+94wsPJ7Vdz5leqP8Pjt0gyQ3/y/5GHiPczQS1I
         aPMfuz0a+IdcP8q/jONusWp4L5/TCPjPBZmxk7axzuiszmGBtsoV6fHXTK627lrhaDsd
         lNaMS1Ewz5A6vjzj9SWysmDCCDKKCjypOTk4odLx8Kj2WN4GvXgtmFUBPlAQfeZOA+tv
         qOMsbbCA0ZSztpZZws6+LZ+o7hvz9aOVao44s+hmgHiLMzIkSeBlc5n4cBwg5SiiRtNp
         mamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292558; x=1779897358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uOBI/76zfymmsnLabP6yGWPMsg68pHJzFMjvw0nPsIU=;
        b=mB3u1yMuDx7rY54c/a88v7P01GXgHtn8e5bjJPqRXGyso6xiIhR52iy0sI5EEMW5Sy
         MJ/xhPWbu8kAPUf+UsmkWvgErcCwna6kXcQ9dGBqERBsZ01CpdE8C4LbFrAbYaJ2ZrPg
         ZxR5AD2F410mqWJQzJq8r/zM6tZCmQ34qgclFW16pGU6QIZp+0nUH2sMtifO/0Yi4HL8
         PiLet9Mmpy16iEzeMNfTzFb7PbhjM/LwuvdIXG9/fipmRJIugX3+O7vWsM9YkFGuf89s
         bhCF8EXXh5wgk3V6ZS5Vgq+V/OJRfVcmK0SYrFG7Bbr9x8LeLa0rXeXFMXPGK7S+wsFP
         8fig==
X-Forwarded-Encrypted: i=1; AFNElJ+uGnt4mcSzBjMgtOk6kYeFtp4NQbYYmbJnP4h4fJ33Ra0I+CpoBM/zwnvuwlBfe4H1LzQEliVZXwz+@vger.kernel.org
X-Gm-Message-State: AOJu0YySmEz39jv6i4ebBq+XU1MoUyb0dCNHLBHQY18V4UglfHqSa2vJ
	4eHcSPiTyudNeXjvjMHqHAIwE2aAM2XTAK9mqkSHMds763eYGH+sQ3G0
X-Gm-Gg: Acq92OHG+tFu4b5M2LIzzPoib5sgsZ74dgafVjcGZBiGcJF3aZc8OvygHNyDQ74evTJ
	uwMSrqTuvWUR8qE3gxaXAYAnsK21qmYMJwZ5nmtF2bFfIpYTpuPKfugxDdxBrrBJMFwoy4MtTxi
	ip/F+KSiuX5mlF7FQf22F7aNRN8DxU8MSp33GMVovIbxOlIe3KweKElfONaOL2wCYZM3ESzp7rP
	700uGjRFCdIKkQD3NtVHf7e14rUNFiNITvs6bA6MTKgtuahtz+rdIpQtcqYp7YRVvmpFOrOJw1S
	7cTM2nowN3f6VFXLDjHCduA9QjhQF0YxN8ADuX/0h91fh1rr1o72pVEgbmyfwZnNgX8MQIc42N6
	fJUESmJGNqFMZ8cRJzVpu36+idplDD6CiLdWH7JH7yeJJan6nYTA3GFxvk0LEJ54curkDfQ4H+j
	LVRNysYBmgEQHVCpJbJ/ejRXDdfHbNnw387uiPcDulrn5L+kZL1StuGLU5O9n/brw=
X-Received: by 2002:a05:600c:c10b:b0:490:263f:24f2 with SMTP id 5b1f17b1804b1-490263f259amr60540645e9.28.1779292558176;
        Wed, 20 May 2026 08:55:58 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fed253f93sm132123215e9.16.2026.05.20.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:55:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 7/7] thermal/drivers: airoha: Add support for AN7583 Thermal Sensor
Date: Wed, 20 May 2026 17:55:20 +0200
Message-ID: <20260520155525.22239-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520155525.22239-1-ansuelsmth@gmail.com>
References: <20260520155525.22239-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha AN7583 Thermal driver. This apply similar logic
on how to read the temperature but totally drop support for the
PTP_THERMAL subsystem. PTP_THERMAL subsystem was a way to trigger trip
point from hardware by configuring how to read the temperature
internally.

This subsystem has been totally removed from Airoha AN7583 permitting
only to read the temperature.

The SoC support up to 3 sensor but the original driver always read the
BGA sensor hence it's currently implemented reading only this specific
sensor. Reference and values for the other 2 sensor are defined for
further implementation if confirmed working.

set_thermal_mux() is extended to also address muxing the sensor as
AN7583 use a different way to read the temperature from 3 different
diode. The EN7581 code is updated to account for these changes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 161 ++++++++++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index 249abbbd46bc..c84b5c36e880 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -18,6 +18,12 @@
 #define EN7581_DOUT_TADC			0x2f8
 #define   EN7581_DOUT_TADC_MASK			GENMASK(15, 0)
 
+#define AN7583_MUX_SENSOR			0x2a0
+#define   AN7583_LOAD_ADJ			GENMASK(3, 2)
+#define AN7583_MUX_TADC				0x2e4
+#define   AN7583_MUX_TADC_MASK			GENMASK(3, 1)
+#define AN7583_DOUT_TADC			0x2f0
+
 /* PTP_THERMAL regs */
 #define EN7581_TEMPMONCTL0			0x800
 #define   EN7581_SENSE3_EN			BIT(3)
@@ -181,6 +187,11 @@
 #define EN7581_SCU_THERMAL_PROTECT_KEY		0x12
 #define EN7581_SCU_THERMAL_MUX_DIODE1		0x7
 
+#define AN7583_SCU_THERMAL_PROTECT_KEY		0x80
+#define AN7583_NUM_SENSOR			3
+
+#define AIROHA_THERMAL_NO_MUX_SENSOR		-1
+
 /* Convert temp to raw value as read from ADC	((((temp / 100) - init) * slope) / 1000) + offset */
 #define TEMP_TO_RAW(priv, temp)			((((((temp) / 100) - (priv)->init_temp) * \
 						  (priv)->default_slope) / 1000) + \
@@ -193,8 +204,39 @@
 
 #define AIROHA_MAX_SAMPLES			6
 
+/*
+ * AN7583 supports all these ADC mux but the original driver
+ * always checked temp with the AN7583_BGP_TEMP_SENSOR.
+ * Assume using the other sensor temperature is invalid and
+ * always read from AN7583_BGP_TEMP_SENSOR.
+ *
+ * On top of this it's defined that AN7583 supports 3
+ * sensor: AN7583_BGP_TEMP_SENSOR, AN7583_GBE_TEMP_SENSOR,
+ * AN7583_CPU_TEMP_SENSOR.
+ *
+ * Provide the ADC mux for reference.
+ */
+enum an7583_thermal_adc_mux {
+	AN7583_BGP_TEMP_SENSOR,
+	AN7583_PAD_AVS,
+	AN7583_CORE_POWER,
+	AN7583_AVSDAC_OUT,
+	AN7583_VCM,
+	AN7583_GBE_TEMP_SENSOR,
+	AN7583_CPU_TEMP_SENSOR,
+
+	AN7583_ADC_MUX_MAX,
+};
+
+enum an7583_thermal_diode_mux {
+	AN7583_D0_TADC,
+	AN7583_ZERO_TADC,
+	AN7583_D1_TADC,
+};
+
 enum airoha_thermal_chip_scu_field {
 	AIROHA_THERMAL_DOUT_TADC,
+	AIROHA_THERMAL_MUX_SENSOR,
 	AIROHA_THERMAL_MUX_TADC,
 
 	/* keep last */
@@ -208,6 +250,7 @@ struct airoha_thermal_priv {
 	struct resource scu_adc_res;
 
 	u32 pllrg_protect;
+	int current_adc;
 
 	struct thermal_zone_device *tz;
 	int init_temp;
@@ -224,6 +267,24 @@ struct airoha_thermal_soc_data {
 	int (*post_probe)(struct platform_device *pdev);
 };
 
+static const unsigned int an7583_thermal_coeff[AN7583_ADC_MUX_MAX] = {
+	[AN7583_BGP_TEMP_SENSOR] = 973,
+	[AN7583_GBE_TEMP_SENSOR] = 995,
+	[AN7583_CPU_TEMP_SENSOR] = 1035,
+};
+
+static const unsigned int an7583_thermal_slope[AN7583_ADC_MUX_MAX] = {
+	[AN7583_BGP_TEMP_SENSOR] = 7440,
+	[AN7583_GBE_TEMP_SENSOR] = 7620,
+	[AN7583_CPU_TEMP_SENSOR] = 8390,
+};
+
+static const unsigned int an7583_thermal_offset[AN7583_ADC_MUX_MAX] = {
+	[AN7583_BGP_TEMP_SENSOR] = 294,
+	[AN7583_GBE_TEMP_SENSOR] = 298,
+	[AN7583_CPU_TEMP_SENSOR] = 344,
+};
+
 static int airoha_get_thermal_ADC(struct airoha_thermal_priv *priv)
 {
 	u32 val;
@@ -234,7 +295,7 @@ static int airoha_get_thermal_ADC(struct airoha_thermal_priv *priv)
 }
 
 static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
-				   int tdac_idx)
+				   int tdac_idx, int sensor_idx)
 {
 	u32 pllrg;
 
@@ -245,9 +306,20 @@ static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
 	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT,
 		     priv->pllrg_protect);
 
+	/*
+	 * Configure Thermal Sensor mux to sensor_idx.
+	 * (if not supported, sensor_idx is AIROHA_THERMAL_NO_MUX_SENSOR)
+	 */
+	if (sensor_idx != AIROHA_THERMAL_NO_MUX_SENSOR)
+		regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_SENSOR],
+				   sensor_idx);
+
 	/* Configure Thermal ADC mux to tdac_idx */
-	regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC],
-			   tdac_idx);
+	if (priv->current_adc != tdac_idx) {
+		regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC],
+				   tdac_idx);
+		priv->current_adc = tdac_idx;
+	}
 
 	/* Restore PLLRG value on exit */
 	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, pllrg);
@@ -361,7 +433,8 @@ static void en7581_thermal_setup_adc_val(struct device *dev,
 	u32 cpu_sensor = 0;
 
 	/* Setup Thermal Sensor to ADC mode and setup the mux to DIODE1 */
-	airoha_set_thermal_mux(priv, EN7581_SCU_THERMAL_MUX_DIODE1);
+	airoha_set_thermal_mux(priv, EN7581_SCU_THERMAL_MUX_DIODE1,
+			       AIROHA_THERMAL_NO_MUX_SENSOR);
 
 	regmap_read(priv->map, EN7581_EFUSE_TEMP_OFFSET_REG, &efuse_calib_info);
 	if (efuse_calib_info) {
@@ -477,6 +550,10 @@ static int en7581_thermal_probe(struct platform_device *pdev,
 	for (i = 0; i < AIROHA_THERMAL_FIELD_MAX; i++) {
 		struct regmap_field *field;
 
+		/* Skip registering MUX_SENSOR field as not supported */
+		if (i == AIROHA_THERMAL_MUX_SENSOR)
+			continue;
+
 		field = devm_regmap_field_alloc(dev, priv->chip_scu,
 						en7581_chip_scu_fields[i]);
 		if (IS_ERR(field)) {
@@ -519,6 +596,74 @@ static int en7581_thermal_post_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
+	int sensor_idx;
+	int delta_diode, delta_gain;
+	int coeff, slope, offset;
+
+	int diode_zero, diode_d0, diode_d1;
+
+	/* Always read sensor AN7583_BGP_TEMP_SENSOR */
+	sensor_idx = AN7583_BGP_TEMP_SENSOR;
+
+	coeff = an7583_thermal_coeff[sensor_idx];
+	slope = an7583_thermal_slope[sensor_idx];
+	offset = an7583_thermal_offset[sensor_idx];
+
+	airoha_set_thermal_mux(priv, AN7583_ZERO_TADC, sensor_idx);
+	diode_zero = airoha_get_thermal_ADC(priv);
+	airoha_set_thermal_mux(priv, AN7583_D0_TADC, sensor_idx);
+	diode_d0 = airoha_get_thermal_ADC(priv);
+	airoha_set_thermal_mux(priv, AN7583_D1_TADC, sensor_idx);
+	diode_d1 = airoha_get_thermal_ADC(priv);
+
+	delta_diode = diode_d1 - diode_d0;
+	delta_gain = (delta_diode * coeff) / 100 + (diode_zero - diode_d1);
+	if (!delta_gain)
+		return -EINVAL;
+
+	*temp = (slope * delta_diode * 10) / delta_gain - offset * 10;
+	*temp *= 100;
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops an7583_tz_ops = {
+	.get_temp = an7583_thermal_get_temp,
+};
+
+static const struct reg_field an7583_chip_scu_fields[AIROHA_THERMAL_FIELD_MAX] = {
+	[AIROHA_THERMAL_DOUT_TADC] = REG_FIELD(AN7583_DOUT_TADC, 0, 31),
+	[AIROHA_THERMAL_MUX_TADC] = REG_FIELD(AN7583_MUX_TADC, 1, 3),
+	[AIROHA_THERMAL_MUX_SENSOR] = REG_FIELD(AN7583_MUX_SENSOR, 2, 3),
+};
+
+static int an7583_thermal_probe(struct platform_device *pdev,
+				struct airoha_thermal_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	int i;
+
+	priv->chip_scu = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(priv->chip_scu))
+		return PTR_ERR(priv->chip_scu);
+
+	for (i = 0; i < AIROHA_THERMAL_FIELD_MAX; i++) {
+		struct regmap_field *field;
+
+		field = devm_regmap_field_alloc(dev, priv->chip_scu,
+						an7583_chip_scu_fields[i]);
+		if (IS_ERR(field))
+			return PTR_ERR(field);
+
+		priv->chip_scu_fields[i] = field;
+	}
+
+	return 0;
+}
+
 static int airoha_thermal_probe(struct platform_device *pdev)
 {
 	const struct airoha_thermal_soc_data *soc_data;
@@ -533,6 +678,7 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->pllrg_protect = soc_data->pllrg_protect;
+	priv->current_adc = -1;
 
 	if (!soc_data->probe)
 		return -EINVAL;
@@ -561,8 +707,15 @@ static const struct airoha_thermal_soc_data en7581_data = {
 	.post_probe = &en7581_thermal_post_probe,
 };
 
+static const struct airoha_thermal_soc_data an7583_data = {
+	.pllrg_protect = AN7583_SCU_THERMAL_PROTECT_KEY,
+	.thdev_ops = &an7583_tz_ops,
+	.probe = &an7583_thermal_probe,
+};
+
 static const struct of_device_id airoha_thermal_match[] = {
 	{ .compatible = "airoha,en7581-thermal", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-chip-scu", .data = &an7583_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, airoha_thermal_match);
-- 
2.53.0

