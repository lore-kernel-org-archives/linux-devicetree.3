Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840196;
	b=5lbjUxUsq1V7Smk6cSfQ+PoSpoFQxjopn7XsZ8rn2CHxoJaR1NNzsOSthYqmDXnO+q7U
	 j3TuSONQnCVu1MKX0aTOwEaMNAhwFiBtFrj3AwzZn5Htijyv65AklKXITuK+bklw8wM8q
	 0I/YwBfNFHeV3ImhwDLpZk8VDG81tA+CVsyjeeKMnFA1XVYK8OjcYkVboQ4lYeZvyJ7Bi
	 wirBs6JeYXLNs6cSxIts3f6SqfhGETC0k1HE8BZyO7kpVoykhdjfWtOinQG6U9SfbDcnP
	 CNl/uXD2azOskC2b60gR2lYMTLaI9pwE6B0E3hhLm6rmPnABZBC9rNnC0otjVaVP/+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vj6y2xt+jDOqCWqq4J2HcTwd0S87PQDfZTUTIz42RsU=;
	b=3NzsJ9ceI8aMesYbXaPBuMlK0vWeiCm2wt0S5UyDepHaIfSqB5YG6JZD+40wGwi2I8JT
	 p0QnpwPqgIVaEOOoLMcXS/c9aS3mit2/QGjFF034HGJBr2facI1UmyIkjWZecWZulfmk+
	 bp7/KHOEaCdyc22mNJZ7+LQxdLsciSutW2vrvSWyzBqRRic3BGMIAw/BQCYMfep6x+0Eu
	 bDEUjohGiAk/nJfFeFiHXd4rJMB9EPsp8Yv2UgZt3mUsEFjoJMje5A+Pl1HT6efufrA/B
	 D2in/vFhwFI22e3g/B/eDtEHL7mxJd/kKYeJCrccxi41NqVgRDuDvQcb5LE2iba1YNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iab2fnWv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05717606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iab2fnWv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E4B1F000C4;
	Mon, 16 Nov 2026 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840195;
	bh=Vj6y2xt+jDOqCWqq4J2HcTwd0S87PQDfZTUTIz42RsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iab2fnWvf9bHydAPAC43kmQKquoBhdc46RMjbEqiWDzNe34c5tHgCrtUB85xFtC+U
	 VoFzWkyJzszjdCG44qqlVGvdZOMzKybLbMB+EyEpedyqm9BvlDXJBEPpJVgzlpAB2j
	 At1s6YkwmmOB7rSP4gzKs0B1ZWKE7p7sv2DSRDo1rtLASw8VcJxf3Wof9dYzdpayGE
	 nJPVIAGzXZbwiUoTa7Lse3rWvYtdDnFN/cYN7lPKSSmZFSHgUrQ6maNyCGgF5txzS2
	 f/NKnKh4/WtZa/kCm7tpdCZysZgg0feYB8ScNLNPutc59td5wfFXVW4fNzjvnBDJzT
	 IP7kdFfz9Y27A==
Message-ID: <sashiko-outbox-217188@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-eyeq5_msi-v4-2-2e1233b014b0@bootlin.com>
References: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
 <20261116-eyeq5_msi-v4-2-2e1233b014b0@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 14:43:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] irqchip/eyeq5-msi: lost and unmasked interrupts in
  eyeq_msi_isr()
--

commit ecbaf749e93a909382eba764dafb43426071620b
Author: Gregory CLEMENT <gregory.clement@bootlin.com>

irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver

This commit adds an irqchip driver for the Mobileye EyeQ5 PCIe MSI
controller, supporting both root complex PCI MSI and endpoint platform MSI
roles.

> diff --git a/drivers/irqchip/irq-eyeq5-msi.c b/drivers/irqchip/irq-eyeq5-=
msi.c
> new file mode 100644
> index 0000000000000..823dfb0b00b5b
> --- /dev/null
> +++ b/drivers/irqchip/irq-eyeq5-msi.c
[ ... ]
> +static struct irq_chip eyeq_msi_irq_chip =3D {
> +	.name			=3D "EyeQ5-MSI",
> +	.irq_mask		=3D eyeq_msi_mask_irq,
> +	.irq_unmask		=3D eyeq_msi_unmask_irq,
> +	.irq_ack		=3D eyeq_msi_ack_irq,
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
> +	guard_chained_irq(parent_chip, desc);
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
> +}

[Severity: Medium]
Can eyeq_msi_isr() lose interrupts that arrive while a vector is lazily
disabled, and dispatch vectors that are masked in GCSR_IRQMASK?

eyeq_msi_domain_alloc() sets handle_edge_irq without IRQ_DISABLE_UNLAZY or
an .irq_disable callback.  When an MSI arrives after disable_irq(),
eyeq_msi_isr() clears its bit in GCSR_IRQSTATUS before handle_edge_irq()
records IRQS_PENDING and masks GCSR_IRQMASK.  Because eyeq_msi_irq_chip
has no .irq_retrigger callback and neither EYEQ5_MSI nor MIPS selects
HARDIRQS_SW_RESEND, enable_irq() -> check_irq_resend() cannot replay
IRQS_PENDING and the interrupt is lost.

In addition, eyeq_msi_isr() does not mask pending with the enabled bits in
GCSR_IRQMASK before clearing GCSR_IRQSTATUS and calling
generic_handle_demux_domain_irq().  If a masked vector latches in
GCSR_IRQSTATUS, a sibling vector firing will clear and dispatch the masked
vector (for example re-entering a masked IRQF_ONESHOT threaded handler,
since handle_edge_irq() checks irq_can_handle() rather than
irqd_irq_masked()), or repeated writes to a masked vector can keep the
while (true) loop spinning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-eyeq5_msi-=
v4-0-2e1233b014b0@bootlin.com?part=3D2
