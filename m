Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC2A453A28
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049111; cv=none; b=UpwQT08S6pjx5WFl16AiFgq6yu00GeJepmdmpk/gSrhmF18lDJclBPqfMW8r7ctlV/9zG10T/ADPYte6XK8WEA7qReI56nxCjtWHngAgDJ20iKTgc2678tEMzt4vOtvfm+lKThgOwspTmo6Ub8ioU0VpluOi6kEFVeLG8H5BUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049111; c=relaxed/simple;
	bh=/ZnDVyFXyOMlnp+4kOKxjkZE8/hrh/AgeryTNVSXcuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9pIaCi7qiE6Z8jtYKTPWdZfvhZYp9rSTJ8UwQtQYdN6uQ7/y31tIJVlvCNp0wndxo8eS+9RgAW8XfazNVxBO3JVrevTjPd4NO3Mf56mVP+/uIf8/+5BlnI5MsX6kKhPnjQz0pj6/V9koE9ZJg9cB30pJh3fPazNQ+N0i2Thl3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=RvoR4Z9U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="RvoR4Z9U"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954df200ddso31774825e9.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049107; x=1787653907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjRJ6CK8+10XxSw1IIq1k9Y5+IsaxjCnKt7BPw+fxxg=;
        b=RvoR4Z9UvM+sMGDd3enlJN2ZTXOo5Y9aGUHxPelaphJ8xyF54+XpWlyabPRfY4v+Ho
         7iuQgja95neLs55EzFdPOCWDEt+WZMc/MY8OklkbirzxMSL5ejmS2Bs8sC80O82hmh1s
         +2DOpNIYi6B/0mAOpPOMmjvNbxcRYHEV7rCuN6Jw+3VCmYndW1lbia8JZ3a1c3mUSbiL
         bTWuK0kM6xoxMH8Z3ecB7P3DzvoHCGgWdBGmgtuiuKvo3DUcTLqbouzBHULgfwxMY/Ep
         SzAcmgTbXj5OHAFwbYqkyecaUIVNiTLI9S6cizdUyxQIy9inKNiLSUc5x/SC9Tew/Fzu
         X2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049107; x=1787653907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjRJ6CK8+10XxSw1IIq1k9Y5+IsaxjCnKt7BPw+fxxg=;
        b=lG5jkibNZMMcpc0LVZu4IBZS+ZQtB4D2IDTctl6YV3ig1dDlBvLUASxk4iy8AkpkJT
         ZOU4E8kb9B/aVCjTMwNty/Qu5hCZ/U8W1Xha5URfR6ss4Kr8IsK9ZeGGwbb2ZSZlauci
         2fWTroT7NYbw0bCqHoMvVPyscOpeR1ZTUydMEzcdHI9dT0brpRQTS1c3qSgtXaLq3sEL
         vBWOlPy3/T0UE1QdwRE0YZHeSWbe8qDOYGhDSQgT6uYEFvC+XyZtKkzCtodZdrZQn14q
         OQX0P+sssWoeg7fxvSgLvqhoMaq+4BYLyM72VIRmxasW/Oe3nnP31MNyvLGR/BuaOzg8
         eJFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVr0LfxSBwCv4PIggqrolqfVAi49sra57gV3MfCMZ3EIAyrHsfZLREyFp0su6mqz6qrxF2S+d0+Deq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+z3KXX6G/f1m+SC3kAY2wCMB4Ckpt5bA6xerHwRSJi3AcDm0B
	WulfAKRa1YRRGJBJpWQQnlrPWl7FHkDoeiDNZUhprNs9R+hiIgu/ef/6g7UwLPxYkgo=
X-Gm-Gg: AR+sD13IognjpUOCnMxoMACDJ7p34gda3YOZ80zfxO439k4bEUNI79lkPFvpsZAm4rw
	3rjG4HbCMEghlXzt2Ls/JMjPuTk4niniO0qAiN7Fx6aWhXZ4xTfu8YW+7MzV3iyU15ST47NfEzL
	LHif7zO4NRuYe/7RS2VupNGd4JEDt5+qS4OMjXO22/Odd1M3uTbTMH8OOjZinK1IAMJgRl3lvUq
	3QG1C77OI809jXyTQQS7L4fMD6oxnkf9kTdSbBknfeT2sfG4LazK2S7ygW2BXoscBDdukTCVv5G
	d51/X9oR+q7D5zFpyQv76xEbpxPMRj+Wyn5dCfShfR2wU9U8d0ZgG6HTPWn5ge5UgKjuqLB8ziU
	NiR+nR/MG/gFTeFfgTkAt5tydYiSmXP3pu01WfJBLZ5+C9ms0q8ZapypWQAl7dw9gGFpb2MbqyG
	/5FqHllmKAuYGBaBhlp3u4GL4OD6CyI/+xoM0yK6KPBacX4130D4Z2iXkmXXm+Jjxe386WRiGjQ
	lUQUQIpeK56bdStnAvkhydOPHlMbnsTzlhEyO50Q6If4qtpasjl/V5jFUI3
X-Received: by 2002:a05:600c:3b1d:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-49988057986mr490766875e9.0.1787049107156;
        Tue, 18 Aug 2026 03:31:47 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:46 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:16 +0000
Subject: [PATCH v6 3/6] serial: 8250_aspeed_vuart: add VUART over PCI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-3-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2

Enable the VUART over PCI for the AST2600. Activate it only if the
'aspeed,vuart-over-pci' property flag is set on an
'ast2600-vuart' compatible node.

The AST2600 has 2 VUART that are usable over PCI. These are already
defined as the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.

Sets the BMC PCI device enable bits, sets the PCI class code to
unassgined/device specific, and configures MSI interrupts.

There is no disable function. Removing this driver should not disable
the BMC PCI device, as other drivers could use it.
However, if all the drivers using it are removed, the
BMC PCI device will still be activated, which is not ideal. But in reality,
this is not a use case for a BMC, the drivers will never be removed.

This is useful on PCIe BMC expansion cards that use the AST2600,
such as the ASUS Kommando IPMI Expansion Card.

Register initialisation taken from ASPEED 6.18 Kernel SDK.
Add return code checks to each register write.
Simplify the code and add macros.

The ASPEED_SCUC24 regmap update is use an undefined reserved register
ASPEED_SCUC24_RESERVED_14. I was unable to determine the purpose of this
bit. In the AST2600 A3 datasheet it is marked as 'reserved'. It is only
used on the other revision. As I only have the AST2600A3, I was unable
to try this code path. This BIT14 was set in the ASPEED SDK so I kept it.
I can remove it and the untested path if necessary.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 91 +++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 6afa2f4057e1..2360d37139bf 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -32,6 +32,28 @@
 #define ASPEED_VUART_DEFAULT_SIRQ	4
 #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
 
+#define ASPEED_SCU_SILICON_REVISION_ID			0x04
+#define AST2600A3_REVISION_ID				0x05030303
+
+#define ASPEED_SCU_PCIE_CONF_CTRL 0xC20
+#define  SCU_PCIE_CONF_BMC_DEV_EN					BIT(8)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MMIO				BIT(9)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_MSI				BIT(11)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_IRQ				BIT(13)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER	BIT(14)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_E2L				BIT(15)
+#define  SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE		BIT(21)
+
+#define ASPEED_SCUC24 0xC24
+#define  ASPEED_SCUC24_MSI_ROUTING_MASK				GENMASK(11, 10)
+#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1 \
+		FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)
+#define  ASPEED_SCUC24_RESERVED_14					BIT(14)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN	BIT(17)
+#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN	BIT(18)
+
+#define ASPEED_SCU_BMC_DEV_CLASS	0xC68
+
 struct aspeed_vuart {
 	struct device		*dev;
 	int			line;
@@ -412,6 +434,66 @@ static int aspeed_vuart_map_irq_polarity(u32 dt)
 	}
 }
 
+static int aspeed_ast2600_vuart_over_pci_set_enabled(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	u32 silicon_revision_id;
+	struct regmap *scu;
+	int rc;
+
+	u32 pcie_config_ctl = SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
+				SCU_PCIE_CONF_BMC_DEV_EN_MMIO |
+				SCU_PCIE_CONF_BMC_DEV_EN_MSI |
+				SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER |
+				SCU_PCIE_CONF_BMC_DEV_EN_E2L |
+				SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE |
+				SCU_PCIE_CONF_BMC_DEV_EN;
+
+	scu = syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,scu-syscon");
+	if (IS_ERR(scu)) {
+		dev_err(dev, "failed to find SCU regmap\n");
+		return PTR_ERR(scu);
+	}
+
+	/* update class code to be an Unassigned/device specific class device */
+	if (regmap_write(scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000)) {
+		dev_err(dev, "could not set PCIe class code\n");
+		return -EIO;
+	}
+
+	if (regmap_update_bits(scu, ASPEED_SCU_PCIE_CONF_CTRL,
+			       pcie_config_ctl, pcie_config_ctl)) {
+		dev_err(dev, "could not set PCIe configuration\n");
+		return -EIO;
+	}
+
+	if (regmap_read(scu, ASPEED_SCU_SILICON_REVISION_ID, &silicon_revision_id)) {
+		dev_err(dev, "could not read silicon revision\n");
+		return -EIO;
+	}
+
+	if (silicon_revision_id == AST2600A3_REVISION_ID)
+		rc = regmap_update_bits(scu, ASPEED_SCUC24,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN |
+					ASPEED_SCUC24_MSI_ROUTING_MASK,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN |
+					ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
+	else
+		rc = regmap_update_bits(scu, ASPEED_SCUC24,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN |
+					ASPEED_SCUC24_RESERVED_14 |
+					ASPEED_SCUC24_MSI_ROUTING_MASK,
+					ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN |
+					ASPEED_SCUC24_RESERVED_14 |
+					ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
+	if (rc) {
+		dev_err(dev, "could not set PCI device 1 MSI interrupt routing\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct of_phandle_args sirq_polarity_sense_args;
@@ -540,6 +622,15 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	aspeed_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
 
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
+	    of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
+		rc = aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
+		if (rc < 0) {
+			dev_err_probe(dev, rc, "could not enable VUART over PCI\n");
+			goto err_sysfs_remove;
+		}
+	}
+
 	return 0;
 
 err_sysfs_remove:

-- 
2.54.0

