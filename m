Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F403FDBEC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005906; cv=none; b=BFfetE9L4VfFyczP0JT4/dvYUe++nL+AHA1hDhsuQlOrv6VOkK3VYCAA6vtO4/iSQs2ktgmek9CNvSaQif/GmquYVIfEEFQMYti36b2oJDu03M63bC9xVyJWt5qSRpJ6s1yr/v+1uTUW2gnUXOuf7bkQerNQpPrPtCkpK2F3dKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005906; c=relaxed/simple;
	bh=D5HEnzHGIfqgIFZ1ZfTSyW2wlaNHY2QTPS/tN6xyOwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qaFFTiJBXccMo/0nVBzLNxx2IbhVjwJgpv5FporrK8XYtWuc4HXl5E/FCPKWUIz1bFgWz60sIM9cyPFXywZ6WkfWK4aaR1Ip5ccElmrutvRWea/TgiCAUWVWVTwqLZNdRmcqYJS94ZGGmc0pX56rnu6m9YfebpbIWRwli+yc5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEz4r7JC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEz4r7JC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6FB1F0089A;
	Tue,  9 Jun 2026 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005905;
	bh=N0h1aVl2F5m+rpmcp3lY8fVcS741+ADCPbHAytYnvx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gEz4r7JCBQrhUWoXLLxBef1CEDZjv74RY6a4tXphIdWr63JZgcl7e7svoD0w1scPx
	 LtFqTsPm7YmGO2EYkrSgleOH+GaV5KV7AGyfmbkuD4XeO346SKFqpVnKL6UZDY3Xef
	 51Yc/VyLkoHikf/5p8p1d7A0D/9/JvrzO9jP5vVv9+iFPRSDk4gA7aosOWS6SePqII
	 0gB+wy28DbaPjix0MGysT00aU7htC4dGnyZVMm6pcGrFG7gmMpHssWURXRn5mpsdny
	 aTGmxzDIt98sgA75oSL7YHX3MmARhwYouhZ3XlVTvJ1Gldd9SZB6jxOF94Vu8TU237
	 M9NagfCuZe5Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/11] ASoC: renesas: fsi: Move
 fsi_stream_is_working()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609113836.45079-5-phucduc.bui@gmail.com>
References: <20260609113836.45079-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:51:44 +0000
Message-Id: <20260609115144.DD6FB1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Time-of-check to time-of-use (TOCTOU) race condition between fsi_s=
tream_is_working() and subsequent lockless pointer access in fsi_pio_get_ar=
ea(), leading to a potential NULL pointer dereference.
--

commit 8fa524754ea1b8f1ac9ac2d6e00b052f212f3a41
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Move fsi_stream_is_working()
   =20
Move fsi_stream_is_working() before fsi_count_fifo_err(). This prepares for
a subsequent patch that needs to check stream status when handling in-flight
IRQ handlers.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 800ac40f9680d..0bd0e0c8c5a30 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -442,6 +442,16 @@ static int fsi_sample2frame(struct fsi_priv *fsi, in=
t samples)
>  	return samples / fsi->chan_num;
>  }
> =20
> +static int fsi_stream_is_working(struct fsi_priv *fsi,
> +				 struct fsi_stream *io)
> +{
> +	struct fsi_master *master =3D fsi_get_master(fsi);
> +
> +	guard(spinlock_irqsave)(&master->lock);
> +
> +	return !!(io->substream && io->substream->runtime);
> +}

[Severity: High]
This is a pre-existing issue, but does fsi_stream_is_working() leave callers
vulnerable to a time-of-check to time-of-use (TOCTOU) race condition?

The lock is acquired and then immediately released, protecting only the
condition check but not the caller's subsequent pointer usage. For example,
in fsi_pio_transfer(), the stream status is checked securely but the lock is
dropped, followed immediately by a lockless pointer access:

	if (!fsi_stream_is_working(fsi, io))
		return -EINVAL;

	buf =3D fsi_pio_get_area(fsi, io);

Concurrently, an ALSA stream stop triggered from userspace could call
fsi_stream_quit() on another CPU, which acquires the lock and sets
io->substream to NULL:

	guard(spinlock_irqsave)(&master->lock);
	...
	io->substream =3D NULL;

If fsi_stream_quit() acquires the lock immediately after
fsi_stream_is_working() releases it, the pointer would be nullified just
before the IRQ handler continues execution.

The IRQ handler would then proceed to call fsi_pio_get_area(), which
locklessly dereferences io->substream->runtime:

static u8 *fsi_pio_get_area(struct fsi_priv *fsi, struct fsi_stream *io)
{
	struct snd_pcm_runtime *runtime =3D io->substream->runtime;

Can this result in a NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D4
