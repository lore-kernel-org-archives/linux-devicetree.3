Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4363E559B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917959; cv=none; b=h4tZhuNkHbkHKnQoU1UspdzmP9LzSlghNOWONJyOUJuaLeuchKFfThLX61yhTVTPER+5SNL35K2MgGmedZOOTXjJTlbkGtYZB42yBYo4iJ+3tecRBe7UlD3iFNc37n41Tq3LrO7Y0i5zZhFX9l2WJAfFwO+rJLw9D2b6TcLwTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917959; c=relaxed/simple;
	bh=y6PPFPd3iaRRZFTNevVWg6c/9itvIR7TABxo/DssobY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsJaFZRe5XKhk/Pozs6fxOJih5Uu+P3KLv2eba78OFWmsaHCBzdnR/Fwyn1wA0x8uBMqbcOd4S5LlFBVKkY4KDDRjmRdgdY2cX5CFZ9B+ZYqD+RA2c2ruKhWRGbMcmrwf3MqCpd7AjbZdTH8Tc05Cc1PGsYwmqwjeuuG1MEwhtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=aFokeq2O; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="aFokeq2O"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49802c418b5so6285025e9.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785917956; x=1786522756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MzOsUeybMS9dXaNgD2Ggm/YXuUKfNu/EThsAs7XLtY=;
        b=aFokeq2OWjUTat4qXw9CXuQr1LGU37VoicE+KiyR3hRH05ZHbfvW1k0B1KiCm3gPsf
         fsBFxvAMpw1uG4ner11c/MJbq3eQfEVbu/OHx4Lh8mCtWEykHfpkP1E3Mvqq2OvVm3a5
         C5RQNd811/xWfSyJBGgOLSUc2L56QtpS5eukdLAPMx9hvXbZvYV5PQfYSQMowY8EzDal
         sPtAiBPO3Yn7j/9TyAVAUCRsINPFa4kyG8MH4VPB5uKz7nKcrUfHUuTMsT9OQ0yEwSKX
         uu2nWSd/IHnZpYvgHOG8LCl50sGsaH1hnTcbF209cYc2tbl/rZCmHV9Ew548sIT1IhzX
         hfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917956; x=1786522756;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MzOsUeybMS9dXaNgD2Ggm/YXuUKfNu/EThsAs7XLtY=;
        b=kspf2ft7809XmuJ91G6CkemhgMWNxQKZeo+PP6gDmB6SzfyhCze/+4Nm+glRSAq05A
         OYeKhtmocw7GyF2zmhQqdyVEHYd6eVKBTLEp0yLRyT0nSfAjg9yi/gewOT6omO1BZ/ME
         fR+kT2v7HCG8K7DlbkxctpuGr8Hbqjn4myINSCXIIOfQgZ/PNr/uzLL+HTnIdvgDTZvK
         1qoHGRh4acDXJwdIW6yZePQsIRw6nAVHPY32BN5GUKD3wv69uDIMDUeiD00tdI8/RiN9
         dzlVKMeXdMEyHysrfD+kRdoBveVhMEF1jC96YcihyYDb8m0chTzcYY0xpMwEKNb2nwT5
         hUhQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/oBUS7nB7OFGpKJdDwuJvH+Pzh7TxTOpeMfD6XF4mcQK/5LiLJ2NJwYzXDrwJ7u3WdQnhBliKWyws@vger.kernel.org
X-Gm-Message-State: AOJu0YxdWNVlIaglp8TqjA7eFbMApMqY42xr84N/HFnJzSNAFEb8SxUN
	yuvNgjZqpwdFtS7qW2rgsnhB8tMQXmMQQZ6YwacyVzgQhKXMxDXiuNmfwHaMp2/Ezs8=
X-Gm-Gg: AR+sD103+rtrmyMuxrqOQRRNt+QTDMeNXBEH++NGOXoIrlRF1z1+X50ZULipnirET3Z
	dkROrzNDb2jSw/unEKGSYOkzi1rmjE8l6c8ilzuMNDOK95xvZ7KPmedJ7+ZhXDASMlSizBuP863
	rGUE53X0d5dYXcOjyGkBt7ceb/ULmRqc8VL5+c9I+jJleAHnGtaDQg+Y1j7Ior1ElnpTalNR44R
	6KMoidGE5aob9qgpu6gxFmkLpPpBIyOcoM61dhgPMnXVjp6pyEhhtpCLqriVsxMS9gT9WCPUSco
	2sKCg98JeuNeKa3pQHJfWFSV8DDImJyY9GubY65hu7Gv1k4peJ8ZXDsTJafguhRZwHvccS6Vgj7
	CZR4j7vnFC8X6AdN3/DmkcLUrEGHzB6a8wjd9vlZkIjeGtvxpHrS3BFyCF7e90CPGE9Q4cNMDiE
	fuk7b1352zu3OLCeD8a2/9/btY5gNu7s69/2WeOc/M4em8MAkeljQBLv7iEtUTrFZ/AVv/gZI5x
	U022+DxeAJEmmHYjxrISOuFS98bp0zIvZabeQKyb5rVnchCT3dtDIKBWE+l4lS5a8SpwMCP8/pK
X-Received: by 2002:a05:600c:3b22:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-4994e7bb0e5mr48896535e9.10.1785917956009;
        Wed, 05 Aug 2026 01:19:16 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e0356d4sm74745695e9.10.2026.08.05.01.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:19:15 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: jammy_huang@aspeedtech.com,
	yc_hsieh@aspeedtech.com,
	openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 1/2 RESEND] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
Date: Wed,  5 Aug 2026 10:19:00 +0200
Message-ID: <45f36ea6a3a2df18b51c5b83200c7596dbafe133.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785135437.git.gregoire.layet@9elements.com>
References: <cover.1785135437.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID: <20260805081900.IM37rUwLGR_JPFyhAlc2VEZVjUhOGHQe7HAnpWdmQEw@z>

Created a 5th KCS channel to match against the KCS 4 over PCIe addresses.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

The 5th channel created is only valid on the AST2600.
This cannot be used for AST2400 and AST2500 chips, as they don't have LPC
over PCIE.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 41 ++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a13a3470c17a..97daa2b3d6a0 100644
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

@@ -159,6 +165,7 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 	case LPC_ODR2:
 	case LPC_ODR3:
 	case LPC_ODR4:
+	case PCIE_LPC_ODR4:
 		break;
 	default:
 		return;
@@ -191,6 +198,9 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
 		break;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
+		break;
 	default:
 		break;
 	}
@@ -278,6 +288,14 @@ static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 addrs[2],

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
@@ -344,6 +362,11 @@ static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u
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
@@ -373,6 +396,10 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enabl
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
 		return;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_LPC4E,
+				   enable * LPC_HICRB_LPC4E);
+		return;
 	default:
 		pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
 		return;
@@ -452,6 +479,10 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
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
@@ -492,6 +523,7 @@ static const struct kcs_ioreg ast_kcs_bmc_ioregs[KCS_CHANNEL_MAX] = {
 	{ .idr = LPC_IDR2, .odr = LPC_ODR2, .str = LPC_STR2 },
 	{ .idr = LPC_IDR3, .odr = LPC_ODR3, .str = LPC_STR3 },
 	{ .idr = LPC_IDR4, .odr = LPC_ODR4, .str = LPC_STR4 },
+	{ .idr = PCIE_LPC_IDR4, .odr = PCIE_LPC_ODR4, .str = PCIE_LPC_STR4 },
 };

 static int aspeed_kcs_of_get_channel(struct platform_device *pdev)
@@ -575,11 +607,16 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
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
