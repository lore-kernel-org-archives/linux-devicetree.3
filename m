Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409562DC79A
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987991; cv=none; b=u/eY47g8h7L7UtbIE+BZnor1YdltxJKRvmy5mjrVArqSAs93FiuGtz7SZGtxNsh9nN8u68rDts4hQ6fhf/+mKyh/EFJNUlqd3cKo3COIp2FDj/jLGDrHkUyqB9V0cXwzGYd6099Y2lxfZZOQhccc97gsLRvygf6fnLhWVGiDynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987991; c=relaxed/simple;
	bh=D6Zi1MSBGGeFYIitVQbRcqPOAhyQaNI0fqv5N1ZByic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Chkif1fJj5yG7jo2go3QqyQYBWDF8Q5yZgTdlNBDrX0wiKk78grY1KxWuoMFExYER8nH9IzuKb/2XqgdOwXY2rXTHH8XL/4QtVQ6jElHUcakDUmQdDRyCIEoFjmDQtYKgJFgytVajKIOdEVUr5/YHUMGZKdvXem2VVJHnSMBUjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeS4kl3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeS4kl3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3A61F000E9;
	Sat, 25 Jul 2026 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784987989;
	bh=BYWbCYaLfseETTUY1cxm/FKh1MXL8PyT2CCxew1Etds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GeS4kl3Ry5QvTqfMYjrHj9gDMsjfrGCe2C+9Jr1tpeWdNEQlgkcmlc7PLZbYMCIpC
	 iqBlUSBL3aMaIVuWgja/WgUqSWjQZhNx2gN6f6GtxaM75ktMlK2lrlhsG/6NAPvNya
	 y6uU6wj4CEmdClzRIr0GE/koHj4GIkGdtPWVSaDEtTJchQJE42bj8fSUQvZsVku38/
	 mO9+xNlqWz+BOCTqeiWGigBL02+c9vjmlmOfdlr0ApP5SiyVQ/M1oBHKpUdtxECjHm
	 BBKh8NJ03WImH9CJRV8BJk4FIR0xrQBKbnmZDDmu3BNJjKSvlmaPLipSLCeq19OgHn
	 5Zbp81zux0jOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] spmi: apple: interrupt controller functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260725-t603x-spmi-v1-7-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-7-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 13:59:49 +0000
Message-Id: <20260725135949.AA3A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using the 32-bit `BIT()` macro with 64-bit integers causes data tr=
uncation and undefined behavior on 32-bit architectures.
- [Low] Missing inclusion of `<linux/io-64-nonatomic-lo-hi.h>` causes build=
 failures on 32-bit architectures under `COMPILE_TEST`.
--

--- Patch [7]: [PATCH 7/7] spmi: apple: interrupt controller functionality =
---
commit d1caa99a04e657899090218f53dc529fd1b04548
Author: Alba Mendez <me@alba.sh>

spmi: apple: interrupt controller functionality

Add support for interrupts sent by slave devices.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index d627187b3ac00..13b48fd66aec4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -228,11 +234,123 @@ static void apple_spmi_irq_unmask_raw(struct apple=
_spmi *spmi, u32 irq)
>  	writel(readl(reg) | BIT(irq % 32), reg);
>  }
> =20
> +static void apple_spmi_irq_ack(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi =3D irq_data_get_irq_chip_data(d);
> +
> +	apple_spmi_irq_ack_raw(spmi, d->hwirq);
> +}
> +
> +static void apple_spmi_irq_mask(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi =3D irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
> +	apple_spmi_irq_mask_raw(spmi, d->hwirq);
> +	spmi->irq_mask_cache[d->hwirq / 64] &=3D ~BIT(d->hwirq % 64);

[Severity: High]
Does using BIT() instead of BIT_ULL() here unintentionally clear the upper
32 bits of the 64-bit irq_mask_cache entry on 32-bit systems?

When d->hwirq % 64 is >=3D 32, this might also cause undefined behavior on
32-bit architectures, which can be reached via COMPILE_TEST.

> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}
> +
> +static void apple_spmi_irq_unmask(struct irq_data *d)
> +{
> +	struct apple_spmi *spmi =3D irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
> +	apple_spmi_irq_unmask_raw(spmi, d->hwirq);
> +	spmi->irq_mask_cache[d->hwirq / 64] |=3D BIT(d->hwirq % 64);

[Severity: High]
Similarly, could this cause undefined behavior on 32-bit systems when
d->hwirq % 64 is >=3D 32?

> +	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
> +}

[ ... ]

> @@ -241,6 +359,23 @@ static irqreturn_t apple_spmi_irq_handler(int irq, v=
oid *dev_id)
>  		handled =3D true;
>  	}
> =20
> +	for (offset =3D 0; offset < SPMI_IRQ_USER_SIZE; offset +=3D sizeof(val)=
) {
> +		val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);

[Severity: Low]
Does calling readq() here cause a build failure on 32-bit architectures
under COMPILE_TEST since <linux/io-64-nonatomic-lo-hi.h> is not included?

> +		/**
> +		 * because of other masters in the bus, we're going to get a multitude=
 of
> +		 * interrupts we're not interested in. irq_resolve_mapping isn't very
> +		 * optimized for the nonexistent path, so instead we mask with (a loca=
lly
> +		 * cached version of) the IRQ mask
> +		 */
> +		val &=3D spmi->irq_mask_cache[offset / sizeof(val)];
> +		while (val) {
> +			bit =3D __builtin_ctzll(val);
> +			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
> +			handled =3D true;
> +			val &=3D ~BIT(bit);

[Severity: High]
Since val is a 64-bit integer, and bit can range from 0 to 63, would
~BIT(bit) on 32-bit systems produce a 32-bit inverted mask that zero-extends
when promoted to 64 bits? This might unintentionally clear the upper 32 bits
of val.

> +		}
> +	}
> +
>  	return handled ? IRQ_HANDLED : IRQ_NONE;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-spmi=
-v1-0-e1a29fcd2d38@chaosmail.tech?part=3D7
