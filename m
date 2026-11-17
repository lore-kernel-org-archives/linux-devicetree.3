Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948734;
	b=cuN/6tWN1q1iU4TLtaUQ2zlAemiIg9Dh6qwFRDqOACYdEIZnxlkDRzafjfMaIXMFm8wl
	 WHDeKT6ETF56m8sPieMMaOCKD3R1TmmiPtFIA6auYA6eSDCcvx+Pd/Kj8Qghk2ULB/1A1
	 JJI/lIe6liSmMtH7Q4xjB+fQ/yybeb4dHiGY+kf5CWkdexJJlohagGYTXua6ZsaARtSTx
	 H7Xj8JhO1IRRbN7C0gXutVRXK3Oh5J3JycIYnvmCoxhnJstGfQR3rXRIqow5GCy8iIFK0
	 lbi47ak99oCZZyvGiNaoX1BUkW+Ncf6t89lMmWTep+lNP3V5NYFzd28+bF1G9TBGkFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qR4YTCRl+SUoV0TzOLZOa+5dovXafk3OxLj0xK/t+0Q=;
	b=hW3dSNBTAhmb9KLoZfdr3QfRlCcm4c/LxivY9TYs1qKLEvTF0P/kHoMiyqMmwei3jQPD
	 DSoqHGghhuBAvol+3nbxXWyleLPMIrYoc2295CGny1lga/r32hTtmxBX420NhLwPwoFkf
	 +XGw8VWp3qfNXp6NpaB2K/q4x9KXKGHtTdVCW9JpqbXH8w6pHiyediuNrWsF8+lhH8nOc
	 E4IrJwwscKbfMW/v4msB8EXs1v9u4E5kHu5d9d7H5op4ZNVwEbaMFGTjhsAwx3OajIKg8
	 u5pbB9gNlnoI4yVzTlk5GIsTm1YNqcnJWflOjAvwRyoYyaD/LYEWomWxERvROZ91TxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlHksZgA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC78D606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 20:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlHksZgA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED631F000C4;
	Tue, 17 Nov 2026 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794948734;
	bh=qR4YTCRl+SUoV0TzOLZOa+5dovXafk3OxLj0xK/t+0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UlHksZgA1iKKI1gW3EK2zUiBhMPAF+5rt3Z3zBzJmUjNx5M0yva5uhbHNQQTiPRaB
	 oCLNAp1Vazz247VRfgBCd1oJGmzSVpSHEBhDZNHGRnqEaF+kJOIE8KQGvr0NgOwMAP
	 CmshGK35zyrKZxb9pzO8X5+9WGjurB3yZK77vbTuMDnrRboYbhAIZUpzIgpeM9NrQd
	 xkgIsSTKlwQteGY1eM4KJbEG2ybevaF6hL+THhDhDoryKJ2nxQw0Pz5DGz8nmB+D/Q
	 3CNKCnLQ4pKvPW1p5wotaBz9lfcp9a3LtGDj8bf8ZwDqsmfjQzGgYReJlYi6O1y3pl
	 +zPspg5aZs4wA==
Message-ID: <sashiko-outbox-219661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-cs75xx-intc-v4-2-0a678f35e5f3@gmail.com>
References: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
 <20261117-cs75xx-intc-v4-2-0a678f35e5f3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 20:52:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] irqchip: CS75XX_INTC uses undefined ARCH_CORTINA_ACCESS and
  lacks HAS_IOMEM
- [Medium] irqchip: cs75xx: missing IRQ_LEVEL and wrong IRQ_NOPROBE in
  cs75xx_intc_init()
- [Medium] irqchip: cs75xx: leaked MMIO region reservation in
  cs75xx_intc_init()
--

commit 57fad06ce5781b2c6a356fbbe01aad10d8c69bd9
Author: Fil Dunsky <filipp.dunsky@gmail.com>

irqchip: Add Cortina Systems CS75xx peripheral interrupt controller

This commit adds a chained interrupt controller driver for the low-speed
peripheral interrupt combiner on Cortina Systems CS75xx SoCs.

> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 136bab41f8011..db5edd4ec0927 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -187,6 +187,18 @@ config BRCMSTB_L2_IRQ
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN
> =20
> +config CS75XX_INTC
> +	bool "Cortina Systems CS75xx peripheral interrupt controller"
> +	depends on ARCH_CORTINA_ACCESS || COMPILE_TEST
> +	default ARCH_CORTINA_ACCESS
> +	select GENERIC_IRQ_CHIP
> +	select IRQ_DOMAIN

[Severity: Medium]
Is ARCH_CORTINA_ACCESS defined anywhere in the tree, and does CS75XX_INTC
need to depend on HAS_IOMEM?

Because ARCH_CORTINA_ACCESS is not defined in any Kconfig file,
CS75XX_INTC cannot be enabled without COMPILE_TEST and its default always
evaluates to n.  In addition, enabling CS75XX_INTC under COMPILE_TEST on
architectures without HAS_IOMEM (such as s390 with PCI disabled) fails to
build in cs75xx_intc_init() due to an implicit declaration of iounmap().

[ ... ]

> diff --git a/drivers/irqchip/irq-cs75xx.c b/drivers/irqchip/irq-cs75xx.c
> new file mode 100644
> index 0000000000000..f3d71b06c59de
> --- /dev/null
> +++ b/drivers/irqchip/irq-cs75xx.c
> @@ -0,0 +1,100 @@

[ ... ]

> +static int __init cs75xx_intc_init(struct device_node *np, struct device=
_node *parent)
> +{
> +	struct irq_chip_generic *gc;
> +	struct irq_domain *domain;
> +	void __iomem *base;
> +	int parent_irq;
> +	int ret;
> +
> +	base =3D of_io_request_and_map(np, 0, of_node_full_name(np));
> +	if (IS_ERR(base)) {
> +		pr_err("%pOF: unable to map registers\n", np);
> +		return PTR_ERR(base);
> +	}
> +
> +	/* Mask everything before the chained handler is installed */
> +	writel(0, base + CS75XX_INTC_ENABLE);
> +
> +	parent_irq =3D irq_of_parse_and_map(np, 0);
> +	if (!parent_irq) {
> +		pr_err("%pOF: unable to map parent interrupt\n", np);
> +		ret =3D -EINVAL;
> +		goto err_unmap;
> +	}
> +
> +	domain =3D irq_domain_create_linear(of_fwnode_handle(np), CS75XX_INTC_N=
R_IRQS,
> +					  &irq_generic_chip_ops, NULL);
> +	if (!domain) {
> +		ret =3D -ENOMEM;
> +		goto err_dispose;
> +	}
> +
> +	ret =3D irq_alloc_domain_generic_chips(domain, CS75XX_INTC_NR_IRQS, 1, =
"cs75xx-intc",
> +					     handle_level_irq, IRQ_NOREQUEST | IRQ_NOPROBE, 0,
> +					     IRQ_GC_INIT_MASK_CACHE);

[Severity: Medium]
Should irq_alloc_domain_generic_chips() set IRQ_LEVEL | IRQ_NOPROBE in the
set argument instead of passing 0 and clearing IRQ_NOPROBE?

Because the interrupt specifiers have no trigger type cell and the chip
does not implement .irq_set_type(), leaving IRQ_LEVEL out of the set flags
means _IRQ_LEVEL and IRQD_LEVEL are never set on the mapped descriptors.
As a result, check_irq_resend() treats these level interrupts as
edge-triggered during enable_irq() and schedules software resends via
irq_sw_resend().  Passing IRQ_NOPROBE in the clear mask also makes the
interrupts probeable instead of preventing probing.

> +	if (ret)
> +		goto err_domain;
> +
> +	gc =3D irq_get_domain_generic_chip(domain, 0);
> +	gc->reg_base =3D base;
> +	gc->chip_types[0].regs.mask =3D CS75XX_INTC_ENABLE;
> +	gc->chip_types[0].chip.irq_mask =3D irq_gc_mask_clr_bit;
> +	gc->chip_types[0].chip.irq_unmask =3D irq_gc_mask_set_bit;
> +
> +	irq_set_chained_handler_and_data(parent_irq, cs75xx_intc_handler, domai=
n);
> +
> +	return 0;
> +
> +err_domain:
> +	irq_domain_remove(domain);
> +err_dispose:
> +	irq_dispose_mapping(parent_irq);
> +err_unmap:
> +	iounmap(base);
> +	return ret;
> +}

[Severity: Medium]
Does the err_unmap path leak the memory region reserved by
of_io_request_and_map()?

of_io_request_and_map() reserves the physical range via
request_mem_region() before mapping it, and iounmap() only drops the
virtual mapping, leaving the region permanently reserved in iomem_resource
if initialization fails.  Using of_iomap() or releasing the region on
error would avoid the leak.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cs75xx-int=
c-v4-0-0a678f35e5f3@gmail.com?part=3D2
