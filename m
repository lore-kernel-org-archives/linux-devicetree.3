Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0092352C2B
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541778; cv=none; b=QZ6D9qIBNzeQQNU8mNjnD+uttt5EvKFdsXNQpfGCx2nXjBCp9q1y28M3vQe/HLUDL83PQIWS0W62he+mH3j8KFoyg4n/B8Az8Eya63R/sQm2ydh0zmkZiZ6YbqCCuIUfgc9h07kbPOw5f4hIeEKdP1OD/llj45bgoso137KJnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541778; c=relaxed/simple;
	bh=BRSK7yoMj2D171k4ekbsznlubzvXNoOKK+XgwOZmD9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XHjOurdCuDI4rStDfhOS5TlCKwu35neQI6wX2+EuvooifeSuGEBC8PIOTiExslL6r1regMwOuni8OBMeUqB0cV5WrC7dTt0pZTm9yVtg3DGoICbnXugcCirLcp/FnFCplGyIEz2sf3XVVdlkHqGmp3VCF/gOXKNQoiezH7rfKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCPMH0I8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCPMH0I8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3B3C2BCB0;
	Mon, 11 May 2026 23:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541778;
	bh=BRSK7yoMj2D171k4ekbsznlubzvXNoOKK+XgwOZmD9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MCPMH0I8Lo8L0T1QudW3EFwEabhYr9B0R1ZAuXhBeRDPS6RTBDLs+Ibus4KgUSOVK
	 WjbLehLLC0ih9lr90t9HzEQmIvYld/F+4x8Pv7ef9zJQdqUUw5CXM3ZOFouyGMW1kO
	 YMKB1TRipdEHp3Gt/s9QlAB5b37d00SDWF8+XB+JJhyPkbnK725GYahr5hREnhw6Cj
	 F1VACg7RDyOfLvCSaIrOAOmT53h5ApoYssx50hVbH9qlWuWChtN8MeDK4z8EwNO+uQ
	 TJ8SyB03wBkW4j3Gi8UAudmfcoph2tc9xlWENM5REUjFxA4VTeKTpUW+f7RPNM5NNk
	 agwZqysK2Otzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/10] ASoC: renesas: fsi: Fix register access from
 in-flight IRQ after shutdown
Reply-To: sashiko@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510084303.122426-5-phucduc.bui@gmail.com>
References: <20260510084303.122426-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:22:57 +0000
Message-Id: <20260511232258.0E3B3C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Incomplete Fix / Unprotected Hardware Access in fsi_stream_tra=
nsfer()
- [Critical] Uncleared Interrupt Status Causes Guaranteed Hang on Next IRQ
- [Critical] Pre-existing TOCTOU Race Leading to NULL Pointer Dereference i=
n IRQ Handler
- [High] Data Race / TOCTOU on fsi->running_streams
- [High] State Tracking Variables Leak on START Failure
--

commit a5f51696dc0fd84e1f16198b25e33b2b5da818dc
Author: bui duc phuc <phucduc.bui@gmail.com>
Subject: ASoC: renesas: fsi: Fix register access from in-flight IRQ after s=
hutdown

This commit attempts to fix a system hang caused by in-flight interrupt
handlers accessing hardware registers after the clocks are shut down. It
tracks running streams and adds early returns in the interrupt path when no
streams are active.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 94ab2e4908108..fc8428cb1ba73 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -460,6 +463,9 @@ static int fsi_get_current_fifo_samples(struct fsi_pr=
iv *fsi,
> =20
>  static void fsi_count_fifo_err(struct fsi_priv *fsi)
>  {
> +	if (fsi->running_streams =3D=3D 0)
> +		return;
> +

Does this check completely protect against hardware access during shutdown?

The interrupt handler calls fsi_stream_transfer() before reaching
fsi_count_fifo_err() and fsi_irq_clear_status(). The fsi_stream_transfer()
function calls handlers that directly read hardware registers, such as
DOFF_ST inside fsi_get_current_fifo_samples(). Because this hardware access
remains completely unprotected by the new running_streams check, would an
in-flight interrupt handler still access the shut-down hardware and cause
the exact system hang this patch is intended to fix?

Additionally, is there a time-of-check to time-of-use data race when
evaluating fsi->running_streams here?

The value is read locklessly in the interrupt handler, while it is updated
under fsi->master->lock in the process context during fsi_dai_trigger().
An in-flight interrupt on one processor could evaluate running_streams > 0
locklessly and proceed. Concurrently, another processor could execute
fsi_dai_trigger(SNDRV_PCM_TRIGGER_STOP), acquire the lock, decrement the
counter to 0, and disable the hardware clocks. When the interrupt handler
resumes, it would execute hardware accesses on the disabled clock.

As a side note, there appears to be a pre-existing time-of-check to
time-of-use issue leading to a potential NULL pointer dereference in the
interrupt handler. In fsi_pio_transfer(), the handler calls
fsi_stream_is_working(), which temporarily takes master->lock to verify
io->substream !=3D NULL. It then drops the lock and unconditionally
dereferences io->substream->runtime. Could a concurrent trigger stop on
another processor execute fsi_stream_quit() and set io->substream =3D NULL
between the check and the use, causing a kernel panic when the interrupt
handler resumes?

[ ... ]
> @@ -681,6 +687,9 @@ static void fsi_irq_clear_status(struct fsi_priv *fsi)
>  	u32 data =3D 0;
>  	struct fsi_master *master =3D fsi_get_master(fsi);
> =20
> +	if (fsi->running_streams =3D=3D 0)
> +		return;
> +

Can returning early here without clearing the interrupt status cause a
guaranteed hang on the next interrupt?

If an in-flight or delayed interrupt fires as the stream is shut down, the
handler skips clearing its port's interrupt bits in the shared master int_st
register. Because this register is shared between port A and port B, the
uncleared bit remains permanently asserted. When the other active port
subsequently generates an interrupt, fsi_interrupt() will read int_st, see
the stale bit for the shut-down port, and unconditionally call
fsi_stream_transfer() for it. This forces a hardware register access on the
shut-down port while its clocks are disabled.

[ ... ]
> @@ -1573,10 +1582,17 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
>  {
>  	struct fsi_priv *fsi =3D fsi_get_priv(substream);
>  	struct fsi_stream *io =3D fsi_stream_get(fsi, substream);
> +	bool need_shutdown =3D false;
>  	int ret =3D 0;
> =20
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
> +		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
> +			if (!io->running) {
> +				io->running =3D true;
> +				fsi->running_streams++;
> +			}
> +		}
>  		fsi_stream_init(fsi, io, substream);
>  		if (!ret)
>  			ret =3D fsi_hw_startup(fsi, io, dai->dev);

Does this leak the state tracking variables if the start sequence fails?

If fsi_hw_startup() or fsi_stream_start() fails and returns an error,
the framework aborts the start sequence and does not invoke
SNDRV_PCM_TRIGGER_STOP. Because the error handling path does not revert
io->running and decrement fsi->running_streams, these variables could
permanently leak. This would prevent running_streams from reaching 0 on
subsequent valid stops, permanently bypassing fsi_hw_shutdown() and leaving
the hardware clocks powered on indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.1224=
26-1-phucduc.bui@gmail.com?part=3D4
