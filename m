Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140153B354
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700757; cv=none; b=KFY6sUG2CHSzR+GPNHtxQOiXqwoCJPvut6ApE8dFbW4Kl8m2DP2MXn5qshlZDC36SzjCYuyFNFzq7ynuVwdiKsweG8u6KdDYGVH9GEJessZaRRX8EZkn4MNRTEguVwcZSdliJ527drmZrKod34rjzod8Q/VIzuuNQZT+UJ8CCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700757; c=relaxed/simple;
	bh=r7rAzsQj8tq8hOzCk4tA2IJiAq9Flk3ypaIF/m8Mhtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ll3SLRk8aM5BQfqm+tbhgu2W9O7+zA8/8fhHXPJXdkCAZdJChKCnguKal3YN3KW5A5smio7W7ktv8Zm1bRsCKNaOZgK4LWNsezfknlmHGnQeIi/isUqRokKs+dwzs7qMGBZx1JdudSsOi9jFw7KRbvZDETDyZBwP5402WCWL00o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPsAGEvd; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPsAGEvd"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so41516001fa.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700752; x=1791305552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPqwF7x5ZyfbIT2MUR02hgJRce/NwkKWQi9i+m/u9W0=;
        b=ZPsAGEvdr43qCCdPEzz7iTuer1yc3ntzFxSMFT7YfJSdpDCPS+Jj0RF96WIQYcfb5X
         W20q5DgPzdzUXA0SNc4u0FEwsgqCijXm9FguDLliQ//rGPAjOzML4V24d2QNtBSkwdkK
         2rgT+abjmmXQ7V+KVIkCUzJtR2nEzVA/ULJG8APgvzuYa+nUSq6g2gZnqRD7rbnj8l9K
         Gb6Wg4ojXu2guiaoEb3W1K0c8JmCHIifGEf/FTRh9uAZcYvmhoVwnlhr1dGSJ/cW+/XT
         MZWSIOH2Ty7W+uw+TBdZxWzN/gnvo4OjaCU41b+wdatjoCsAmdvxKP7ktmmZaWR8BsZk
         lcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700752; x=1791305552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPqwF7x5ZyfbIT2MUR02hgJRce/NwkKWQi9i+m/u9W0=;
        b=C362O++ghvo1kD7BYQqdjWy2Ojg3qDJnPwp7Nvno++Xh4R9U2LNsQ3JT7ow1aN/ODn
         pJbEtlOjKQXkZ/dpdBQ+ZbX6T33Pvh3JUiyeQknLgTO+mP3zvBf2vbUjSW8hVP1IogYI
         LYE5uRhXV3BIUM6bqlE6vORDgR8kKO1vx3zq6VzfSsri/rVyU8b2Cr3HoA+k7EfJ8LEh
         HhAHfTLo0kK6oISNIOGub7UnKl/BH0Kfd10snIbu8ovlYjTrb/eP4xO/jx7NH2Ssif5k
         GeWw+ce94fEPPHHPx1xct+zmbrdhbtwWf8i+iFfPx0HPj8eHyrx9I8A3HeKcTeS4Zwll
         +rBA==
X-Forwarded-Encrypted: i=1; AKwUvBzvPwqCpalGmNw3jB3CUlTIPt/mE17SZChUCn87sWPzSiFKH11fas8S0o2N4Ecq2Paeo5R8KJhfZnsr@vger.kernel.org
X-Gm-Message-State: AFq9FYJawFPQn8kk7m/fS/LTfD/Zom8gM0femyBN2IAFax64NlS6a9QX
	4xYlt4vCI64cvkCpuGXbgQ7kEDmOleqz7l7MJiwZ6gDm3zrzqWmZxAo=
X-Gm-Gg: AYBFou2ovJDSl4Sm+W9vBeimq8Hxo0dmhJP/JGUC50eZMuHUz3lt77B1Ad/dOlomHBa
	KreMIM9OuwZ3Ng3WPirKmwlLARdCxv/1eo6UIs49/DeYrUyXhwX0IHixq1WHvRavWjnf9kExc1X
	BHRBZv9Cnn1q+e6zC8AnaKpDqcQC2sXdhuFxZIVZYY9UX/AuwBczEunGnFwO+RVtB90TEshhuAT
	0AaHriDNt4fclS1vu0cOS+vCNB13Da8LX4+xPSjIElonpiHlnOYMtcCnZPYfHqXI/4Y5a14eqgu
	E5TUzy6tKe+D6fRJIVEjyKxtA5UbK+M40O0/AdQFpnknYNyr7tFZg0AVUzBTvpOUdQCUDcArhIX
	A6AWlWIqFokbpwcPxgdETXWDcc9hkW03JYnYgD4mbPUqSacopdHNMiCrsfJg9h+3RW1zVFKoapY
	QEh2JgDyvSMN+4rFjwrEMw4D4dNI4Pm5B8x+nT2tGxC4KNCzwrGPJaqC1Id451
X-Received: by 2002:a05:651c:c85:b0:3a6:6aad:be56 with SMTP id 38308e7fff4ca-3a771a5d025mr218461fa.22.1790700751777;
        Tue, 29 Sep 2026 09:52:31 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:31 -0700 (PDT)
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
Subject: [PATCH v3 2/4] thermal/drivers/airoha: Serialise access to the shared ADC
Date: Tue, 29 Sep 2026 19:52:07 +0300
Message-ID: <20260929165209.69669-3-sochnev.v.74@gmail.com>
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

A read selects the sensor and walks three diodes with a 10 ms settle on
each. The zone lock serialises reads of one zone. With a zone per AN7583
sensor, added later in this series, reads of different zones interleave
and convert samples taken at another mux position.

Mux writes are dropped silently unless PLLRG_PROTECT is lifted, and its
save and restore do not nest. The cached TADC value also skips a write
after another reader has moved the mux.

With the AN7583 sensors read as parallel zones during CPU frequency
changes, a zone crossed its critical trip on a chip at 55 C and the
board shut down.

Serialise the sequence, drop the cache, check the selection after
writing and after sampling, and return -EAGAIN if it does not hold.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 85 +++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 17 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index 1b187c41baea..0f0e6f3af3cd 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -5,6 +5,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -191,6 +192,7 @@
 #define AN7583_NUM_SENSOR			3
 
 #define AIROHA_THERMAL_NO_MUX_SENSOR		-1
+#define AIROHA_THERMAL_MUX_TRIES		3
 
 /* Convert temp to raw value as read from ADC	((((temp / 100) - init) * slope) / 1000) + offset */
 #define TEMP_TO_RAW(priv, temp)			((((((temp) / 100) - (priv)->init_temp) * \
@@ -250,7 +252,8 @@ struct airoha_thermal_priv {
 	struct resource scu_adc_res;
 
 	u32 pllrg_protect;
-	int current_adc;
+	/* Serialises mux selection and ADC sampling */
+	struct mutex lock;
 
 	struct thermal_zone_device *tz;
 	int init_temp;
@@ -294,9 +297,26 @@ static int airoha_get_thermal_ADC(struct airoha_thermal_priv *priv)
 	return val;
 }
 
+static bool airoha_thermal_mux_holds(struct airoha_thermal_priv *priv,
+				     int tdac_idx, int sensor_idx)
+{
+	unsigned int val;
+
+	if (regmap_field_read(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC], &val) ||
+	    val != tdac_idx)
+		return false;
+
+	if (sensor_idx == AIROHA_THERMAL_NO_MUX_SENSOR)
+		return true;
+
+	return !regmap_field_read(priv->chip_scu_fields[AIROHA_THERMAL_MUX_SENSOR], &val) &&
+	       val == sensor_idx;
+}
+
 static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
 				   int tdac_idx, int sensor_idx)
 {
+	int tries = AIROHA_THERMAL_MUX_TRIES;
 	u32 pllrg;
 
 	/* Save PLLRG current value */
@@ -307,19 +327,17 @@ static void airoha_set_thermal_mux(struct airoha_thermal_priv *priv,
 		     priv->pllrg_protect);
 
 	/*
-	 * Configure Thermal Sensor mux to sensor_idx.
+	 * Configure Thermal Sensor mux to sensor_idx and Thermal ADC mux to
+	 * tdac_idx. Writes can be dropped silently, so read them back.
 	 * (if not supported, sensor_idx is AIROHA_THERMAL_NO_MUX_SENSOR)
 	 */
-	if (sensor_idx != AIROHA_THERMAL_NO_MUX_SENSOR)
-		regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_SENSOR],
-				   sensor_idx);
-
-	/* Configure Thermal ADC mux to tdac_idx */
-	if (priv->current_adc != tdac_idx) {
+	do {
+		if (sensor_idx != AIROHA_THERMAL_NO_MUX_SENSOR)
+			regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_SENSOR],
+					   sensor_idx);
 		regmap_field_write(priv->chip_scu_fields[AIROHA_THERMAL_MUX_TADC],
 				   tdac_idx);
-		priv->current_adc = tdac_idx;
-	}
+	} while (!airoha_thermal_mux_holds(priv, tdac_idx, sensor_idx) && --tries);
 
 	/* Restore PLLRG value on exit */
 	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, pllrg);
@@ -596,12 +614,40 @@ static int en7581_thermal_post_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int an7583_thermal_read_diode(struct airoha_thermal_priv *priv,
+				     int diode, int sensor_idx, int *val)
+{
+	airoha_set_thermal_mux(priv, diode, sensor_idx);
+	*val = airoha_get_thermal_ADC(priv);
+
+	return airoha_thermal_mux_holds(priv, diode, sensor_idx) ? 0 : -EAGAIN;
+}
+
+static int an7583_thermal_read_diodes(struct airoha_thermal_priv *priv,
+				      int sensor_idx, int *zero, int *d0,
+				      int *d1)
+{
+	int ret;
+
+	ret = an7583_thermal_read_diode(priv, AN7583_ZERO_TADC, sensor_idx, zero);
+	if (ret)
+		return ret;
+
+	ret = an7583_thermal_read_diode(priv, AN7583_D0_TADC, sensor_idx, d0);
+	if (ret)
+		return ret;
+
+	return an7583_thermal_read_diode(priv, AN7583_D1_TADC, sensor_idx, d1);
+}
+
 static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
 	int sensor_idx;
 	int delta_diode, delta_gain;
 	int coeff, slope, offset;
+	int tries = AIROHA_THERMAL_MUX_TRIES;
+	int ret;
 
 	int diode_zero, diode_d0, diode_d1;
 
@@ -612,12 +658,14 @@ static int an7583_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	slope = an7583_thermal_slope[sensor_idx];
 	offset = an7583_thermal_offset[sensor_idx];
 
-	airoha_set_thermal_mux(priv, AN7583_ZERO_TADC, sensor_idx);
-	diode_zero = airoha_get_thermal_ADC(priv);
-	airoha_set_thermal_mux(priv, AN7583_D0_TADC, sensor_idx);
-	diode_d0 = airoha_get_thermal_ADC(priv);
-	airoha_set_thermal_mux(priv, AN7583_D1_TADC, sensor_idx);
-	diode_d1 = airoha_get_thermal_ADC(priv);
+	mutex_lock(&priv->lock);
+	do {
+		ret = an7583_thermal_read_diodes(priv, sensor_idx, &diode_zero,
+						 &diode_d0, &diode_d1);
+	} while (ret == -EAGAIN && --tries);
+	mutex_unlock(&priv->lock);
+	if (ret)
+		return ret;
 
 	delta_diode = diode_d1 - diode_d0;
 	delta_gain = (delta_diode * coeff) / 100 + (diode_zero - diode_d1);
@@ -678,7 +726,10 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->pllrg_protect = soc_data->pllrg_protect;
-	priv->current_adc = -1;
+
+	ret = devm_mutex_init(dev, &priv->lock);
+	if (ret)
+		return ret;
 
 	if (!soc_data->probe)
 		return -EINVAL;
-- 
2.55.0

