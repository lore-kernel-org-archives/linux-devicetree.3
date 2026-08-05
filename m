Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870C46EC69
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934733; cv=none; b=guEutwxFG22f8jjKXgcjEO5EWvnhuZ3uHZXgs8g8NKvExy5QIS3R5gEXd5yOxz0SrOfHVlJ/QIRWF+KPRdZd1q89TSBvZeOtU+ith/DHDXFoeGzrgSU0FYWMtf6nnTLrzjT+pHEencZJmmteCrLfF+/nA54NMsKwtim5dc9VTQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934733; c=relaxed/simple;
	bh=8vkyYSNxqp4NOlErqFvy7AoRhvaAByeNIurL7xS0v4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XHDEgcjNhV7xB67S5MLeKR1qB5wmH86RfRhYHh4wLXHC12N6IzgyTbgIij863TXYBG2V0Tpf0BfO9JHtcOMnB3WbWN0Norb5D7lQ5QwzY0gTHqZBMqS74VSLOa6frsImI+6CvALDCB8fbsCvPl90+IB9wqDcuOzWkOH2hcxKpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8krGBIr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8krGBIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6501F00A3A;
	Wed,  5 Aug 2026 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934732;
	bh=1oelFhMvQPDkWi+eSo+B4eYFZoktUROm8xJEihgkTbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8krGBIrprdDDOgQUpT1Pq/ZELwZiL0xBKJd0D+tMsDWYDT07IWy78jC2XHxjRfAl
	 QN9b3PQlXqUC+XbzMdRORUugxk+nW/F4WSyC0NS8FUXO2xMc9uj76nRCoH9erwjebz
	 wsUfA0LQmzaCXVBYpfiOZrEZF5y1mSrufspRcoTP0d6UGKe6AgBTo8ep59B0q8w93F
	 T8SxoEfU7uyTFo0wRd4/aLtt5H18fs/EIyihtBlBlpwTlxiS/QsL3LHMfPOjUbQA8c
	 33Hjy0vYddR6tyNRtnkCj6WVKi1o64aA0bxnyl/Lg+KNxK5vvy6p/z7XEY0dGnJFUv
	 NYUhFOBeeVcEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 24/36] pinctrl: airoha: split driver on shared code
 and SoC specific drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-25-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-25-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:58:51 +0000
Message-Id: <20260805125852.5C6501F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Hardcoded SCU compatible string in shared probe function prevents =
AN7583 and future SoCs from probing.

Pre-existing issues:
- [High] Parent IRQ requested before gpiochip initialization creates a race=
 condition.
- [High] Redundant manual clearing of IRQ status bit leads to permanently l=
ost edge interrupts.
- [High] Lock nesting violation in IRQ callbacks triggers "sleeping in atom=
ic context" on RT kernels.
--

--- Patch [24]: [PATCH v10 24/36] pinctrl: airoha: split driver on shared c=
ode and SoC specific drivers ---
commit 5233d68e7af6a3826dd884bf3c42e656bc817865
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: split driver on shared code and SoC specific drivers

Split the combined an7581/an7583 source file into shared pinctrl code and
SoC-specific pinctrl drivers. The initialization code was also adapted to
work properly for both shared and SoC-specific cases.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 55a6efc5887bc..134c57a54b963 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -3070,6 +781,8 @@ static int airoha_pinctrl_probe(struct platform_devi=
ce *pdev)
>  	int err, i;
> =20
>  	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> =20
>  	pinctrl =3D devm_kzalloc(dev, sizeof(*pinctrl), GFP_KERNEL);
>  	if (!pinctrl)
> @@ -3086,8 +799,8 @@ static int airoha_pinctrl_probe(struct platform_devi=
ce *pdev)
>  	pinctrl->chip_scu =3D map;
> =20
>  	/* Init pinctrl desc struct */
> -	pinctrl->desc.name =3D KBUILD_MODNAME;
> -	pinctrl->desc.owner =3D THIS_MODULE;
> +	pinctrl->desc.name =3D data->pinctrl_name;
> +	pinctrl->desc.owner =3D data->pinctrl_owner;

[Severity: High]
Does this shared probe function prevent other SoCs from probing due to a
hardcoded SCU compatible string?

In airoha_pinctrl_probe(), there appears to be a lookup that ignores the
SoC-specific match data:

	map =3D syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
	if (IS_ERR(map))
		return PTR_ERR(map);

If the SCU node for the newly added AN7583 uses a different compatible stri=
ng
(such as "airoha,an7583-chip-scu"), this lookup will fail and return an err=
or.
This would abort the probe and leave pinmux and GPIO functionality unavaila=
ble
for the new SoC.

[ ... ]
> @@ -3141,87 +854,10 @@ static int airoha_pinctrl_probe(struct platform_de=
vice *pdev)
>  	/* build gpio-chip */
>  	return airoha_pinctrl_add_gpiochip(pinctrl, pdev);
>  }

[Severity: High]
This is a pre-existing issue, but does requesting the parent IRQ before
gpiochip initialization create a race condition?

In airoha_pinctrl_add_gpiochip(), the IRQ is requested early:

	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
				dev_name(dev), pinctrl);
	if (err) {
...
	return devm_gpiochip_add_data(dev, gc, pinctrl);

If the shared IRQ line is asserted immediately by another device and the
Airoha hardware also has a pending interrupt, airoha_irq_handler() could
execute and call generic_handle_domain_irq(girq->domain, offset). Because
devm_gpiochip_add_data() hasn't run yet, girq->domain is still NULL, which
could cause a NULL pointer dereference or a silently dropped interrupt.

[Severity: High]
This is a pre-existing issue, but does the redundant manual clearing of the
IRQ status bit lead to permanently lost edge interrupts?

In airoha_irq_handler(), after servicing an interrupt, the status is cleare=
d:

			generic_handle_domain_irq(girq->domain, offset);
			regmap_write(pinctrl->regmap,
				     pinctrl->gpio_regs->status[i], BIT(irq));

If a new edge interrupt arrives while the child handler is executing, the
hardware latches the new status. This manual write might blindly wipe the
newly latched status before it can be processed, meaning edge-triggered
interrupts could be silently cleared and lost forever under high interrupt
load.

[Severity: High]
This is a pre-existing issue, but could these regmap accesses violate lock
nesting rules in IRQ callbacks and trigger sleeping in atomic context panics
on RT kernels?

In airoha_irq_mask() and airoha_irq_unmask():

	regmap_clear_bits(pinctrl->regmap, gpio_regs->level[index], mask);
	regmap_clear_bits(pinctrl->regmap, gpio_regs->edge[index], mask);

and

		regmap_update_bits(pinctrl->regmap, gpio_regs->level[index],
				   mask, val);

The generic IRQ core calls these functions while holding irq_desc->lock,
which is a raw_spinlock_t. Calling regmap_update_bits() and
regmap_clear_bits() on a syscon regmap internally takes a standard spinlock=
_t
or mutex. Acquiring a standard sleepable lock inside a raw spinlock protect=
ed
region is invalid.=20

Should .irq_bus_lock and .irq_bus_sync_unlock be used to perform these regm=
ap
operations outside the raw spinlock context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D24
