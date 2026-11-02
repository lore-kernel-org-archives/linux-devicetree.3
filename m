Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641168;
	b=dJbxoH0IfuMipVwtNuNQ00a5O33uCiXZbpWTfF7RBXC8StI6M9lqtJy4BGr/DIht9f5m
	 0B2/uf22/k/53OrYkcIoF1seGyp7gdl4dbCnEpgEpqU+CWmwrEcB5V4aFbGYd1NsU5/ku
	 ApV331+ZzVCYPF1iyhPL++fV4yLUmTfxQmaptbAbF4qwUEx9Utkelr0mONjpASnlFfBmE
	 geJ9yiz18EjhPe2jE7wc5eEOyWzFk6NUmmC1VxAqZmupQQK67Kf60musIjfHFdYynNTJx
	 DFRkhUE3wMJRTYqdsI4OFrOwwKmWfiJGT9BtviccjbyVywu/ofPrDW8p7pgE/xt9y0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641168;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+7+4IMRdMxmFxGsdZZXQ2dV8IPYm9HQmmQNy06t/kBU=;
	b=EQNAt/mC8wp+wz6SxVNdnfskV29eWegWKbj6zIibIp8idnR2NfsDiE/KltiiHTNqMCcb
	 x70R1jq8bU+logaNc2aWpa4BAKanZzlLAUHMlY145WEZOCstfbfv0WuYOlNuXxFOJI3ES
	 vCJz+t7FFv2nVKcerxggdHWD+vEBfi9MITaXTaSWIXr+u2H5WmbYsx/Xj/crmr+2MvOsm
	 /5QjY84GjIzQ5Vnm2dAwLXL968G1mzCrVWfgQavKR150vzUXbL1gBVlmU4aCuoAGD1+zy
	 sTm+1ckCm+GhSZqnsC2Q0JncznPvkygarE3behlWITpnnMqnmmOgEDwaFAhTvHdvyaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9o+tPuN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB77606A923
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9o+tPuN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214FA1F00A18;
	Mon,  2 Nov 2026 17:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793641167;
	bh=+7+4IMRdMxmFxGsdZZXQ2dV8IPYm9HQmmQNy06t/kBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I9o+tPuNw9IS6/mEEDBzdEHY5jB0MVoiCXuzmuKV95jMW0MuLqj79sytYVRTFqKCZ
	 e7RBMHaldS6nQVhnH3Um/CL6Fj1q0TQr6d7h8Mx3+mNp1OTDj/RvnJNRy00HusOmDg
	 fxcH5R6XT87D5znEZH0u1GkypkAYtpHle7Z9DJJr/5kkt0q8ZzpUc8GdZ3iq947VLM
	 6syzfv6DydH1GHwVZDFMeX8NRCvCbM6Krlej6kgoAnpeiuTcJWU4sWcMEROTJVAIKw
	 uCnvvOuKol+11+N95dFIE/ssHrOjVGSvNXV8p0os9SrrNMQEmvHRm7e3GyDbOrPUqo
	 FGCpQG+wi7gWQ==
Message-ID: <sashiko-outbox-193852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-eyeq5_msi-v2-2-4aa3d3608064@bootlin.com>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
 <20261102-eyeq5_msi-v2-2-4aa3d3608064@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:39:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] irqchip: eyeq5-msi: wrong flow handler in eyeq_msi_domain_alloc()
--

commit 6649bd5a917b478cbaaf4b595ae6e980b906705c
Author: Gregory CLEMENT <gregory.clement@bootlin.com>

irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver

This commit adds an interrupt controller driver for the Mobileye EyeQ5 PCIe
MSI snooper, supporting up to 4 MSI vectors per port in either root complex
(PCI MSI parent) or endpoint (platform MSI parent) mode.

> diff --git a/drivers/irqchip/irq-eyeq5-msi.c b/drivers/irqchip/irq-eyeq5-=
msi.c
> new file mode 100644
> index 0000000000000..f56e130393cb2
> --- /dev/null
> +++ b/drivers/irqchip/irq-eyeq5-msi.c

[ ... ]

> +static struct irq_chip eyeq_msi_irq_chip =3D {
> +	.name			=3D "EyeQ5-MSI",
> +	.irq_mask		=3D eyeq_msi_mask_irq,
> +	.irq_unmask		=3D eyeq_msi_unmask_irq,
> +	.irq_compose_msi_msg	=3D eyeq_msi_compose_msg,
> +#ifdef CONFIG_SMP
> +	.irq_set_affinity	=3D irq_chip_redirect_set_affinity,
> +#endif
> +};
> +
> +static void eyeq_msi_isr(struct irq_desc *desc)
> +{
> +	struct irq_chip *parent_chip =3D irq_desc_get_chip(desc);
> +	struct eyeq_msi *msi =3D irq_desc_get_handler_data(desc);
> +	void __iomem *status_reg;
> +	unsigned long pending;
> +	unsigned int bit;
> +
> +	chained_irq_enter(parent_chip, desc);
> +
> +	status_reg =3D msi->gcsr_base + GCSR_IRQSTATUS;
> +
> +	while (true) {
> +		pending =3D FIELD_GET(GCSR_IRQSTATUS_MASK, readw(status_reg));
> +		if (!pending)
> +			break;
> +
> +		/*
> +		 * Write-one-to-clear status register.
> +		 */
> +		writew(FIELD_PREP(GCSR_IRQSTATUS_MASK, pending), status_reg);
> +
> +		for_each_set_bit(bit, &pending, EYEQ_MSI_MAX_VECTORS) {
> +			if (!generic_handle_demux_domain_irq(msi->msi_domain, bit))
> +				pr_err_ratelimited("unmapped MSI interrupt %u\n", bit);
> +		}
> +	}
> +
> +	chained_irq_exit(parent_chip, desc);
> +}
> +
> +static int eyeq_msi_domain_alloc(struct irq_domain *domain, unsigned int=
 virq,
> +				 unsigned int nr_irqs, void *args)
> +{

[ ... ]

> +	i =3D 0;
> +	for_each_set_bit(bit, reserved, EYEQ_MSI_MAX_VECTORS) {
> +		irq_domain_set_info(domain, virq + i++, bit, &eyeq_msi_irq_chip,
> +				    msi, handle_simple_irq, NULL, NULL);
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Should eyeq_msi_domain_alloc() in drivers/irqchip/irq-eyeq5-msi.c configure
handle_edge_irq (along with an ack/pre_redirect callback on
eyeq_msi_irq_chip) instead of handle_simple_irq?

Using handle_simple_irq here appears to cause two issues when MSI interrupts
are dispatched through eyeq_msi_isr() -> generic_handle_demux_domain_irq():

First, neither eyeq_msi_irq_chip nor the child MSI chip templates configured
via msi_lib_init_dev_msi_info() implement .irq_disable, and
IRQ_DISABLE_UNLAZY is not set. When a consumer calls disable_irq() or
disable_irq_nosync(), irq_disable() -> __irq_disable() only sets
IRQD_IRQ_DISABLED in software and leaves the vector unmasked in
GCSR_IRQMASK, relying on the flow handler to mask the hardware line if an
interrupt fires while disabled.

When an MSI arrives while disabled, eyeq_msi_isr() clears GCSR_IRQSTATUS and
dispatches to handle_simple_irq():

kernel/irq/chip.c:handle_simple_irq() {
	guard(raw_spinlock)(&desc->lock);

	if (!irq_can_handle_pm(desc))
		return;

	if (!irq_can_handle_actions(desc)) {
		if (irqd_needs_resend_when_in_progress(&desc->irq_data))
			desc->istate |=3D IRQS_PENDING;
		return;
	}
	...
}

Because handle_simple_irq() returns without calling mask_irq(),
eyeq_msi_mask_irq() is never invoked, GCSR_IRQMASK remains unmasked, and
subsequent MSI writes while disabled will keep raising the parent GIC
interrupt and queueing cross-CPU redirect irq_work.

Second, eyeq_msi_isr() clears GCSR_IRQSTATUS before dispatching the vector
and exits chained_irq_exit(), while the target CPU runs handle_simple_irq()
-> handle_irq_event() with IRQD_IRQ_INPROGRESS set and desc->lock released.

If another MSI for the same vector arrives on a different CPU while
IRQD_IRQ_INPROGRESS is set (for example across an affinity change or when
effective_affinity spans multiple CPUs), handle_simple_irq() checks
irq_can_handle_pm():

kernel/irq/chip.c:irq_can_handle_pm() {
	if (irqd_irq_inprogress(&d->irq_data) && d->handle_irq !=3D handle_edge_ir=
q)
		return false;
	...
}

Since desc->handle_irq is not handle_edge_irq and
irqd_needs_resend_when_in_progress() is not set, handle_simple_irq() returns
without marking IRQS_PENDING or looping in handle_irq_event(), dropping the
second MSI interrupt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-eyeq5_msi-=
v2-0-4aa3d3608064@bootlin.com?part=3D2
