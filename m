Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC823B2FD6
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086197; cv=none; b=VMvlIiY5NF7UOeGanRj3Yx2Psr2mv6cPlobHfSPpjKxEhec8xPrWZYfR6X5QrCmf8I13OjXfzKLqtx2Xdt01svTSaSn5dJPylRL3cq2Fp/bl7lNh/cUdEBNv9ffQzZMo5NufKE3fQaOEJsStnLNP6CQLukBPWW6dKqFsJQaXgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086197; c=relaxed/simple;
	bh=/+Ao4lGzk73OYtgg51Acb2POkOqVeua9jH+GahGxLQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r04vZSedFv9r56lukHY2ZPO3ujr0G6901Avcm1/LAolpog9Xm+SVeBr27OXKrwoFHv5OYojhrt6oLi6t7GdL3dronwI4PN5T9hWwgN7JJEM1a0pKiQzbYsvrIDBxurcwmFOcR/Te9HLb20J0iVkqNh6rfHEQWMqIjZxSjyOZBvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BljwpAnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BljwpAnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9F71F000E9;
	Fri,  3 Jul 2026 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086195;
	bh=8jSZEbE47I3BwaoP7xfOatyPQoK8GSpZYpPyzTJTh9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BljwpAnV1PVfuD5qVD2t/2MgI9G9uIF4LQWKkZ/eD30YpEZizjsBayG/c5WkVHuCk
	 CNyVIvkHnqxknwSFLRU7iV0rDE7KO+8te7MGIPdfsg+rMATTyKorHz2C5iilyCwRCn
	 q5DsqpKcGgSTUYRQdQ1vi4RWQh4M1TbfZAuYV+Brs990w6qIQtrmM31QgCKyqSqXBo
	 Oyn9ag2OxL+auVvs+MRorJ7OpfQ00V2AEWYU1pMCaxbz9MOPeQFZaa/SnnB2Zh8F7Z
	 p3Ljc3M5lwO6t+3zdT/pqqO1UeyXhE90IDHmWaDIE5kopJJFvARZT4dFcMg53ieASu
	 fB4bRVCxWo5hQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/12] soc: fsl: qe: Rename host member to domain in
 struct qepic_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-qe-pic-gpios-v1-10-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-10-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 13:43:14 +0000
Message-Id: <20260703134315.4A9F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Off-by-one mapping between hardware interrupts and virtual IRQs du=
e to incorrect bit index arithmetic.
- [High] Uninitialized pointer dereference because the chained IRQ handler =
is registered before dependencies are populated.
--

commit 2f6243965deebfddabc0af7472b701df854ecb78
Author: Paul Louvel <paul.louvel@bootlin.com>

soc: fsl: qe: Rename host member to domain in struct qepic_data

This commit renames the host field to domain in struct qepic_data to match
the common kernel naming convention for irq_domain pointers.

> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_por=
ts_ic.c
> index 718703dab0240..1bf2af087b784 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c

[ ... ]

> @@ -85,7 +85,7 @@ static void qepic_cascade(struct irq_desc *desc)
>  	}
> =20
>  	for_each_set_bit(bit, &event, 32)
> -		generic_handle_domain_irq(data->host, 32 - bit);
> +		generic_handle_domain_irq(data->domain, 32 - bit);

[Severity: High]
Does this code map the hardware interrupts to the wrong virtual IRQs?

Since for_each_set_bit() provides a 0-based index for bit, mapping it
using 32 - bit shifts all interrupts by one (e.g. mapping hardware
interrupt 31 to 32, which is out of bounds). Should this be 31 - bit
instead?

>  out:
>  	chained_irq_exit(chip, desc);

[ ... ]

> @@ -158,11 +158,11 @@ static int qepic_probe(struct platform_device *pdev)
>  	if (data->parent_irq < 0)
>  		return data->parent_irq;
> =20
> -	data->host =3D devm_irq_domain_instantiate(dev, &d_info);
> -	if (IS_ERR(data->host))
> -		return PTR_ERR(data->host);
> +	data->domain =3D devm_irq_domain_instantiate(dev, &d_info);
> +	if (IS_ERR(data->domain))
> +		return PTR_ERR(data->domain);
> =20
> -	data->gc =3D irq_get_domain_generic_chip(data->host, 0);
> +	data->gc =3D irq_get_domain_generic_chip(data->domain, 0);

[Severity: High]
Can this result in a NULL pointer dereference if the parent interrupt
fires during probe?

Calling devm_irq_domain_instantiate() synchronously invokes the domain
init function, which registers the chained handler (qepic_cascade) and
unmasks the parent interrupt. If the interrupt triggers immediately,
qepic_cascade() will execute before data->gc is populated here:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_cascade() {
    ...
	struct irq_chip_type *ct =3D data->gc->chip_types;
    ...
}

Will data->gc still be NULL when the handler tries to access it?

>  	if (!data->gc)
>  		return -ENODEV;
>  	data->gc->reg_base =3D data->reg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qe-pic-gpi=
os-v1-0-6c3e706e27dc@bootlin.com?part=3D10
