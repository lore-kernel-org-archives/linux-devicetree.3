Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204552;
	b=ZAESxKKSmppgo0t6HCgNadaCk+gV5vsLA/nsGekkPsHIygs75fp3sBudpahgV4Q4drvS
	 oHmRGcqviq0m+ehQEQoYWxYU1UXtAtHJN1AHIMKJ2pPJuGyGUV82j56lVVAyqGHbCTm4m
	 Bm4CFJ0mh06+5JQZCpyv0h9cNDPj0CIFsQibCvP2rmiVPwoYmBQj87SItf52uNexaZ6Rm
	 xmAI9yEi6hfTN//RPw11RbKYZXueCH3r95SsP3iNXkZ5bcdpgmuX9q5p0yQN8rYj4GwpK
	 qCkJlQTKmrjY4G42KCddPKGF3rbD5iLdZkiEXlsEVEdaqXh/iuhC07VMFujYoz4FrKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204552;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rCUFNrmLjL5v7vgCgquImBDIg3i3ca/i9ZYGxGfePyw=;
	b=fXWpqm71akWWsiIpFmUeoFdFLeO/WsyrmGpb//qwESRESZUuTNJW4bp/dx/RFYNX6tP/
	 73ZPj7ZU4M4VdCBy6nYqSHBwZa4qPzqwgBW4yA25rsGz6DEaFCaGUYxyEURt+C6x7D7jm
	 kPCcO1fSnl+Q3bFvYY+CcFeLRIF4N5MMho2EtpE1d7lYKki7xeJduzBrFu41Krbuz1djU
	 twC0Wj5Wr44s6k7RMbcHS/0VuO7KTwskW4j9ODUD4MWrXx+T4tqWhiyqszjm48xcf2AUN
	 czWzE1BQa2c1HYP0EPYwCszzMdRhNmReN2IdppB1j4AmznHCpelZrF5h5jBdV238/3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpUzNkob;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5F606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpUzNkob
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A98C1F01825;
	Wed, 28 Oct 2026 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793204551;
	bh=rCUFNrmLjL5v7vgCgquImBDIg3i3ca/i9ZYGxGfePyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mpUzNkobnEJCtj914LgTDu3GvEbLN2Qd7OiGiXQjbij8q67fgiFwaQjz30AA13OiD
	 5uzQZWqaKge62rGFno2fAwJqj3mvZMoolxAPzOXA0aWIBTb+0cRfl7WgYY7kDrnNSY
	 9HUaP4afN253n7Mmv3zVTOFhqmWbd/PwM3Khb+P8+R5wTBwL0BnciNwZMuzf/DhnjZ
	 i5BSGokW5T5lne+odFigeHWMUMOGu2FHZXQAIXOtI/ZFsA6TJ4KiH6indK6qbeaYhq
	 UQH9qPEkFIlaXnDV0N5PqnW0nHEaiuaJGTzq4Xp7aNC5lwL9p5yCQsX5qGAR6YBTpW
	 uXy3RGMS4wxpg==
Message-ID: <sashiko-outbox-188159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-eyeq5_msi-v1-2-c464752fb55f@bootlin.com>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
 <20261028-eyeq5_msi-v1-2-c464752fb55f@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 16:22:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] irqchip/eyeq5-msi: drop incompatible MSI_FLAG_MULTI_PCI_MSI suppor=
t flag
- [High] irqchip/eyeq5-msi: fix parent MSI masking and premature alloc unma=
sking
- [Medium] irqchip/eyeq5-msi: handle of_irq_get() returning 0 in eyeq_msi_o=
f_init()
--

commit 7c85e9bc1468e131430bc5eb933cf75febaa03f7
Author: Gregory CLEMENT <gregory.clement@bootlin.com>

irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver

This commit adds an irqchip driver for the Mobileye EyeQ5 PCIe MSI snooper
controller, supporting up to 4 vectors per port in both root complex mode
(as a PCI MSI parent) and endpoint mode (as a platform MSI parent).

> diff --git a/drivers/irqchip/irq-eyeq5-msi.c b/drivers/irqchip/irq-eyeq5-=
msi.c
> new file mode 100644
> index 0000000000000..883b6d63c9882
> --- /dev/null
> +++ b/drivers/irqchip/irq-eyeq5-msi.c
> @@ -0,0 +1,474 @@

[ ... ]

> +static void eyeq_msi_compose_msg(struct irq_data *data, struct msi_msg *=
msg)
> +{
> +	struct eyeq_msi *msi =3D irq_data_get_irq_chip_data(data);
> +	phys_addr_t address;
> +
> +	memset(msg, 0, sizeof(*msg));
> +
> +	address =3D msi->vector_phys + data->hwirq * EYEQ_MSI_VECTOR_STRIDE;
> +
> +	msg->address_lo =3D lower_32_bits(address);
> +	msg->address_hi =3D upper_32_bits(address);
> +	msg->data =3D data->hwirq;
> +}
> +
> +static struct irq_chip eyeq_msi_irq_chip =3D {
> +	.name			=3D "EyeQ5-MSI",
> +	.irq_mask		=3D eyeq_msi_mask_irq,
> +	.irq_unmask		=3D eyeq_msi_unmask_irq,
> +	.irq_compose_msi_msg	=3D eyeq_msi_compose_msg,
> +};

[ ... ]

> +static int eyeq_msi_domain_alloc(struct irq_domain *domain,
> +				 unsigned int virq,
> +				 unsigned int nr_irqs,
> +				 void *args)
> +{
> +	struct eyeq_msi *msi =3D domain->host_data;
> +	DECLARE_BITMAP(reserved, EYEQ_MSI_MAX_VECTORS);
> +	unsigned long bit =3D 0;
> +	unsigned int i;
> +
> +	bitmap_zero(reserved, EYEQ_MSI_MAX_VECTORS);
> +
> +	scoped_guard(raw_spinlock_irqsave, &msi->lock) {
> +		for (i =3D 0; i < nr_irqs; i++) {
> +			bit =3D find_next_zero_bit(msi->used, msi->num_vectors, bit);
> +			if (bit >=3D msi->num_vectors) {
> +				/*
> +				 * Roll back this call's allocations: on error the
> +				 * core does not call .free().
> +				 */
> +				for_each_set_bit(bit, reserved,
> +						 EYEQ_MSI_MAX_VECTORS) {
> +					clear_bit(bit, msi->used);
> +					__eyeq_msi_mask_irq(msi, bit);
> +				}
> +
> +				return -ENOSPC;
> +			}
> +
> +			set_bit(bit, msi->used);
> +			__eyeq_msi_unmask_irq(msi, bit);
> +			set_bit(bit, reserved);
> +			bit++;
> +		}
> +	}
> +
> +	i =3D 0;
> +	for_each_set_bit(bit, reserved, EYEQ_MSI_MAX_VECTORS)
> +		irq_domain_set_info(domain, virq + i++, bit,
> +				    &eyeq_msi_irq_chip, msi,
> +				    handle_simple_irq, NULL, NULL);
> +
> +	return 0;
> +}

[ ... ]

> +#define EYEQ_MSI_FLAGS_REQUIRED			\
> +	(MSI_FLAG_USE_DEF_DOM_OPS |		\
> +	 MSI_FLAG_USE_DEF_CHIP_OPS |		\
> +	 MSI_FLAG_NO_AFFINITY)

[Severity: High]
Should EYEQ_MSI_FLAGS_REQUIRED include MSI_FLAG_PCI_MSI_MASK_PARENT, and
should GCSR_IRQMASK be managed by the irq_chip mask/unmask callbacks rather
than unmasking inside eyeq_msi_domain_alloc()?

In msi_lib_init_dev_msi_info(), the child PCI MSI and MSI-X irq_chip only
wires irq_mask and irq_unmask (as well as cond_startup_parent() and
cond_shutdown_parent()) to the parent domain when
MSI_FLAG_PCI_MSI_MASK_PARENT is set:

drivers/irqchip/irq-msi-lib.c:msi_lib_init_dev_msi_info() {
    ...
	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
		chip->irq_mask		=3D irq_chip_mask_parent;
		chip->irq_unmask	=3D irq_chip_unmask_parent;
	}
    ...
}

Without MSI_FLAG_PCI_MSI_MASK_PARENT in EYEQ_MSI_FLAGS_REQUIRED,
eyeq_msi_mask_irq() and eyeq_msi_unmask_irq() are never called in root
complex mode, so disable_irq() and free_irq() cannot mask the interrupt in
GCSR_IRQMASK when a PCI device does not support optional per-vector MSI
masking in PCI config space. (Note that msi_lib_init_dev_msi_info()
automatically strips MSI_FLAG_PCI_MSI_MASK_PARENT for DOMAIN_BUS_DEVICE_MSI
in endpoint mode.)

In addition, calling __eyeq_msi_unmask_irq(msi, bit) inside
eyeq_msi_domain_alloc() unmasks the vector in GCSR_IRQMASK before
irq_domain_set_info() configures the virq, before irq_domain_insert_irq()
populates msi->msi_domain->revmap, and before request_irq() is called.
Similarly, eyeq_msi_program_hardware() does not initialize GCSR_IRQMASK to
mask all vectors or clear stale pending bits in GCSR_IRQSTATUS before
eyeq_msi_of_init() installs eyeq_msi_isr(), allowing interrupts that arrive
before revmap insertion (or after revmap removal in irq_domain_free_irqs())
to be dropped as unmapped.

> +
> +#define EYEQ_MSI_FLAGS_SUPPORTED		\
> +	(MSI_FLAG_MULTI_PCI_MSI |		\
> +	 MSI_FLAG_PCI_MSIX |			\
> +	 MSI_GENERIC_FLAGS_MASK)

[Severity: High]
Can this controller support MSI_FLAG_MULTI_PCI_MSI when the snooper decodes
the vector number from TLP address bits [4:3]?

In eyeq_msi_compose_msg(), each vector hwirq requires a distinct doorbell
address:

	address =3D msi->vector_phys + data->hwirq * EYEQ_MSI_VECTOR_STRIDE;

However, a PCI device using Multi-MSI (as opposed to MSI-X) has only a
single MSI Message Address register in its PCI MSI capability structure and
writes all vectors to that one address, varying only the low-order bits of
Message Data. Correspondingly, pci_msi_domain_write_msg() only writes the
first vector's composed message to the device:

drivers/pci/msi/irqdomain.c:pci_msi_domain_write_msg() {
	...
	/*
	 * For MSI-X desc->irq is always equal to irq_data->irq. For
	 * MSI only the first interrupt of MULTI MSI passes the test.
	 */
	if (desc->irq =3D=3D irq_data->irq)
		__pci_write_msi_msg(desc, msg);
}

When a PCI device requests multiple MSI vectors in root complex mode,
advertising MSI_FLAG_MULTI_PCI_MSI allows Multi-MSI to be enabled, but all
MSI writes from the device will target the first vector's doorbell address
and trigger only the first allocated vector while the remaining vectors
never fire. Should MSI_FLAG_MULTI_PCI_MSI be dropped from
EYEQ_MSI_FLAGS_SUPPORTED?

[ ... ]

> +static int __init eyeq_msi_of_init(struct device_node *node,
> +				   struct device_node *parent)
> +{

[ ... ]

> +	ret =3D eyeq_msi_parse_dt(msi, node);
> +	if (ret)
> +		goto err_unmap_msi;
> +
> +	msi->irq =3D of_irq_get(node, 0);
> +	if (msi->irq < 0) {
> +		ret =3D msi->irq;
> +		pr_err("failed to obtain parent IRQ: %d\n", ret);
> +		goto err_unmap_msi;
> +	}

[Severity: Medium]
What happens if of_irq_get() returns 0 when irq_create_of_mapping() fails?

In of_irq_get(), a failure in irq_create_of_mapping() returns 0 rather than
a negative error code:

drivers/of/irq.c:of_irq_get() {
    ...
	rc =3D irq_create_of_mapping(&oirq);
out:
	of_node_put(oirq.np);

	return rc;
}

Checking only msi->irq < 0 lets a 0 return value proceed, skipping the
err_unmap_msi cleanup of msi->msi_base, msi->gcsr_base, and msi and passing
IRQ 0 to irq_set_chained_handler_and_data(). Should this check msi->irq <=
=3D 0
(and set ret =3D msi->irq ?: -EINVAL)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-eyeq5_msi-=
v1-0-c464752fb55f@bootlin.com?part=3D2
