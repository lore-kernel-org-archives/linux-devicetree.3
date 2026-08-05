Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF951217648
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935758; cv=none; b=d8QY92wIG5lij+Ix+FfCkxhrTpZyzq3ZnL3b4p+tNANMYb8clSMMStpD2e6oKh1wainsjxb/oBIONzqL/8gmbluJfGE7p+xIFkzGD5lfiCmjOslku8sa39pN4XLM4VHieR7J00jUPHfWbu+ClGA0ktgWWVD01tuGqNh16SliZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935758; c=relaxed/simple;
	bh=6Sz4Q0ABr5Tfip31KyIIcvrudC0SDzp/CSjmJxU7CSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnW20l/d9RPeNJddVkrvCkjO/BVOpGF2ErnWcxcV+hT4KU3+L6NoKauesdLFSoIHz6lIfOs2Q43vV2+w+ba2MQA5IuG4Ooe+cYma5dGgu6b/5E/LRNmLxvsNOjfH1TPgM/cFIlqH3pmHajnNLNDeBYUv5nReJdk3hH6/43zxzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIVfKMeB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIVfKMeB"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e7109321dso654136a91.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935754; x=1786540554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mof0gXHLBACZ9mYjnIwYKuzUS/R9hysxBWyHkqLlLTg=;
        b=fIVfKMeBxh2GTX0g9jspWdrlay5rqJAUbbY5ZOyBL4kDB9UThb9yxj+gj2sclLXpKV
         1jTomK2FzMOh0Dj8Qs3F+0Dciik4oEK0IdkyIKanSuz5C3cJOW2hM6/JnPeQWmOsc589
         YPXHo1dQfWFb0jnfbMnT7sSeO6nWxEmq97oeuxBA5HhpK8rS9IRwmpqchNDJ8FtGGnXE
         xnJOIyERzqRqMum4WqijDFWXRneyqV3OCWOFNzsf/Qvm1tgYsaKr1bopoe7QJFOgM/3C
         X2XZMEJ/wDfIUjS+flM6RXlrp7xBB6408Kl/yjwN3IucDtXuOiKEAiddLXDsWPX1UrlE
         fLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935754; x=1786540554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mof0gXHLBACZ9mYjnIwYKuzUS/R9hysxBWyHkqLlLTg=;
        b=j7zz796AI23m4nPyCLG+Ou4lzpdl9gxvku+U+TMnR/Lc8ubwiVK+D2qMaIP4l9VS3O
         FsXGQLpSLTsPl4rDqup8uRZgH1Q1kM9y3gvU9FxYC7iTXwRhZYp48gKKxn7iPXZkC6kB
         eeUc4EDU3HXCk0VmFfBukQ/O/aQIQWCTqYp0jiSPfzf5s4EQCw+k7IXlauSjJzaaC7RC
         gP2fUsUxhNFuV6lYvw4Bwh/wQJ0OfuCZiPPqUAtJhd9nznfPcNbpKgk7j095zmbrRZew
         i9yRYRkoCxYxXAah0h0R/GYK4TggK+0BOwXrxdGJP9b51J0NbR8iMDfeW3AwlKynnONM
         7s4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrkm6KPotSXmIiI4O+zCXPRXrWKquGSKzzgz1CbEg/pykdcH18veQVUQ/M2euFk+GdTW8ZldxYs3ZiI@vger.kernel.org
X-Gm-Message-State: AOJu0YxVb3U5Ck51kLhqvvJ8wSe6ZykSLXDBzI6hmDmF7HMUaajUiLFK
	gbl1yO7IAeYG59wLjCqLSK289yDaI/gu2hwr8Hc7ptEf7RynmgUuVvdb
X-Gm-Gg: AR+sD12FaU6ElW0SbeWBa1atyZwkCQL1pCw0Y5qmFDopOezcdqyiSJ+Kz/qx5/U+l7R
	P1vJyeecazdWhM3it9Gh+SN9IZJPRT0H9IJZ/QtQa0GzasJz9DCLWsYCkvLdlYlMptml26wtQ/8
	XvM3OTtRhtafNzDjb3GRVIQpiYrKxSYyGiGFQ3AL7h/Z5J2BZIO1KHNZy8tV9E5WcPUh8zkZ306
	ZtulXUaRL6Wpdg7EuKLI6D83dBpaJqAoTVinunsNOcsib8OW26oCcaULSpIsgFPaA76Bg3BPtRr
	7dh742xRJwBFMqAuyGZrNuzCd5jn7edFuyeoqV2W2g3yW9tLzHJT2E5ivv4BpM3Ox+OQJ+9r9oJ
	48Wtm6WsgQchU5TJMSJtUcgFYVnYm63NVxVQTD3KsUSY2bJsQcX4UWD1rKWU4oyFBXI6yo0vzIz
	A1nk2xe+rLkak6K91V1x5cvsNlgJ/YBQvewPgJGmE3d4057ft3L/KGRXSrimXjr7KrF0Z8spVyq
	yxqVKaCX+s=
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr6273573a91.9.1785935753895;
        Wed, 05 Aug 2026 06:15:53 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:52 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 05 Aug 2026 10:15:19 -0300
Subject: [hwmon-next PATCH v6 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-adt7470_thermalzone-v6-3-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
In-Reply-To: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

The ADT7470 features four PWM outputs designed to control fans.
Previously, these were only accessible through the legacy hwmon
sysfs interface.

Expose the ADT7470 fan control lines through the generic PWM framework.
This allows generic PWM consumers described in Device Tree, such as
"pwm-fan", to use the device through the "#pwm-cells" property.  This is
particularly necessary for boards where the ADT7470 external temperature
sensors are not populated and the chip is used strictly as a fan
controller (e.g., Edgecore ECS-2100-52T switches). In such setups,
delegating control to the generic PWM subsystem allows the kernel's
thermal framework to manage the fans based on unrelated temperature
zones, such as internal SoC sensors.

When a PWM consumer applies a new PWM state, the driver automatically
switches the corresponding PWM channel to manual mode so that the
requested duty cycle takes effect. The duty cycle specified by the PWM
framework is internally converted to the 0-255 scale expected by the
hardware registers.

To prevent conflicting access, the hwmon PWM sysfs attributes are hidden
when the device is registered with PWM framework support (i.e. when
"#pwm-cells" is present in DT and CONFIG_PWM is reachable).

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/adt7470.c | 194 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 6b71e3304b4f..0d6bd117d14d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -224,6 +224,7 @@ config SENSORS_ADT7462
 config SENSORS_ADT7470
 	tristate "Analog Devices ADT7470"
 	depends on I2C
+	depends on PWM || PWM=n
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Analog Devices
diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 87ddd7b8ddae..eeec3db0da88 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -22,6 +22,9 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/util_macros.h>
+#include <linux/pwm.h>
+#include <linux/cleanup.h>
+#include <linux/math64.h>
 
 /* Addresses to scan */
 static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
@@ -164,6 +167,7 @@ struct adt7470_data {
 	char			limits_valid;
 	unsigned long		sensors_last_updated;	/* In jiffies */
 	unsigned long		limits_last_updated;	/* In jiffies */
+	bool			use_pwm_framework;
 
 	int			num_temp_sensors;	/* -1 = probe */
 	int			temperatures_probed;
@@ -887,6 +891,133 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 	return err;
 }
 
+struct adt7470_pwm_wfhw {
+	u8 val;
+};
+
+static int adt7470_pwm_round_waveform_tohw(struct pwm_chip *chip,
+					   struct pwm_device *pwm,
+					   const struct pwm_waveform *wf,
+					   void *_wfhw)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	struct adt7470_pwm_wfhw *wfhw = _wfhw;
+	u64 actual_period;
+
+	if (wf->duty_length_ns == 0) {
+		wfhw->val = 0;
+		return 0;
+	}
+
+	/*
+	 * The PWM frequency (period) is a single chip-wide setting shared by
+	 * all 4 channels, so it cannot be changed on a per-pwm_device basis
+	 * through this API. The duty cycle is rounded against the currently
+	 * configured hardware period rather than the period requested in
+	 * @wf; round_waveform_fromhw() reports the actual resulting
+	 * waveform back so the core/consumer can detect a mismatch.
+	 */
+	actual_period = DIV_ROUND_UP_ULL(NSEC_PER_SEC, data->pwm_freq);
+
+	if (actual_period > wf->period_length_ns)
+		/* period too short */
+		return 1;
+
+	if (wf->duty_length_ns >= actual_period) {
+		wfhw->val = ADT7470_PWM_MAX;
+	} else {
+		wfhw->val = mul_u64_u64_div_u64(wf->duty_length_ns,
+						ADT7470_PWM_MAX,
+						actual_period);
+	}
+
+	return 0;
+}
+
+static int adt7470_pwm_round_waveform_fromhw(struct pwm_chip *chip,
+					     struct pwm_device *pwm,
+					     const void *_wfhw,
+					     struct pwm_waveform *wf)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	const struct adt7470_pwm_wfhw *wfhw = _wfhw;
+
+	wf->period_length_ns = DIV_ROUND_UP_ULL(NSEC_PER_SEC, data->pwm_freq);
+	wf->duty_offset_ns = 0;
+	wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->val * wf->period_length_ns,
+					      ADT7470_PWM_MAX);
+	return 0;
+}
+
+static int adt7470_pwm_read_waveform(struct pwm_chip *chip,
+				     struct pwm_device *pwm,
+				     void *_wfhw)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	struct device *dev = regmap_get_device(data->regmap);
+	struct adt7470_pwm_wfhw *wfhw = _wfhw;
+
+	data = adt7470_update_device(dev);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	/*
+	 * No lock needed: like the other hwmon_ops read callbacks in this
+	 * driver (e.g. adt7470_pwm_read()), this only does a single byte
+	 * read from the cache populated by adt7470_update_device().
+	 */
+	wfhw->val = data->pwm[pwm->hwpwm];
+
+	return 0;
+}
+
+static int adt7470_pwm_write_waveform(struct pwm_chip *chip,
+				      struct pwm_device *pwm,
+				      const void *_wfhw)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	const struct adt7470_pwm_wfhw *wfhw = _wfhw;
+	unsigned int pwm_auto_reg_mask;
+	int err;
+
+	if (pwm->hwpwm % 2)
+		pwm_auto_reg_mask = ADT7470_PWM2_AUTO_MASK;
+	else
+		pwm_auto_reg_mask = ADT7470_PWM1_AUTO_MASK;
+
+	guard(mutex)(&data->lock);
+
+	if (data->pwm[pwm->hwpwm] == wfhw->val &&
+	    data->pwm_automatic[pwm->hwpwm] == 0)
+		return 0;
+
+	/* Put the PWM channel in manual mode before updating it. */
+	err = regmap_update_bits(data->regmap,
+				 ADT7470_REG_PWM_CFG(pwm->hwpwm),
+				 pwm_auto_reg_mask, 0);
+	if (err < 0)
+		return err;
+
+	data->pwm_automatic[pwm->hwpwm] = 0;
+
+	err = regmap_write(data->regmap,
+			   ADT7470_REG_PWM(pwm->hwpwm), wfhw->val);
+	if (err < 0)
+		return err;
+
+	data->pwm[pwm->hwpwm] = wfhw->val;
+
+	return 0;
+}
+
+static const struct pwm_ops adt7470_pwm_ops = {
+	.sizeof_wfhw = sizeof(struct adt7470_pwm_wfhw),
+	.round_waveform_tohw = adt7470_pwm_round_waveform_tohw,
+	.round_waveform_fromhw = adt7470_pwm_round_waveform_fromhw,
+	.read_waveform = adt7470_pwm_read_waveform,
+	.write_waveform = adt7470_pwm_write_waveform,
+};
+
 static ssize_t pwm_max_show(struct device *dev,
 			    struct device_attribute *devattr, char *buf)
 {
@@ -1107,6 +1238,10 @@ static struct attribute *adt7470_attrs[] = {
 	&dev_attr_alarm_mask.attr,
 	&dev_attr_num_temp_sensors.attr,
 	&dev_attr_auto_update_interval.attr,
+	NULL
+};
+
+static struct attribute *adt7470_pwm_attrs[] = {
 	&sensor_dev_attr_force_pwm_max.dev_attr.attr,
 	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
 	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
@@ -1131,7 +1266,32 @@ static struct attribute *adt7470_attrs[] = {
 	NULL
 };
 
-ATTRIBUTE_GROUPS(adt7470);
+static const struct attribute_group adt7470_group = {
+	.attrs = adt7470_attrs,
+};
+
+static umode_t adt7470_pwm_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct adt7470_data *data = dev_get_drvdata(dev);
+
+	if (data->use_pwm_framework)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group adt7470_pwm_group = {
+		.attrs = adt7470_pwm_attrs,
+		.is_visible = adt7470_pwm_is_visible,
+};
+
+static const struct attribute_group *adt7470_groups[] = {
+		&adt7470_group,
+		&adt7470_pwm_group,
+		NULL,
+};
 
 static int adt7470_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			int channel, long *val)
@@ -1166,6 +1326,7 @@ static int adt7470_write(struct device *dev, enum hwmon_sensor_types type, u32 a
 static umode_t adt7470_is_visible(const void *_data, enum hwmon_sensor_types type,
 				  u32 attr, int channel)
 {
+	const struct adt7470_data *data = _data;
 	umode_t mode = 0;
 
 	switch (type) {
@@ -1198,6 +1359,14 @@ static umode_t adt7470_is_visible(const void *_data, enum hwmon_sensor_types typ
 		}
 		break;
 	case hwmon_pwm:
+		/* Hide all pwm attributes if this device is exposed to the PWM
+		 * framework
+		 */
+		if (data->use_pwm_framework) {
+			mode = 0;
+			break;
+		}
+
 		switch (attr) {
 		case hwmon_pwm_input:
 		case hwmon_pwm_enable:
@@ -1328,6 +1497,29 @@ static int adt7470_probe(struct i2c_client *client)
 
 	data->pwm_freq = (u32)freq_val;
 
+	data->use_pwm_framework = false;
+
+	if (device_property_present(dev, "#pwm-cells")) {
+		if (IS_REACHABLE(CONFIG_PWM)) {
+			struct pwm_chip *chip;
+
+			chip = devm_pwmchip_alloc(dev, ADT7470_PWM_COUNT, 0);
+			if (IS_ERR(chip))
+				return PTR_ERR(chip);
+
+			chip->ops = &adt7470_pwm_ops;
+			pwmchip_set_drvdata(chip, data);
+
+			err = devm_pwmchip_add(dev, chip);
+			if (err)
+				return dev_err_probe(dev, err, "failed to register PWM chip\n");
+
+			data->use_pwm_framework = true;
+		} else {
+			dev_warn(dev, "#pwm-cells present but CONFIG_PWM disabled. HWMON PWM attributes not hidden.\n");
+		}
+	}
+
 	/* Register sysfs hooks */
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &adt7470_chip_info,

-- 
2.55.0

