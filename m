Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547680;
	b=4SYRZdxbBTo6A5WKl4i4w6Mk4aEoW33XfdTisoISfyJwRQqRPyP6yOjiWoKk0ESMEju7
	 TOQ95p87Xcb/2IGk7N8LN5ZwCNxL1Nubsd14BDdGLEaHSQvj0K05uGqaggCFo9TP6MomC
	 hDj/j18OmpJjozqvNdiHoNfENV85CgDeufK3bs6OOJjnC7/56MqShHKaG5f73fAQVROeK
	 lAxBf710w27oswb0lQPq61IDwUG8ygWOFnMjhH+kNsYQ9JV1FavvinnJmH78wmV2uzabA
	 G4FuPctrM97oVuJMsB9YUpIOicvyzgZ5IYEH3MXyM2gL/wPgxRJnYnTdTWelw1adHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
	b=eZpMZlIp02JJGsKr4h2BVuBKoC9adLgl18lZgtu4Wrt/y+RK/Emk9NcHtYxpOURRtn3l
	 I62cgATM2tN6n0I3JzsaYEo7JyrcG1RZeOtjwdOnm/DH/uQrIDTtg8kYuxpMVyJUx+5BV
	 +QdvjmM1e6ll98fKJTJe0gji7ziRxVqBKvzwVkTU9STHNg/K7W5lipbSJS2R2MX6h8PpN
	 62wd9SQYmOFTi2tpkpodZHHdXH3/1NKwjFSRVpa1QEka0A0wyewo1ATVqzuE4eJOsiuh8
	 YYd0ifXiUTPBUmMlqv4htWu1lb4gAknbkXzWHa5tfT2BKQGh6IgnAGL5stR9uN6MdIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/jLoln6";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCE606A329
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 15:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CCE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/jLoln6
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so1056697a91.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547679; x=1794152479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=S/jLoln6RvWYTGIy1ApMtaHHXf0oJ9gLsgCzpLH7KldVOxjmoVxKbkB4GOiZtFhxqu
         jC9WNRz1ybmL6ddn5CyvCJ/vKVhXDCcdCWh1vRkBCVEpcGphA0hCmkuklnj8XKsPQcv9
         SJvHJzPNm7Hwmw8cPAM/htB53jLc+LgoNiGinxAe+BdIPHwux5Fs3RkAt3jPk924Ws8j
         FplY8l5r7o70mCVs49MfK3igC72hcwZa/KSpwVXSxsJ5jJXkETDP7WyKPhraQ2cASydG
         wOy7zNOoIFP7s+lC3B8chkFS9iNc6po6dhptrvt/W0dRk5NbteaO/iBpm4agT0FKm5ji
         V4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547679; x=1794152479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=PYKvcgQpipP4/+bD4/iid/FsBGdeXGQagTYqLnnIOucK4+KIkHDE3rYAOSXRuiSGgJ
         40kPZJCo1d4gMKXDeYVjyMdtAe8+0YDSi5/kZz2AWl/RM/GmI/isAEHZDQtIpPuHm9/9
         J3Jhx96JbQy5DcdmTAVxufqmEi5jmhKcaE8mfOJeiqf+DOn1ZqzVq0XtMSnXhNcuvOv4
         MPOTxfhIVus6p/9+wG2hDycU02KfCxt6i/KgZOaoWWNoLGlZvnEKmAOTENhVfVltWrqT
         H9CgB0AWFiB0Y1fSHoMB9SwqcIyrbH/q9wWQfUKxz17rLnvQSsR8zQR+YbERUopZw1PC
         nykw==
X-Forwarded-Encrypted: i=1; AKwUvBzP0y7IlVpNfOPCYSLzcgneDVkbsDjtmdeASVjx7WJYMgQNqgr1GTONRgUb4ALASzJttjhVAMcm9QzI@vger.kernel.org
X-Gm-Message-State: APuU4Z9jOWCcs4fSLeOARfh1hC1lhM3N5FNoKdT8+3eVtlVBlZivTpzq
	rN9vK1RaXf8F4xPulKwXC32nSFjDAnhbAu7FY4/DldRpGXKuL5xiErPzhKKuBHx2v+8RmA==
X-Gm-Gg: AYBFou2bd3kOvmZOiR9yDpUiuaZNPCyh58Mj9ndLs6QfpM5Uvh3gv3UDm4j7xTLhsDm
	ogHQI82VIlcsY+AU9yyYOO+pKeJ48AIt760IAv3JKwYI4vCJ6ueVaojSBW1TA/xjASRFamGTOU9
	OoNokeCum+2aa+9hxVtizsvK4yn1XS0eWlz0i66dW4z3ZB+tpNLkebBxuCuJahBopUPJn2vusbh
	QcUkJrIkr3XpvefFshx191Q1IXNQ7qtNBoUMn8ewGlFPvei8LMPrrHMYW29XfMy3LXLuCipgcFo
	M1Md5MBjBUX24wNPuftP4X0Zpl3AspQWz0HbLF3o8ZURsk+K6tPhs6fxJdA/NHbKvA45LD2tCG2
	hd86rtR1L3CyEz5/oLa7cknxmeE9bPWhI9xBXnRFdhl/Tp8ITpwcaR2Qu0VVC9NoV1aqxwbjOTI
	L9L2eVvf0IBPDHdD4QARpnoNOGd3Ms1pQyNFDTIqNv5PTqbfEieS8iMy1QsuJzWz2a1rxG8QZQu
	Cdq8BE10609Bt6jz2ats4qJVgA195BBo5yZjpLKUE7CC+vY7O8z4FJzOK7dQXGsn7ZmQvRusUmV
	ZqEFD59aBAZL4pxFwc2DD33u7q+IpyMVr+v9yk2zQQ==
X-Received: by 2002:a17:90b:4c08:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3ae8957d253mr6930512a91.5.1793547679213;
        Sun, 01 Nov 2026 07:41:19 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:18 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Sun,  1 Nov 2026 23:40:51 +0800
Message-ID: <20261101154053.3874-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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

rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
lines driven by the SoC gate the PMIC's power-off path, a shutdown
performed this way does not stick: the rails drop and immediately come
back up, so the board restarts instead of staying off. U-Boot reports the
result as a power-on reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

The array is claimed before any child device is registered, so that a
-EPROBE_DEFER from the GPIO provider does not tear down the regulators,
RTC and clocks that devm_mfd_add_devices() has already registered.

On a Firefly-RK3399 the shutdown stuck when such a line went from high to
low before the shutdown bit was written, and did not when the line was
never driven.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 49 +++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/rk808.h |  3 +++
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..137ab20 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -11,6 +11,8 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/rk808.h>
 #include <linux/mfd/core.h>
@@ -703,6 +705,22 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written,
+	 * otherwise the rails can drop and come back up instead of staying
+	 * off. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		for (unsigned int line = 0; line < rk808->power_hold_gpios->ndescs; line++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[line], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -766,6 +784,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	struct rk808 *rk808;
 	const struct rk808_reg_data *pre_init_reg;
 	const struct mfd_cell *cells;
+	bool system_power_controller;
 	int dual_support = 0;
 	int nr_pre_init_regs;
 	u32 rst_fun = 0;
@@ -851,6 +870,33 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	system_power_controller =
+		device_property_read_bool(dev, "system-power-controller") ||
+		device_property_read_bool(dev, "rockchip,system-power-controller");
+
+	/*
+	 * Claim the optional power hold GPIOs before any child device is
+	 * registered. A -EPROBE_DEFER from the GPIO provider at this point
+	 * costs nothing, whereas deferring after devm_mfd_add_devices()
+	 * would tear the freshly registered children down again on every
+	 * retry.
+	 */
+	if (system_power_controller) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev, "power-hold",
+									GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "Failed to get power hold GPIOs\n");
+
+		/*
+		 * The settle time is optional. rk808 is zero initialised and
+		 * the binding documents 0 as the default, so an absent property
+		 * means the shutdown request follows the release with no wait.
+		 */
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+	}
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -872,8 +918,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
 
-	if (device_property_read_bool(dev, "system-power-controller") ||
-	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+	if (system_power_controller) {
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..e56d595 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -15,6 +15,7 @@
 #ifndef __LINUX_REGULATOR_RK808_H
 #define __LINUX_REGULATOR_RK808_H
 
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
 
@@ -1466,6 +1467,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3

