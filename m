Received: from mail-pz2-f32.google.com (mail-pz2-f32.google.com [74.125.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1E52ED3C
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690836; cv=none; b=suD0kUddPwNdA7jzKci4zno42pAvT85FkaI/z544HCGtUYAU1ywnwCFfsEFLwpHQfGOmXgfQos3hBSYAga/vnXbpEGtrBkf0znm08kF6S0MebHnfB+VO04z8O2dQx3LYZ3DWcbuSbeb6gknTp1i0+g0vZe0+9x12r6erKBB+l30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690836; c=relaxed/simple;
	bh=YqeX3w8j6QjlLlWOTZzMe/EIOARDjD5UD97FvMnYXkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIxknmqZjqjz1lQCUfNsFNmKL/ZXYspHitzqS4A6k3LBZbAIE5R9IK9q1z/q43I/Nnj4Tqb/zq/Od2WLtjCeKExTdYK6xndMmhIuAgSPFw+gpE8XKFbCToaWkhg2OcQFnZn+M0/M2lIkNoiyzRqBi5OyEbwnWxOz9cL24t93JDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejXIpr0x; arc=none smtp.client-ip=74.125.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejXIpr0x"
Received: by mail-pz2-f32.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1621877a12.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690834; x=1791295634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=ejXIpr0xcK3UZxfRrNjtSQ5Hx7zS6L/puppmvgPMFwAzVREtIH4ETv642ECwpcG4ZA
         DfsbFcJazKyw/SQ/E3Mwm4woer4w1sDebe8YyaB9MPOiKDdwU4Vj8IXQFxdI5ok0Jkl+
         LPYPtzWSCn/xQP8rqry8TfTFb5DNy6onmwvZoACKhRWR5ZmyeEwnNletrb0SlFSunSe+
         6fPOEAASNP/2CbAz0ghW4YGeygyAQK8cokBNKRkGAaSFLbNFqHuRU46MnhODvitliO+v
         Xta3OhFnLWQjuUP4uwcMedG9/s53cAaI+gfSHG5kiKrQJH3pBtlxB8QLpJj6kDcJ8kDu
         jiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690834; x=1791295634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=0Czmgax83s2bGD5M1RZHvVkXkVy/8XPhokkH5gJbmjjcKwr4XI+NNFacjVxu4MA15Z
         Ii9Pgm+lboZaydms6xRooeSn1EXpqgBAVjsXFvBGIAut524x1mY37sAxVEfsd9/UqinC
         TxteRuaSUcR/9Q+V0jM/C2VRi7KxYcAWEvubPLY+s+sO1u4L0nBWn8JRt/QXxD8OF1dD
         wTVFjo8WADfaODZ3a86WxHLhbyYv7OxcxCSeSOlGgMZpPDBI2sMfiKUMNd4gG/gDJx2H
         nIuu2RP7hwOqdpKGyaWV5J2wip6UG+AZfN1W9Xys2pRR+zcM7qWb81RWYJqRCRlcj32+
         /pTQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/i1SQVSgO7XPiHH5gJrVouyQPBIb67vddRKbd3nHMj4i3yjzsgkPhS551JM6TNLKAlKg6ifyqVUBI@vger.kernel.org
X-Gm-Message-State: AFq9FYJZKIMW7SClk+5wltamV8gzDux1i5fOBckyV5qdCdd90jPW7K4V
	BkIvAIeJBXwfK4oAXUi1d2GNjqA4Jboo2qPHxMhjO1snXVXOPtHQMli9
X-Gm-Gg: AYBFou0A28FiG2FER0lzD9yV5YAWW1PuwsD/6uPcXT/oIP5PdllbLXBGSgoIjhSHwUT
	RZjrrg/POwEJ0p89jwafgpZH9K3p3Y8K/2mos/4rA0n3wVaNJJGI5fQh0Z7D2jbBjJD0KCC2DcB
	Q+eRK6vOyIhNc8fBRmfohcQE+YLJ5+WebJXVJG8FBeCTeq6pTLs/UUiUhNMdllh9UboGnaMQkzf
	6HXNaSTkcFXvPAjENyhOu76dWg+BcmcxQjKGFALwNVd5cxYirRbtd2vAYaXmVfqNwiirRQSdZun
	qBoououOezrSVMe1LH5nfk4bs+wbJhMPBBZ+0Zhq6nff93bVmInl+hvMf9VuYO2KaScpO3uvBuR
	ln+Pi3rXqnhFydB/rbkQEVx5JNiBnkDKrGONdOlByRAMTzQ6yCyANsCGyZPpx879bVOtCqgODeM
	1Q7lkz5IZmMJuX95Y1tkWImtWEKVuokd9jQzvs7f0E8U2Iaco4eFWBn6ZRN7geYmTpCQkIOS25a
	+eNM0VcU6I=
X-Received: by 2002:a17:90b:1a84:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-3a098e8814emr14918272a91.55.1790690833528;
        Tue, 29 Sep 2026 07:07:13 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:12 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Tue, 29 Sep 2026 22:06:47 +0800
Message-ID: <20260929140649.55-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

