Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E683451C6
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 05:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695688; cv=none; b=X/k6YK41gRUE3KL+iiHP8wTo+Q9wYAioLnKYAnGG3KdZeVHySlGiS7Uramnye2PDvC6coLE8V4JnJSD1OYPSJ/iThvHUS52JOGhSR+PIwHEh/jnkAv2eQ0zaVG+asAsdxVBu28NdAN3xlo9hgVJmNMtvCk54qfO3POe9Go9FdQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695688; c=relaxed/simple;
	bh=ZpVcBm0FUYNk4H/lj/mTvkIQRaRbWe7mg0Ua+HOelaQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=stt69vHC2iWOM3L8Hf0yD62TB0x3bCCeVWDk0z+OzEZSk8P+3OMPlXkmSv3AK1794gsgAQAO2rsxjFz1KDXp1vZ+qsMKy0DgubY3vwqL7XVP1lx9KVBZGI6gVfSfJQ3lFejq9tZ4QdTNJhiGPl497GRWRIi/8uB67PI7S3cWSpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggflZrrd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggflZrrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3499F1F0089C;
	Sun, 11 Oct 2026 05:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791695686;
	bh=tO+3NA441t3XPUQT47mBFgg+dlK/l06kQKo4nGbC4OE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ggflZrrd/a4+HSV4gS9hTRE/2WSMjgEbe3b7CipX5flVEMqu1HFP/PJE673Rb3CZe
	 z4DvnoQ7lHGd8lOVU45YYt69crBMTxceGiyQy7MazU7rq1HQRZ/z+v2RVNuN470OXN
	 0HV8HoarKt7718U1rs2S41DrJNJQtpg5q0pohjKTcMQhvINFVZgC+h/wyov2iF/NC9
	 +ghB0GU/8KYiL3LDTw0WziUwp4vzqdQ3avlk/HmHd1pYS4cWk3mcNNHxixlQAsTE38
	 K52lMZFEC1uaYOyhaKZp20aD3KH+basguIZLU4nH6c84MVDNjf6XN4+Om895zLZCRb
	 IdoEcLG5e0CpA==
Message-ID: <sashiko-outbox-167032@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/9] irqchip/al-fic: switch to shared parent
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261011050449.41903-6-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
 <20261011050449.41903-6-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 05:14:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] irqchip/al-fic: shared parent mapping destroyed on error path via =
irq_dispose_mapping
--

commit 2575228eb0e3f9536c071e11d0536822135b2cae
Author: Eliav Farber <farbere@amazon.com>

irqchip/al-fic: switch to shared parent interrupt

This commit changes the driver from using a chained handler to a shared
interrupt (IRQF_SHARED) for the parent interrupt line. This change allows
multiple FIC groups to share a single output line toward the parent GIC SPI.
It also seeds the mask cache from the hardware register before requesting
the interrupt.

> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 32d8098699a41..8a7eb9009515f 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
[ ... ]
> @@ -162,9 +165,22 @@ static int al_fic_register(struct device_node *node,
>  	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
>  	gc->private =3D fic;
> =20
> -	irq_set_chained_handler_and_data(fic->parent_irq,
> -					 al_fic_irq_handler,
> -					 fic);
> +	/*
> +	 * Seed the mask cache with the value al_fic_wire_init() programmed,
> +	 * rather than having the generic chip read the register back on the
> +	 * first child mapping: that is later than the parent is requested, and
> +	 * never happens at all for a group with no consumer in the devicetree.
> +	 */
> +	gc->mask_cache =3D ~0U;
> +
> +	ret =3D request_irq(fic->parent_irq, al_fic_irq_handler,
> +			  IRQF_NO_THREAD | IRQF_SHARED,
> +			  of_node_full_name(fic->node), fic);
> +	if (ret) {
> +		pr_err("fail to request irq (%d)\n", ret);
> +		goto err_domain_remove;
> +	}

[Severity: High]
Will this transition to a shared parent interrupt cause issues with the
error path in al_fic_init_dt()?

Since multiple FIC groups can now share the same parent interrupt, if a
subsequent group fails initialization (e.g. if this request_irq() fails),
al_fic_init_dt() will call irq_dispose_mapping(parent_irq):

drivers/irqchip/irq-al-fic.c:al_fic_init_dt() {
    ...
    fic =3D al_fic_wire_init(node, base, parent_irq);
    if (IS_ERR(fic)) {
        pr_err("%pOF: fail to initialize irqchip (%pe)\n", node, fic);
        ret =3D PTR_ERR(fic);
        goto err_irq_dispose;
    }

    return 0;

err_irq_dispose:
    irq_dispose_mapping(parent_irq);
    ...
}

Because Linux IRQ mappings are not natively reference-counted at the dispose
level, unconditionally unmapping the shared parent interrupt would sever
interrupts for any other FIC instances that already successfully requested
and mapped this shared parent line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011050449.4190=
3-1-farbere@amazon.com?part=3D5
