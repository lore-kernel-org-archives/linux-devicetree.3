Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4103EEAC0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006353; cv=none; b=tnmmTwGTX/V4guTEUfRR/3bGHlTOUIYb10vIh2DGPgGszpr0Tdlbty1Df460xKFI3fgE/W0tM1JfdfhsBfBDhKtI/JMZW0EBjXlnKcqweRkD8MHfnby0vZYu8akkbMP+ao7kZnxCFIYxMldAbH3m6TI/U8mnGSaHi0aTEFjJFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006353; c=relaxed/simple;
	bh=11rZRiZ5+mu+UOnrzZ0kuBj20Cqp/Ocs2USEV9UO3zA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WuYiF5WhlFe6MbYBEmePYrEe8/4aoo/GosQi1YFS3ZmPf005iAqqcr9D/MbxLDBLlsdw+tmCrL7FsvCkxVGKoOtwi/4sJwrABzlc0z+5HFKd6dmMkgc+Gd4kZVEM0TtK1QPqVvn1EVL5kcS7RGmSrrJsW5sC9QPPjakW1ZMpoxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQtTfrdc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQtTfrdc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189B71F00893;
	Tue,  9 Jun 2026 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006348;
	bh=kAj8MPZiaKtP4iZTZDUWhcADyr/C1L3162mrt5p68FI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQtTfrdcEKcbvbhkxnBwbxnP8zU2Mhs/DLiBlKpQITmcjTt1H+aiSIGQMkvOi7kbN
	 d6rx3RILx++PzxM79sp0UNRCZE+wWWPhjFI6caBn3xEkiDG4voENKP7wFVfn0DRHYa
	 UkyaA/Zy/OmiwibZHxM27rIZkiEgkOy6fhwk46kDbe80rQ7PCHq+/9MuCUAPyzX0bq
	 bUFsM1MhbNmV3+mDW8AWaJhIJz1yyy/oIaJ893kN821xiLjWqGK8umYwS2Md9Il2Zy
	 GVdlZW0gr5t9Dr/cFi9+SzeWOnq2ZoURdTJUWmSp0Wi0u1F4o2zhnPCA5Z1nCuEiqf
	 o2am4Q7KlRMdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/11] ASoC: renesas: fsi: Fix register access from
 in-flight IRQ after shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609113836.45079-6-phucduc.bui@gmail.com>
References: <20260609113836.45079-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:59:07 +0000
Message-Id: <20260609115908.189B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The newly added `fsi_stream_is_working()` checks introduce a Time-=
of-Check to Time-of-Use (TOCTOU) race condition with the clock disablement =
path.

Pre-existing issues:
- [High] The patch fails to prevent system hangs during in-flight IRQs beca=
use it misses the `fsi_stream_transfer()` path, which still performs unprot=
ected hardware accesses and NULL pointer dereferences.
--

commit 6fe54dc43154d802e5ce8471d592fd6f73f622bd
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown

This commit attempts to fix system hangs caused by in-flight IRQs accessing
registers when the SPU clock is disabled. It introduces fsi_stream_is_worki=
ng()
checks in fsi_count_fifo_err() and fsi_irq_clear_status() to abort early if=
 no
streams are active.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 0bd0e0c8c5a30..3e3c6fd7c56b8 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -470,6 +470,10 @@ static int fsi_get_current_fifo_samples(struct fsi_p=
riv *fsi,
> =20
>  static void fsi_count_fifo_err(struct fsi_priv *fsi)
>  {
> +	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
> +	    !fsi_stream_is_working(fsi, &fsi->capture))
> +		return;
> +

[Severity: High]
Does this introduce a time-of-check to time-of-use race condition?

The fsi_stream_is_working() function acquires master->lock, checks the
substream, and immediately drops the lock. Because the lock is released bef=
ore
the hardware access below:

	u32 ostatus =3D fsi_reg_read(fsi, DOFF_ST);
	u32 istatus =3D fsi_reg_read(fsi, DIFF_ST);

Could a concurrent ALSA shutdown sequence on another CPU execute
fsi_stream_quit() and fsi_hw_shutdown() to disable the SPU clock exactly in
this window, leading to the same system hang?

[ ... ]

> @@ -681,6 +685,10 @@ static void fsi_irq_clear_status(struct fsi_priv *fs=
i)
>  	u32 data =3D 0;
>  	struct fsi_master *master =3D fsi_get_master(fsi);
> =20
> +	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
> +	    !fsi_stream_is_working(fsi, &fsi->capture))
> +		return;
> +
>  	data |=3D AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
>  	data |=3D AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does the in-flight IRQ still
trigger hardware accesses and NULL pointer dereferences through other paths?

If fsi_interrupt() runs during shutdown, it calls fsi_stream_transfer()
unconditionally without checking fsi_stream_is_working() first:

sound/soc/renesas/fsi.c:fsi_interrupt() {
	if (int_st & AB_IO(1, AO_SHIFT))
		fsi_stream_transfer(&master->fsia.playback);
	...
}

In PIO mode, this leads to fsi_pio_push() which reads the hardware registers
before verifying the stream state:

	sample_space =3D io->fifo_sample_capa -
		       fsi_get_current_fifo_samples(fsi, io);

In DMA mode, it leads to fsi_dma_transfer() which dereferences io->substream
directly:

	struct snd_soc_dai *dai =3D fsi_get_dai(io->substream);
	struct snd_pcm_substream *substream =3D io->substream;

Can this still cause a system hang or a NULL pointer dereference if the
stream clock is already disabled and io->substream is set to NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D5
