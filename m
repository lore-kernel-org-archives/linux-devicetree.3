Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B644AFE25
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492405; cv=none; b=LO65tRHLFLZJYVPapmCZ7nDG8GsZ7az7bzyIUzabBzEOWI4/371WEaE193D06Vb1+7GA1EeGMbJnpPmnR7Pd9PKe/pa5RQVmApHWUabwZ4mGjxBsrXGjCS6IzBSVOQtGCW/ql/Vc4+31V3UY3r5wn7A1/OOZdj1LLtko+QBYtCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492405; c=relaxed/simple;
	bh=9dqGjDEI4RbdLK6jt6HCd0s+ya3fCD6ApoTxnVl2Ciw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgUJ3a26YhNHnv4Uz3fAJnZuO4JzDkFzfR4XbF+5Q3X0lDKQJVDRblURwAncqW361VcmRycvQmopeGgTy3Y3TzziKmht/wAWpobfvlgwO20tv+AzqIm2DG9uKgfFFDq15lJugrUDW46Eh+43FbJ+Yu3sUPpvMMeEHLO1SslSqIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Egl0OnqY; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Egl0OnqY"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff163f65so518551fa.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789492400; x=1790097200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgfH4fC1RNbYMj7TSVJSUxYa5garvCg3vB3RQ2vnJ3I=;
        b=Egl0OnqYkB5fE9jobJioPZLB9QdaUloRMx6rPwZLjRcVEKn1HILwXsZ13U+TgAzojV
         2Am7pvs+kgdnCdxKcpzA1cpucqCGQRXyGMjK3L+LkxAGrib+Q+OvAyGsr6yRDasicTE4
         eUpkb44J0OLXPjKDqXZOH078vCJnweuqvPwYTMLtDUJRaIEBGppV/NuquaH7PY6ByRma
         nZi4AHwicCNxwiYkURC1p5tVpRkSuwW+NfzBPigdu4SISg+ELh51zARK/409644F/Es1
         eZLTXpIMc1J6KczyM9/wnetQ3qSmV1hwX891RXAvLvLuPmaxb+YDgFdgGVDw84Vmdr8c
         o6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492400; x=1790097200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgfH4fC1RNbYMj7TSVJSUxYa5garvCg3vB3RQ2vnJ3I=;
        b=yEfVdZukaq4yUtiH/f7tP+lEwlR8k3CicDi27ZwGB8nGGmp8FcKPAezNt0/+SsWPcp
         32XdqR7gsd8ZOzgc3r4fyVAJMxvUJTF0D1aWPoR494WS9ynMNEmT3HHxLU1OmVJ6bkU2
         Rm64FDX9D5iHyRKyh8bUyzcGA+l8z609qw0uZdqpcOo1e8bvWrT1O+yRraeV6OXCW2Od
         cOb64Otimmlh1MbAtEFWNjHKaR9TyAHviutb5pLcyAEmK1s032JIECYu2WOMCx5dy4Le
         Tl8WCGsTIeVoFa1/lsgJt9FWUQgPWfi5E9HhEKULx2Cp6EmBCBuwmmu6b3IprOYfA8uA
         JEFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA76ldgN68hO8fgZBSOjs0uXiggqDKv0dFo1YBAOqE0dY8TFPA7rv19Dy/rQFOSazSHjIZdYEKDVtG@vger.kernel.org
X-Gm-Message-State: AFuF++l1ialjnySHJUrPz3qNm0Usn/7qrKv/poM/ibZhd8d8TtPnQU0y
	yPBFDgDqAmUmk1Wu/7pNTGnLn+1scnnvLgkcylgvISLUTEMgcBewDoc=
X-Gm-Gg: AYBFou1ppDBDm5muLjx7A5qD/PHtWGFjZuDdQWM5nHW5uxva2ALt3gKinhfQ7e7us80
	fYudxlG3Qr7roD4/pZ332v7TjzL8Yl922QvpBq1laI544xFdlr1OYNXRF73kbURuACp8MwU3msx
	Kwy7BC9OfbQUUUYeD9/Rjf+dRON4IKka206teBmzNMFiD79qc9JYpM9weUCG5+g3EL0mtdR9lv1
	WKTrl++/sS5KKEEkrxbOKCeXP5B7cqffPf+/l396PbaUNFhOFqns047xGqX/9RLQ4VPKRVdOlsO
	VunsqC7CSZP0T/gD+WMujkt5Kfsn9h8nKLf991Q8MF0UeNmqZvbAi8eIelwKnGWfJ9gQ1d8plOd
	Mt+/0PGaq9Z7s/rmMrFBGBHX1/N/sku6Uxr4zOPDJodRqQvgja1RQRROmtDB1zM1HwRlRgtT6oa
	HXs5LsloscMwrU2s8bm47tJGQTEbL1Dhc4ChaG2kcxo+stqgyLOuqQpGNGz8ZVXMqJIuDd+4gN
X-Received: by 2002:a05:6512:3ca9:b0:5b6:183c:5c94 with SMTP id 2adb3069b0e04-5b8ae69f54fmr2035444e87.50.1789492400503;
        Tue, 15 Sep 2026 10:13:20 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm91791e87.79.2026.09.15.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:13:20 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v2 4/4] thermal/drivers/airoha: Register a thermal zone per AN7583 sensor
Date: Tue, 15 Sep 2026 20:11:31 +0100
Message-ID: <20260915191131.25214-5-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915191131.25214-1-sochnev.v.74@gmail.com>
References: <20260915191131.25214-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AN7583 has three temperature sensors and the driver has constants for
all of them, but it registers one zone and reads only the bandgap sensor.

Register a zone per sensor; the thermal sensor cell selects it. A device
tree may describe fewer zones than sensors. EN7581 still registers one
zone.

Idle and with both cores loaded on a Nokia XG-040G-MF:

  bandgap  56.9 C -> 59.3 C
  GbE      58.7 C -> 61.5 C
  CPU      57.0 C -> 61.1 C

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 64 +++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index d7e4a088b7ea..d996ef539fa1 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -245,6 +245,11 @@ enum airoha_thermal_chip_scu_field {
 	AIROHA_THERMAL_FIELD_MAX,
 };
 
+struct airoha_thermal_zone {
+	struct airoha_thermal_priv *priv;
+	int sensor;
+};
+
 struct airoha_thermal_priv {
 	struct regmap *map;
 	struct regmap *chip_scu;
@@ -263,6 +268,9 @@ struct airoha_thermal_priv {
 
 struct airoha_thermal_soc_data {
 	u32 pllrg_protect;
+	/* Sensor mux value per zone, NULL without a sensor mux */
+	const int *sensors;
+	int num_sensors;
 
 	const struct thermal_zone_device_ops *thdev_ops;
 	int (*probe)(struct platform_device *pdev,
@@ -348,7 +356,8 @@ static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
 
 static int en7581_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
+	struct airoha_thermal_zone *zone = thermal_zone_device_priv(tz);
+	struct airoha_thermal_priv *priv = zone->priv;
 	int min_value, max_value, avg_value, value;
 	int i;
 
@@ -374,7 +383,8 @@ static int en7581_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 static int en7581_thermal_set_trips(struct thermal_zone_device *tz, int low,
 				    int high)
 {
-	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
+	struct airoha_thermal_zone *zone = thermal_zone_device_priv(tz);
+	struct airoha_thermal_priv *priv = zone->priv;
 	bool enable_monitor = false;
 
 	if (high != INT_MAX) {
@@ -640,8 +650,9 @@ static int an7583_thermal_read_diodes(struct airoha_thermal_priv *priv,
 
 static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
-	int sensor_idx;
+	struct airoha_thermal_zone *zone = thermal_zone_device_priv(tz);
+	struct airoha_thermal_priv *priv = zone->priv;
+	int sensor_idx = zone->sensor;
 	int delta_diode, delta_gain;
 	int coeff, slope, offset;
 	int tries = AIROHA_THERMAL_MUX_TRIES;
@@ -649,9 +660,6 @@ static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	int diode_zero, diode_d0, diode_d1;
 
-	/* Always read sensor AN7583_BGP_TEMP_SENSOR */
-	sensor_idx = AN7583_BGP_TEMP_SENSOR;
-
 	coeff = an7583_thermal_coeff[sensor_idx];
 	slope = an7583_thermal_slope[sensor_idx];
 	offset = an7583_thermal_offset[sensor_idx];
@@ -715,7 +723,7 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 	const struct airoha_thermal_soc_data *soc_data;
 	struct airoha_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i;
 
 	soc_data = device_get_match_data(dev);
 
@@ -737,11 +745,31 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 		return ret;
 
 	/* register of thermal sensor and get info from DT */
-	priv->tz = devm_thermal_of_zone_register(dev, 0, priv,
-						 soc_data->thdev_ops);
-	if (IS_ERR(priv->tz)) {
-		dev_err(dev, "register thermal zone sensor failed\n");
-		return PTR_ERR(priv->tz);
+	for (i = 0; i < soc_data->num_sensors; i++) {
+		struct airoha_thermal_zone *zone;
+		struct thermal_zone_device *tz;
+
+		zone = devm_kzalloc(dev, sizeof(*zone), GFP_KERNEL);
+		if (!zone)
+			return -ENOMEM;
+
+		zone->priv = priv;
+		zone->sensor = soc_data->sensors ? soc_data->sensors[i] :
+						   AIROHA_THERMAL_NO_MUX_SENSOR;
+
+		tz = devm_thermal_of_zone_register(dev, i, zone,
+						   soc_data->thdev_ops);
+		if (IS_ERR(tz)) {
+			/* A DT may describe fewer zones than sensors */
+			if (i && PTR_ERR(tz) == -ENODEV)
+				continue;
+
+			dev_err(dev, "register thermal zone %d failed\n", i);
+			return PTR_ERR(tz);
+		}
+
+		if (!i)
+			priv->tz = tz;
 	}
 
 	platform_set_drvdata(pdev, priv);
@@ -749,7 +777,15 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 	return soc_data->post_probe ? soc_data->post_probe(pdev) : 0;
 }
 
+/* Zone order; the bandgap sensor stays zone 0 */
+static const int an7583_zone_sensors[AN7583_NUM_SENSOR] = {
+	AN7583_BGP_TEMP_SENSOR,
+	AN7583_GBE_TEMP_SENSOR,
+	AN7583_CPU_TEMP_SENSOR,
+};
+
 static const struct airoha_thermal_soc_data en7581_data = {
+	.num_sensors = 1,
 	.pllrg_protect = EN7581_SCU_THERMAL_PROTECT_KEY,
 	.thdev_ops = &en7581_thdev_ops,
 	.probe = &en7581_thermal_probe,
@@ -757,6 +793,8 @@ static const struct airoha_thermal_soc_data en7581_data = {
 };
 
 static const struct airoha_thermal_soc_data an7583_data = {
+	.sensors = an7583_zone_sensors,
+	.num_sensors = AN7583_NUM_SENSOR,
 	.pllrg_protect = AN7583_SCU_THERMAL_PROTECT_KEY,
 	.thdev_ops = &an7583_tz_ops,
 	.probe = &an7583_thermal_probe,
-- 
2.55.0

