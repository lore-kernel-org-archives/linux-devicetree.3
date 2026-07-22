Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970829E10F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733331; cv=none; b=B1IqRkWdOOoYqOfUkVH/5bAS/UY+De4uncExkAUzW6fQpbiYgrkAZswMdrJ+sLgAePC4ZFk5TUFyCL/gaCBaT8Q/YA91JhzhEvHHbBh1eTY8pAmqK4Zc/f7n8t+5wlBgmd5HP5dc0Z8u5NTNHGtHgDIQGXXFvPQkKXK8bbgIO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733331; c=relaxed/simple;
	bh=+Ahv/5dZ1FFrai0/Fzb4I3yyoOOuQsgMJuWWf42buxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sIlF1t1Ww/hUfpauDmt1XF83wJw10ewIIva5DYiRB3SWLLXbCgnC1vaf0SJJNZ/DJSPKyYK8fA9HkCcQnjpQsI1Rnyul0L+pYgsVdviGUubqQsAplHZeprTor6VB+SH6ODvQ4K9+fWn65BahV9Izn2NC9cTYrzRzEH7A7CY3oys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=NoxhQw/A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="NoxhQw/A"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so37820635e9.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784733327; x=1785338127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qXzXulSKAPLcRuX3YZiepbKZUvKjmLNyPDEVWHi2rOQ=;
        b=NoxhQw/AiOi1xe8i5HHU1T59nY1N4xgIBeLsqiS3MxlMgFEKMT6bD1scmwGhfeou0x
         EDn35JqrgumciDF+hKtnVeeeL6Qh5gU60OVHzu2zInU+yLyYPw3NZZdjWrO1Ol3b1ukI
         e8o2q0slM1LWSWpuIOmD0Qvilp78Nwq5LlYP0gW/aTfJY2kS74RItgUnraeK6a5hmJ6F
         Lr63Y7msiuoF3DixdF2GrK47mh2ty48z649yuois4HrqVVKZ6Kzm9QYb1cH9pY5e9ypQ
         gJ/8/tNYlbQzriXk6++NWsESDnzPvVVJ4NAPU9IGGhV1wLh9XeCY4Yo7vR9KUnHnxlY/
         wqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733327; x=1785338127;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qXzXulSKAPLcRuX3YZiepbKZUvKjmLNyPDEVWHi2rOQ=;
        b=oXVd08fYJO5I5/5cU9EyW2O0JJ+szgmAwcYrTyLxTDBz61UbddA+qSuhjFEdPLkYdw
         GZePeq6zF5heorpdMEhbmJVlhf33nJCBLHGCs2IGYoOECgF1CcCDwVw1LJCc0HnPhzmN
         vuYwiGtYAfdbHxSTfPFIWqVHxl5wUWLXVDhqNaRKo5KE49vCe7QdIcQzn5Caky7xSKcn
         XIBGqEDOt6mqT95G48d4kV/CKLBJp4l4kt7Vn/aMBpK8i226/ICIlocA/U+jCQH6SqA3
         YPrBjlijvhI1GqO+fgR0dXvg5lSUtKkT9mbHoACHow5qPzhEvI51jRX9ob5m+a5eD6lQ
         qjlQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+w1xvo0GC+8RM94QjqExASoEnEcj+K9ZnkF2zS2u/0Y23V10/N3KArZJWEOBMduHf9yXQV0yhVY54@vger.kernel.org
X-Gm-Message-State: AOJu0YzWhQZRtkYuRuGemOt9u4ARWlQ1XVggzyghdQQ6IqYYf14CV3VL
	nM3ZbSEKQ4D5z1C3d9OGHYW4TIHknKNdNWbHD19IZQ2aw2ZmvFCdxTKQUFO3hPwdpcg=
X-Gm-Gg: AR+sD127IuEPoFDf4XtfMepbjE57YIhOJ4EZBv1UjlIe+oBwbXzsi7y+3yHA2zLJHLP
	tCk8v8df0KVV5pgLouhKLgH0B0SBItAiNyEeHR2BBb6WXkX4MfhnELHdSMdrvY5thD7QBvKU15o
	KUTCV2Do9zynHXm6QG+FkIjkavx3y2SIzOGWipElykBRIj3n7hNsVrywUGADp5mWvEOmyMge5Sb
	JdgRSxav8OvicCJSTqm6gwqI7YQCrgJkjHv1hn9kmVtKjsOcTGVa/aQLS6IXQpXnVNgrV1GcnEf
	ppRQYiWmxgrGKJcXnoQnlrFk5+j4neqwGORBtAlc7H1tAJp4CGhi/yWzId/ApkZ33kUEIDoaMY3
	VwuZWmp9XI32VCoOvUs3GKVBShf/ShK6RAkqvAE4LauXNiI6ZcicQqEaCzLj2WBRHdhX70Nvvue
	evdS+dZ0WQY7lqF6mdcQI6p830S+g70Srr/8fdV5ANxZUrnDjPlOnRIzLY2b+OvYOq8yXTCEvDf
	5KKYmzRCJh9MzfiRGKxy/xqoSgE
X-Received: by 2002:a05:600c:3153:b0:493:e97c:216e with SMTP id 5b1f17b1804b1-4954a41382fmr284426115e9.39.1784733327405;
        Wed, 22 Jul 2026 08:15:27 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm70595615e9.6.2026.07.22.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:15:26 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
Date: Wed, 22 Jul 2026 15:11:57 +0000
Message-ID: <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Created a 5th KCS channel to match against the KCS 4 over PCIe addresses.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

The 5th channel created is only valid on the AST2600.
This cannot be used for AST2400 and AST2500 chips, as they don't have LPC
over PCIE.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 39 ++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a13a3470c17a..4d93af2455b8 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -26,7 +26,7 @@
 
 #define DEVICE_NAME     "ast-kcs-bmc"
 
-#define KCS_CHANNEL_MAX     4
+#define KCS_CHANNEL_MAX     5
 
 /*
  * Field class descriptions
@@ -102,6 +102,12 @@
 #define     LPC_LSADR12_LSADR2_SHIFT 16
 #define     LPC_LSADR12_LSADR1_MASK  GENMASK(15, 0)
 #define     LPC_LSADR12_LSADR1_SHIFT 0
+#define PCIE_LPC_HICRB       0x900
+#define PCIE_LPC_HICRC       0x904
+#define PCIE_LPC_LADR4       0x910
+#define PCIE_LPC_IDR4        0x914
+#define PCIE_LPC_ODR4        0x918
+#define PCIE_LPC_STR4        0x91C
 
 #define OBE_POLL_PERIOD	     (HZ / 2)
 
@@ -191,6 +197,9 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
 		break;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
+		break;
 	default:
 		break;
 	}
@@ -278,6 +287,14 @@ static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 addrs[2],
 
 		break;
 
+	case 5:
+		if (nr_addrs == 1)
+			regmap_write(priv->map, PCIE_LPC_LADR4, ((addrs[0] + 1) << 16) | addrs[0]);
+		else
+			regmap_write(priv->map, PCIE_LPC_LADR4, (addrs[1] << 16) | addrs[0]);
+
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -344,6 +361,11 @@ static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u
 		val = (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX_SHIFT);
 		regmap_update_bits(priv->map, LPC_HICRC, mask, val);
 		break;
+	case 5:
+		mask = LPC_HICRC_ID4IRQX_MASK | LPC_HICRC_TY4IRQX_MASK | LPC_HICRC_OBF4_AUTO_CLR;
+		val = (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX_SHIFT);
+		regmap_update_bits(priv->map, PCIE_LPC_HICRC, mask, val);
+		break;
 	default:
 		dev_warn(priv->kcs_bmc.dev,
 			 "SerIRQ configuration not supported on KCS channel %d\n",
@@ -373,6 +395,9 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enabl
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
 		return;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
+		return;
 	default:
 		pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
 		return;
@@ -452,6 +477,10 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
 			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIE4,
 					   enable * LPC_HICRB_IBFIE4);
 			return;
+		case 5:
+			regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_IBFIE4,
+					   enable * LPC_HICRB_IBFIE4);
+			return;
 		default:
 			pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
 			return;
@@ -492,6 +521,7 @@ static const struct kcs_ioreg ast_kcs_bmc_ioregs[KCS_CHANNEL_MAX] = {
 	{ .idr = LPC_IDR2, .odr = LPC_ODR2, .str = LPC_STR2 },
 	{ .idr = LPC_IDR3, .odr = LPC_ODR3, .str = LPC_STR3 },
 	{ .idr = LPC_IDR4, .odr = LPC_ODR4, .str = LPC_STR4 },
+	{ .idr = PCIE_LPC_IDR4, .odr = PCIE_LPC_ODR4, .str = PCIE_LPC_STR4 },
 };
 
 static int aspeed_kcs_of_get_channel(struct platform_device *pdev)
@@ -575,11 +605,16 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (channel < 0)
 		return channel;
 
+	np = pdev->dev.of_node;
+	if (channel == 5 && !of_device_is_compatible(np, "aspeed,ast2600-kcs-bmc")) {
+		dev_err(&pdev->dev, "LPC over PCIE KCS4 only supported on ast2600\n");
+		return -ENODEV;
+	}
+
 	nr_addrs = aspeed_kcs_of_get_io_address(pdev, addrs);
 	if (nr_addrs < 0)
 		return nr_addrs;
 
-	np = pdev->dev.of_node;
 	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_irq, 2);
 	if (rc && rc != -EINVAL)
 		return -EINVAL;
-- 
2.54.0

