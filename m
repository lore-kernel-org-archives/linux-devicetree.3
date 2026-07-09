Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7AB3FFF91
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597127; cv=none; b=dv6nAIFC5+DAWM/ai4qLO8v1qt4Do/MEhi1hc1FcPfGg69U/cRPMhSP4x4++wy89q836GPdz1aoG5N7SmNY8w8CF1UKyt8duabL3sBpMOJ7S/01z+JcBtf4xSKp2p3reLukKxCnyAHdvRD9/QhPrLaLKw9Lm281T5RJ9sTShmpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597127; c=relaxed/simple;
	bh=OVbpVDRyZTBO7y/N/FqdD48oqS1uZjPktXmBLeNpn7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kjqT/SfInxDYTGnLC6OTk++r7Y5I3EgFXJHYUCP8A6UCd2vjECceTvgmtcYByPfF2s2JVy2BmY9ZITf409CiIuUbqWHqm3pBYXcYRzIn5vFHcBZ5P4k9OCos13xUaNCNy2HMp7l377HHxkoUoQU+arl3T6OcuoJrg9FbseQ88kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FByXFh9E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FByXFh9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C47B1F000E9;
	Thu,  9 Jul 2026 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597121;
	bh=Qy2mrmLiFlokOqk+VudBdNGIf3/P95lVo/QF7Qudbwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FByXFh9EHRdCTGkWYSJVZJAfD8dMIyllYmmFrYhBFvk3iNMEzyBX/z6ftjzlGlD/h
	 NnrBSA0vHu+A43F1z18tNlDEQjSxGfMSqGXJss0cGIBbMrUnQisHzxexiWYjR/FmhO
	 mc1rfZfTg5qIHHaXQ2NYafiUZv0AM7ipMH1Ta1F6KA3t15ZHIEw5mwRN0+05RdDZeR
	 8efnww/afHbJZlahk9h3zJmnFs/toQs7EHoHNUhV522NbOXSi/cTN5j8WYdGELschP
	 /QxyivcIdNXuw29Vnvt+2N6ZeW/PvkM/psGLXAJS6CAB1Zuqa008x20x1yGdZAdfnE
	 8HpCS6OLTosew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] spi: atmel-quadspi: add controller init callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709112006.390742-3-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:38:40 +0000
Message-Id: <20260709113841.6C47B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The custom `.init` callback is evaluated unconditionally in `atm=
el_qspi_resume()`, bypassing required PM state restoration for non-gclk var=
iants.
- [Medium] Unbalanced clock prepare operations on the error path of the new=
ly added `.init()` callback in `atmel_qspi_resume()`.

Pre-existing issues:
- [High] Pre-existing bugs in the `has_gclk` suspend/resume paths cause a P=
M runtime usage counter leak and perform hardware register accesses with di=
sabled clocks.
- [High] The generic clock (`gclk`) enable count leaks continuously because=
 `clk_prepare_enable()` is invoked unconditionally during every SPI setup.
--

--- Patch [2]: [PATCH v2 2/5] spi: atmel-quadspi: add controller init callb=
ack ---
commit 6c4a6f692bd1bda4ee70cd3b53efc7320ebf6191
Author: Robert Marko <robert.marko@sartura.hr>

spi: atmel-quadspi: add controller init callback

Allow controller variants to provide a custom initialization callback
through their capability data. This prepares the driver for variants
which require a different hardware initialization sequence without
adding SoC checks to the common path.

> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index aaf7f4c46b22f..62ea84d234d02 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c

[ ... ]

> @@ -1156,6 +1159,9 @@ static int atmel_qspi_sama7g5_setup(struct spi_devi=
ce *spi)
>  	/* The controller can communicate with a single peripheral device (targ=
et). */
>  	aq->target_max_speed_hz =3D spi->max_speed_hz;
> =20
> +	if (aq->caps->init)
> +		return aq->caps->init(aq);
> +

[Severity: High]
This is a pre-existing issue, but does invoking initialization callbacks
from atmel_qspi_sama7g5_setup() cause a generic clock enable count leak?

The generic clock enable count appears to leak continuously because
atmel_qspi_set_gclk() unconditionally calls clk_prepare_enable().

Since spi_setup() can be called multiple times during the device lifecycle,
such as when the SPI core probes child devices or adjusts transfer speeds,
the clock's enable count repeatedly increments:

drivers/spi/atmel-quadspi.c:atmel_qspi_set_gclk() {
    ...
	ret =3D clk_prepare_enable(aq->gclk);
    ...
}

Because clk_disable_unprepare() is only called once during system
suspend, the clock becomes severely unbalanced and might never be fully
shut down.

>  	return atmel_qspi_sama7g5_init(aq);
>  }

[ ... ]

> @@ -1570,6 +1576,9 @@ static int __maybe_unused atmel_qspi_resume(struct =
device *dev)
>  		return ret;
>  	}
> =20
> +	if (aq->caps->init)
> +		return aq->caps->init(aq);
> +

[Severity: Medium]
Will this unconditional early return bypass required power management state
restoration for non-gclk variants?

If a non-gclk variant defines an init callback, it will intercept the
system resume path and completely bypass pm_runtime_force_resume() and the
default non-gclk hardware restoration sequence that occurs further down in
atmel_qspi_resume().

[Severity: Medium]
Does this also create a clock prepare count leak on the error path?

If the newly added init callback fails and returns a non-zero error code
in atmel_qspi_resume(), the function returns immediately.

This skips the necessary clk_unprepare() calls for aq->pclk and aq->qspick
that were successfully prepared earlier in atmel_qspi_resume().

>  	if (aq->caps->has_gclk)
>  		return atmel_qspi_sama7g5_init(aq);

[Severity: High]
This is a pre-existing issue, but does returning early for has_gclk
devices leak a power management runtime usage counter and access hardware
with disabled clocks?

In atmel_qspi_suspend(), pm_runtime_resume_and_get() increments the power
management usage count. For has_gclk devices, it returns early, skipping
pm_runtime_force_suspend() and missing a balancing pm_runtime_put():

drivers/spi/atmel-quadspi.c:atmel_qspi_suspend() {
    ...
	if (aq->caps->has_gclk) {
		ret =3D atmel_qspi_sama7g5_suspend(aq);
		clk_disable_unprepare(aq->pclk);
		return ret;
	}
    ...
}

In atmel_qspi_resume(), it calls clk_prepare() for aq->pclk but misses
clk_enable(). It then returns early via atmel_qspi_sama7g5_init(),
completely skipping pm_runtime_put_autosuspend().

As a result, every system suspend/resume cycle permanently leaks a power
management usage count.

Furthermore, because clk_enable() is never called, the hardware
initialization callback accesses registers with a disabled peripheral clock,
which could cause an asynchronous external abort or bus fault on resume:

drivers/spi/atmel-quadspi.c:atmel_qspi_lan969x_init() {
    ...
	atmel_qspi_write(QSPI_CR_DLLOFF, aq, QSPI_CR);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709112006.3907=
42-1-robert.marko@sartura.hr?part=3D2
