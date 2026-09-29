Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97939539791
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700768; cv=none; b=KWn4LFBQZ9hi7+DwxLLfd9PXioOuSpEywB22yjLEGMvH2duQqb0ryOgIqO3M0l5PaoqF64mA/4JciQX47n1gcK9kjlYxJZsoBiblTOyjIZ102RAoADUw2wN24XhLAGEMsqnrJD936y7x/UYwQ/HMXDLRvnyau3XY9AFnkYfIpsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700768; c=relaxed/simple;
	bh=CaGRYcmoudXU11QZBW+RXEllJE8sR+maRTwVpD6ZkwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ub7oxorEWYrheWUEMkm9wE7Xy+XwjRhODEb/i0wZLRjNtrn/S8EmPpY3dG1SlWiiZ7GCTwg5dfdT2e12+U5LHvcWA1Rjsdpm8RMJytglq0hHc4WN1kwxanyuuNrawOl2kZKCK+6XB36irgv5dxSLS95lqxXnjyP1aX2IlamBz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5tdsQNQ; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5tdsQNQ"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso35893171fa.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700754; x=1791305554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg3hFgqk0ZsxaUG+QumlUoTIw9JpugzQWPqN5D8ejLw=;
        b=n5tdsQNQw6McahZ4i3WgMLZ85kk0JP9fP92+maZg3pJI/OJoahM8EnLJtwAtDOolYj
         m/g+c8RN4oo6+QOHUji9c6n5hXkHM/SgKP1B1wg6DwRnEZxrIe258Q+uKzNcSAI3CDln
         1GXOL5ycQTtCdz8De+r4gjfm+kIWerXRcwmL9zTsjeduweYLbOpoSdjPbBUn0S07aDas
         rOwQ+nUkzmjoazhEy8cV/44nU6gQOyzX7RE7GNQ2GRMTQHCYs3M9elW2bRGzErjM1Mek
         fDGPrjBUrtGrzZToTRpj+LP39xtSWbHXlhdq4KDqdJxxOCmlmCVtthHp82tQuVfKzTg9
         rAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700754; x=1791305554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg3hFgqk0ZsxaUG+QumlUoTIw9JpugzQWPqN5D8ejLw=;
        b=ajGHaHWo2BPNFjoidN7bGFH4/i/Vh51hhK9XTTooBczpAaHAvwwLfI7GpgNqxf5p4n
         fCGG1DA6KWjJ88RhuFNtYCs2+1IBh3C60d5HtrghoH4o8gq73d9W7xpEK++LWuNpDdBB
         YZN3pUnhTYIWanJcWUCezT0iwO7PwioBvRXepUWDqmTQF8TRB+n/gLTsYvKpNfplccTC
         bqrgUJoqJr4Ek89bfWbA8vLfhZh/776ecMOJtKuDuogTL6URYl0k0ZuG2b4AxdnUkZdr
         lWJeD42chwAY0JIf2sbZrkXbAfmF5wWGWuUnM9qlaHKC90PTwvpa0pc5020MJY7RArq/
         uqWA==
X-Forwarded-Encrypted: i=1; AKwUvBzDSiR6M4pCcKfvt4Dlq6K4b2yrETx+xg9+Tsq5Bp+YqRS8DW///wE0rjcvkozds07EUOtiNBkp+WEC@vger.kernel.org
X-Gm-Message-State: AFq9FYImfwiux73jCiBpEmff4kY0PwieW7CYuNpXIMQf7YY/2cS+1mNt
	L7Ph4HprBQwrdofwZR7zlpE1A8OQ+JQ1pN3IU+QdQ+pCTImMgolFtcY=
X-Gm-Gg: AYBFou2K4n6fUKLMJZgoX3wyP4lgTYa4MkXX9YgQotM5WIrCP4viO8kw6fuMGAhqXW7
	QquAMXQAKOJ3VN94RRg6lGpFp7jwUaMtWy0INm+upCLaT/Oi+WV8JOalXv+ClIwb3vDGiC8CNrz
	nB7TCWrfeLPh0+6XV0AmTkzNuc6LNonFZGKW7lkb6O4xjx4BFldJTNGF80NkqAAaCf9JzSsDBJB
	84jsI3wD1+Rv/EJWBYGJbL32qgiJIdKNxFqprBfTobukXXOuJObIXQD4kAJ/N54K37iB5oTBsVG
	5t+20+UexvuUucB+5s4deMGxQDACwjv94M23oAAkBLVR3E+nPXiooDP1TTEbS8kMxyR+ggL1wOQ
	kwc1Mu9bC+LON/C947v14UKior/42HOt82M2tj0VP2sYFUSrguiH1J9jXSdNYbefYddYKvwSl84
	yUb+d3Or+X8puA8wqd5ZHqU5F3StifD8aVqr/dKaeDzb8lc+Uy7EAUpCjidUK+bw==
X-Received: by 2002:a05:651c:19a7:b0:3a7:71d2:2f9c with SMTP id 38308e7fff4ca-3a771d2306bmr33601fa.23.1790700754468;
        Tue, 29 Sep 2026 09:52:34 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:34 -0700 (PDT)
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
Subject: [PATCH v3 4/4] thermal/drivers/airoha: Register a thermal zone per AN7583 sensor
Date: Tue, 29 Sep 2026 19:52:09 +0300
Message-ID: <20260929165209.69669-5-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929165209.69669-1-sochnev.v.74@gmail.com>
References: <20260929165209.69669-1-sochnev.v.74@gmail.com>
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
index 0f0e6f3af3cd..7c63a1b44a6b 100644
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
@@ -642,8 +652,9 @@ static int an7583_thermal_read_diodes(struct airoha_thermal_priv *priv,
 
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
@@ -651,9 +662,6 @@ static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	int diode_zero, diode_d0, diode_d1;
 
-	/* Always read sensor AN7583_BGP_TEMP_SENSOR */
-	sensor_idx = AN7583_BGP_TEMP_SENSOR;
-
 	coeff = an7583_thermal_coeff[sensor_idx];
 	slope = an7583_thermal_slope[sensor_idx];
 	offset = an7583_thermal_offset[sensor_idx];
@@ -717,7 +725,7 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 	const struct airoha_thermal_soc_data *soc_data;
 	struct airoha_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i;
 
 	soc_data = device_get_match_data(dev);
 
@@ -739,11 +747,31 @@ static int airoha_thermal_probe(struct platform_device *pdev)
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
@@ -751,7 +779,15 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 	return soc_data->post_probe ? soc_data->post_probe(pdev) : 0;
 }
 
+/* The bandgap sensor stays zone 0 */
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
@@ -759,6 +795,8 @@ static const struct airoha_thermal_soc_data en7581_data = {
 };
 
 static const struct airoha_thermal_soc_data an7583_data = {
+	.sensors = an7583_zone_sensors,
+	.num_sensors = AN7583_NUM_SENSOR,
 	.pllrg_protect = AN7583_SCU_THERMAL_PROTECT_KEY,
 	.thdev_ops = &an7583_tz_ops,
 	.probe = &an7583_thermal_probe,
-- 
2.55.0

