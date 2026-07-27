Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767513D79E2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140349; cv=none; b=nqJeI5kYIXpi8n7NdAmYIPuDdc2tM6D0h9mC2RwD+qzrea5aq6ESt6b1OZ6NfD33s3zlmh4iGCVUqyzVOnZI4/Fv6+XOmW5lTOP6zHNY4MozFF8B8doaE7QYZW4LHpxtSiB2oKktr5pFnKDGkCnQZfLXEJyiLeFBg01Nq6CQoWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140349; c=relaxed/simple;
	bh=fCWkicevH4l27bVA3C25HGSCdwjszECBgZA6KxOZVU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mNWOgUeW4OxMz5GJ3FqvDN65x27ZhFB1ETwJoTgbk2W1SDCUx3OLxTVFkOo1qYqF8T4uVmVFPkaCJNCVMYrGBKs13zg0mMocvQVQy6rQafFDcbbwU3CWFmq+fOeZJaIZfYJrggTxUp7Yvr4O2uEH8nxuZDRVl8vbhXokkhz+4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JykRo0fk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JykRo0fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D082F1F000E9;
	Mon, 27 Jul 2026 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785140348;
	bh=Tcy784Toe5Z5+U/TKrCOU3etF4Z2ddluLhrv437WYTg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JykRo0fkUT1kxypWXMPyd5wb/5VhBvhBifJENbuhBwSKIOz+Te/GFsv/xTTukh822
	 H++vdf5A8TN6Zjf8INGFhVn6ZcaehRNCYWyorm4wHJBa1oF0A0GJcpgLKgbBwy5EYN
	 1VNfo9wR5MqCfNhAGJbKvXxpNpkYYzfc0mS7CnS0vnxS2jQEN67NU9ig03MN+SXzrH
	 9PIbsUgji8jDMFCZEjYHYuUK507l5S8bo2Tu8YUfGZVisFGJ6SGSBPoFGkRAVsQqNd
	 YmTtCHRhVWQK64XOu3epKHQKg6oM0XksohC3fJHbit2yqMKdHYGOdLSV6CRP/1+Qeu
	 9j6EJVFW9R66A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 20/34] pinctrl: airoha: split driver on shared code
 and SoC specific drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727074234.3761170-21-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-21-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:19:07 +0000
Message-Id: <20260727081907.D082F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The trailing explicit status clear after executing `generic_handle=
_domain_irq()` double-ACKs edge-triggered interrupts, silencing subsequent =
pending edge events.
- [Medium] The driver dynamically copies an immutable `irq_chip` structure =
into per-instance memory, defeating the purpose of the `IRQCHIP_IMMUTABLE` =
flag.

Pre-existing issues:
- [High] Incorrect devres teardown ordering causes a Use-After-Free of `gir=
q->domain` on driver unbind and a race condition during probe.
--

--- Patch [20]: [PATCH v7 20/34] pinctrl: airoha: split driver on shared co=
de and SoC specific drivers ---
commit cead269156cfbd3a10c51e662e4e2740e945e387
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: split driver on shared code and SoC specific drivers
   =20
Split combined an7581/an7583 source file on a
 * shared pinctrl code (pinctrl-airoha.c)
 * an7581 specific pinctrl driver (pinctrl-an7581.c)
 * an7583 specific pinctrl driver (pinctrl-an7583.c)

Ininialization code was adapted a bit to work properly for shared
and SoC specific cases.

> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/air=
oha/airoha-common.h
> --- a/drivers/pinctrl/airoha/airoha-common.h
> +++ b/drivers/pinctrl/airoha/airoha-common.h
> @@ -148,9 +148,12 @@ struct airoha_pinctrl {
>  	struct regmap *regmap;
> =20
>  	struct airoha_pinctrl_gpiochip gpiochip;
> +	struct irq_chip gpio_irq_chip;
>  };

[ ... ]

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2630,9 +343,11 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->base =3D -1;
>  	gc->ngpio =3D AIROHA_NUM_PINS;
> =20
> +	memcpy(irq_chip, &airoha_gpio_irq_chip, sizeof(struct irq_chip));
> +
>  	girq->default_type =3D IRQ_TYPE_NONE;
>  	girq->handler =3D handle_bad_irq;
> -	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
> +	gpio_irq_chip_set_chip(girq, irq_chip);

[Severity: Medium]
Does copying the immutable airoha_gpio_irq_chip into per-instance memory
bypass the protections of the IRQCHIP_IMMUTABLE flag?

The core kernel contract expects a static const irq_chip to be passed to
gpio_irq_chip_set_chip(). Here, the driver dynamically copies it into the
mutable pinctrl->gpio_irq_chip and registers that instead.

[Severity: High]
This is a pre-existing issue, but can the devres teardown order here cause
a use-after-free of the IRQ domain?

In airoha_pinctrl_add_gpiochip(), devm_request_irq() is called before
devm_gpiochip_add_data():

    err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
                           dev_name(dev), pinctrl);

On driver unbind, devres will execute gpiochip_remove() first (which
destroys girq->domain), and only then call free_irq(). If the shared parent
IRQ fires during this window, airoha_irq_handler() will dereference the
freed girq->domain when calling generic_handle_domain_irq().

It could also fire during probe before the domain is fully initialized.

[Severity: High]
Can the trailing status clear in airoha_irq_handler() lead to lost
edge-triggered interrupts?

Looking at airoha_irq_handler() in drivers/pinctrl/airoha/pinctrl-airoha.c:

    generic_handle_domain_irq(girq->domain, offset);
    regmap_write(pinctrl->regmap, pinctrl->gpiochip.status[i], BIT(irq));
       =20
This patch series updates edge-triggered interrupts to use handle_edge_irq,
which already ACKs the interrupt upfront via the .irq_ack callback. This
allows the hardware to latch new edge events while the handler runs.
However, the explicit regmap_write() after generic_handle_domain_irq()
double-ACKs the interrupt, potentially clearing any new edge events that
arrived during processing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D20
