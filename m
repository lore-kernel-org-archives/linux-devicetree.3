Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD24F3DA5C3
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086443; cv=none; b=b3uWD1Amh4JMs+TF0zZY8u05V4eZ0IxIxmm/DlnuIkeZ7bXX2AlH6AHjBX3bEY9EZa9UAzw/ZOpyQzk3SiQxlfrvGKpikG+56wZ0w1Crta7FpnemL33veXNMaWAGPl8CMajMQk93Joobxxnb1eI+kf2QoFCtjfBQB/fPqXiR0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086443; c=relaxed/simple;
	bh=9RpZlf1AyG+lT9n9ggCmXeayaGPZ0jNAM8SuLqc/n6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eyajpDDvmt6JTVEd9zOq44FJq387LLbelolJILRBoDpOPDmzfmfS6R8eeNKjMxnXaEsMBi2UiSqVsl5h1TpUw5er4bDQHQb8mgo7Cv0d1CfdWK2jQLT5D86TH0UubKFU4opSSC2Yhhg5NFEJa3lvRmBeJXp+8Dm5oCVEr02h1eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQOmtqxh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQOmtqxh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927701F000E9;
	Fri,  3 Jul 2026 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086438;
	bh=mYgsSqpDMl0/TO4c9DePlTYmDMo+wu975FVjBaMRMHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQOmtqxh4Aa9sfHIqiaht02Af2984J0NI+9TsLe8j6LzIkmnyr7b9UvJjGqkwPAhW
	 lkRA9VRokW8bNCd2fmEjZ18BPmewYmsTfINbFwXPKLM2BTcynTjE8gHbwtEdDQFuFn
	 g9/TOnrcppYXXqSbdX534JlC7QWQgHdLoj4vPv2VL8gsnn5Lpb0eryi49eT5BCmkgN
	 sJoVpDxh329ZLzbEsyVRfHUUW0h6s9X/MFUWbdSD3VksUbkaDhmcJ/eiLNajdQXoZN
	 9TUv3vpJxnNVXUOJWFmtBrE5DyppS+vNpwf6mm08PrwYv52bxSqHnNhKYMR65WmWxq
	 Z6WYeSEeA6ivw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] soc: fsl: qe: Remove useless struct member
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703-qe-pic-gpios-v1-11-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-11-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 13:47:18 +0000
Message-Id: <20260703134718.927701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] The chained cascade handler is registered prematurely during I=
RQ domain instantiation before the generic IRQ chip and its register base a=
re populated, leading to a potential NULL pointer dereference.
- [High] Off-by-one error in calculating `hwirq` from the interrupt event b=
it index, leading to out-of-bounds array access and shifted IRQ mapping.

Pre-existing issues:
- [High] Missing synchronization around shared memory-mapped registers in t=
he custom mask, unmask, and set_type operations.
--

commit 5ecb4528440dd9ca9845f840100f9f68d449b15d
Author: Paul Louvel <paul.louvel@bootlin.com>

soc: fsl: qe: Remove useless struct member
   =20
The reg member from the struct qepic_data is no longer needed, since it
is now embedded in reg_base of struct irq_chip_generic. Remove it.

> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_por=
ts_ic.c
> index 1bf2af087b784..6cf23a721ff36 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
[ ... ]
> @@ -165,7 +165,7 @@ static int qepic_probe(struct platform_device *pdev)
>  	data->gc =3D irq_get_domain_generic_chip(data->domain, 0);
>  	if (!data->gc)
>  		return -ENODEV;
> -	data->gc->reg_base =3D data->reg;
> +	data->gc->reg_base =3D reg;

[Severity: Critical]
Can this lead to a NULL pointer dereference?

The devm_irq_domain_instantiate() function is called earlier in qepic_probe=
(),
which synchronously triggers qepic_domain_init().

Inside qepic_domain_init(), irq_set_chained_handler_and_data() is called:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_domain_init() {
    ...
    irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, data);
    ...
}

This immediately registers and unmasks the parent interrupt. If a pending
interrupt fires right after this, qepic_cascade() will execute and
dereference data->gc->chip_types:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_cascade() {
    ...
    struct irq_chip_type *ct =3D data->gc->chip_types;
    ...
}

However, data->gc is only allocated and initialized here, after
devm_irq_domain_instantiate() returns. Could data->gc be NULL if the hardwa=
re
interrupt is asserted early?


[Severity: High]
Is there an off-by-one error when calculating the hardware IRQ?

Looking at qepic_cascade(), when an interrupt fires, it seems to pass an
incorrect hwirq to the subsystem:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_cascade() {
    ...
    generic_handle_domain_irq(data->domain, 32 - bit);
    ...
}

If bit is 0, this calculates a hwirq of 32. Since the domain size is 32 (max
hwirq 31), will calling generic_handle_domain_irq() with 32 fail?

Does this also shift the IRQ mapping, making the 0th bit interrupt
unserviceable?


[Severity: High]
This is a pre-existing issue, but is there missing synchronization around t=
he
shared memory-mapped registers?

The custom mask, unmask, and set_type functions perform non-atomic
read-modify-write operations on shared hardware registers without holding
any locks:

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_mask() {
    ...
    clrbits32(gc->reg_base + ct->regs.mask, d->mask);
    ...
}

drivers/soc/fsl/qe/qe_ports_ic.c:qepic_unmask() {
    ...
    setbits32(gc->reg_base + ct->regs.mask, d->mask);
    ...
}

On SMP systems, could concurrent masking or unmasking of different interrup=
ts
on different CPUs race and silently clobber the mask state?

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qe-pic-gpi=
os-v1-0-6c3e706e27dc@bootlin.com?part=3D11
