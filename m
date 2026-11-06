Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966214;
	b=5UDUG0JkitxJix60umE87hMH5sBPWs4YqGejW+itsHEPg5+GQDWvQidZpjutm27T5taz
	 H+nmIv9TbgtyMQATZFHRZqUQ0d1woKr8WjNqtTsmBHTtQqYLlNTtEzxoAPW2wxT4j43Jg
	 /7w6sztLTP8E5Ktobjvq5EsfT/Jn7edEu/O66zLT2obLUQd5/9guxrh5yrzYyVn8Hop+y
	 h3jaSGLrB9O7kYFFVUrtO/Smk4Iuux4fBPD2EbloQx9q2Zt/IAoUCD6hEY7TwVucxuxzr
	 XRIai+TvEd2smeG64JZgPJ8efrUuysG3NdgE+lnZUePxjf9BnelZmYsQoQLsYW5A2iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=LXUV9vzh/Ex4mWqnyZJmk8EcqCjzREkHe0iLISQH+Sg=;
	b=PxdlraCCVR6Z74+cg0kxGjkvi5rWZFLDCZRnqG4R4UKDcVfpjSfu1pVWK4/I8TABWW2y
	 6+Kzwdlc/RjLYJbD2eqSMuM22QivOd//fkWmmzV5zbV9COfGLhsEEjW9fWbfKMy7QqvH3
	 +sUGp55nL805IS3g2ABdahAPJvJcra3mzuE75I4lPB6+5ncj/trNu2XpC6QhAIckkfMcu
	 9v77G0Odeqywf7t2f2rH/Cs0j7weVsgZX+fW9Ui2GAegJiPWX8Aw4xY9o8gW0/cXsPmrE
	 U/uZ4d9dio6cMf82+hmg9wx0mYuqoHFL3rD46f6o9hU90lNeFdjYyBD/XKKh6OxR5XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQ2b68kw;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C99606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C99606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQ2b68kw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so5569355e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966212; x=1794571012; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXUV9vzh/Ex4mWqnyZJmk8EcqCjzREkHe0iLISQH+Sg=;
        b=FQ2b68kw+U4Cn97m9rCGsKdTIugMzhGYKaiC1RaAodMDwWQG3ipm7dMkWI0AkCRY48
         1gwn/DXgFu5cCiTlWt61etCzRzYCgM9aAvzhfBm+/EdBnu3chU2vlOheUc+ORQQ4ZPgI
         s2sAj3OinudI4SYYzn4jgAbjNMQ/YxUM94HKMpSdjwe1aczKUrPHlEMXmBE9GoI9+H9D
         oQTcDeS64Yts8qUlVl71qU8eFOXrj7L9Way9S6pwNInRt+WoKcyQOXL3JkKe0/IV6juT
         hwdLLhhWY8BJvswki/Y+w7uCtwS6ttppjs5wv6j9KBCvqMF9F+Y/y1DzOfcPwrsG5EnA
         FVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966212; x=1794571012;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXUV9vzh/Ex4mWqnyZJmk8EcqCjzREkHe0iLISQH+Sg=;
        b=NIg3ZM5KaAJ4PCBz5bvgnwyCGiaCriTJHPft6JUPu6VyYaerK0x9k7wDuCCggPRp/k
         sweAhQBTpdL2BQQxWqGBQTZDk9MDBaoEUeIQRv72H6clchfW0/PTW4adLNvgXQMvzp5x
         rEjs3xMqnU/ISmaE16Xd7EIxj5JLSCXkA9Z2ZPblFbM3N34JMcLCDcgvnmmxjylLfHEo
         BScuXAIbmvxCfxpX9Tq7lG2YUB4zVfqV37LWoTCpVaIh9ER0IeEDLC4TAe9aKMZ1ud8/
         5G3sm1GqiYIZirdPy3ArSjLYZtxI1vhKVafJW1Tx9Xv3wy/2UNzM1AR/DTdJhBArsAhf
         /fNQ==
X-Forwarded-Encrypted: i=1; AKwUvByDwNEuC7zXSq90mUVs32rxxeli4ivBMKfqLdP4mH1js0Mgk4UtrjL6o6AVB1onLB2c8EbOts5yfpNE@vger.kernel.org
X-Gm-Message-State: APuU4Z8LQoyDXIIMAUsAqNJtHH8DPPHVAcWSoxdztOXRbXDGQ1whZ8Fh
	MiqfpPTyPcad1rRHlT7FuTnbcB/xJQmGJozKss9f8RB64AlWPJt9RrYV
X-Gm-Gg: AYBFou2NwqtIlsb5NpfxP5mjViIZ4JN6399S63VqS+P7RkjX3BO2RGhVjOghTjotpHv
	FG/zBJijpztmCiH+7L9IwDTYGtxWafvNSsVJ408shCcHNcw6YxZv+XicUhG3gy0dbC1TVomiv2w
	etY9QiYKXDW3I89d5Z/cwlrjPwkaCTLubsN2P1Fy1WwwvrFcw8FDWd71wEtjCec2vKGJTwUoxyl
	GG5Kp21DPqKHngq8g0NAPclhsWA+fLSpMVp3Yw9KU13LU5PebBKReiomc2V93yi1G606FBeHNY3
	I6b40J99bs8n5Otz9xEgSgp6msebRCwDP8ujLgyN5mAAartVP6NkQYXzr/YALc7OP5mFawQHXc2
	hXb9ONsQ1b2MNhlqMzF1pbMGaF70LuKHVjacierl+8Pu6qp9Pqw5Pqo5fRGR7cJdD3SzLRF8Rm6
	OqieTqQg9PCryJ9Be+8dLNSX3st6joQfHs6BB+O51ZZYEBvt/jUX03qzg5GVZicwvc0g6lv7UQw
	lqylPW1I0Tc8Bqu0C4PaZxkioR6yw66Y8EA4IoWdtRv78kNvfwhq2HVy20s0eFSl81m1gwRlzpt
	t6evy/KT29B8qksCbyd8O8ygzn/gF/iK86pKI3lwxAbiSGM4E6fdJDfKNrfwcAB4vtNHR9dP7k1
	NRXaVJQcFp9pjayo=
X-Received: by 2002:a05:600c:83c4:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4b6df5eac49mr37724645e9.19.1793966212146;
        Fri, 06 Nov 2026 03:56:52 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7701af6sm3385000f8f.38.2026.11.06.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:56:51 -0800 (PST)
Message-ID: <6aedc083.003ab60d.a954.e1fe@mx.google.com>
X-Google-Original-Message-ID: <au3AgB_U0DLTy5WL@Ansuel-XPS.>
Date: Fri, 6 Nov 2026 12:56:48 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v10 5/5] clk: en7523: add support for Airoha AN7583 clock
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
 <20261105121059.11201-6-ansuelsmth@gmail.com>
 <sashiko-outbox-199026@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-199026@kernel.org>

On Thu, Nov 05, 2026 at 12:25:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] clk: en7523: sleeping in atomic context in en7581_pci_disable()
> - [High] clk: en7523: separate spinlocks fail to serialize shared SCU registers
> - [High] clk: en7523: AN7583 MDIO clocks registered as fixed-rate clocks
> --
> 
> commit 0c38944a68dcbbf6c296bc45b4d9669bdee653fb
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> clk: en7523: add support for Airoha AN7583 clock
> 
> This commit adds clock and reset controller support for the Airoha AN7583
> SoC, including its base clock descriptors, MDIO clocks, and reset line
> mappings.
> 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 979dd9c20a4f2..c1cc6fbc3c019 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> [ ... ]
> > @@ -372,6 +381,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >  	}
> >  };
> >  
> > +static const struct en_clk_desc an7583_base_clks[] = {
> [ ... ]
> > +	}, {
> > +		.id = AN7583_CLK_MDIO0,
> > +		.name = "mdio0",
> > +
> > +		.base_reg = REG_CRYPTO_CLKSRC2,
> > +
> > +		.base_value = 25000000,
> > +
> > +		.div_bits = 4,
> > +		.div_shift = 15,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}, {
> > +		.id = AN7583_CLK_MDIO1,
> > +		.name = "mdio1",
> > +
> > +		.base_reg = REG_CRYPTO_CLKSRC2,
> > +
> > +		.base_value = 25000000,
> > +
> > +		.div_bits = 4,
> > +		.div_shift = 19,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}
> > +};
> 
> [Severity: High]
> Can AN7583_CLK_MDIO0 and AN7583_CLK_MDIO1 work as intended when registered
> via en7581_register_clocks()?
> 
> In drivers/clk/clk-en7523.c, an7583_clk_hw_init() calls
> en7581_register_clocks(), which reads the initial hardware register value
> at probe time and registers every clock in soc_data->base_clks with
> devm_clk_hw_register_fixed_rate():
> 
>     hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
> 
> However, in drivers/net/mdio/mdio-airoha.c, airoha_mdio_probe() calls
> clk_set_rate(priv->clk, freq) to divide the 25 MHz default MDIO clock down
> to 2.5 MHz. Since clk_fixed_rate_ops does not implement .set_rate,
> .round_rate, or .determine_rate, clk_set_rate() will return 0 without
> programming the 4-bit divider in REG_CRYPTO_CLKSRC2, leaving the MDIO bus
> clock running at its 25 MHz boot default. Should the MDIO clocks implement
> clockops that support setting the divider rate?
>

This is being handled in a different series that is adding exactly this
feature.
 
> >  static const u16 en7581_rst_ofs[] = {
> [ ... ]
> > @@ -1152,6 +1351,43 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
> >  	return en7581_serdes_phy_register(&pdev->dev);
> >  }
> >  
> > +static int an7583_clk_hw_init(struct platform_device *pdev,
> > +			      struct clk_hw_onecell_data *clk_data)
> > +{
> [ ... ]
> > +	en7581_register_clocks(dev, clk_data, map, base);
> > +
> > +	val = readl(base + REG_RST_CTRL1);
> > +	val |= REG_PCIE_HB_RST;
> > +	writel(val, base + REG_RST_CTRL1);
> > +	val &= ~REG_PCIE_HB_RST;
> > +	writel(val, base + REG_RST_CTRL1);
> > +
> > +	ret = en7581_reset_register(dev, base, an7583_rst_map,
> > +				    ARRAY_SIZE(an7583_rst_map),
> > +				    en7581_rst_ofs);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: High]
> As reported by Sashiko on v6 [1], do cg->lock and rst_data->lock fail to
> serialize concurrent read-modify-write accesses to the shared SCU registers?
> 
> In drivers/clk/clk-en7523.c, an7583_clk_hw_init() registers the PCIe clock
> via en7581_register_clocks() -> en7523_register_pcie_clk() (which allocates
> struct en_clk_gate with its own cg->lock) and registers the reset controller
> via en7581_reset_register() (which allocates struct en_rst_data with a
> separate rst_data->lock) over the same MMIO base.
> 
> In an7583_rst_map, AN7583_PCIC_PERSTOUT0_RST and AN7583_PCIC_PERSTOUT1_RST
> map to bank 2 of en7581_rst_ofs, which is REG_NP_SCU_PCIC (offset 0x88).
> Asserting or deasserting these resets in en7523_reset_update() performs a
> readl()/writel() read-modify-write on base + 0x88 under rst_data->lock:
> 
>     spin_lock_irqsave(&rst_data->lock, flags);
>     val = readl(addr);
>     if (assert ^ inverted)
>             val |= BIT(id % RST_NR_PER_BANK);
>     else
>             val &= ~BIT(id % RST_NR_PER_BANK);
>     writel(val, addr);
>     spin_unlock_irqrestore(&rst_data->lock, flags);
> 
> At the same time, en7581_pci_enable() and en7581_pci_disable() perform a
> readl()/writel() read-modify-write on the same physical register
> REG_PCI_CONTROL (offset 0x88) under cg->lock:
> 
>     spin_lock_irqsave(&cg->lock, flags);
>     val = readl(np_base + REG_PCI_CONTROL);
>     writel(val | mask, np_base + REG_PCI_CONTROL);
>     spin_unlock_irqrestore(&cg->lock, flags);
> 
> Similarly, on EN7523 and EN751221, en7523_pci_prepare() modifies
> REG_RESET_CONTROL1 (offset 0x834) and REG_PCI_CONTROL (offset 0x88) under
> cg->lock, while en7523_reset_update() modifies REG_RST_CTRL1 (offset 0x834)
> under rst_data->lock. In addition, in en7523_pci_prepare(), after releasing
> cg->lock and sleeping in usleep_range(1000, 2000), the code re-acquires
> cg->lock and writes back the cached val without re-reading REG_PCI_CONTROL:
> 
>     spin_lock_irqsave(&cg->lock, flags);
>     val |= REG_PCI_CONTROL_REFCLK_EN1;
>     writel(val, np_base + REG_PCI_CONTROL);
>     spin_unlock_irqrestore(&cg->lock, flags);
> 
> Because cg->lock and rst_data->lock are separate spinlock_t instances, can
> concurrent clock and reset operations race and overwrite each other's bit
> updates in 0x88 and 0x834?
> 
> [ ... ]
> > @@ -1305,6 +1541,18 @@ static const struct en_clk_soc_data en7581_data = {
> >  	.hw_init = en7581_clk_hw_init,
> >  };
> >  
> > +static const struct en_clk_soc_data an7583_data = {
> > +	.base_clks = an7583_base_clks,
> > +	/* We increment num_clocks by 1 to account for additional PCIe clock */
> > +	.num_clocks = ARRAY_SIZE(an7583_base_clks) + 1,
> > +	.pcie_ops = {
> > +		.is_enabled = en7581_pci_is_enabled,
> > +		.enable = en7581_pci_enable,
> > +		.disable = en7581_pci_disable,
> > +	},
> > +	.hw_init = an7583_clk_hw_init,
> > +};
> 
> [Severity: High]
> As reported by Sashiko on v6 [1], does wiring en7581_pci_disable() to
> .disable in an7583_data cause sleeping in atomic context when the PCIe
> clock is disabled?
> 
> When a consumer calls clk_disable() or clk_disable_unprepare() on
> EN7523_CLK_PCIE, the Common Clock Framework holds enable_lock via
> spin_lock_irqsave() in clk_core_disable_lock() and calls
> core->ops->disable(core->hw).
> 
> In drivers/clk/clk-en7523.c, en7581_pci_disable() calls usleep_range()
> while enable_lock is held with interrupts disabled:
> 
>     spin_lock_irqsave(&cg->lock, flags);
>     val = readl(np_base + REG_PCI_CONTROL);
>     writel(val & ~mask, np_base + REG_PCI_CONTROL);
>     spin_unlock_irqrestore(&cg->lock, flags);
> 
>     usleep_range(1000, 2000);
> 
> Should this sleep be moved to an .unprepare callback (which runs under the
> sleepable prepare_lock mutex, as in en7523_data and en751221_data), or use
> a non-sleeping delay such as udelay()?
> 
> [1] https://lore.kernel.org/r/20260819222743.5044F1F000E9@smtp.kernel.org
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261105121059.11201-1-ansuelsmth@gmail.com?part=5

-- 
	Ansuel
