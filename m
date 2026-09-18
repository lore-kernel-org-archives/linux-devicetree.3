Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F64908CB
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714117; cv=none; b=Nsef6HC4v0PGIoBxQTMtura2GxF1WIratbfiDw5holxREuuQbuCVgHo/5XYrcZFEF3FWfAgD54NVDpMfuda4n6Y4nePToY+yW9VEjBFQKV2yYzxImK7kc7b/+kC9v7M4Y/wgZevQ8erjz9AfbsRKQft4MmKcdo+2agImxhb4Tno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714117; c=relaxed/simple;
	bh=snDk2QMLQGyl+liNUi1u7MD6ycpi7NLuHIGSEKI/DfI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jASyvW4rccvwwODWMPCaZaOFcyfM85TOy2tlNe3et4niE5oTpv8MG/rRxeggw+XaYutdNC4UQfj7HfcmrUPtqQocmvvAWxsLYOLr6l1ERseyH+YUG1K4uNoMaXnocqGjbYIcBHg+5YtRMuxBYlK2gvuKPlnL0xYtJZg7DaiNvGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhrSYmzz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhrSYmzz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E5C1F000FF;
	Fri, 18 Sep 2026 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789714111;
	bh=GQAoX5Z9BzdTGFotXYPxGnl9JY0Zeg8E4UbO5QraDug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KhrSYmzzwG3ncrNpgo2HZUXytrGDd3htLYhwUvvTkNzECWLOM69B4uss+2LFgIHFQ
	 ZW0ScFTs++ThHtr0Cz5IlQ7ijH8B+IV/duGs6UmWWhL/S/tJ2jmYee70ZXrkZTf6jk
	 LIqSHl7NGRoMdwFooMaJJHHq4BSRtv8JdFwLNThdkMxE3dwpE3zyjgDwW6r7GoXIGP
	 DkExVHJi8vsc9qsztlEekFyfdXe9EOh8l4xks/fHPW0JJyPp5RxAnpUTGmd7lkX8uS
	 LM8MdDk+YNsqaQH1WedLx1F49/9zadG9viDqGjZrASaOZLQyhyqdrWJxnu9sujIdTe
	 czmyzDbbn3Qtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] irqchip: Add Xilinx Versal NET SMMU CSR
 interrupt controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tushar Nimkar" <tushar.nimkar@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-smmu-changes-v2-v2-2-adda681ab983@amd.com>
References: <20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com>
 <20260918-smmu-changes-v2-v2-2-adda681ab983@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 06:48:31 +0000
Message-Id: <20260918064831.92E5C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] irqchip: unrecoverable interrupt storm due to unhandled CMDQ_SYNC
- [Medium] irqchip: spurious handling of disabled interrupts causes log spam
--

commit bfa978fa90b50ee4257046a8002784c0f7fc45f7
Author: Anirudha Sarangi <anirudha.sarangi@amd.com>

irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver

The Xilinx Versal NET SoC implements a Control and Status Register (CSR)
block in front of the ARM SMMUv3 to manage EVENTQ, PRIQ and GLOBAL
interrupts. This commit adds an irqchip driver to demultiplex these
interrupts and chain them to the upstream SMMUv3 driver.

> diff --git a/drivers/irqchip/irq-xilinx-smmu-csr.c b/drivers/irqchip/irq-=
xilinx-smmu-csr.c
> new file mode 100644
> index 0000000000000..d9b575c6c58b0
> --- /dev/null
> +++ b/drivers/irqchip/irq-xilinx-smmu-csr.c
[ ... ]
> +static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
> +{
> +	struct xilinx_smmu_csr *csr =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +	u32 status, pending;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	status =3D readl(csr->base + SMMU_CSR_ISR);
> +
> +	/* Only service sources we support; SMMU_CSR_ISR latches raw status */
> +	pending =3D status & SMMU_INTR_ALL;

[Severity: High]
If the CMDQ_SYNC interrupt (bit 1) was enabled or asserted by a previous bo=
ot
stage like u-boot or kexec, it is filtered out of this pending mask. Because
it is never cleared or acknowledged, will this cause an interrupt storm on =
the
parent GIC line and a system hard lockup?

[Severity: Medium]
Additionally, since SMMU_CSR_ISR latches the raw status, does masking again=
st
SMMU_INTR_ALL instead of a shadow mask of actually enabled interrupts lead =
to
processing disabled or unmapped events?=20

> +
> +	while (pending) {
> +		irq_hw_number_t hwirq =3D __ffs(pending);
> +		int ret;
> +
> +		ret =3D generic_handle_domain_irq(csr->domain, hwirq);
> +		if (ret)
> +			pr_err_ratelimited("xilinx-smmu-csr: Failed to handle domain IRQ %lu:=
 %d\n",
> +					   hwirq, ret);

If an unmapped interrupt fires, generic_handle_domain_irq() will fail with
-EINVAL and log this error. Because the driver cannot ACK an unmapped
interrupt, the bit remains set in the ISR. Does this result in permanent
ratelimited log spam and wasted CPU cycles on every subsequent valid
interrupt?

> +
> +		pending &=3D ~BIT(hwirq);
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
[ ... ]
> +static int __init xilinx_smmu_csr_init(struct device_node *node, struct =
device_node *parent)
> +{
[ ... ]
> +	/* Start from a known state: all sources disabled, latches cleared. */
> +	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_IDR);
> +	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_ISR);

[Severity: High]
SMMU_INTR_ALL omits bit 1 (CMDQ_SYNC). If a prior boot stage left CMDQ_SYNC
enabled or pending, doesn't writing only SMMU_INTR_ALL fail to disable and
clear it, setting up the interrupt storm described above?

> +
> +	csr->domain =3D irq_domain_create_linear(of_fwnode_handle(node), SMMU_C=
SR_IRQ_NR,
> +					       &xilinx_smmu_csr_domain_ops,
> +					       csr);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-smmu-chang=
es-v2-v2-0-adda681ab983@amd.com?part=3D2
