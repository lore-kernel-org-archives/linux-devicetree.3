Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030F3546C3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006488; cv=none; b=TrV3Adl88NPFCGJxGjSl4f1xrLP20+Sva90JrGhPdQFsSsiJS7233bW/uGqA0A2WySe3ZWaRnhoc+qqC8+OZtBLum3zxb+LnBbQ3zDqNscnLo3L2u6jdY/PkZ9se3I8bmxRfO3GisAjJwHwfdNpZoR8ayqWYD/wmgS92I5owdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006488; c=relaxed/simple;
	bh=20E4jlDgRHmL8VjI6o84T0Vsa704YAzLsh2SAUlBpGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T1lYMhmnUNluPh1hBkg1TyvIRcEKEMYQ0hXL8I8jifvelqHSUlsBrj5vvV7k+zZzjhof5utmJd21NORz+XXMF+asWabrCUGhyWlLTErZD9Jrw142bHkYxF4z1PQsrmhbTUHqrfIoU909Y7jDspO0DnkjScWXCVPmHuaREV9CPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oh8YU1Q5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oh8YU1Q5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451E41F00898;
	Tue,  9 Jun 2026 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006486;
	bh=pB99YzbAehabNUC1Kop/AANyI7ouF40y05SIuLsoefI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oh8YU1Q55YHH7uUD7m6y2pe2dbK2MsmN6qZ8AL20+z4XYenP+ftY+IfpubKblabU6
	 zvZinV5Q5WOmpzx3p+XP5Zd13lL4Xvd7Mvzk0gvHMPPk0sByFrSeoJ8A0UuPu5QyCs
	 YnSpXHxhBkHpXPOJbY1t6bOrXjiQciLlBRkHhD91YQNuIYIxJMWYruhrnmQH8N7acr
	 lcuyQM6221z3JtZGOgc/nJyKjenjgWHfLJ5d3KFoEnEkWKTVpaLe+BbEK1MbJOtD63
	 LZm8HG1zr19nuASaxiQrow7ojgJS/h7HV7H/7DnZzP/5gr+gjtoBYiHRFveBqWVllU
	 hwM3hznSNmrDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/11] ASoC: renesas: fsi: Fix trigger stop ordering
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609113836.45079-4-phucduc.bui@gmail.com>
References: <20260609113836.45079-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 12:01:25 +0000
Message-Id: <20260609120126.451E41F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing data race in fsi_clk_enable() leads to premature cloc=
k disabling (bus hang) and breaks full-duplex operation.
- [High] Missing IRQ and DMA synchronization during stream shutdown leads t=
o TOCTOU NULL pointer dereferences and hardware bus hangs.
--

commit b345d93585828cc07f1537860417394b58877fa1
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Fix trigger stop ordering

This patch changes the trigger stop ordering by calling fsi_stream_stop()
before fsi_hw_shutdown(). This ensures that the sequence matches the
existing order in the suspend path.

> This change ensures all register accesses during stream shutdown are fully
> completed before disabling the clocks.

[Severity: High]
This isn't a bug introduced by this patch, but is this statement accurate
without synchronization?

Without synchronize_irq() and dmaengine_terminate_sync() in the shutdown
sequence, an in-flight fsi_interrupt() or fsi_dma_complete() could run
concurrently.

If an in-flight interrupt handler accesses FSI registers after
fsi_hw_shutdown() disables the hardware clocks, could this trigger an
asynchronous bus hang?

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 8cbd7acc26f49..800ac40f9680d 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1586,10 +1586,10 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
>  			ret =3D fsi_stream_transfer(io);
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
> -		if (!ret)
> -			ret =3D fsi_hw_shutdown(fsi, dai->dev);
>  		fsi_stream_stop(fsi, io);
>  		fsi_stream_quit(fsi, io);

[Severity: High]
This is a pre-existing issue, but does fsi_stream_quit() introduce a race
with in-flight interrupts?

Because fsi_stream_quit() sets io->substream =3D NULL, could concurrent
execution cause NULL pointer dereferences in fsi_pio_get_area() or
fsi_pointer_update(), which dereference io->substream without validation?

> +		if (!ret)
> +			ret =3D fsi_hw_shutdown(fsi, dai->dev);

[Severity: High]
This is also a pre-existing issue, but does fsi_hw_shutdown() have a race
condition when managing the clocks?

fsi_hw_shutdown() could run concurrently with fsi_hw_startup() since ALSA
permits concurrent SNDRV_PCM_TRIGGER_START calls for playback and capture
on the same DAI.

Looking at fsi_clk_enable() and fsi_clk_disable() which are called from
these paths:

sound/soc/renesas/fsi.c:fsi_clk_enable() {
    ...
    int ret =3D -EINVAL;
    ...
    if (0 =3D=3D clock->count) {
        // ...
        clock->count++;
    }
    return ret;
}

sound/soc/renesas/fsi.c:fsi_clk_disable() {
    ...
    if (1 =3D=3D clock->count--) {
    ...
}

Could a lost update on the lockless clock->count variable lead to
prematurely disabling the clock when the first stream stops, turning off
FSI clocks while the second stream is still actively accessing registers?

Additionally, fsi_clk_enable() initializes ret to -EINVAL. If a second
stream tries to start (clock->count !=3D 0), doesn't it unconditionally
return -EINVAL, breaking full-duplex operation?

>  		break;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D3
