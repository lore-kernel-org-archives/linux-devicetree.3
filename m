Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35BA3EBF3B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946100; cv=none; b=mh0A1hGIXtWMWufSD0tY5eBDa+gF9bGefW27gTDOrtfnsGdxTmF7M5gQBuyN9FmxxCwqHmRC6Wbe4UHjYlXK3tKZQN1n/TEXWaOTLw4e950M0Lzo5On4vxY0gYDXKbyLYUql36QKLx5vUycfJAr1cJpEGD8n0HTY+rToO1t63qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946100; c=relaxed/simple;
	bh=UUhxKqZWnSTmT/Un2Yj1DpmBpGKjhHwwgtjv+edXRAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbdfwLXkaSKlKh6yhraQdV7KZeFk4uYL1YaKr0TM2+1rLAwxqH7M2D+GdocYah8VxtNqUbHwFMQpZW9UZbVtua9X8IrYrKaZOjhvduMuDHd2Bxa09UUT5ZphVC1f7eFDw+8yCyOUm7LwfQchQG+0uYsfgXz+br0zrhImNuaqY+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGkavwCf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGkavwCf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-85590c5aeabso3945508b3a.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946086; x=1789550886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=lGkavwCfIDU3Gs7voSpZVCEsX7oPWp8dFUjnAbeHekeC23tK8lJhxq7RkhgPXhk4Dw
         QmdUz94JPu+NPyg4lVGEWVCaYp52jkxDSw239IG8Qu1mhDSKaSHLLgP1cwkiZ4ulZuMs
         /pYpVx6PHmdZsqYEYwIfcvSLjs4Cgagx5NwUfQrIMOMhob/YPhAed76hLj+RHMeXOmuR
         GXTRaaMuCl5A8zLOGa9OGjIGO4PCZRG3za5oEBMuPceDU4ZX5U6k/uSccvc4jInpelA7
         Cl7UhTIvLcidiamfi46N2n0zWeqXcyqEyb3OTtHBKbmxE+1GYidkBEA/8C0WoBl90HXt
         kExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946086; x=1789550886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=YGkFIyVLhHQhAZYdmBhDtNS0k6JbjWJCatkAL/N/BS9aTW0o476a4E7ey6vgg5zkGp
         eOl+0ayW27EHatFG6vXerhpHBwj0ifU6m5h1yJ4ZVxJO9Md2jAyr2G8hIcWNwJa8srsw
         N/NhQsGawxVEnb9bRberzYsIiGZk1WAJzXhMHV3Rb0ZRSKsIOEIqKBgqnfC/f680iKc9
         oAEG2E8umJflA7jEizDhfERqhDSCwxGKY2Dw4wv5Y/pkzPf3P8rweo6D+m+VmAdyCQSq
         UcO1i7dXG2Oh3sl6/ND/yF8JjlG1V/yUBoqSpaKaYIV2QLL1TuXYNmgFTAL1pGAk06FS
         43jA==
X-Forwarded-Encrypted: i=1; AKwUvBy5BVAkc4g3lwkteN6UtDRjZgGeb5mYAqCy225M2ZgUUCr876yRWyoZpHQq9kAdhK+DIEkAodioSyUF@vger.kernel.org
X-Gm-Message-State: AFuF++lckP5I5ULIcfO9s5lfK4lAS33yWeWo85Ft/DfsL4Ws26wj9Y49
	yz+u1Tw42awDMsT7DNYsxUC7XNpdhMz3jwnB27JZ9v6pTIo0INe0sEAR
X-Gm-Gg: AYBFou11vuiQkOolVa6BmC5ydLa+d7J7MdSn1lkPuFCqbkowElYTDr0iN4HW7zgUGCn
	Nv7sKxiujYfXcPPYYC2KtevjccrDhS5CRstimvVRmS/oMk0la50SKTcX4q/S3ukif1E1u59xJp5
	bqZfJ62Hgjd6VPevNi7UNsUMqqgT9EjQ02xO88ROAKYWuIO3rKTFQfOMIyGtP+ZDCPPlCdzJ2Hu
	dyDcfGuThsdwDtakQxamLy3q0tu3qBvKu4TjeKA/sm74WYPWNmVxDCVnyBEW+YL9oQF0aI03Bz0
	+PiV1SYxRTMrksgalt/rVvU6dWrr/Tx2nGc8v0YkxFerQPRUglOXHZv04N5JNDhydjovYDHpGCp
	px5geD4q77u2jtdautrvrtZhFGBPVOfchIFUoVP9NNUpozdr+8upVp3DgErGtVeOEHE2bNY6TXi
	x2XKghTFmBfh9aXOArVkgCb2cEucCKj2SgJK0WkxPi0cXh4+x7Az2kcWtZH0Y5tjxJ1Ln0SAsiQ
	h4j9WLzNSvL
X-Received: by 2002:a05:6a00:4388:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-8616a266f1bmr50402873b3a.19.1788946086204;
        Wed, 09 Sep 2026 02:28:06 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:05 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH 2/3] mfd: rk8xx: release the power hold GPIOs before powering off
Date: Wed,  9 Sep 2026 17:27:27 +0800
Message-ID: <20260909092728.1859-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rk808_power_off() writes the PMIC's shutdown bit directly. On boards with
"power hold" lines driven by the SoC, a shutdown performed this way does
not stick: the rails drop and immediately come back up, so the board
restarts instead of staying off. U-Boot reports the result as a power-on
reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

Releasing every described line matters: on a Firefly-RK3399 the board
stays off when both lines described for it are released, whereas releasing
GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 29 +++++++++++++++++++++++++++++
 include/linux/mfd/rk808.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..fd1efbb 100644
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
@@ -703,6 +705,24 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written:
+	 * with any of them left asserted, the rails drop and then come back
+	 * up. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		unsigned int i;
+
+		for (i = 0; i < rk808->power_hold_gpios->ndescs; i++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[i], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -874,6 +894,15 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 
 	if (device_property_read_bool(dev, "system-power-controller") ||
 	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev,
+							"power-hold", GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "failed to get power hold GPIOs\n");
+
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..eda111e 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1459,6 +1459,8 @@ enum {
 	RK818_ID = 0x8180,
 };
 
+struct gpio_descs;
+
 struct rk808 {
 	struct device			*dev;
 	struct regmap_irq_chip_data	*irq_data;
@@ -1466,6 +1468,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3

