Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA903D8138
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603020; cv=none; b=kGt3pOU79H0LVjqHBiYiv8lMuXDnIdu0xxoysFDPtdekyRXQMI9tvRVApnh7aQIPZ2oW1aC0F+RQChXSa1dpNJARWGeoZmEWa8FGpZtXmbMQ4TJRFd87Xs1x1eOJEbUbNivwcpC+b1/+X0JrNGnNkq80vAN6QzS2pdsq6cVLIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603020; c=relaxed/simple;
	bh=aKlKz0k/mYgqh0urwL4beWk5DyDD1+PaibhtJjshnVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f4wzvKvGyF1dGUOh3m8WegawR3sLsNS/9iw3P5UvN2ks1GFTDGQI3QTG7J5HG7Aqv/alewqTQF0+Z42XRSyGbbRQO+k3OcXo0Tu2xKJfR86TYfB6DnYqA7FgW5ONk/RdI6BIeRbalNaqYTTsQXlGip4iNMpSVQDxjedQtfmpoSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbNXuJr7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbNXuJr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1919B1F000E9;
	Tue, 16 Jun 2026 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781603019;
	bh=pK2zrivRnVXxikSuY1+FrIl2G3k624H6+VmL9G44aOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WbNXuJr7VzaLhDHaS/OEWPG0NxSEq1KH79tamk1DZ3uPaGE3DLmo4lkt5hswVNpY3
	 mSCr7bzPU1bzdBbRohBiGjmEYQXQpD0RqAlcCc+L4Y8vSZoNrgG5bfFssYVv50FfJ0
	 S5s7g5KL8MRf+X1VPE6v+0UKIJqTGoBiGad4py8BPYAJoD3UBRDoGSzeMt240IP5zF
	 Ldw8Lp/5tAqR+frKPWWCvUt/Q2G9xkANKQ7RoYANPIntjcPeh94vMcxUu00IZVFp92
	 FwfLPkfhDLZOYBbtsyl5zcFpL/piVase9PAR1GpK1jQeQ8yuHuYbvHIQTH3plt5Mey
	 DuZOa/N8C436g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 09:43:38 +0000
Message-Id: <20260616094339.1919B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Read-Modify-Write (RMW) operations on `irq_cfg_reg` race with asyn=
chronous hardware updates to the latched status bit, risking lost interrupt=
s.
--

commit 5bfc60b86ecb20a923a4f052f469cb8a8237153f
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

irqchip/qcom-pdc: Configure PDC to pass through mode

This commit configures the PDC to pass through mode using an SCM write
access. If the write fails, it falls back to a secondary controller mode
where GPIO IRQs are latched at the PDC and sent to the GIC as level
interrupts.

> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 1aa6be42307ca..c6f2935ff7887 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c

[ ... ]

> @@ -231,6 +260,30 @@ static void pdc_enable_intr_bank(int pin_out, bool o=
n)
>  		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
>  }
> =20
> +static void pdc_clear_gpio_cfg(int pin_out)
> +{
> +	unsigned long gpio_sts;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_sts =3D pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	__clear_bit(pdc->cfg_fields->gpio_irq_sts, &gpio_sts);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
> +}
> +
> +static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
> +{
> +	unsigned long gpio_mask;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_mask =3D pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	__assign_bit(pdc->cfg_fields->gpio_irq_mask, &gpio_mask, !unmask);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_mask);

[Severity: High]
Could this read-modify-write operation accidentally clear a pending interru=
pt?

Since pdc_clear_gpio_cfg() clears the hardware latch by setting gpio_irq_sts
to 0, it appears this is a Write-0-to-Clear (W0C) register bit.=20

If a new interrupt arrives and the hardware sets gpio_irq_sts to 1 right
after the read but before the write completes:

CPU
pdc_unmask_gpio_cfg()
    gpio_mask =3D pdc_reg_read(...) // reads gpio_irq_sts as 0

Hardware
Interrupt arrives, sets gpio_irq_sts to 1

CPU
pdc_unmask_gpio_cfg()
    pdc_reg_write(..., gpio_mask) // writes 0 back to gpio_irq_sts

Will this write of 0 inadvertently clear the newly latched interrupt before
it can be processed by the system?

> +}
> +
>  static void pdc_enable_intr_cfg(int pin_out, bool on)
>  {
>  	unsigned long enable =3D pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-hamoa_pdc_=
v3-v3-0-4d8e1504ea75@oss.qualcomm.com?part=3D5
