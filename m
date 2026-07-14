Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63252641EE
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 18:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055203; cv=none; b=QeCc+rWgiNqVVokqRsCMt86mUFCvcXnQFYS5gDkOcwUX3AWLfNy9wIGgfD0nkNI8kfiG7swnuRIFSeGx/XQqMQyQPNtGg08Vqxbi0MwmX0gueXdRJbOy+8bd1Sa1NBukoBDL2th/UrId2UDTUxMxe/8FhWOu5MEsLfEMgz83jkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055203; c=relaxed/simple;
	bh=ZdMjtjALJ9INUjixbUCM2kZrdun7GikDbIME1A+PLD4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uNXtDUnTK77SFM8Psz3y3X8vFzR+y7dgxpM7bIsrz0w3oHBUm38pd4fF3+JO/vZ+BKRqrzDYhrPN272wS64BraZOZXSrue404l9kcauvXdZGwzD5tx3/qFWgBK6ABkAVvMMKJjNnY9EQQFGq3nHKyzoZaE0KCUMwlqxJ00aiVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=IHs0nixE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="IHs0nixE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47df6a5202bso2884432f8f.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784055188; x=1784659988; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v81RYgZzr05KCDxoR1cyj6HFcz85Vml1RF/7JkwpDYw=;
        b=IHs0nixEvgbAsfcA2+uVO2prTfml0MlLbLAI2MyLIE+qg+LwVbxI1q7/Su+HFYjS22
         6+cV+3N8msl9AC/3PGgWS6z9adTU/i4Az6lxWqIL6ho++zgtIQAUs/xQrFgy7hxZLjMM
         BBsgY+EZ0Q1iC3RYNHqq9FPL6S3MoX88Z2ENxMvUT2/ZzwKhEGRvtyk6xBiswH5uqTt+
         /eYR0tTypL/NKYBcU8NEqw79Giz5rfZcOhv6GnEO8dBs+AFpqVNegS0sa0Krcugvxumz
         QSBA66pEhP6YIob+GjLOEYFWtUug00OytU7iEfdxLDMiesqMztQpibZGsed3URqFou/J
         tQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055188; x=1784659988;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v81RYgZzr05KCDxoR1cyj6HFcz85Vml1RF/7JkwpDYw=;
        b=k2+ef1VwmT0sCZeSgomFiDKkr7BFB4S7RtiCu2MGMChCj0aOQsS2Hfjvr+S5x7x2Q8
         xlp1T0I6hxeYRheh7qr9PQLC0quZSsHleardrGaD4WlaaXuVJ418AuWCk8eRm9Z8Vrto
         u0gOZgFyCVwkKSR7HRs3P9OXUk0Oj4HpGq2U9JXSjf6qtTC+VX3ycMcMg5kMrswkDDLY
         0g+HJmRdNQXeOZURs19Z3cMPB1ENDRWRpgWTwd7i/Vp+HXZQC8qPJQmANVI8XBHJQkCK
         zbxm3lSqqOBfFqz7GBQbf9vGONyKH04z++dBfa9K+wtfkbBEgfepqJCyWkiG/5VHtnik
         FYzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj2nv23+YUgnmu++KCT9ODidife3ysxiCq2HXCBMmV42ZgJUgtUbTsFPc1ekpAdxAAtO11vuD1ihex@vger.kernel.org
X-Gm-Message-State: AOJu0YzDn8U45ClTAmw4YNdYz+lg4R/Y5u22xY/d/BLz8jaiL7AaOJnm
	YqLBN3RuJS5RsjuRgwDwdCu2Cr6Ai1xDBbSlTR4RVK4vtUu4BYixh6JBTN2o10zkHl4=
X-Gm-Gg: AfdE7cmt13KUZ6Zg/fzLSeDY4hzsdmthmfk2e8ehg8MO+msrHLORVkCrXfKt4hsj1G+
	f3vNAqj4Kvz0Mo1d18EhLoTt5q7LvG6ucWoks9p74gFEHCquZuXWMaffcWa+y0kyNKLDG58Z/T4
	yLOiaiRE8rCbaCXEy7Mm/lTTLmDCIbS9D7wagrprr6csrz9DkMyJe8vPlW07dq57ksBnLX32x3S
	i/4YSoy5K6Bclj/PV4fjqbd9cgInHjo/bd9OUTtBWatwUV2XIUk/84RHQrRSu9UkyYHSJt3c4x4
	Mb8ynam0c7Tfr8jnZ3/c1cAEr+OJs+1YKX+mtusKWH2y6Cm3g8rnYhgbNw1D+acZyig/p0TsGaV
	B4lUb9XjVB0kO3no5I6ilTJRsWmfT60wFDEAJs13fd83BtxznBQWiZo/ICEyKcxSRatUPmT9iUe
	jiBCyoJUa/MnhRw3gIuTvllz6zdOqURA==
X-Received: by 2002:a05:600c:3150:b0:492:53e8:3bc1 with SMTP id 5b1f17b1804b1-4953c1624bdmr714135e9.17.1784055187650;
        Tue, 14 Jul 2026 11:53:07 -0700 (PDT)
Received: from [192.168.254.124] ([2001:9e8:2fb:8201:c26a:83ef:161a:409b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm94908715e9.2.2026.07.14.11.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <28c6e7c493559feffc7e6231b0a2f0b73b7fda41.1783524645.git.gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 20:53:03 +0200
Message-Id: <178405518337.194693.16062290686593842402.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055186; l=4160;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=ZdMjtjALJ9INUjixbUCM2kZrdun7GikDbIME1A+PLD4=;
 b=GZ6jzOrhucR05WwmvOfO9a6YYLoB752Rjv/H4tteyWXK0nQoP0J4vtOVuXDGA+QefmBBarWe8
 Ma1Cg3Obz4gAvCucwwSYpECAuo9Mbmv2Y1RTdL+yzoGUgXHEqBazp7d
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Enable the VUART over PCI for the AST2600. Activate it only if the
> 'aspeed,vuart-over-pci' property flag is set on an
> 'ast2600-vuart' compatible node.
> 
> The AST2600 has 2 VUART that are usable over PCI. These are already defined as
> the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.
> 
> Sets the BMC PCI device enable bits, sets the PCI class code to
> unassgined/device specific, and configures MSI interrupts.
> 
> There is no disable function. Removing this driver should not disable
> the BMC PCI device, as other drivers could use it.
> However, if all the drivers using it are removed, the
> BMC PCI device will still be activated, which is not ideal. But in reality,
> this is not a use case for a BMC, the drivers will never be removed.
> 
> This is useful on PCIe BMC expansion cards that use the AST2600, such as the
> ASUS Kommando IPMI Expansion Card.
> 
> Register initialisation taken from ASPEED 6.18 Kernel SDK.
> Add return code checks to each register write.
> Simplify the code and add macros.
> 
> The ASPEED_SCUC24 regmap update is missing a macro for 'BIT(14)'. I was
> unable to determine the purpose of this bit. In the AST2600 A3
> datasheet it is marked as 'reserved'. It is only used on the other
> revision. As I only have the AST2600A3, I was unable to try this code
> path. This BIT14 was set in the ASPEED SDK so I kept it.
> I can remove it and the untested path if necessary.

There's not even a reference in the datasheet changelog, so I suspect that it
has always been reserved.
I'd be in favour of removing it.

> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 6afa2f4057e1..4d09c04cb972 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c

*snip*

> +static int aspeed_ast2600_vuart_over_pci_set_enabled(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 silicon_revision_id;
> +	struct regmap *scu;
> +	int rc;
> +
> +	u32 pcie_config_ctl = SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
> +				SCU_PCIE_CONF_BMC_DEV_EN_MMIO |
> +				SCU_PCIE_CONF_BMC_DEV_EN_MSI |
> +				SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER |
> +				SCU_PCIE_CONF_BMC_DEV_EN_E2L |
> +				SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE |
> +				SCU_PCIE_CONF_BMC_DEV_EN;
> +
> +	scu = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(scu)) {
> +		dev_err(&pdev->dev, "failed to find SCU regmap\n");

dev_err(dev, ...) instead of &pdev->dev (defined above).

> +		return PTR_ERR(scu);
> +	}
> +
> +	/* update class code to be an Unassigned/device specific class device */
> +	if (regmap_write(scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000)) {
> +		dev_err(dev, "could not set PCI class code\n");
> +		return -EIO;
> +	}
> +
> +	if (regmap_update_bits(scu, ASPEED_SCU_PCIE_CONF_CTRL,
> +			       pcie_config_ctl, pcie_config_ctl)) {
> +		dev_err(dev, "could not set PCIe configuration\n");
> +		return -EIO;
> +	}
> +
> +	if (regmap_read(scu, ASPEED_SCU_SILICON_REVISION_ID, &silicon_revision_id)) {
> +		dev_err(dev, "could not read silicon revision\n");
> +		return -EIO;
> +	}
> +
> +	if (silicon_revision_id == AST2600A3_REVISION_ID)
> +		rc = regmap_update_bits(scu, ASPEED_SCUC24,
> +					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_MASK,
> +					ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
> +	else
> +		rc = regmap_update_bits(scu, ASPEED_SCUC24,
> +					/**
> +					 * The bit 14 is reserved in the Datasheet.
> +					 */

Even in the oldest datasheet that I've got (which was for A2 apparently) it is
marked as reserved.

Maybe some ASPEED folks can enlighten us what Bits 14 till 16 were used for on
A0-A2, and if they are relevant for PCIe INTx/MSI routing on the older silicons.

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
