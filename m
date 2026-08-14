Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1C370D54
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689337; cv=none; b=GSXm1PNUeAViP9BeXRQElW07jRhd+kMc8e42PE886dBccd3fRxBVHHpVrLpBHPMVkbEPZWGFMMWbrbj3XI/+RaXXHQJsz/xPUl3hnpqC/PP6SbwtL04aW7oEsrBxsQYuVvf5ogMoF/5DowtTjmjRCYQaLozXEjm2pfzgp7CUVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689337; c=relaxed/simple;
	bh=nnLUqz/IKlvuSfMg4USQ9IULOM/LG27O/b7SuBnauTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XkXc8VQHPE1dNiNOoGjOh0hMzYNTnNsALOPPeyuWwtvqhscnYY3dtW7vBrIwxKfsOts1GPPZ84GKJy8ZbvuygE5ejJ5n2faD3TA5YKbQ67QuDeH7qB0Ovg2HMEbHOe3TfW6SYUTPShl5QXN7Miuoz9KuYfN1BaLAW20yYTE6E7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPB61IXN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPB61IXN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FDC1F000E9;
	Fri, 14 Aug 2026 06:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786689336;
	bh=eUiLcdIj2LCBAwQcCAvFRRIpmJXbW3ZggIymiLfnaG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dPB61IXNZxiLBLsvEYnDlnR6zySU4WXR0bQgGHoe3t2dpep2dgzg1VVIA2aMH2PAK
	 nx8LfQM7n9mABi4kxMz0e+7wvPrljCO7w8eIkSz6x97SCyABUg4iHdIre+44uJJ+Kz
	 TsTndgfIetqzKF0dvUzkZ1IEvoCYum3hbVMa/FebFbwma9oKyqrzyOPdd1/QX0p9fU
	 oAyttsshYto3Ii3SO3vyQzgyBlzS68rZMA0fJ+5uASOOCuwMQ7+DUhR1QSkASOfrNQ
	 xKTB4IiyxO5z1uysOp2iMAbPdyeDuwy2d2iyexw2njv/xocilEAVhvdy/F24cEBQs+
	 ZUR9B13Pbyu4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] gpio: pl061: add Ambarella CV75 register layout
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814-cv75-v4-b-v4-3-ef2e83ec0eac@ambarella.com>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
 <20260814-cv75-v4-b-v4-3-ef2e83ec0eac@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 06:35:30 +0000
Message-Id: <20260814063535.C6FDC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Global replacement of strictly ordered MMIO accessors with relaxed=
 variants strips required memory barriers, risking device synchronization a=
nd IRQ storms.
- [High] Unconditional clearing of the Alternate Function Select (`afsel`) =
register in probe forces all pins to GPIO mode, breaking bootloader-configu=
red peripherals.
--

--- Patch [3]: [PATCH v4 3/4] gpio: pl061: add Ambarella CV75 register layo=
ut variant ---
commit 2ccca896232c8172aca5451ae64d6ee831bac07f
Author: Long Zhao <longzhao@ambarella.com>

gpio: pl061: add Ambarella CV75 register layout variant

This commit extends the gpio-pl061 driver with a per-variant register layout
to support the Ambarella CV75 GPIO banks. It introduces wrapper functions f=
or
read/write operations and variant-specific data structures.

> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 919cf86fd590f..d9e5a9f25681c 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
[ ... ]
> @@ -26,41 +26,94 @@
[ ... ]
> +static u32 pl061_read(struct pl061 *pl061, u32 offset)
> +{
> +	if (pl061->variant->access_32bit)
> +		return readl_relaxed(pl061->base + offset);
> +
> +	return readb_relaxed(pl061->base + offset);
> +}
> +
> +static void pl061_write(struct pl061 *pl061, u32 value, u32 offset)
> +{
> +	if (pl061->variant->access_32bit)
> +		writel_relaxed(value, pl061->base + offset);
> +	else
> +		writeb_relaxed(value, pl061->base + offset);
> +}

[Severity: High]
Is it safe to replace the strictly ordered MMIO accessors with relaxed
variants globally in these wrappers?

By dropping the implicit memory barriers previously provided by readb() and
writeb(), could this lead to out-of-order MMIO operations and system lockup=
s?

For example, in pl061_irq_ack(), clearing the interrupt uses this new relax=
ed
wrapper. Because writeb_relaxed() lacks the wmb() barrier provided by write=
b(),
could the write clearing the peripheral interrupt remain in the CPU store b=
uffer
when the IRQ handler completes and unmasks the parent IRQ? This might cause
the CPU to instantly re-take the uncleared interrupt, resulting in an IRQ
storm.

Similarly, could bit-banging operations using GPIO be reordered with respec=
t to
DMA memory stores, breaking device data transfers?

[ ... ]
> @@ -335,7 +402,14 @@ static int pl061_probe(struct amba_device *adev, con=
st struct amba_id *id)
>  	/*
>  	 * irq_chip support
>  	 */
> -	writeb(0, pl061->base + GPIOIE); /* disable irqs */
> +	pl061_write(pl061, 0, pl061->variant->ie); /* disable irqs */
> +	if (pl061->variant->enable !=3D PL061_REG_NONE)
> +		pl061_write(pl061, GENMASK(pl061->gc.ngpio - 1, 0),
> +			    pl061->variant->enable);
> +	if (pl061->variant->afsel !=3D PL061_REG_NONE)
> +		pl061_write(pl061, 0, pl061->variant->afsel);

[Severity: High]
Does writing 0 to the entire afsel (Alternate Function Select) register
unconditionally during pl061_probe() reset the multiplexing for all pins
on the bank back to GPIO mode?

Could this forcibly disconnect any active peripherals (like UART, SPI, I2C)
that were already configured by the bootloader? If the system console UART
shares this GPIO bank, it seems like the system would immediately lose seri=
al
output on boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-cv75-v4-b-=
v4-0-ef2e83ec0eac@ambarella.com?part=3D3
