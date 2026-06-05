Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF293793D3
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693609; cv=none; b=b7xAfhOjT9Z+5sUZDJR6exIFONmf8V4w7x/LZsNh2fm9A6oZlsPM37ekG7QrUMQR9PaWIg2+3djlOSYxQZQVUA5RA2IaBjBqxFmn3+AVB5G6aFJ1RczGUzlRWswJsGnAA52Qu4EMk9i2bFkDWIIzsrllGIgCzJTggwPuni/iZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693609; c=relaxed/simple;
	bh=61rte7MaSOzDqtspHsJpDJ5+BXLasL5lob6X8WuR33A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RJMbw+shVHP1Q6Bv/dGAlNVoz+HXrfzhNtNutxC/1ExjuKUNN8aV+D70i4PhhG3eS2mkG2vv7EwgGwQgJ5qkylOGrxOXx7EbUheXsLPGG+x3Ji6xHXOlXWJ/8nszddD0v/+bkguFSroHqGlCv2LfZ1qZBbdO0WWdXuYWjhCmKU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJ6bVCNs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJ6bVCNs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC881F00893;
	Fri,  5 Jun 2026 21:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693608;
	bh=whS1d7nXkDw4zoSVbsdVYePWFmhD14nc3iG2yQJsTy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJ6bVCNs6kV7tumb87QQO/8z3haM3zXwLt0zDzlD4LRMF928tyTXaKDlwnLDO4g3J
	 WmNPwuyX6OWu53/tr4tl3YG/JstDdD66oPc9rtM0GmlsO+fw2F3GSSinBFdj4EkYi8
	 qjM74FqNIBS2bbqXmjdPd+OyjLaUb2t50tb7J3+X3mCEFQDLCFrA5t9kZHVU8nOPsm
	 BwKzHL4BqAHs2Q0Kx//7LXS61m9zPT4Iq7RamB2mlcrgwykntv3fAAtEqFf6qOuDJY
	 TSVLwMmhvyha0zwnUKFrzwH5OJlMKZ3G+xGxIgFJzdFxhGmtHyCZB8YIIg9mxCCinY
	 PM3z2qixXAnSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: omap: dra7: Use new property name
 ti,crossbar-irqs-reserved
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260606-crossbar-v1-3-f67f7cb9ee50@gmail.com>
References: <20260606-crossbar-v1-3-f67f7cb9ee50@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:06:47 +0000
Message-Id: <20260605210647.CCC881F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] crossbar_domain_free() uses the crossbar source index (d->hwir=
q) to index into the GIC SPI array (cb->irq_map) and register offsets array=
, causing an out-of-bounds write and hardware misconfiguration.
- [High] allocate_gic_irq() modifies cb->irq_map[i] on its error path witho=
ut holding the required cb->lock.
--

commit 8a92634d55db2a355eaab894b32aa94e0464f39a
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

ARM: dts: omap: dra7: Use new property name ti,crossbar-irqs-reserved
   =20
Property name for irq-crossbar 'ti,irqs-reserved' is updated to
'ti,crossbar-irqs-reserved' by new binding conversion.

> diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/o=
map/dra7.dtsi
> index 711ce4c31bb1f..80bee3db3a532 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> @@ -866,7 +866,7 @@ crossbar_mpu: crossbar@4a002a48 {
>  			ti,max-irqs =3D <160>;
>  			ti,max-crossbar-sources =3D <MAX_SOURCES>;
>  			ti,reg-size =3D <2>;
> -			ti,irqs-reserved =3D <0 1 2 3 5 6 131 132>;
> +			ti,crossbar-irqs-reserved =3D <0 1 2 3 5 6 131 132>;
>  			ti,irqs-skip =3D <10 133 139 140>;
>  			ti,irqs-safe-map =3D <0>;
>  		};

While reviewing this patch, I noticed a couple of pre-existing issues in
drivers/irqchip/irq-crossbar.c:

drivers/irqchip/irq-crossbar.c
>  static int allocate_gic_irq(struct irq_domain *domain, unsigned int virq,
>                              irq_hw_number_t hwirq)
>  {
[ ... ]
>  	raw_spin_lock(&cb->lock);
>  	for (i =3D cb->int_max - 1; i >=3D 0; i--) {
>  		if (cb->irq_map[i] =3D=3D IRQ_FREE) {
>  			cb->irq_map[i] =3D hwirq;
>  			break;
>  		}
>  	}
>  	raw_spin_unlock(&cb->lock);
> =20
>  	if (i < 0)
>  		return -ENODEV;
[ ... ]
>  	err =3D irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
>  	if (err)
>  		cb->irq_map[i] =3D IRQ_FREE;

[Severity: High]
This is a pre-existing issue, but does this error path modify cb->irq_map[i]
without holding cb->lock?

Earlier in the function, cb->lock is acquired to protect accesses to the
shared cb->irq_map array. Resetting cb->irq_map[i] to IRQ_FREE here without
re-acquiring the lock appears to create a data race with concurrent
allocations or frees on other CPUs.

>  	else
>  		cb->write(i, hwirq);
> =20
>  	return err;
>  }

[ ... ]

>  static void crossbar_domain_free(struct irq_domain *domain, unsigned int=
 virq,
>  				 unsigned int nr_irqs)
>  {
>  	int i;
> =20
>  	raw_spin_lock(&cb->lock);
>  	for (i =3D 0; i < nr_irqs; i++) {
>  		struct irq_data *d =3D irq_domain_get_irq_data(domain, virq + i);
> =20
>  		irq_domain_reset_irq_data(d);
>  		cb->irq_map[d->hwirq] =3D IRQ_FREE;
>  		cb->write(d->hwirq, cb->safe_map);

[Severity: Critical]
This is a pre-existing issue, but does crossbar_domain_free() use the wrong
index when freeing the map?

In allocate_gic_irq(), the allocated GIC SPI index 'i' (bounded by
cb->int_max =3D 160) is used to index cb->irq_map and cb->register_offsets,
while the crossbar source index 'hwirq' (bounded by
cb->max_crossbar_sources =3D 400) is stored as the value.

Here, crossbar_domain_free() uses 'd->hwirq' (the crossbar source index) as
the index for cb->irq_map and cb->write(), rather than the GIC SPI index.
Since the source index can greatly exceed the bounds of the array, could
this lead to out-of-bounds memory writes and out-of-bounds MMIO writes to
hardware registers?

>  	}
>  	raw_spin_unlock(&cb->lock);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-crossbar-v=
1-0-f67f7cb9ee50@gmail.com?part=3D3
