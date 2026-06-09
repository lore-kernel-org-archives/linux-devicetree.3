Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5CD19E992
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780969573; cv=none; b=Pb0GsOuCzLn+BHLZCvm/zNEwrugsS52XmLOOGkVoqo8sXn8plAT7Ortr0BZuVzHL+mvVVJrZJ0wPeR2EdlmKz1/k4glfEAP3S6Rhc7EpEsB2cvy6UK40V6COxIRZhjGldgKcDni3bGG/HHcSsmCf6ppoAFBViaF8fVNKh7NoAV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780969573; c=relaxed/simple;
	bh=89Hypw7FFuvTIVQTg/MjyZRTAcpLQeEncGfhe+/kvwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ozw6JjNFg31XN0XkISL36cuOVSibvgAUybzv8BOv0uzku7N6Ug0dbj/u2br4G4PsVdPIYwOW0dFTFlYQHHXbQXhEIDdbKv2f2Kn9v9p3UXIq4okoIbvvZz7YdAmgkC2esMZTXiEyfL1HZ3ADSTgMWzt97/QdvdBKsfG3ZJDgKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzIyHxFb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzIyHxFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AE71F00893;
	Tue,  9 Jun 2026 01:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780969572;
	bh=RGYFRZBm595P8mcG2gfKgy7K9HZZdIO51PGscrrB8Yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PzIyHxFb4Bb0zgyZN+H9A4PdKT1EyWvfKdENFjFmPN8/9keDu3+7VnTBePm9TBm3G
	 jh/aYkdD2fyum4fB211vCFJ4OWLjVKiv/RBPk+EofRW3fTGrT4ST3zL99jL1Tvig3S
	 Um5zb7+Jw/Y5OV7ufASkj/VfB97HzU1sfYBObIOLmMI/abtjZWLAxNG2ce8jGA4U+X
	 iwccZlpG82um52vO6FjD8lalIevhEeEHzOny4IZXujCcjZV21xn6iIxaWACWz4HrSr
	 vfJuQNoIiYJlVcy6vsRfPVRRmGEcgcl5TCfh7JgXPbi0GCttpy+TBEsx7xgaab95WX
	 f3+xeeVt6Qxew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/11] ASoC: renesas: fsi: Move fsi_clk_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609013107.5995-7-phucduc.bui@gmail.com>
References: <20260609013107.5995-7-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 01:46:11 +0000
Message-Id: <20260609014611.C0AE71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A TOCTOU race condition in `fsi_stream_is_working()` allows concur=
rent stream shutdown, leading to hardware accesses while clocks are gated a=
nd NULL pointer dereferences.
--

commit 2a7ff11c2bbdedadae9c569f5a5fb36f784c525a
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Move fsi_clk_init()
   =20
Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 3e3c6fd7c56b8..1df7dc0143630 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c

[ ... ]

> @@ -1034,6 +970,70 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
>  	return ret;
>  }
> =20
> +static int fsi_clk_init(struct device *dev,

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the clock
handling in this file, does fsi_stream_is_working() have a TOCTOU race
condition that allows concurrent stream shutdown?

It appears that fsi_stream_is_working() acquires and immediately releases
master->lock before returning a boolean. Concurrently, an ALSA
SNDRV_PCM_TRIGGER_STOP on another CPU can call fsi_stream_quit(), which
acquires the lock, sets io->substream =3D NULL, and releases it. This can be
followed by fsi_hw_shutdown() disabling the hardware clocks.

Because the lock is dropped in fsi_stream_is_working(), can an in-flight
fsi_interrupt() on CPU 0 evaluate the check as true, after which CPU 1
processes the STOP trigger, zeroes the substream pointer, and gates the
clocks?

CPU 0 could then proceed to access hardware registers while clocks are
disabled:

sound/soc/renesas/fsi.c:fsi_count_fifo_err() {
	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
	    !fsi_stream_is_working(fsi, &fsi->capture))
		return;

	u32 ostatus =3D fsi_reg_read(fsi, DOFF_ST);
	...
}

Would this cause a system hang due to hardware access while clocks are
gated?

Additionally, in fsi_pio_transfer(), could this same TOCTOU race allow
execution to reach fsi_pio_get_area(), which unconditionally dereferences
io->substream->runtime?

sound/soc/renesas/fsi.c:fsi_pio_transfer() {
	if (!fsi_stream_is_working(fsi, io))
		return -EINVAL;

	buf =3D fsi_pio_get_area(fsi, io);
	...
}

sound/soc/renesas/fsi.c:fsi_pio_get_area() {
	struct snd_pcm_runtime *runtime =3D io->substream->runtime;

	return runtime->dma_area + ...
}

Could this result in a NULL pointer dereference if io->substream was
zeroed? This seems to be an issue that was only partially addressed by the
earlier commit "ASoC: renesas: fsi: Fix register access from in-flight IRQ
after shutdown".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609013107.5995=
-1-phucduc.bui@gmail.com?part=3D6
