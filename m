Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CC413D8B
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596778; cv=none; b=T/bsRhRgVGWtrr4aE2td7Gm7eKt0cRkhGyFQbEpGaTuSi3wQsEdTRZC8FFpwRnes+T+CDsWbjbL3Z07bpKQV+jRInMBu2ZcSD9sDudpmr+ArWsQ3YdFqaaCcE4ay6s2EU+Fc4p1Zb1qR1kRjwZG3J4V9nzQ7rY/bGFAB0hpQuvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596778; c=relaxed/simple;
	bh=X3b3YuZFHpJkVna26Tg4WbvtA8R4kV65KTUnT+sX6fo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DWQKD6vk5EAINx5kztlgI8UQ7VhCEoint+TVl1sesTkenqCzOtVcqW+SjiEMa/+6/qeEU7KWeqdKQRlYBkCLDd6aAl8ZYBtc0v6klS4Em3E2LawHLiTnJptDUZNjtOHTWgZ/kgs8qJdeVGJ6igEZWsAWpY2jPkpzUDEImTB+6/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gg/5mPTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gg/5mPTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28DE1F000E9;
	Thu,  9 Jul 2026 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596777;
	bh=0ulM/nJHDl/w4xPJ0KGDg1wnzkPcMO8uuxgndAa1ryk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gg/5mPTuKsy6OwwZNXtlgep3Sot/Pl92MXQv7zGPi9wTkOLxvQJhBPF2Bpq1NnywI
	 EQCbi4JHTGNVGiDQDu/pcR6HjRMJ0mcssM7eKyt17LXFAq6UqRyRBKMNoxqVYBIa0b
	 /Zy32dSOGJNYK+6ID+vJKQXiMJop8sVRbddPt4jnQScOzel94JScS1Z5E+goizzKGQ
	 YNgsnZl283fLGJopRUbQsr6nlCbzlxB5FR9IcEYSfUo3LtXf+BnAkMalUcWcjV6bo4
	 nVIJHkNZBObql2UFJR1O5VBC1rz28v1gpwRtFQkXJTSd9crE2a3W95noc8+yInoa+9
	 q0V+yCudb0r0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] spi: atmel-quadspi: add LAN969x QSPI support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709112006.390742-5-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:32:56 +0000
Message-Id: <20260709113256.C28DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Loss of SPI Chip Select custom timings due to explicitly clearing =
shadow registers in lan969x init.
- [High] Missing clk_disable_unprepare() on error paths in atmel_qspi_lan96=
9x_init() causes clock reference leak.

Pre-existing issues:
- [High] Missing PM runtime wakeup in has_gclk device setup path causes sys=
tem hang.
- [High] Silent loss of QSPI_MR configuration across suspend/resume because=
 shadow register check prevents hardware update.
- [High] Clock enable count leak in atmel_qspi_set_gclk() on repeated SPI s=
etup.
- [Medium] System resume timeout if no SPI child devices are attached to th=
e controller.
--

--- Patch [4]: [PATCH v2 4/5] spi: atmel-quadspi: add LAN969x QSPI support =
---
commit e7c8f2e53e20c016b424a0d36952bf174920cb87
Author: Robert Marko <robert.marko@sartura.hr>

spi: atmel-quadspi: add LAN969x QSPI support

Microchip LAN969x has two QSPI controllers based on SAMA7G5 QSPI.
It requires pad calibration, supports DMA, and supports 100 MHz operation.

> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index d1aec14e39789..f05e2617fa89e 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
[ ... ]
> @@ -1152,6 +1152,58 @@ static int atmel_qspi_sama7g5_init(struct atmel_qs=
pi *aq)
>  	return ret;
>  }
> =20
> +static int atmel_qspi_lan969x_init(struct atmel_qspi *aq)
> +{
> +	u32 val;
> +	int ret;
> +
> +	atmel_qspi_write(QSPI_CR_DLLOFF, aq, QSPI_CR);
> +	ret =3D readl_poll_timeout(aq->regs + QSPI_SR2, val,
> +				 !(val & QSPI_SR2_DLOCK), 40,
> +				 ATMEL_QSPI_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D atmel_qspi_set_gclk(aq);
> +	if (ret)
> +		return ret;
> +
> +	/* Start the DLL before resetting the controller. */
> +	atmel_qspi_write(QSPI_CR_DLLON | QSPI_CR_STPCAL, aq, QSPI_CR);
> +	ret =3D readl_poll_timeout(aq->regs + QSPI_SR2, val,
> +				 (val & QSPI_SR2_DLOCK) &&
> +				 !(val & QSPI_SR2_CALBSY), 40,
> +				 ATMEL_QSPI_TIMEOUT);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this early return path leave the hardware generic clock running?

The function calls atmel_qspi_set_gclk() which prepares and enables aq->gcl=
k.
If the subsequent readl_poll_timeout() operations fail (such as waiting for
the DLL to lock), the function directly returns the error code.

Without calling clk_disable_unprepare(aq->gclk), won't this result in a
permanent clock reference leak?

[ ... ]
> +	atmel_qspi_write(QSPI_CR_SWRST, aq, QSPI_CR);
> +	ret =3D atmel_qspi_reg_sync(aq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D atmel_qspi_set_pad_calibration(aq);
> +	if (ret)
> +		return ret;
> +
> +	aq->mr =3D 0;
> +	aq->scr =3D 0;

[Severity: High]
Does explicitly clearing these shadow registers permanently wipe the
cached hardware timings?

During system resume or dynamic reconfiguration via spi_setup(),=20
atmel_qspi_resume() or atmel_qspi_setup() invokes aq->caps->init().
Zeroing out aq->mr and aq->scr clears the chip select timings (cs_setup,
cs_hold, cs_inactive) that were configured by atmel_qspi_set_cs_timing().

Will this cause data communication failures with SPI memory because the tim=
ings
are wiped from the cache and never written back, making the controller oper=
ate
with zero delays?

> +
> +	ret =3D atmel_qspi_set_serial_memory_mode(aq);
> +	if (ret)
> +		return ret;
> +
> +	atmel_qspi_write(QSPI_CR_QSPIEN, aq, QSPI_CR);
> +	return readl_poll_timeout(aq->regs + QSPI_SR2, val,
> +				  (val & QSPI_SR2_QSPIENS), 40,
> +				  ATMEL_QSPI_TIMEOUT);
> +}


Additionally, there are some pre-existing issues in this file that I noticed
while reviewing the code.

[Severity: High]
This isn't a bug introduced by this patch, but does the has_gclk device set=
up
path lack a PM runtime wakeup, potentially causing a system hang?

drivers/spi/atmel-quadspi.c:atmel_qspi_setup() {
    ...
	if (aq->caps->has_gclk)
		return atmel_qspi_sama7g5_setup(spi);
    ...
}

The atmel_qspi_setup() function delegates to atmel_qspi_sama7g5_setup() whi=
ch
directly invokes hardware register writes via aq->caps->init(aq). Unlike the
fallback non-gclk path in the exact same function, this path fails to call
pm_runtime_resume_and_get().

If spi_setup() is called by a client driver while the SPI controller has
autosuspended, won't the driver touch registers with the power domain or
peripheral clock disabled, causing a system crash or bus fault?


[Severity: Medium]
This is a pre-existing issue, but does atmel_qspi_resume() unconditionally
attempt hardware initialization using uninitialized speed values?

drivers/spi/atmel-quadspi.c:atmel_qspi_resume() {
    ...
	if (aq->caps->has_gclk)
		return aq->caps->init(aq);
    ...
}

If no SPI child devices probe successfully, aq->target_max_speed_hz remains=
 0.
During system resume, atmel_qspi_resume() executes aq->caps->init(aq) for
has_gclk controllers. This invokes atmel_qspi_set_gclk(), setting the clock
to 0 Hz.

Won't the subsequent polling for the DLL lock (QSPI_SR2_DLOCK) inevitably
timeout since the clock is halted, causing readl_poll_timeout() to stall for
1000ms?


[Severity: High]
This is a pre-existing issue, but does the shadow register check block
hardware writes if the bit is already cached, breaking restoration on resum=
e?

drivers/spi/atmel-quadspi.c:atmel_qspi_set_serial_memory_mode() {
    ...
	if (!(aq->mr & QSPI_MR_SMM)) {
		aq->mr |=3D QSPI_MR_SMM;
		atmel_qspi_write(aq->mr, aq, QSPI_MR);
    ...
}

During system resume, non-gclk controllers rely on atmel_qspi_init() to
restore hardware state after a software reset (QSPI_CR_SWRST). It calls
atmel_qspi_set_serial_memory_mode() to restore the Mode Register (QSPI_MR).

Because aq->mr retains its pre-suspend value with the SMM bit set, the
condition evaluates to false and the register write is silently skipped.
Could this leave the hardware at its reset state of 0 and break device
communication after resume?


[Severity: High]
This is a pre-existing issue, but does atmel_qspi_set_gclk() unconditionally
increment the clock enable count during every setup call?

drivers/spi/atmel-quadspi.c:atmel_qspi_set_gclk() {
    ...
	/* Enable the QSPI generic clock */
	ret =3D clk_prepare_enable(aq->gclk);
    ...
}

spi_setup() can be called multiple times during the lifecycle of a SPI devi=
ce.
Every time it is called on a has_gclk controller, it invokes
aq->caps->init(aq), which sequentially calls atmel_qspi_set_gclk().

Since clk_disable_unprepare() is only ever called once during device suspend
or removal, won't this endlessly increment the clock reference count and le=
ak
the reference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709112006.3907=
42-1-robert.marko@sartura.hr?part=3D4
