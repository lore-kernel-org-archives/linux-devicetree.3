Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46B32FDC3C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780969414; cv=none; b=BUqNpV84vTiJ0gN8PL0bHyme85TyRgYYbnWzMCVh2BkEYBlxmePTkov6vVHh5XJeKJOVNgVdmDS9hhZ6QN+Sx21MZHxagLKzFylxs0bDHSlai86hxhSGvyvwUCAKiIQTko1ogCsSoARR2tuBvV+0qUUTS2+B/zHoQS3r9b3sRgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780969414; c=relaxed/simple;
	bh=D9FAC+v0TYdoYPImIKcPAon2lKsGSXLvd9GmaecHd1U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iqzx0qYZwrmB21XV3zGLLgGoWK2ZvkZzDF+lLvjBq+krbAwe3uhfA6b2Yx+4NRGjVlq1uN9mi/u+A8iv3h2cB6zLUR2bQ3skSMY66C+U7DNDdpCjDT8DQJ3mK2FHV0jCm8sIgpwr5F9MsJ45u3g/mTsd7t2M/SUL8C8DAMCOFg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlpvPY+A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlpvPY+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5945F1F00893;
	Tue,  9 Jun 2026 01:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780969412;
	bh=Rzw7nmnfaaqBFxmxYwVkx86U+1mtFK38yp3F5Fqz260=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UlpvPY+AX3vDh7Ux/6LDIeICISGYIkYFMtrMOBy8Hg66Opu8st5SVw4KS1NNQvVpf
	 7YFTcBXS+gPgY3Ib7jKhjNcj6eDQb/u0L3K2PCpQ7UUOyZUc93ARc9EzCd7DSIZMac
	 BaQdjAhV2/w7FTXldWwOtfsG06wQh6LjXezCYyNzlg88g21OAx8ETVwQfhGV8WbZkd
	 LjREc3O8EZfIYbgfiWmcTnirZRSoLB1l0wYVYKf+q8ImprIjGEx0Qswub4Azpscgpp
	 MyHpUqDGoPO67cikgWNSHLIZp+wlZb9hD3exoffzn2lOcN40PDcqvBfN8ZKdoGPtNc
	 jTDNxoEOfDdWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/11] ASoC: renesas: fsi: Fix trigger stop ordering
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609013107.5995-4-phucduc.bui@gmail.com>
References: <20260609013107.5995-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 01:43:32 +0000
Message-Id: <20260609014332.5945F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Clock reference counting logic in `fsi_clk_enable()` permanently b=
locks subsequent active streams.
- [High] Asynchronous tasks (IRQ and DMA callbacks) dereference `io->substr=
eam` after it is freed by `fsi_stream_quit()`, causing a TOCTOU NULL pointe=
r dereference.
- [High] Hardware DMA channels are released before ALSA component unregistr=
ation, leading to a Use-After-Free during teardown.
- [High] The ALSA trigger callback calls `clk_set_rate()`, which acquires s=
leepable mutexes, from an atomic context.
- [High] Missing synchronization with the IRQ handler before disabling the =
SPU clock in `TRIGGER_STOP`, causing hardware hangs.
- [High] Missing error rollback in `TRIGGER_START` leads to a permanent res=
ource leak and device failure.
--

commit b4a51fcc95452ce19991b681d00a481811b27efc
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Fix trigger stop ordering

Call fsi_stream_stop() before fsi_hw_shutdown(). This matches the existing
order in the suspend path.
This change ensures all register accesses during stream shutdown are fully
completed before disabling the clocks.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 8cbd7acc26f49..800ac40f9680d 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1586,10 +1586,10 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
>  			ret =3D fsi_stream_transfer(io);

[Severity: High]
This is a pre-existing issue, but if fsi_stream_transfer() fails during
SNDRV_PCM_TRIGGER_START, the error is returned immediately without rolling
back earlier steps like fsi_hw_startup() and fsi_clk_enable().

Could this leak the clock->count reference and leave hardware clocks
permanently enabled?

[Severity: High]
This isn't a bug introduced by this patch, but does fsi_dai_trigger() run in
atomic context since .nonatomic =3D 1 is not set on the DAI?

If so, is it safe to call fsi_hw_startup() which calls fsi_clk_enable() and
subsequently clock->set_rate() (which calls clk_set_rate())?

clk_set_rate() acquires a sleepable mutex:
fsi_dai_trigger() -> fsi_hw_startup() -> fsi_clk_enable() -> clk_set_rate()

Could this trigger a scheduling while atomic panic?

[Severity: High]
This is a pre-existing issue, but looking at fsi_clk_enable(), if a second
stream tries to start while one is already active (clock->count > 0), does
the function return -EINVAL instead of 0?

sound/soc/renesas/fsi.c:fsi_clk_enable() {
	int ret =3D -EINVAL;
	if (0 =3D=3D clock->count) {
		ret =3D clock->set_rate(dev, fsi);
		...
		clock->count++;
	}
	return ret;
}

Could this permanently fail full-duplex operations by preventing
simultaneous playback and capture?

Also, could the lack of atomic protection on clock->count lead to races
between independent substream triggers?

>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
> -		if (!ret)
> -			ret =3D fsi_hw_shutdown(fsi, dai->dev);
>  		fsi_stream_stop(fsi, io);
>  		fsi_stream_quit(fsi, io);

[Severity: High]
This isn't a bug introduced by this patch, but fsi_stream_quit() sets
io->substream =3D NULL under master->lock.

Is there a race window with asynchronous tasks like the IRQ handler or DMA
callbacks?

fsi_pio_transfer() checks fsi_stream_is_working() which verifies
io->substream but drops the lock before returning:

sound/soc/renesas/fsi.c:fsi_pio_transfer() {
	if (!fsi_stream_is_working(fsi, io))
		return -EINVAL;
	buf =3D fsi_pio_get_area(fsi, io);
	...
}

Could fsi_stream_quit() nullify io->substream immediately after the lock is
dropped, causing fsi_pio_get_area() to dereference a NULL pointer when
accessing io->substream->runtime?

> +		if (!ret)
> +			ret =3D fsi_hw_shutdown(fsi, dai->dev);

[Severity: High]
This is a pre-existing issue, but since fsi_hw_shutdown() disables the SPU
hardware clock, could this cause a hardware hang if the IRQ handler is still
running concurrently on another CPU?

Without synchronize_irq() to wait for completion, couldn't fsi_interrupt()
access hardware registers like CPU_INT_ST or SOFT_RST after the clock is
disabled, resulting in an external abort or bus fault?

>  		break;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does fsi_remove() prematurely
destroy hardware channels before devm tears down the ALSA interface?

sound/soc/renesas/fsi.c:fsi_remove() {
	...
	fsi_stream_remove(&master->fsia);
	fsi_stream_remove(&master->fsib);
	...
}

Since the ALSA component is registered using
devm_snd_soc_register_component(), it is unregistered later during the
devres cleanup phase.

Could userspace trigger operations on the still-visible PCM devices that
call dmaengine_prep_dma_cyclic() with a NULL io->chan, resulting in a
use-after-free during teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609013107.5995=
-1-phucduc.bui@gmail.com?part=3D3
