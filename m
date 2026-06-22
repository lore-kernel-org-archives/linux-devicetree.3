Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AEA36F427
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130935; cv=none; b=LdqlVnSaZ3AxhF32eiXf2s86mMSpxzmmQqvJplx4WAKfa4/Ll8yf6AtIZplzgI3LIgWsjIuh4vzGMk9eccfEqtgQH8+L43pGCX0lZisJVjmhe/smo6DFxZwc4rwMjffN2PA5vm6M3YvhI3W2Ql7UQH6VkFGjJUVUTKCFtY7SbhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130935; c=relaxed/simple;
	bh=28S+hwf3FQ9UQMsWLsBpPG3yCFP+JNRXsC8IN1JFl2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1xMuxwPjee5y2ancxySHeS5sPcR72DOaxEELtMgjcDM8eKJdM119tLbJ8J7gTatzGwSeKzQ/GxI8Sco5Xg+a7xQniWLVpyk4S2jeiOLyFiFj9vWy9HJFwph/HMHDt0pqfdtcMVsPENxnZ/AZtLwiAuC2e7gB6xY4f/KGCm4zWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9NF73pp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9NF73pp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso44974425e9.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782130932; x=1782735732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaQZWDz5cyx/OORRvlw+BuYWZasvfEG4FxKB1dhqSgI=;
        b=i9NF73ppSlIjr88WDg7U2PVyj73XRezqE7s/J+yfiIvXkjxB5HB6dpLvVFipPTGprI
         tlhE/uVAjJpPk/nUJeYwnG97b6FSL/uVbuEJOYNbCMgeT9Af263JTVIhQs9PjiEtJKxc
         LpVpVWqEDz0fEDD+HyRT6K3nTmrw1ZzApAsszEIk/rKVgkiwqSmF+HN9sNQC4SWgXxlH
         LlODTo+tH9zz9IuJ+iAaw/E897k7A0LQApJX+5TIfG2QV5+7JAMKGZ8DbILdurPouWkw
         rdw86h6GtC2WaEe6Za4HPCnhF4KVHPPgUM1bodvBDrGD01HrGa3CBq/1H7W5woUTQ4AT
         K+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130932; x=1782735732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaQZWDz5cyx/OORRvlw+BuYWZasvfEG4FxKB1dhqSgI=;
        b=RKVDuJCcIZQFvJx/g2DA0KP9laspbNrfjoeUVIyjE+zhtBHHNFU+NWYUNKEQ9lEviF
         IBvg8WnarOJGWcTxgnvtRnx02VwtcWUu0Wqg/8owRWtUXrjbNdhaO0J6sg6Lxly7cVxl
         mkOYylPR8Pk0FFK1sU49qLrrbMApwyYNJkC3SuNEQeIYVA77nIeavVxMh8aLblyNVv1U
         pzLI0M2ZJp+yogaY/r7bbKcBgTeFQYysugFRJr7oGjoJ73Trq0s8ZoMNaJeJbLXYq+gk
         hTbuG4t1LCqjb1Vm6HZUvDsvdxbsb9Kera3nB2DrTJcwBYyqTd2oG0k0fbyq42VDyj0c
         Cm3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+kWHv9tCJrbvJjBsMcM+GpWV9qRIM04CnH4kLv29APOkO+lJwRLUG6ZcBEPb4jigOfHQlTisoPdAkj@vger.kernel.org
X-Gm-Message-State: AOJu0YxElu1HugnhJbyXqIzc0Z+rx3D7I2mUk88kQq5pYqHONF1M1u2N
	mgkQLbPk6+gDCJBzOHVTYuzZFlDsO3zC354sFahtwmgtcaJct8lHD2ya
X-Gm-Gg: AfdE7clkGPBah4PGR1JkPv2OPYk0BUitgNQUa4s+MGWHD9L/ZTR6tyynuDTmb36DLAx
	YbUtLtc3f0u6ou3dIlOn7P1yKmn+uhaPFl91JcGtjewcR0WG1CzR+dzWRMusR/jXahJOdCyAVAY
	CwbtvDDcT+/HG37Q6i+g1bzH3FwoR++HxSjTyujwXXWrx2pHsibcgIOmlIkKnrFKS8bng7LPv8f
	R6RkBrrKYs53XeRri1vgLjgEW9hUqzEG/e8bTGlIdCcRCkSXyUVfx66fekAZrwmASyOs5e2N1jd
	3N3pFRYMV/daRQIT+7etv3UdXS5YOnyfLO/HwVG+iizBzhcBUFeFvHZj5mEQeS5yGrdin87FdOx
	mdqBEEMuMdda6FfEORXry72x8OVDx36oY1FT/xDXCxRq96zgRXULMoiSlOMSssoX1a1UMTyaZYi
	kQViFXZK2zKaTrUCMZdS/US3fgaWZgvuKeCx2ZwKNtG3lK65vAcPxgt1wrKvyANQ==
X-Received: by 2002:a05:600c:5489:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-4924668299emr195917525e9.6.1782130932269;
        Mon, 22 Jun 2026 05:22:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm27255637f8f.12.2026.06.22.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:22:11 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (chipcap2) Add support for label
Date: Mon, 22 Jun 2026 15:22:00 +0300
Message-ID: <20260622122200.14245-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622122200.14245-1-flaviu.nistor@gmail.com>
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other hwmon devices.
This is particularly useful for systems with multiple sensors on the
same board, where identifying individual sensors is much easier since
labels can be defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/hwmon/chipcap2.rst |  2 ++
 drivers/hwmon/chipcap2.c         | 25 +++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/chipcap2.rst b/Documentation/hwmon/chipcap2.rst
index dc165becc64c..c38d87b91b69 100644
--- a/Documentation/hwmon/chipcap2.rst
+++ b/Documentation/hwmon/chipcap2.rst
@@ -70,4 +70,6 @@ humidity1_min_hyst:             RW      humidity low hystersis
 humidity1_max_hyst:             RW      humidity high hystersis
 humidity1_min_alarm:            RO      humidity low alarm indicator
 humidity1_max_alarm:            RO      humidity high alarm indicator
+humidity1_label:                RO      descriptive name for the sensor
+temp1_label:                    RO      descriptive name for the sensor
 =============================== ======= ========================================
diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 4aecf463180f..086571d556b7 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -22,6 +22,8 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 
 #define CC2_START_CM			0xA0
 #define CC2_START_NOM			0x80
@@ -83,6 +85,7 @@ struct cc2_data {
 	struct i2c_client *client;
 	struct regulator *regulator;
 	const char *name;
+	const char *label;
 	int irq_ready;
 	int irq_low;
 	int irq_high;
@@ -449,6 +452,8 @@ static umode_t cc2_is_visible(const void *data, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_humidity_input:
 			return 0444;
+		case hwmon_humidity_label:
+			return cc2->label ? 0444 : 0;
 		case hwmon_humidity_min_alarm:
 			return cc2->rh_alarm.low_alarm_visible ? 0444 : 0;
 		case hwmon_humidity_max_alarm:
@@ -466,6 +471,8 @@ static umode_t cc2_is_visible(const void *data, enum hwmon_sensor_types type,
 		switch (attr) {
 		case hwmon_temp_input:
 			return 0444;
+		case hwmon_temp_label:
+			return cc2->label ? 0444 : 0;
 		default:
 			return 0;
 		}
@@ -552,6 +559,16 @@ static int cc2_humidity_max_alarm_status(struct cc2_data *data, long *val)
 	return 0;
 }
 
+static int cc2_read_string(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, const char **str)
+{
+	struct cc2_data *data = dev_get_drvdata(dev);
+
+	*str = data->label;
+
+	return 0;
+}
+
 static int cc2_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		    int channel, long *val)
 {
@@ -670,8 +687,9 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 }
 
 static const struct hwmon_channel_info *cc2_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
-	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_MIN | HWMON_H_MAX |
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_LABEL |
+			   HWMON_H_MIN | HWMON_H_MAX |
 			   HWMON_H_MIN_HYST | HWMON_H_MAX_HYST |
 			   HWMON_H_MIN_ALARM | HWMON_H_MAX_ALARM),
 	NULL
@@ -680,6 +698,7 @@ static const struct hwmon_channel_info *cc2_info[] = {
 static const struct hwmon_ops cc2_hwmon_ops = {
 	.is_visible = cc2_is_visible,
 	.read = cc2_read,
+	.read_string = cc2_read_string,
 	.write = cc2_write,
 };
 
@@ -710,6 +729,8 @@ static int cc2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(data->regulator),
 				     "Failed to get regulator\n");
 
+	device_property_read_string(dev, "label", &data->label);
+
 	ret = cc2_request_ready_irq(data, dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request ready irq\n");
-- 
2.34.1

