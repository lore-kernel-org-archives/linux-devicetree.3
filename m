Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316B25F98A
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695793; cv=none; b=e8U4rvtTvm9tKHCV7YNmC61/pXNGg4jBLfyUrzvhu8yUiFRRpt3z/PrRT08KXakDCUB6PAvPryZWt19vXaC3NPBWiyNuPxseMxAhPFtNIHr8jLiiIL6TkFkk992DIsaEzx4nEF0bouDQ31KLlSBw08Jwd5yXtn1HdgT0WkmLZQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695793; c=relaxed/simple;
	bh=isMy3mSNxQYuW9KTI9DRLYiUVwDH4k8vujMQdUMoUN4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ec10/ltviqiBzyfTItmHXBYlThlYjv8iWSJw6aJB0GzGvNMa3kT1FtHjGzFxv1MY/Ek2ZdfT+J+j03zc7GQWFtJ72L31YCiZ3QFWjh3+2vuCDTT5rhzYGKhuUqXGAObTYPPl7AckUbXmKiCkAUduL59HoL65mUZUf5DvVrO4tsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5Q+AnKC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5Q+AnKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AC41F0089B;
	Sun, 11 Oct 2026 05:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791695792;
	bh=K1C53mUXKyYluHrfibBTFKRS9ERFvW6/MyLMby51e6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q5Q+AnKCr2N4c9HKjmKsF8JcR7qnUUgIngYWqiBHG+KJhNuXYY9mjInAeZDylISya
	 3KnCAjMcQkj57TskoiZmTGzIOaBhoLXfZjXQQadICXYiUDwaoAvvOsf6lOyO2nqyny
	 eBFovknqDVgW2nX/1D3v6FPCgyvSORorKDzUMPWwoo9CS/RzAsqJ19DDpbhaSVo3f3
	 DqnO974JL5eqCoYxfFv/Chk1Zmzps8Dtpdd5960NzuwLUPjat5O5hKD3rahfCis0nW
	 6+TuelVU/HscUyh3U8OJKRUvuKIvgB4sWG1cFYZotuuPcYlfYjmlls6WQMkwn/pXJt
	 MRx6wEjJGzX1w==
Message-ID: <sashiko-outbox-167034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 9/9] irqchip/al-fic: support per-child affinity via
 interrupt redirection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261011050449.41903-10-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
 <20261011050449.41903-10-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 05:16:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] irqchip/al-fic: unconfigured level interrupts cause interrupt stor=
m on redirection
--

commit a2b0d194e9e91e226ae5163eb51d0cdf61945a75
Author: Eliav Farber <farbere@amazon.com>

irqchip/al-fic: support per-child affinity via interrupt redirection

This commit wires al-fic into the interrupt redirection infrastructure to
support per-child affinity control. It defers the handler execution to the
target CPU via irq_work while moving the ack (and masking for level
configured groups) into parent context using irq_pre_redirect.

> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 13a945a1d312a..77cff6308eba1 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c

[ ... ]

> @@ -157,6 +163,32 @@ static int al_fic_irq_retrigger(struct irq_data *dat=
a)
>  	return 1;
>  }
> =20
> +#ifdef CONFIG_SMP
> +/* The ack happens in al_fic_irq_pre_redirect() on both paths instead. */
> +static void al_fic_irq_noop(struct irq_data *data) { }
> +
> +/*
> + * Runs in the parent interrupt context on every dispatch, redirected or=
 not.
> + * Clear the cause bit here: once the flow handler is deferred, the FIC =
keeps
> + * driving its output until the irq_work runs, and a level parent SPI re=
-fires.
> + *
> + * A level configured group is masked too, because its cause bit re-latc=
hes
> + * while the input stays asserted; the deferred handle_level_irq() unmas=
ks
> + * when the handler is done. An edge configured group is only acked, sin=
ce
> + * handle_edge_irq() never unmasks unconditionally and the mask would st=
ay.
> + */
> +static void al_fic_irq_pre_redirect(struct irq_data *data)
> +{
> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
> +	struct al_fic *fic =3D gc->private;
> +
> +	if (fic->state =3D=3D AL_FIC_CONFIGURED_LEVEL)
> +		irq_gc_mask_set_bit(data);

[Severity: High]
Could unconfigured level interrupts cause an interrupt storm on redirection
here?

If a driver requests a child interrupt without specifying a trigger type,
fic->state remains AL_FIC_UNCONFIGURED.

Since the generic chip defaults to handle_level_irq, when the interrupt
fires and its affinity excludes the current CPU,
generic_handle_demux_domain_irq() calls al_fic_irq_pre_redirect().

Because the state is unconfigured, the check for AL_FIC_CONFIGURED_LEVEL
fails and the interrupt is not masked.

The handler execution is then deferred to another CPU via irq_work.
However, because the hardware is level-triggered and was not masked, the
FIC continues asserting the parent SPI. This immediately re-triggers the
parent interrupt upon return, trapping the parent CPU in an infinite loop.

> +
> +	irq_gc_ack_clr_bit(data);
> +}
> +#endif /* CONFIG_SMP */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011050449.4190=
3-1-farbere@amazon.com?part=3D9
