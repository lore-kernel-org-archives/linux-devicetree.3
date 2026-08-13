Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96243C09ED
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617051; cv=none; b=hweeMg3MeQNalkMxsIYOTCaA6dHYcc3ZIE4MtOgorAeudl+J+ySlKAUhe8muAJWxChkdcE1qgvyNo9+oXe/pOsHTwTuSNDB+XTWw4/6oVuLwo2nkLxfVSVqBpsUaEchPbr0A076tFDkWYiOgq6hpGL4xoVv70/dTWwVM8YwIAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617051; c=relaxed/simple;
	bh=vuEr0nyA1fhedArnwWL0i/4SZRRZDisrBjJE9F3brSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r9ihWzOv4FPJwdCzNdGLMf8cfVLxPtxOQmyuyuBSw2J8T2k57zoSfu1LFdva7JvVR5Hj5wzQtHb+swIo9MILvfotI4okBVW+PrUgKmxH3xxhLvVRlKwWxRUt7X8yCngQDLt1fPyaYI8NioQgivUgLlBIvpXYNkQ3IGew5jWSCCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZHX8rVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZHX8rVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E771F000E9;
	Thu, 13 Aug 2026 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786617050;
	bh=MTwLo/8/13C8lo+fL6vwg45cWlzTAyJxDyxLeHM/nQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZHX8rVUSShgXacyEwYi1gZFcTte6u/JZu/PV+qyVNbozG21X3cFHyFbj5cvoOhMK
	 yPy8NmENc9/CzUhqBSQG4JBke+LLs7bHRNZcmbnOn0lV2WGl9QueAVaJRVbIL+DSxz
	 IQpRpSUXWhpT6tqg2mEXl0L+yHN2r57+V6mjGAgnY23DxYl9awYqXGRAMp9VU1t9ef
	 8CV8IGeBEjdf6EuFrN+VB8AnfO7Vaxy7lYXp4E6XJ/yc+mapM9zXOMJ7XKG9LhyKAA
	 dlVv7M6/sOO6pDWcE1VCVakENHf2YwBofsvvMxdIOy2Kp9A2ZOyxmF0HXRBhonN6bJ
	 bYADalJidkM8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75 register layout
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
 <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:30:49 +0000
Message-Id: <20260813103050.24E771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The probe function unconditionally clears the entire `afsel` (alte=
rnate function select) register for the whole GPIO bank, breaking bootloade=
r pinmux state.
- [High] Silent removal of memory barriers from I/O accesses by switching t=
o `_relaxed` accessors.
- [High] The newly added `mask` register is restored in `pl061_resume` with=
out acquiring `pl061->lock`, breaking the atomicity of the `mask` and `data=
` register sequence.
--

--- Patch [2]: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75 register layo=
ut variant ---
commit fe14f60fc7b7fd8cd63e65496225f1d2973a8ad1
Author: Long Zhao <longzhao@ambarella.com>

gpio: pl061: add Ambarella CV75 register layout variant

This commit extends the gpio-pl061 driver with a per-variant register layou=
t.
This allows the Ambarella CV75 GPIO banks to reuse the PL061 driver instead
of duplicating the code.

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
Does switching from readb/writeb to the _relaxed accessors introduce memory
ordering regressions?

Since the original driver used the standard non-relaxed I/O accessors, this
change drops the implicit memory barriers on all accesses. Can this cause
CPU reordering of GPIO writes ahead of memory writes for drivers that depend
on memory writes being visible before signaling hardware?

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
Is it safe to write 0 to the entire afsel register during initialization?

By unconditionally zeroing out the alternate function selection during prob=
e,
does this blindly force all pins into GPIO mode and disconnect any active
peripherals configured by the bootloader or early firmware?

[ ... ]
> @@ -398,20 +489,75 @@ static int pl061_resume(struct device *dev)
[ ... ]
> +	if (pl061->variant->afsel !=3D PL061_REG_NONE)
> +		pl061_write(pl061, pl061->csave_regs.gpio_afsel,
> +			    pl061->variant->afsel);
> +	if (pl061->variant->mask !=3D PL061_REG_NONE)
> +		pl061_write(pl061, pl061->csave_regs.gpio_mask,
> +			    pl061->variant->mask);

[Severity: High]
Should pl061_resume hold pl061->lock when restoring the mask register?

Writing to the mask register without the lock breaks atomicity between mask
and data accesses. If an interrupt fires here and triggers a concurrent
pl061_set_data on another CPU, could the resume function overwrite the
mask register before the concurrent thread completes its data write, causing
it to update the wrong pins?

> +	if (pl061->variant->enable !=3D PL061_REG_NONE)
> +		pl061_write(pl061, GENMASK(pl061->gc.ngpio - 1, 0),
> +			    pl061->variant->enable);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-cv75-v3-b-=
v3-0-1d82e18da09b@ambarella.com?part=3D2
