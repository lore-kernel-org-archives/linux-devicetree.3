Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC03B637E
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150190; cv=none; b=pLKB/dIV3fGw2f+sPik2mMk87po/DvAKWFfYN+1Vn8+Y2cdGMgfxoNL2zjPghVkGUFSzaoVIyWJO6LtJRk2LHgCnluZd0eTJiuL5wy6YXp6unknMwn0JgNmt8QqWWVLFdIbncJrUD7isvXiP4Fs3NX9sSLkPWz7OEdKSpRtWH+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150190; c=relaxed/simple;
	bh=w42E8yRlHnWeu7ro0at0/MRIspBbIAy7hA6c0HUdS9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqXuVI5UAgzVocAvlalzOaaD634E5epVD3L4LRT/KYDDzd4RYL48+AM+9rlKgDj/+rxEhNZwDVsuHHHdYFSh26t978gSXglo0HpzssAAl0eHkI4QWaAmn6xLW5d2fdVsHIGhM3m5byM1hvvtyeVxle8upe046CNkMAtw+IXftn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pEsWLjT8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pEsWLjT8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fd4531020so651900f8f.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150187; x=1787754987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FIMnROWV+G1zY9jLXOD7iVEP6KynbF8HZH9OOdDgTI=;
        b=pEsWLjT8iJQvPUWgXe6rclRo4fje2MGjBVIw8Cns5kSy+a8jIHjcRi8aL7xzewp95s
         lmJvENv+/T1qrQJWZjBbqwSgrZPGUd4HqB1OsTPMuFs7/WUQ3UaQWlvSu/Qpk/ZdOYyP
         3Ug0PMqI+/oU+UW3vteugSiemsOQigLZzOwhE7VQqAqTpv/9Jm5m8S8iQkT6xcXRukbf
         CDKqYKlkfDkOR/3edBwqB/lOA00LGaIAVcGbym/xYbgswzq8N7RINhwRlNcxpCSEnhJb
         uyfhgNOEqiqv6SEOaIZdv8VOAYzkrA85fQN84p0fyVlOS46rpl2ypncuJ2YzAk9BsmMh
         iNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150187; x=1787754987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FIMnROWV+G1zY9jLXOD7iVEP6KynbF8HZH9OOdDgTI=;
        b=qNtws9uGasLM4oPqiWRjTrOqImNw9cimWS4bgR86OTVwMJH+Fl6dixsiEc76wQThSR
         dAJvTqEjOKeTrl8DjiEyUbJq24DdZAqKTd6Lz1hBMpY2b4bbyWFAg1yey9Udp1fkPVSY
         qefJOVyDYvzTe5x7qzYB4uscj5CatWwLMe81VsYY5IqiGOv+FAB9qOujyxqTGO9tRTeb
         TEpJvHohbK+CD38xwIvf0UnL8UfncSoPjDa2A+YiXkInBWorsNSf4M8X0B8Lkd8TE0vA
         bTEANDVCtvlWmROPTdknm2cCwqDEaf5TCDaF27Hv5kOnHowAYyU0yof9YmaMUSZUsb/u
         HTEw==
X-Forwarded-Encrypted: i=1; AHgh+RrcQoPd14i3HEQo8lpEYIBdIJ2Pm8yd4J+WG8pXrDgbwy9kv7aBZlUyRDM33ksCyD5K6/cR4vrUR6Vl@vger.kernel.org
X-Gm-Message-State: AOJu0YxzKc6suSxvKM6Z8wgBrh6nCbvasGcjOQRofC8V5QrDAVVPmU/3
	cq6c0MzEPD3vG6k838MQvht0w1StWRafY4wo2cPkxPWkiJh4RLS2al0kLtWXqdLFqEk=
X-Gm-Gg: AR+sD136qsR/p86kLV/lVC3Bu7TyXKdmDAXRYaPtgzAZUSlNWuavrM3Dqy8IhvSoahk
	FnuGOCxHkOo1Q/iehVaiX8OYYgdzs3Hd+p2WU43mXZY7A4dvEJLiUuezEn/fst7IoBZgxmn8/mJ
	nYQ6mZpNyMw0MsxyLV0icGImEqNyk5c+QjjDJe5oirTc/rfCpIpI3TSaF0eqOFRyRF9nX5ROJXJ
	K7GtfBIk7QJLmXOm7pOWRJKfRSj4cezLgW3VVDlAtdpQqBx7q1hfLj47OvwuiGOYX6bOXGRGX+W
	sdm009bgbaXcNEQsCrHBJoyN70MyUFeqW0hLXGk8aMxhvS2Dk8VjZ8RBq+c/m2U+wKYQw0Yh2BN
	Dbd5KCFKxhu2A9PkTWK8fA8oW2sRflnI9/OwaLOdGXut2KjzHyqClWqSwl1VV5N09uuczHGG/su
	b5tXoGi+kbK9lQujkpTZNYUP6+UBuUaEPOjwEj77hHM8n7UO2XALsnNCwhX6ggOCtgN6ZanbSuU
	qVBPYmwu3cteHRDaMAr5KeLN28Ok19KN0hjCosSEfpe1Lhotw==
X-Received: by 2002:a05:600c:1d1a:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-499aa1dde53mr93007425e9.10.1787150186951;
        Wed, 19 Aug 2026 07:36:26 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:26 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 1/5] pinctrl: renesas: rzg2l: Generalize the power source code
Date: Wed, 19 Aug 2026 17:35:49 +0300
Message-ID: <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The current functions used to get/set the pin power source check the
OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
code to be extended for other power source functionalities (e.g. I3C on
RZ/G3S), generalize the functions used to get/set the pin power source.

For this, introduce the struct rzg2l_register_masks data structure whose
purpose is to store SoC specific register bit masks. The members of this
structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
corresponding to a SoC specific power source capability.

The conversion between HW specific power source values and SW specific
power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
rzg2l_ps_to_pwr_reg_val().

Finally, to keep the code generic, the register update in
rzg2l_set_power_source() was changed to a read-modify-write approach to
cover all cases.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- in function rzg2l_ps_to_pwr_reg_val() return power source register
  value or negative error; due to this, in rzg2l_set_power_source()
  dropped the val local variable and use ret instead; due to this,
  to be able to use ret on register setup, moved the rzg2l_ps_to_pwr_reg_val()
  call after rzg2l_caps_to_pwr_reg()
- dropped the tags

- collected tags

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 174 +++++++++++++++---------
 1 file changed, 109 insertions(+), 65 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index be52d47d77ae..72e0783d5845 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -186,6 +186,7 @@
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
+#define PVDD_MASK		0x3
 
 #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
 #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
@@ -268,6 +269,23 @@ struct rzg2l_register_offsets {
 	u16 other_poc;
 };
 
+/**
+ * struct rzg2l_register_masks - Masks for different RZ/G2L pinctrl functionalities
+ * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
+ * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
+ * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
+ */
+struct rzg2l_register_masks {
+	union {
+		/* RZ/G3L masks */
+		struct {
+			u8 other_poc_pvdd1833_oth_awo_poc;
+			u8 other_poc_pvdd1833_oth_iso_poc;
+			u8 other_poc_wdtovf_n_poc;
+		};
+	};
+};
+
 /**
  * enum rzg2l_iolh_index - starting indices in IOLH specific arrays
  * @RZG2L_IOLH_IDX_1V8: starting index for 1V8 power source
@@ -288,6 +306,8 @@ enum rzg2l_iolh_index {
 /**
  * struct rzg2l_hwcfg - hardware configuration data structure
  * @regs: hardware specific register offsets
+ * @masks: hardware specific masks for various functionalities available in
+ * the registers described by regs
  * @iolh_groupa_ua: IOLH group A uA specific values
  * @iolh_groupb_ua: IOLH group B uA specific values
  * @iolh_groupc_ua: IOLH group C uA specific values
@@ -301,6 +321,7 @@ enum rzg2l_iolh_index {
  */
 struct rzg2l_hwcfg {
 	const struct rzg2l_register_offsets regs;
+	const struct rzg2l_register_masks masks;
 	u16 iolh_groupa_ua[RZG2L_IOLH_IDX_MAX];
 	u16 iolh_groupb_ua[RZG2L_IOLH_IDX_MAX];
 	u16 iolh_groupc_ua[RZG2L_IOLH_IDX_MAX];
@@ -1047,27 +1068,70 @@ static void rzg2l_rmw_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
 }
 
 static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
-				 u32 caps, u8 *mask)
+				 const struct rzg2l_register_masks *masks,
+				 u32 caps, u16 *offset, u8 *mask)
 {
-	if (caps & PIN_CFG_IO_VMC_SD0)
-		return SD_CH(regs->sd_ch, 0);
-	if (caps & PIN_CFG_IO_VMC_SD1)
-		return SD_CH(regs->sd_ch, 1);
-	if (caps & PIN_CFG_IO_VMC_ETH0)
-		return ETH_POC(regs->eth_poc, 0);
-	if (caps & PIN_CFG_IO_VMC_ETH1)
-		return ETH_POC(regs->eth_poc, 1);
-	if (caps & PIN_CFG_IO_VMC_QSPI)
-		return QSPI;
+	*mask = PVDD_MASK;
+
+	if (caps & PIN_CFG_IO_VMC_SD0) {
+		*offset = SD_CH(regs->sd_ch, 0);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_SD1) {
+		*offset = SD_CH(regs->sd_ch, 1);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_ETH0) {
+		*offset = ETH_POC(regs->eth_poc, 0);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_ETH1) {
+		*offset = ETH_POC(regs->eth_poc, 1);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_QSPI) {
+		*offset = regs->qspi;
+		return 0;
+	}
 	if (caps & PIN_CFG_OTHER_POC_MASK) {
+		*offset = regs->other_poc;
 		if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
-			*mask = BIT(0);
+			*mask = masks->other_poc_pvdd1833_oth_awo_poc;
 		else if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
-			*mask = BIT(1);
+			*mask = masks->other_poc_pvdd1833_oth_iso_poc;
 		else
-			*mask = BIT(2);
+			*mask = masks->other_poc_wdtovf_n_poc;
+		return 0;
+	}
 
-		return OTHER_POC;
+	return -EINVAL;
+}
+
+static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
+{
+	switch (val) {
+	case PVDD_1800:
+		return 1800;
+	case PVDD_2500:
+		return 2500;
+	case PVDD_3300:
+		return 3300;
+	}
+
+	return -EINVAL;
+}
+
+static int rzg2l_ps_to_pwr_reg_val(u32 ps, u32 caps)
+{
+	switch (ps) {
+	case 1800:
+		return PVDD_1800;
+	case 2500:
+		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
+			return -EINVAL;
+		return PVDD_2500;
+	case 3300:
+		return PVDD_3300;
 	}
 
 	return -EINVAL;
@@ -1077,76 +1141,51 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
-	u8 val, mask;
-	int pwr_reg;
+	const struct rzg2l_register_masks *masks = &hwcfg->masks;
+	u8 mask, val;
+	u16 offset;
+	int ret;
 
 	if (caps & PIN_CFG_SOFT_PS)
 		return pctrl->settings[pin].power_source;
 
-	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
-	if (pwr_reg < 0)
-		return pwr_reg;
+	ret = rzg2l_caps_to_pwr_reg(regs, masks, caps, &offset, &mask);
+	if (ret)
+		return ret;
 
-	val = readb(pctrl->base + pwr_reg);
-	if (pwr_reg == OTHER_POC)
-		val = field_get(mask, val);
+	val = readb(pctrl->base + offset);
 
-	switch (val) {
-	case PVDD_1800:
-		return 1800;
-	case PVDD_2500:
-		return 2500;
-	case PVDD_3300:
-		return 3300;
-	default:
-		/* Should not happen. */
-		return -EINVAL;
-	}
+	return rzg2l_pwr_reg_val_to_ps(field_get(mask, val), caps);
 }
 
 static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps, u32 ps)
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
-	u8 poc_val, val, mask;
-	int pwr_reg;
+	const struct rzg2l_register_masks *masks = &hwcfg->masks;
+	u16 offset;
+	u8 mask;
+	int ret;
 
 	if (caps & PIN_CFG_SOFT_PS) {
 		pctrl->settings[pin].power_source = ps;
 		return 0;
 	}
 
-	switch (ps) {
-	case 1800:
-		poc_val = PVDD_1800;
-		break;
-	case 2500:
-		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
-			return -EINVAL;
-		poc_val = PVDD_2500;
-		break;
-	case 3300:
-		poc_val = PVDD_3300;
-		break;
-	default:
-		return -EINVAL;
-	}
+	ret = rzg2l_caps_to_pwr_reg(regs, masks, caps, &offset, &mask);
+	if (ret)
+		return ret;
 
-	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
-	if (pwr_reg < 0)
-		return pwr_reg;
+	ret = rzg2l_ps_to_pwr_reg_val(ps, caps);
+	if (ret < 0)
+		return ret;
 
-	if (pwr_reg == OTHER_POC) {
-		scoped_guard(raw_spinlock_irqsave, &pctrl->lock) {
-			val = readb(pctrl->base + pwr_reg);
-			if (poc_val)
-				val |= mask;
-			else
-				val &= ~mask;
-			writeb(val, pctrl->base + pwr_reg);
-		}
-	} else {
-		writeb(poc_val, pctrl->base + pwr_reg);
+	scoped_guard(raw_spinlock_irqsave, &pctrl->lock) {
+		u8 tmp = readb(pctrl->base + offset);
+
+		tmp &= ~mask;
+		tmp |= field_prep(mask, ret);
+		writeb(tmp, pctrl->base + offset);
 	}
 
 	pctrl->settings[pin].power_source = ps;
@@ -3795,6 +3834,11 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.oen = 0x3018,
 		.other_poc = OTHER_POC,
 	},
+	.masks = {
+		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
+		.other_poc_pvdd1833_oth_iso_poc = BIT(1),
+		.other_poc_wdtovf_n_poc = BIT(2),
+	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
 		[RZG2L_IOLH_IDX_1V8] = 2200, 4400, 9000, 10000,
-- 
2.43.0

