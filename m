Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509EA3CF1ED
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086026; cv=none; b=YZ7KkEyx+MXJpR+pmXPAnzvLqz/5nHyJ54R7I/pVRfoHmmh5+gPR0iPEG3hU7RLbhwslBBtdE/61+HX8lLDwGKv2KWyLTCptfJ+DY/WmsNW+a5LRfN8RZbxKNMK/WhnQ9fRKONxjrSBzLKnEetju5dq7wK52TRspp493n3NJVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086026; c=relaxed/simple;
	bh=0PcbR4qmjUo9kS3HtCec+SYbpfrEmX6MIncA/x3njBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJCfMC+isUncVCBfVHNce1AFbqT/urorb2ssHbPnkGrnlGtVZ9N/wqOaRxzU8JiTQG6MvMzbwp+qN2/yiA5wCQLxBAOaV5Jz5BTt4N5kmYXN/nvVTqILFvg97MRW126jfGgqdQz0H98G1uB3ARRhCcu3f9gPod0aqz8nes/S5oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5zWbIeR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5zWbIeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A5B1F000E9;
	Fri,  3 Jul 2026 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086024;
	bh=2o8q4xWG8bk0YD3Bp37CJ7BnWokXQRDVBGzdM885td8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L5zWbIeRNM8gNGwbJJxFktDV0Hs3YFucPyqSxEanoFgEpJAxbp0GIBjI37mp47l+O
	 nv6oLb/fQK1M8EwuLVA8KNY6dffP1j4y8dHo4vAKwfca02mxa74NEjaHPDUP14kPse
	 b9WhawphLr/5P62iD4S0TRxjcgRjoGyyYGRcM2vAVUEVzbZO+xQUgya6kglejjuGzx
	 Bcrq0KJQweJjA+mYYMFm6ye2pSrx43KY9xLlkTxVtJUtITOAaVV7ChOmm8rSeOdcTg
	 lmV2EXSVYbrvw/AvWxAAf6LFgrE8KWyzMmV6ARw39J6e8eLwJ8gdOUDaLW4fS/0sNm
	 m3WLgNJOlRjug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/12] soc: fsl: qe: Rename irq variable to parent_irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-qe-pic-gpios-v1-9-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-9-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 13:40:24 +0000
Message-Id: <20260703134024.A1A5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] A race condition during probe can cause a NULL pointer dereference=
 in the chained interrupt handler `qepic_cascade` because the chained IRQ i=
s unmasked before generic chip data is fully initialized.
- [High] An off-by-one logic error in `qepic_cascade` calculates incorrect =
hardware IRQ indices, rendering interrupts incorrectly routed or completely=
 dead.

Pre-existing issues:
- [High] The mask, unmask, and set_type callbacks perform non-atomic read-m=
odify-write operations on shared controller registers without locking.
--

commit 233494b356181bf50d667f74d4dd3ee1947142f8
Author: Paul Louvel <paul.louvel@bootlin.com>

soc: fsl: qe: Rename irq variable to parent_irq

This commit renames the irq local variable to parent_irq in struct qepic_da=
ta
to better describe its role as the upstream interrupt. It updates the
references in qepic_probe, qepic_domain_init, and qepic_domain_exit to use
the new name.

> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_por=
ts_ic.c
> index d022aa224f6d6..718703dab0240 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
[ ... ]
> @@ -111,7 +111,7 @@ static int qepic_domain_init(struct irq_domain *d)
>  {
>  	struct qepic_data *data =3D d->host_data;
> =20
> -	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
> +	irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, data);

[Severity: High]
Does this chained handler registration have an off-by-one regression when
calculating the hardware IRQ?

Looking at qepic_cascade(), the interrupt index is calculated using a bitwi=
se
operation but retains a subtraction logic from older code:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_cascade() {
    ...
    for_each_set_bit(bit, &val, 32)
        generic_handle_domain_irq(data->domain, 32 - bit);
    ...
}

Because for_each_set_bit() yields a 0-indexed bit (0 to 31), calculating
32 - bit yields 32 down to 1. For bit 0, it yields hwirq 32, which exceeds
hwirq_max (32, indices 0-31) and gets dropped by the IRQ core. Should this =
be
31 - bit instead to map correctly?

[ ... ]
> @@ -154,9 +154,9 @@ static int qepic_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->reg))
>  		return PTR_ERR(data->reg);
> =20
> -	data->irq =3D platform_get_irq(pdev, 0);
> -	if (data->irq < 0)
> -		return data->irq;
> +	data->parent_irq =3D platform_get_irq(pdev, 0);
> +	if (data->parent_irq < 0)
> +		return data->parent_irq;
> =20
>  	data->host =3D devm_irq_domain_instantiate(dev, &d_info);

[Severity: High]
Can this cause a NULL pointer dereference regression during probe if the
interrupt fires immediately?

devm_irq_domain_instantiate() calls qepic_domain_init(), which immediately
registers and unmasks the chained handler qepic_cascade() via
irq_set_chained_handler_and_data().

If an interrupt is already pending or fires before qepic_probe() finishes,
qepic_cascade() will execute and attempt to access data->gc:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_cascade() {
    struct irq_chip_type *ct =3D data->gc->chip_types;
    ...
}

However, data->gc is not populated until after devm_irq_domain_instantiate()
returns:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_probe() {
    ...
    data->domain =3D devm_irq_domain_instantiate(dev, &d_info);
    if (IS_ERR(data->domain))
        return PTR_ERR(data->domain);

    data->gc =3D irq_get_domain_generic_chip(data->domain, 0);
    ...
}

Should we defer arming the chained handler until after the generic chip is
fully initialized?

[Severity: High]
This is a pre-existing issue, but do we need to lock the shared registers
during mask/unmask operations?

qepic_mask(), qepic_unmask(), and qepic_set_type() perform non-atomic
read-modify-write operations on shared controller registers:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_mask() {
    ...
    clrbits32(gc->reg_base + ct->regs.mask, d->mask);
}

These callbacks expand to non-atomic I/O operations. Since the core kernel
only holds the per-IRQ desc->lock during these calls, concurrent interrupt
mask/unmask operations on different CPUs could silently overwrite each othe=
r,
causing interrupts to be unintentionally left enabled or disabled.

Would it be safer to acquire gc->lock during these register modifications?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qe-pic-gpi=
os-v1-0-6c3e706e27dc@bootlin.com?part=3D9
