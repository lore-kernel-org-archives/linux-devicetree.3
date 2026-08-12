Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7464936F8EE
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549563; cv=none; b=Z6SeUEJWsjxtj8fbiHf3V/3b+csI2kmbs8Fh9KNO5otznpK+oCsLfDgciHC+8v+G9k3mKmq1OrcTBTW5vwvxRXN/VFVQa77OJz1tNchuaoL5idWTl3s68U1O8VOb8bYK948sap9ZFdJEyQo/OesjghjUIp3fHHoln//RkqBILKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549563; c=relaxed/simple;
	bh=g2060a9pk3BzNyVmVkuenj+T1eJB+qsdHDoqSuXgv7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HeD1MHxId1HvUpkAFMA3yXZcjQ5rEaCWQVVONN6rwT6SCzMZisvv91FSHFhQaAbLrb737Ph1VFctoq1/4cQqYlhu/6dTuRdeMJ1+zhV2KtjsmfF1fxcZUCv5xE684zHB0m9Wq8xmWUGDaJF7rFn9miflMMgx/gRk/4x99Ff3c0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gsl2ZUHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gsl2ZUHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4971F000E9;
	Wed, 12 Aug 2026 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786549562;
	bh=PdYCp6xZBpbYVCBbD4gTSJaDTY5pwmYkEN/4bvfV5yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gsl2ZUHsIRP4c4g+MJE0iJD2P8VM0XXNlwTN12weHAwFQN724f40qpCtytUCPX6N+
	 P0CSGGqJTOGAxcSkNln0Cu0ecPjn0+RHe6+eg+So5jb26DgRkO5vnaZfxnVuz/eAun
	 isQmgWEYrS1ygX1ubO06SAjQdQXAxRoBVGBeAjMC11wpPkAZHEMX15QPsymWfrVxHY
	 qC0FaMrn77m3DdnI6VhhLmSEiJICZoRQnn3eleduDucqyKx94ngv33u7pxI8X4KAib
	 R5C2NnNqmVIGOa2S9MF41JY/IdAHtxIfggrlvWgfNuKqIE2YBanRDk790SaIeWKLG2
	 BPgOCbyB56EXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812-mma8452-open-drain-v4-5-bfca15d02b59@geanix.com>
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
 <20260812-mma8452-open-drain-v4-5-bfca15d02b59@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:46:01 +0000
Message-Id: <20260812154601.CB4971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PM runtime resume handler fails to restore most device configu=
ration registers after a power cycle, reverting to POR defaults.
- [High] The driver ignores the requested interrupt polarity from irq_get_t=
rigger_type() and fails to configure the hardware's WAKE_INT_POL bit.
- [High] Sysfs read/write handlers modify device registers and poll STATUS =
without acquiring a PM runtime reference.
--

--- Patch [5]: [PATCH v4 5/6] iio: accel: mma8452: Allow open drain interru=
pt pin configuration ---
commit 7603b79afdeeb3c4d36936afa7e16bc8d738683c
Author: Esben Haabendal <esben@geanix.com>

    iio: accel: mma8452: Allow open drain interrupt pin configuration
   =20
    When designing systems sharing the interrupt for mma8452 chips, it is
    helpful to be able to configure the irq pin in open-drain mode (default=
 is
    push-pull).
   =20
    Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
    Signed-off-by: Esben Haabendal <esben@geanix.com>

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 106cdd904dbfd..7992f9e388180 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
[ ... ]
> @@ -647,6 +650,22 @@ static int mma8452_set_power_mode(struct mma8452_dat=
a *data, u8 mode)
>  	return mma8452_change_config(data, MMA8452_CTRL_REG2, reg);
>  }
> =20
> +static int mma8452_set_interrupt_pin_mode(struct mma8452_data *data)
> +{
> +	int reg;
> +
> +	reg =3D i2c_smbus_read_byte_data(data->client, MMA8452_CTRL_REG3);
> +	if (reg < 0)
> +		return reg;
> +
> +	if (data->open_drain)
> +		reg |=3D MMA8452_CTRL_REG3_PP_OD;
> +	else
> +		reg &=3D ~MMA8452_CTRL_REG3_PP_OD;

[Severity: High]
This is a pre-existing issue, but could this function also configure the
interrupt polarity bit to match the requested irq polarity?

If a board's device tree specifies an active-high interrupt, the driver
requests the irq with that flag but leaves the chip generating active-low
signals.

Since this function modifies the open-drain setting in MMA8452_CTRL_REG3,
might it also ensure the polarity bit is set correctly so we don't end up
with missing interrupts or continuous interrupt storms?

> +
> +	return i2c_smbus_write_byte_data(data->client, MMA8452_CTRL_REG3, reg);
> +}
> +
[ ... ]
> @@ -1817,6 +1841,10 @@ static int mma8452_runtime_resume(struct device *d=
ev)
>  		return ret;
>  	}
> =20
> +	ret =3D mma8452_set_interrupt_pin_mode(data);
> +	if (ret)
> +		goto runtime_resume_failed;
> +
>  	ret =3D mma8452_active(data);

[Severity: High]
This is a pre-existing issue, but does mma8452_runtime_resume() fully resto=
re
the device state after a power cycle?

When the device goes to runtime suspend after a period of inactivity,
mma8452_runtime_suspend() disables the vdd and vddio regulators, causing the
hardware to lose all its register state.

When it wakes up, only MMA8452_CTRL_REG1 and MMA8452_CTRL_REG3 are restored
here. Does this leave crucial configurations like MMA8452_DATA_CFG,
MMA8452_CTRL_REG4, and MMA8452_CTRL_REG5 uninitialized and revert to power-=
on
defaults?

Could this cause the device to operate with incorrect full-scale settings a=
nd
disabled interrupts?

>  	if (ret < 0)
>  		goto runtime_resume_failed;


[Severity: High]
This is a pre-existing issue, but do the sysfs read/write handlers modify
device registers and poll the status without acquiring a pm runtime referen=
ce?

For example, looking at mma8452_read() in drivers/iio/accel/mma8452.c:

mma8452_read() {
    ...
    int ret =3D mma8452_drdy(data);

    if (ret < 0)
        return ret;

    ret =3D mma8452_set_runtime_pm_state(data->client, true);
    ...
}

The driver polls the status register before waking up the device.
Since the device enters autosuspend and turns off its regulators, will any
subsequent sysfs read or write attempt to access an unpowered chip?

Could this result in bus errors and completely break the sysfs interface?

Also, __mma8452_write_raw() calls into mma8452_change_config() which reads
from the device without holding a pm runtime reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-mma8452-op=
en-drain-v4-0-bfca15d02b59@geanix.com?part=3D5
