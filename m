Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621038C2C6
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321998; cv=none; b=Ff8+hCbHndS+kiOEp1Gj+zQq8w4AotusE9gVbweC9WSHfDUlGarTATBkZYLzIB9yvWrg1dLEXjOVX32/tWBOjGADzjLW+ZLRSvL8rbeJmI3rPHTlTbxc4KKUZ+vB1QCOhK87CTzb/aNQazX6t0ap9lec8DtDL2aQuB/FmgoEHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321998; c=relaxed/simple;
	bh=86gXb+0iVKo/CNaBiOs1PGuYej+NgCevE8J2gY29EUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e02489VMdxCYzhH2OBHBmsDFCT0C8gyVD7ukDOXjv1iX3c0egOqnKaOf1UzGw7N0oEPyU/14zDvjmwWsPQ9RjqKxYjK5LwGU1fF9qe2Zi1gBbetURSRu8Dz8OybX2cpDa8+RUUgonKkbsnPPvA6w6Tj783s4d0YrYwcJ7ZQZqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfX2qIli; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfX2qIli"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80cebd41372so79807107b3.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784321996; x=1784926796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKIuG7ZT2h5nSeNmJaQ8VJ/Mhodno/coMufjCgnracY=;
        b=rfX2qIli55FppQdCCmrdfcE6+1UWCUgQ41wHu/BhBt82aKhaQJMIL1usnM1qEgusHU
         +AeadF7+rSchl3LBtpr7ZrBZPazjvwcyulwMGCrYbJUKnmyVJD8jVIUYGNfjDAhxgxlf
         ElfeM1YSD83tuoCSJA+H+a3FAIZZ3u/CiSYk0VBANx4r5GmY3Q0jTdwENQnUpWLd6wy+
         6gd/pirkTqhvX8wZ8gNxxdHkVR7NicGbfWguyEC19XWPeZaKpyAfLW7CoFH4JTVRmlqS
         SOCDNEPgGAJ8jUeELPMenZwJhgafMP4LjEegRISp3Ss+3o8b/kDuepir0Sm0sw2HVd4t
         dknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321996; x=1784926796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKIuG7ZT2h5nSeNmJaQ8VJ/Mhodno/coMufjCgnracY=;
        b=IlZ1rxpbqbNW6rsQVa4PejtRBRH4USKqf6afu+fMcJBbkmIN0+INgdDv/oFgHnrehO
         XgASokzwC3DJqiXq6+MzS/XKXvggPtMnqTiGanE0Dh4suMReiYyotGgG2fyxbgvNKP/K
         MGPuQYzNkEkVugGg3TVWPdW0583UOx0oUmWaKL/hdf5ETx7QIrXecN+BMEqiSL5KJzMn
         ISd6OlQr5mFi4kVpV4zhwkAjTmES5ZuZMz1ob5NtfYbfYtsGE7UfRhI35k8zLGCZ3LLn
         rfiwBv3Y5jmfU1ZBrhl1cSLxFVVQlJTUqQMYke7eW5lZglxZqqa4DyeOcIRuEIVDOjP/
         bA0w==
X-Forwarded-Encrypted: i=1; AHgh+RqehPeFjA+wmNDk8ONp3BUev/SV/dBuBo9aIeAacAlhzo4e2XUw6Y1+5iZv8n7v618nok6afARpBji4@vger.kernel.org
X-Gm-Message-State: AOJu0YyRy0TwhLpQMlaa8HhlFYFTbxTmHYrZN3LkwfU1OBEzLBVuvcav
	o1z1xf1Vl4USFD16ma+a8S7s3TNUbU1L9zhNZmfJG/Y7J03GZZvqFynU
X-Gm-Gg: AfdE7cnTTeKUzRH7M2VK5ubwVEaLlirZdsdpSZ4UkWR9QzxoaxxyxPNwXlqK0q6kLro
	UxAOi7Uq/jhJsjHpWjfYrETrmbbtIXRWnQqg/Fq9yUHBwBY3G/hdcqW0Xm12rgLlkXo/BFMOXVb
	++BMwuLSWkjxnCb7am3pP6nQRtQP8cD/3UOZGQps4CHcZv6GulagRK6ok8gu0WAe4YMfG9xKvjw
	uY+/p5kinD9mfmSHpB40DG/WQkbsdyNI0A1QWTqQDPDfZLQ6WGekz4/GzEyInPNDNoZFphmlp37
	W2AN5HBwc7jl7J8bTmWsCg8pf2rbMd4Pb1b70nc9fd8emYqLwCXSTNHjDmzM0PePC16z7EfdQU4
	12mI7jIcsKlrDifVHpGMFM2Mqshor9fTPWde5AbZHUXcbMWYK+dosx/exUIYlx4gQIq4/cNBWy/
	PjoO/XWCtWMHM5BfFF
X-Received: by 2002:a05:690c:9a93:b0:80d:fc34:a79e with SMTP id 00721157ae682-81ef26119d8mr15502717b3.35.1784321995782;
        Fri, 17 Jul 2026 13:59:55 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef3e6656dsm20013647b3.0.2026.07.17.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:59:55 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 17 Jul 2026 17:59:18 -0300
Subject: [PATCH v2 5/6] hwmon: (adt7470) Register as a PWM provider
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-adt7470_thermalzone-v2-5-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
In-Reply-To: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
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

hwmon: (adt7470) Register as a PWM provider

The ADT7470 features four PWM outputs that can be used to control fans.
Previously, these were only accessible through the legacy hwmon sysfs
interface.

Register the ADT7470 as a generic PWM provider. This enables standard
Device Tree PWM consumers, such as "pwm-fan", to use the device through
the "#pwm-cells" property.

When a PWM consumer applies a new PWM state, the driver automatically
switches the corresponding PWM channel to manual mode so that the
requested duty cycle takes effect. The duty cycle specified by the PWM
framework is internally converted to the 0-255 scale expected by the
hardware registers.

The legacy sysfs interface remains unaffected and operates in parallel.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/Kconfig   |  1 +
 drivers/hwmon/adt7470.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 08c29685126a..8838b6714e60 100644
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
index d881609c99aa..aaae14a421cd 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -22,6 +22,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/util_macros.h>
+#include <linux/pwm.h>
 
 /* Addresses to scan */
 static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
@@ -864,6 +865,57 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 	return err;
 }
 
+static int adt7470_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct adt7470_data *data = pwmchip_get_drvdata(chip);
+	unsigned int pwm_auto_reg_mask;
+	int err;
+	u8 val;
+
+	if (pwm->hwpwm % 2)
+		pwm_auto_reg_mask = ADT7470_PWM2_AUTO_MASK;
+	else
+		pwm_auto_reg_mask = ADT7470_PWM1_AUTO_MASK;
+
+	if (state->enabled && state->period > 0)
+		val = DIV_ROUND_CLOSEST_ULL(state->duty_cycle * 255, state->period);
+	else
+		val = 0;
+
+	mutex_lock(&data->lock);
+
+	if (data->pwm[pwm->hwpwm] == val &&
+	    data->pwm_automatic[pwm->hwpwm] == 0) {
+		mutex_unlock(&data->lock);
+		return 0;
+	}
+
+	/* Put the PWM channel in manual mode before updating it. */
+	err = regmap_update_bits(data->regmap,
+				 ADT7470_REG_PWM_CFG(pwm->hwpwm),
+				 pwm_auto_reg_mask, 0);
+	if (err < 0)
+		goto out;
+
+	data->pwm_automatic[pwm->hwpwm] = 0;
+
+	err = regmap_write(data->regmap,
+			   ADT7470_REG_PWM(pwm->hwpwm), val);
+	if (err < 0)
+		goto out;
+
+	data->pwm[pwm->hwpwm] = val;
+out:
+	mutex_unlock(&data->lock);
+
+	return err;
+}
+
+static const struct pwm_ops adt7470_pwm_ops = {
+	.apply = adt7470_pwm_apply,
+};
+
 static ssize_t pwm_max_show(struct device *dev,
 			    struct device_attribute *devattr, char *buf)
 {
@@ -1299,6 +1351,21 @@ static int adt7470_probe(struct i2c_client *client)
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
+			return dev_warn_probe(dev, err, "failed to register PWM chip\n");
+	}
+
 	data->auto_update = kthread_run(adt7470_update_thread, client, "%s",
 					dev_name(hwmon_dev));
 	if (IS_ERR(data->auto_update))

-- 
2.55.0

