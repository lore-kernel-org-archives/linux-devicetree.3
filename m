Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843B30B521
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208060; cv=none; b=HGBG6ZJPIRL5cVCd0FjvizE5+4xNiFMLxhebZ2xm6O7mlB6VgX7tdcEyJTapjGcA+sMuUss3dofAO+27dLKNL3K/lclQmnd/E3fHlA5Aoap0Uc8BAvGlOGFB/jU6OGX5Tp1VR53yqNcsVQr1la672plIoWcMBnnAnqCy+QkqC0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208060; c=relaxed/simple;
	bh=uso+AiL4RRVW994rNUEM+SPENAewotD94oUfNOpNN/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i2IaDQDD8wA5OMqAQVqlitD0MvA6GNDD72LhelvuTk85OytHVMxpr2QAwgjS6QND0jZ9+0Z1C1nAIUem8oDVfmFPR4s0yIXhaKpTfWc+2YI2pKvphGrIVTcOwBcov3mNhZ6ZCsgb89eP8IRvSjJ9NC3x24qTPuKQ+xaNkN2nsUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7MZlhrX; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7MZlhrX"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1168185e0c.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785208058; x=1785812858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcAwqVfZstu8fLwMT3MpubKYI8H9ycEfhFoXc9QzxXc=;
        b=M7MZlhrXpbeITZzREZcQPZ+RZF2XzE7roJUth8AtQlseptTrcFt8YS3/NsNBaOmlx1
         zV2+qCxCk+fOPB9BqBBie82xFRLY1xRJdptHxKt2Ql1v9R8qyg2glyDEEqn4EFpFn1cC
         IU4TrVVJLTpKXuSIyPBnCSCwlZByadEUU7vdNF4DJ3NNbYlTnS3oT4gGLiagLrVOn5mp
         Knta0EMNV5udpxaZK5QS+REffr3drbh3mvs0GadO2kYjnvFaSMaSx960dPJo+nNhB+gu
         +M9Tz17Uo6eQE1MA9blHJob1bYuflfyuYiNvRmY2qZxVEzOm4R3WjzW8bPssTQFkOzX1
         /Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785208058; x=1785812858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcAwqVfZstu8fLwMT3MpubKYI8H9ycEfhFoXc9QzxXc=;
        b=hbxdCsuUdlN/2b3stGoHjP4u4WLk2t1smR9KTFDdy261ngK+869e5V3AxZsVIi/fzT
         X6mOPL12dWy43Kxp2jWHQnqiwVZpFIH0ZNaeKdshbS0pinb/MvSAf6BD9e+ZVLoMClrw
         dirFIe/yOWq4NmQXRbWCVQuUD678b49KSZMS4nZ8cwiBL0/33w/kMExklAKyCqYcZVnm
         fD8zPCjZt38oyyFQenmTBM9alLX6hHmIYoiLG+jNxyBAHeoX6IghAYCzBMKISXGqc+nS
         ++41oOuhYiTJvVhlFW3cBTmuPhgjThIEOsKjUHzqYK14JGxUksxFMRKzfQGauo7WHbxa
         DxgA==
X-Forwarded-Encrypted: i=1; AHgh+RpiDFBSsLWc+3BIJV6/wYAwxX3jlI5pBBbDxVhdtLsuS7rJeHOwiv7AT/9BQ8AudOEh0wTEP68GhzpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSfGl6pRzRGuIli0O9uEznrxjRpmSNUKs/kOKG5GNrEe7KwRh
	O5I/mZ9eaNarxqqb0LZmULWbxq4m/CVixhvMI+cq8anf0l4+C+lQO/+T
X-Gm-Gg: AR+sD12Q9+/lUBOlei+aJfJ1nMA2Q7f2IVheGU1tCMcfMxrhajFIEmq6Ve3KJSM35c3
	JinX/ybNZp9LKExT0Y32vOIZo7RNWmmflZSYilceTMfa1mSGKv82nw/4NRdBenJHIB5Ya0MGURr
	nWPgDpIfGO03Pj88rqVp5Hn52EsLY9Wy7Os1NnW7Q6Yn2iGEs8s1DsdvzI0U9rRorgMFysHUMaC
	CaR2GxCmMbGzr8PZWxkpsp/6S8/nc10bA0PCTMPX6jLR2iCwV6fuLux2wvUWqHgeIDtgs6Pnd8q
	BO3yKZZ0L1dUFntiqL2Evvd9sSdwGv/UIt7MpEcGOaiKxHAFhcQcK5FiLqT+dKzxlwpoAkeJyXs
	ZR3ybGb5Herw4L3JqKDz4E2u3hgRARrOEw9MNidH8G5rzySCHZqrQe4LXTqKLA5HtJwybM48DJi
	pmsmppYwwWRMrWjKqqWg==
X-Received: by 2002:a05:6122:50e:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c33f89fd5bmr229758e0c.1.1785208057651;
        Mon, 27 Jul 2026 20:07:37 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305759d35sm8148812e0c.18.2026.07.27.20.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 20:07:35 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 28 Jul 2026 00:07:11 -0300
Subject: [hwmon-next PATCH v3 3/4] hwmon: (adt7470) Expose fan control via
 PWM framework
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adt7470_thermalzone-v3-3-d4586478cdba@gmail.com>
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
In-Reply-To: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
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

The legacy sysfs interface remains unaffected and operates in parallel.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/adt7470.c | 137 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

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
index 87ddd7b8ddae..883838fdcd7d 100644
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
@@ -887,6 +890,125 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
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
+	u64 period_ns;
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
+	period_ns = DIV_ROUND_CLOSEST(NSEC_PER_SEC, data->pwm_freq);
+	wfhw->val = min_t(u64,
+			  mul_u64_u64_div_u64(wf->duty_length_ns, ADT7470_PWM_MAX, period_ns),
+			  ADT7470_PWM_MAX);
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
+	wf->period_length_ns = DIV_ROUND_CLOSEST(NSEC_PER_SEC, data->pwm_freq);
+	wf->duty_offset_ns = 0;
+	wf->duty_length_ns = mul_u64_u64_div_u64(wfhw->val,
+						 wf->period_length_ns,
+						 ADT7470_PWM_MAX);
+
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
@@ -1336,6 +1458,21 @@ static int adt7470_probe(struct i2c_client *client)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
+	if (IS_REACHABLE(CONFIG_PWM)) {
+		struct pwm_chip *chip;
+
+		chip = devm_pwmchip_alloc(dev, ADT7470_PWM_COUNT, 0);
+		if (IS_ERR(chip))
+			return PTR_ERR(chip);
+
+		chip->ops = &adt7470_pwm_ops;
+		pwmchip_set_drvdata(chip, data);
+
+		err = devm_pwmchip_add(dev, chip);
+		if (err)
+			return dev_err_probe(dev, err, "failed to register PWM chip\n");
+	}
+
 	data->auto_update = kthread_run(adt7470_update_thread, client, "%s",
 					dev_name(hwmon_dev));
 	if (IS_ERR(data->auto_update))

-- 
2.55.0

