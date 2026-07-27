Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A33DD87A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137408; cv=none; b=NSHO2KNl3cILxukG0V3JbEmaIS7D9288mrEC9BU6FVkuMeTQnC7YHK7Ba9QxSLgC6ABiH8VH6J5WPxVG0aEAuD4edFnYmqgXAd9gijoAb/CidgjsLreERz65dr+4yjx7Q0SLQNpc+d+e6gWWDL2+gckoTTJXIP9zX/4blD2EjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137408; c=relaxed/simple;
	bh=8D2xL3tTsN51pzCX0A+8Dvq6aPMRQVp05YS8gk/w39k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMai5X49yXcLORw1CUQ+BPaFMUgiBmsP1wFtPS0MhmiHqhNwIbyYtBh/A+jThvOzejoRXpttqlLDI/Ch3AMaDdbjPigg8GZig+sXi/e1NWUz8e/uFyMoX9T1al2mIPb9cRqRq4rUiJODFWAPwzWVJ5RI2z5+GVVACu5w+YC9ozc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=DiAcoWyn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="DiAcoWyn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso2217676f8f.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785137404; x=1785742204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MzOsUeybMS9dXaNgD2Ggm/YXuUKfNu/EThsAs7XLtY=;
        b=DiAcoWynGeoS3yVS3sSj5W3Dk28Pf5A7io2rw9qw0XoWznFSLNxD1vnCh21ZlkLAMv
         y5T12Z5d3z9+X4gcXjhclcz+GanSQTc7jE3bEPS72hW++TnEZ6JzGulQJiXAU3EFBvui
         /Wgu7oqkDoMRGhKSO33KNa3LGj9A90O3Z2H5bb2v6wTHGoRW3IV3x91ITwgWBURtNBgx
         mZ42Dat7PinmbPc7I5pFEVmGzdxCG3H8ev1b26lCrcsOxX/PtXfaVwmZ+3niqUaxGLPd
         2XaFy5Ta5D5v+6uzE/wu1Pb3VlCgg/Mqc3++v1jlDigMhfzu36j+BIo6EJ7ehKU+FudZ
         i2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137404; x=1785742204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MzOsUeybMS9dXaNgD2Ggm/YXuUKfNu/EThsAs7XLtY=;
        b=K9NpeGHd/qqNq4MEmfDMO4JLskj4A3YNm96JdFhu1t+VQFDudlfwQS3zbaGDXTdKp6
         L7KjGZ2zd/btfs6lTnaJDZ0fGjBXsKHxN2MEB2gmWmiUakEd5PrRIwqTlQwvSoNn0qTL
         Ivb9ayQGlsHx+InpKgBOYWOzO6Z+N+PM2mgEJBVnsN7ERwDNydeILVXrWbDqLH7HCH5G
         uKNCsDuHzmhIaVd6JQEKobMz3j1gRhmZbhvTW0GMX9CGMRtuTH/+QElfuWW+Ezh2aDEG
         320ogmJ/bh5tJnPCiK7ISeTEl7xJEunBpWf0yvlsNJC7uD9RsA4Av47kXnyNPK3z06qD
         ctRw==
X-Forwarded-Encrypted: i=1; AHgh+RpdsJ62nW3PbhkXlkwzwqCfF+BIj5Vn+az3ypoSQrSAQT+o0cqI6JwOIRfi+xtkWvFsZOie3U2Gs+pF@vger.kernel.org
X-Gm-Message-State: AOJu0Yye6pkp63B0W5vmtwD8An9qIf/JlUEBCrTTWoSa4bdDjH4+UE+y
	3EfvKLCotxr+WYL2n1fDxBKUF1FVwhwcj1NLHPw+D62es/o1v5igENgaQbIBPbN9bbY=
X-Gm-Gg: AR+sD12BkNhxmKbW8jqA8nSkwtfEbVE7fCdzIN/+EEM9BEugf5nCCBkFheTfvt0PeXy
	qS+GBFhkxRUpLMhYmBSFxxYv1XYaCkinaERVNsNkO74/T3mP5mJR3p7Q30i8gw+Bm5ht1kduSK4
	IRUFoZQqoJKC8Z2T+ouJ31/uitiCK5tdJp3wzlf1dZjpPdBNiUepgVMooHpLN1QvKjEvaD1NpSG
	o6di9h7NdtXl1fZ/1z4kO/WYeZOowFtghYNUMpYUTfFBLRawBHCwOcIcog/JxDe/7yZRhKfs1pK
	CrP1Mzg5EKPo+sZn3fu2UGZ7pQvPYA3UHJsI6/JhBCFSMJT2Q/JYmGbekGfjrFFQUIL7jzPVt6l
	mHbcrku+jY/5FmdZOfSi6Nay8w+Mc9LsiV6wYPmsRzdbKpXcrW4MdV6unLpTsaueDUBoVBxcjlr
	BbCQ7RB9DcoqCTs3fR/xQ28JxQM/cTaTlx61ol9bV4XJmU1gCFPlX6Xb4px+dcRSDrdss7tzXrO
	XE3PBfAuaveDdOdDQ==
X-Received: by 2002:a05:600c:310d:b0:495:7b1b:f387 with SMTP id 5b1f17b1804b1-496b56f141dmr93289595e9.24.1785137404083;
        Mon, 27 Jul 2026 00:30:04 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm201823685e9.6.2026.07.27.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:30:03 -0700 (PDT)
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
Subject: [PATCH v3 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
Date: Mon, 27 Jul 2026 09:27:40 +0200
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

