Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C06E3C1F59
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086637; cv=none; b=PS9uEmT8BF+qA3JysMktw8185WjOalqXqK2MSQRf1khzu1/KGIxaa6or6SeIae8B3LG+jJeJHJMrwQIieq1gCt0UIjuRTK0mAa1fCs932BPrhxeOF3GJr1t/At/p+DyAtJSzXH3ZZ9kNzwG5BZXnfqfKDOX0NKxMJA4r26VJRcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086637; c=relaxed/simple;
	bh=ja795S0CdzJPg9yOm6yxoZ/FfqvwFZdSpD+QheeUf3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WBHEGxsLgjlR3l5KvXlmfiNxwuEZzo8DUe7OFJNrCiu4PMO/8Qc6LqXbTuEAaF+2H9vQRxgEbWAA0wgcVe1MJDRxAfVjz1yQjoL9I9/anRDy8HOTkYar56X/1CAImIILWuXIyY/jff/nr5SntZtA7rSfG8PhM0BysIfXOMPVTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsOYb/6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsOYb/6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905721F000E9;
	Fri,  3 Jul 2026 13:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086636;
	bh=PZef2AmA4SkKP70lH4OiFoMsYo8K2aTBpFGPKMRQ+zM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JsOYb/6yWamFKQ9XvyUIullIzRqEi+Nf38MKkrP5WDiVYYxBJ//hPNdRSGEUan6yv
	 +KWHi0dNm3lgWqaAvCXZWWxhYIwdDb9OOWJEb3qTy1Zsrp98Vljah+S0z8Zez8JXWp
	 PSPv4JnVvfzYGUd8R18plRGbJO1rapf8XmIQ1aaWfGSiJvzdVkKJpE+AbEDgLg3vdc
	 hHn5rOEx7++9NzDP681Yz2CYtrD5Sk4eJMZMnBRcZ3gEk8KDaasWJ3M9EMEUSBLwFj
	 aV47bUCdR3pdTpvLgy9JQ9IhMnAuIpUQZcUDe3Yn6Zk1iNpBmW5CAV7xVY9/Ir1sP1
	 8eEbiKhN3s5qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] soc: fsl: qe: Add chained_irq_{enter,exit}()
 calls in cascade handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260703-qe-pic-gpios-v1-1-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-1-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 13:50:34 +0000
Message-Id: <20260703135035.905721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unrecoverable infinite IRQ storm and spurious processing due to un=
masked and unmapped interrupts.
- [High] Race condition in shared interrupt controller registers due to mis=
sing spinlock protection.
- [High] Missing synchronize_irq() after clearing the chained handler allow=
s use-after-free of the qepic_data structure.
--

commit c013ba9109c1d81cc36eb17c872ac35aa3b57e9f
Author: Paul Louvel <paul.louvel@bootlin.com>

soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler

This commit wraps the cascade handler body with chained_irq_enter() and
chained_irq_exit(). This properly informs the parent IRQ chip that a chained
interrupt is being serviced.

> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_por=
ts_ic.c
> index 9b0bba64e91e4..73a77763210d7 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
[ ... ]
> @@ -79,7 +80,13 @@ static int qepic_get_irq(struct irq_desc *desc)
> =20
>  static void qepic_cascade(struct irq_desc *desc)
>  {
> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +
> +	chained_irq_enter(chip, desc);
> +
>  	generic_handle_irq(qepic_get_irq(desc));
[Severity: High]
This isn't a bug introduced by this patch, but can this lead to an unrecove=
rable
infinite IRQ storm?

In qepic_get_irq(), the code reads the raw CEPIER event register without ma=
sking
it against the CEPIMR mask register:

static int qepic_get_irq(struct irq_desc *desc)
{
	struct qepic_data *data =3D irq_desc_get_handler_data(desc);
	u32 event =3D in_be32(data->reg + CEPIER);

	if (!event)
		return -1;

	return irq_find_mapping(data->host, 32 - ffs(event));
}

If an unmapped interrupt fires (e.g., left unmasked by the bootloader),
irq_find_mapping() returns 0. Then, generic_handle_irq(0) is called, which
typically returns -EINVAL without clearing the hardware event bit in CEPIER.

When chained_irq_exit() unmasks the parent, will the uncleared event immedi=
ately
re-trigger the parent interrupt and cause a storm?

> +
> +	chained_irq_exit(chip, desc);
>  }

[Severity: High]
This is a pre-existing issue, but is there a race condition in the shared
interrupt controller registers due to a missing spinlock?

The mask and unmask functions modify the shared CEPIMR register using non-a=
tomic
macros:

static void qepic_mask(struct irq_data *d)
{
	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);

	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
}

Since the Linux IRQ core invokes these callbacks holding only the per-child
desc->lock (and not a chip-level lock), concurrent mask or unmask operation=
s on
different child IRQs belonging to the same controller could race on SMP sys=
tems.

Could this lead to corrupted mask or type registers, resulting in lost or
stuck interrupts?

[Severity: High]
This isn't a bug introduced by this patch, but does the devres cleanup path=
 risk
a use-after-free by missing synchronize_irq()?

During driver removal or probe failure, qepic_remove() is called:

static void qepic_remove(void *res)
{
	struct qepic_data *data =3D res;

	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
	irq_domain_remove(data->host);
}

This removes the chained handler, but fails to call synchronize_irq() to en=
sure
concurrent hardware interrupt execution has terminated. Immediately after t=
his
returns, the devres framework will free the qepic_data structure.

If qepic_cascade() is concurrently executing on another CPU, won't it deref=
erence
the freed data pointer, causing a use-after-free crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qe-pic-gpi=
os-v1-0-6c3e706e27dc@bootlin.com?part=3D1
