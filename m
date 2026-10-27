Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090751;
	b=XesfZxppbJdr456PYTtChtHNVzpGOk6qgjiqMYviTDa2IlWdJlukRDLWKKmBYVHtrfFe
	 HK9oxpq9BaYNwlAi6pUn+oHKamvegXT2K0iKeVGclG8MZE2fgj8Il/K+0TqHg6fRFJgaM
	 mx3kcGYMMwD5cfcXvIfD3tge9K6fhWOy3r1jCGuMQsPofcASYPMCa4vl3DfogfQvrgE4m
	 MaiTYRSLOeZk931OQohyWroSbxJhEHxTQxMfXIHkaKedjycd/k00Ac0kxhOr9dX5H+10w
	 YSVFSf9lF2/dA1nd5U0fIYRHYS+cQbJBk2Wz74LSh1VdVUdn0ink3zoB/hNKN/HG5tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
	b=R0u7Cg8ndc1qJxtoHKTZq1YdAYthdalSk6ueconqRsV4IrgQ6V4wvLrtouQkEnAFnSJm
	 XWQtuTpTtBxl2ehGQTUSTx/ht/Q1zQ9tjNScSxrKc/FhcwyuI8/Xm8WvJpasLdxiu2zMK
	 5p8wkczJED4ykpELSizJsWcUZNBpjqzsEK9U4fH7ePtIWYmgPzZyHtJ/viL0A3YhqSGCu
	 byOx80E6zNx3AWplQT7bkvdIdcKAPrU7s1CnpwKB89RuktCb9AXfGTuL3ktLT6jPtISYB
	 7jzC4GVJk5CeTOjo+srg/DeVl2NkKozY+aYPd2Rij+7mqUX3x50yBx3Fc/ILdRBsQbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XvfKCyZK;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23770606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23770606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XvfKCyZK
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1899453b3a.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090750; x=1793695550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=XvfKCyZKpjWg2HC5OOLO79kNYkA52szq7rFYWAT6nZOX45p/UJb2QdpxgASdqfa6nz
         rDYRbrioZQ36LIy2lLL3XAdHPkP/zfjk09NDPTsNQFMTmZjx6p1rNS8Sosy6Orl5RRp8
         sjcKlaagbPkfPGdk6OlJIbBZcajsDk1ovoGYNsRP1R+Z9sOQr0YSYYWZBENRGTSv7EUV
         1aGhmQKZDzsclqClRMQboHpo1ThDS8bCJhmxBr/Z7CBXu4CxyAQwcjhiIxd1pFFTt9/A
         Ks0kqFo1aSK/XZ4AhyEJpODF6kNOkv3+8A9Q0fHs/3SCpbGoW55PbR1wcoPqcD/RoliZ
         9KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090750; x=1793695550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=AyOmhgXUJNxdRVNzNbNQ9aRGC0gwWN3K9G8D05gtLPdC7wPafLUBWIzdjF5xksYRzi
         mgZ2mQQOrRKwGn1fSM/mld2ALZKi9Llj+2kZ4Kk73vugSJJQScx1CW3caP1rKTYiQijt
         ztUAAoqgmYc096x4zv0IAoLJurE6y7D5CDrLUb6jWppXSV2RJNMky4FutBCpcte+mIlS
         qiO9G4TxIfyAt+xIq7aEajfp7yYhgbTmPug3SqV6ygQatssjOKgewTXDCrUqjbElb5xh
         scp8tpzkWT6c0/Mf+AXF7oO42tAhthqvRSWFd33x5p1Is+goh5EH7Y6jTo1vK4wcCvBk
         3GGg==
X-Forwarded-Encrypted: i=1; AKwUvByn+e6cwlcD+k3Kpk3kZfMJAOa7qe7fDKhJlWIVTBYS0+y3uIk3MnTLiojyHIgdsdYup7lF6FzhPcqg@vger.kernel.org
X-Gm-Message-State: AFq9FYL9/fKBrzLeLxg0d13rKi4IUKW0t/yKcwT6MfwIKTVRbikYe9C/
	34rjPSSdT4FhJ9TE5ITmu7fZYF1IEFpq2Uo5aGNnrTELsVr/kzoP5HlK
X-Gm-Gg: AYBFou2PXw9KFdUjyOb2Xx71Oo0DZ1vy2U1svcjMki9V5gdmhPhvlbs6OOSC3kxOhbB
	UxVQ3iYZMb8u3cc2AqeFG9HlPeiBo7WW3UbLO2bXwPxev5uXkQ8S53xJUXRxn4Hx0uwN8iI3Xnk
	9nqGDnl2QfhaFpxfhDkQBNUIVutlK73CowYt9uWFjSPnHCEqO0W9r9s57t6hWi9L4IM7xs2REY2
	zxa7WkMcb/l3jLgzoMsIVDFWoKW9XhRJAc9voX8BB7oyNQI8X/DRRtIZVk+uqmOCVpjcldlynoE
	R8wdht5Mp/yL2NRwintDbXIlcA4p2vtWa1g0VLJFwmiFqD3X3OX/66QAPW9GiPYdzrcD3WSy4o8
	GuojJQYMOszBgLtySIH70CemODSi7DKeaEbSUmPWlWEA9/+8PGISk5DLr5CuttClVLYKZMZVzSP
	9E7BzC175TO/F4ZaCxveO+ql+5rmMBOxgw5wwBXl9avA10gwaKF5MDwykrz0UIWQ1pW0ZHCVZ+Q
	anA4dqS65EnGHMGmuZHCiLt8DRsu2JaPl8PXElT+8i9ZdfSGoIZNOJ9C7Ir0VCFF2Xs
X-Received: by 2002:a05:6a20:ef03:b0:3e2:11bc:6abe with SMTP id adf61e73a8af0-3e7bfa20295mr5839714637.32.1793090750034;
        Tue, 27 Oct 2026 01:45:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:49 -0700 (PDT)
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
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v5 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Tue, 27 Oct 2026 16:45:08 +0800
Message-ID: <20261027084511.1992-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
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

