Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7255A3C3F7B
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236923; cv=none; b=Gc4RHngNf0H5w58AneTDwexEjD09JMHyEn4ZDJGaXb9heKPecKKCcKV64wW9EgYcox6DTW+Yq4H79gNi7cepp1J9U1rSregifSlcgduy49fZkDn7RrknC3JSmC4VF9HEmGY2+sKuqx3UX29NleVP5FNMnjVVFvj8OcCRhDYEo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236923; c=relaxed/simple;
	bh=tCxNab6MNI/HOGJW3wkdiUk64Q6R6tu7p6UITFWGt6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/ijn2QQCds4Fc6hs50m/xRNaDaFcGxkU6My317fFN1C6N3etivtpFfdMhDwdTisX1mP/mau/USgQhtktE8bEZf8CcSDVqlhyEBvwTemuG2BB3t8HQ7JlSlSTClKIDbhE/b5mD3nwNNIP5eRU9dfLvnjg9nJ/RXACd+Y69+Cidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hViRpZCi; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hViRpZCi"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81ed000b507so22803167b3.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236921; x=1784841721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqKDYCR457ugmsmta4q9ZtrpQUflfFAWvlDAq3xKBJc=;
        b=hViRpZCiQ0gFRTqZ4IuSeXA50LcNrGXsfE7UmVYGLjVenuHGp25kVbVGbvaXWKQwT/
         2tdqhELt5Nt0OIVDPwZJLki4Ot5eLYpul50yEn30+TMWl1bZQPudmPbFAroqIQJ7qHOv
         krYXpDSMY9j37/Us52kOV+2e6h6bjGEP31T5Wgt/N6xWmDe9WL4xN9V7tRjO6xBO3Zsm
         C8VJq4mVxqvSALhE3h57LgleaBZ8GrPE3/PLuHRZYU9EyGjUjDo6eBUbHiGaNo30QX6R
         7I3I8Wn9ZB9ws/VMfgDE2AmG+k58LlfwwU38k4wwKB9zKe3QScgogItCmxOx3k8NOdev
         f5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236921; x=1784841721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqKDYCR457ugmsmta4q9ZtrpQUflfFAWvlDAq3xKBJc=;
        b=PLZg9BNFYg+5M6e6/Ua9l9We4SEBih0v/sp78h5al0iPxamSuTGZOf6Rt7/clXLKO2
         ohTucYh0kfdadPbAxIWSmkeAW6jTWUoxgdCcWcu+e/b9qYk/FBuhziB09FULERW0T76Q
         8JUP8aNWWCNmXsdlewjYpc0o2Jn3cYYhRrl0IWxi+uxuQ89e85z2IPd4o3dsOG/XkZr6
         YaTT3J7erKNskFDlznqR3ichOQH+ZXSPquN1i+Q9nzzvcgETteaZ9glPD2IyKrAO8aal
         fsVKde6hUPHwdD+OBgDTC8SsfBq7E8kdThBYFNm7FNo08/V6+E7XULr2q7/vbuZTunNL
         UzQg==
X-Forwarded-Encrypted: i=1; AHgh+Rpw5jnwu9jYdcxHfxs8sIvcVoCeC/EBBzKVw3hHUAQWg9mdRJUSM8mrQMTlCIyWsw3v+aaiSCs2H5NC@vger.kernel.org
X-Gm-Message-State: AOJu0YwECdfcObOvkm25ptVQNyNm7KYK3A04s3aVZ6hVpLD1IObwcR1W
	0x2bp/p98h5UzukotunCogGQPo4I6aT2XNa2vF/lUfX0/GVeqRaqZwgk
X-Gm-Gg: AfdE7cnRfo9xoTSIjGuucn3M9kT0RgtCPYpjXVzZBZKKzVHxxC5ccqhB/t0HpJNouS3
	EBxhmIZtGMUxgijC5fvWcWTowsLIkW+tv7uCL9SKCC98aiyJGRu2kADn3qs0qR+nRsLh9NZH5AZ
	O+V4xwGU74sR6Pybo5hsRigXrG0jN/vJRAnfXsClHEdm/NEkT378Cg1DhLtxNk1eYEzWXAO0ENs
	7sSlD6XyQeZh7DJpSJq9PXcKdOzSyheocsrZkc4TtXrL2qv6JHWYKbJzNdQOL8NdqDY7R0HluXb
	CO/nC1zCEAHzeZ0wFC+PlRL+5iJ7A/1MTD+jFDxKzLVE1tRL7gY4sbEwWJYMs5o9A7Fx18Ueu7U
	pcIzG8gDoL1rhv2KWMa+APH5OKvI3RotTT+jz82yR4QMYLTUFVhyZrg7UD7oLiPMzvyx4uk9JsX
	QCCw/qZu4dbI5REjLs
X-Received: by 2002:a05:690c:e1c:b0:80d:f9bb:3d3c with SMTP id 00721157ae682-81eede60cb7mr5927727b3.36.1784236921306;
        Thu, 16 Jul 2026 14:22:01 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81eee7fde39sm5026477b3.36.2026.07.16.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:22:00 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 18:21:40 -0300
Subject: [PATCH 3/4] hwmon: (adt7470) Add thermal cooling device support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-adt7470_thermalzone-v1-3-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
In-Reply-To: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The ADT7470 has four PWM outputs that can be used to control fans.
Register each PWM output as an optional thermal cooling device via
Device Tree so it can be referenced by thermal zones.

When the thermal subsystem sets a cooling state, the driver switches
the corresponding PWM channel to manual mode so that the requested duty
cycle takes effect.

Registration is optional: when the "#cooling-cells" property is absent,
devm_thermal_of_child_cooling_device_register() returns -ENODEV and the
driver silently skips that PWM channel.

The PWM cache is populated with an explicit adt7470_update_sensors()
call before the cooling devices are registered, so that an early
get_cur_state() call from the thermal core does not observe stale
(zeroed) values.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 4ac292cd7f47..b865f4bd50f8 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -22,6 +22,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/util_macros.h>
+#include <linux/thermal.h>
 
 /* Addresses to scan */
 static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
@@ -142,6 +143,13 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
 #define ADT7470_FREQ_MASK	0x70
 #define ADT7470_FREQ_SHIFT	4
 
+struct adt7470_data;
+
+struct adt7470_cooling_device {
+	struct adt7470_data *data;
+	int pwm_index;
+};
+
 struct adt7470_data {
 	struct regmap		*regmap;
 	struct mutex		lock;
@@ -171,6 +179,8 @@ struct adt7470_data {
 
 	struct task_struct	*auto_update;
 	unsigned int		auto_update_interval;
+
+	struct adt7470_cooling_device cooling_devices[ADT7470_PWM_COUNT];
 };
 
 /*
@@ -846,6 +856,107 @@ static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val
 	return err;
 }
 
+static int adt7470_get_max_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	*state = ADT7470_PWM_MAX;
+	return 0;
+}
+
+static int adt7470_get_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct adt7470_cooling_device *cooling = cdev->devdata;
+	struct adt7470_data *data = cooling->data;
+
+	mutex_lock(&data->lock);
+	*state = data->pwm[cooling->pwm_index];
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static int adt7470_set_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long state)
+{
+	struct adt7470_cooling_device *cooling = cdev->devdata;
+	struct adt7470_data *data = cooling->data;
+	unsigned int pwm_auto_reg_mask;
+	int err;
+
+	if (cooling->pwm_index & 1)
+		pwm_auto_reg_mask = ADT7470_PWM2_AUTO_MASK;
+	else
+		pwm_auto_reg_mask = ADT7470_PWM1_AUTO_MASK;
+
+	state = clamp_val(state, 0, ADT7470_PWM_MAX);
+
+	mutex_lock(&data->lock);
+
+	if (data->pwm[cooling->pwm_index] == state &&
+	    data->pwm_automatic[cooling->pwm_index] == 0) {
+		mutex_unlock(&data->lock);
+		return 0;
+	}
+
+	/* Put the PWM channel in manual mode before updating it. */
+	err = regmap_update_bits(data->regmap,
+				 ADT7470_REG_PWM_CFG(cooling->pwm_index),
+				 pwm_auto_reg_mask, 0);
+	if (err < 0)
+		goto out;
+
+	data->pwm_automatic[cooling->pwm_index] = 0;
+
+	err = regmap_write(data->regmap,
+			   ADT7470_REG_PWM(cooling->pwm_index), state);
+
+	if (err < 0)
+		goto out;
+
+	data->pwm[cooling->pwm_index] = state;
+out:
+	mutex_unlock(&data->lock);
+
+	return err;
+}
+
+static const struct thermal_cooling_device_ops adt7470_cooling_ops = {
+	.get_max_state = adt7470_get_max_state,
+	.get_cur_state = adt7470_get_cur_state,
+	.set_cur_state = adt7470_set_cur_state,
+};
+
+static int adt7470_register_cooling_devices(struct device *dev,
+					    struct adt7470_data *data)
+{
+	int i;
+
+	for (i = 0; i < ADT7470_PWM_COUNT; i++) {
+		struct thermal_cooling_device *cdev;
+		char cdev_name[THERMAL_NAME_LENGTH];
+
+		data->cooling_devices[i].data = data;
+		data->cooling_devices[i].pwm_index = i;
+
+		snprintf(cdev_name, sizeof(cdev_name), "adt7470-pwm%d", i);
+		cdev = devm_thermal_of_child_cooling_device_register(dev,
+								     dev->of_node, cdev_name,
+								     &data->cooling_devices[i],
+								     &adt7470_cooling_ops);
+
+		if (IS_ERR(cdev)) {
+			if (PTR_ERR(cdev) == -ENODEV)
+				continue;
+			return dev_warn_probe(dev, PTR_ERR(cdev),
+					      "failed to register cooling device %s\n",
+					      cdev_name);
+		}
+	}
+
+	return 0;
+}
+
 static ssize_t pwm_max_show(struct device *dev,
 			    struct device_attribute *devattr, char *buf)
 {
@@ -1281,6 +1392,17 @@ static int adt7470_probe(struct i2c_client *client)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
+	if (IS_ENABLED(CONFIG_THERMAL)) {
+		/* fill the cache before registering the cooling devices */
+		err = adt7470_update_sensors(data);
+		if (err)
+			return err;
+
+		err = adt7470_register_cooling_devices(dev, data);
+		if (err)
+			return err;
+	}
+
 	data->auto_update = kthread_run(adt7470_update_thread, client, "%s",
 					dev_name(hwmon_dev));
 	if (IS_ERR(data->auto_update))

-- 
2.55.0

