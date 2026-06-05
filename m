Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3066F40E8E8
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665603; cv=none; b=RJQLNUk8R6TvZsAoQkd9qmU7opuHNs6tuwgFZ320gsi5BA2ocjNJsCRAw1EWtpReXelFqGIzq/ArahTHE2x24ysfkbOcJifHkX/fMpiz+4ZjXm5MJxOmUalHXJkg0UcLgM2hRvBxOQkAUBZVo8XAs+aVaZRMdG1vh3UpSPJce0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665603; c=relaxed/simple;
	bh=HE5cLOdLTkkn74dczFDyXyTRhzZlaa/PXwAaGp7vmV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CzkkDsHfolgsaAnX6OImPK8yrCbYb+2wmiN4kwWPwMv+mnad04J8t5s8pfRxl5Q/uOPY14QcwH/pb29/7kejp5lbQvGgOc4J1H4KuZp039Aoa5K1Uz8K01DGVbcBZgb67qvF5r5rVtWcSrOHnDB776/OzGCOcyEKYNQwfPFk7XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaplmJp3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaplmJp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA67A1F00898;
	Fri,  5 Jun 2026 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780665602;
	bh=ukZZ62BzyocIAus/TBqkxmLZQTo5eDHe39Yq0OAfEX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MaplmJp3HOzo/BYbLcCMVPo4gQlCxBGHXLkOu4sThjZF8nebhZRYDHyb3t+4UagmS
	 wGhOt5C6iPPg2coIarmn2CU2bANRG7gqsmz6Pi4av83xAuAeBNwe/GcTpckrHeGOf7
	 2FCGVLXV3eQ51Dk1OKTfzjJe1SxOLn58NdNAUXaRRs5mUB5CVjVmOgkAnSKyFxqg9s
	 THRERk5oILHnbfbhiTkViWXzkNxjZCg/OrL6B8cuzgcrLkEHyZVijFNc+T7mMqtA0O
	 V94tI3KHY2nrNmowI/FfapEBRW9E2unhDrSqS/xEIepnT6JFo5F2E7ZeaFnv8de9J1
	 8puac85DxvWzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/10] ASoC: renesas: fsi: Fix register access from
 in-flight IRQ after shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260605121955.105661-6-phucduc.bui@gmail.com>
References: <20260605121955.105661-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:20:01 +0000
Message-Id: <20260605132001.DA67A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch fails to completely fix the hardware hang due to imprope=
r ordering with clock shutdown and introduces a Time-Of-Check to Time-Of-Us=
e (TOCTOU) race condition.

Pre-existing issues:
- [High] Potential NULL pointer dereference in `fsi_pointer_update()` if a =
DMA completion callback runs after stream shutdown.
- [High] The driver releases DMA channels in `remove` before unregistering =
the ALSA component, creating a Use-After-Free race condition.
--

commit c264d5f1cdc59e54f0e7191a60f9c8c00661657c
Author: bui duc phuc <phucduc.bui@gmail.com>
ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown

This commit attempts to prevent system hangs by adding checks in the
in-flight IRQ handlers to skip hardware access if the stream is no
longer working. It relies on fsi_stream_is_working to detect if the
stream is active before reading or writing registers.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 429c3c9b6ede4..0f350bddeb1d5 100644
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

Since fsi_stream_is_working acquires and drops the master lock, an
interrupt can check the status and drop the lock. Before the handler
reads the hardware registers below, another thread could call
fsi_hw_shutdown, disabling the clock and causing a hang.

Additionally, when stopping the stream in fsi_dai_trigger, the hardware
shutdown is called before the substream is cleared:

sound/soc/renesas/fsi.c:fsi_dai_trigger() {
    ...
    fsi_stream_stop(fsi, io);
    if (!ret)
        ret =3D fsi_hw_shutdown(fsi, dai->dev);
    fsi_stream_quit(fsi, io);
    ...
}

Because the clock is disabled before io->substream is cleared, an
in-flight IRQ will still pass the fsi_stream_is_working check
and access the registers.=20

The same ordering issue occurs in __fsi_suspend, where io->substream is
never cleared at all.

>  	u32 ostatus =3D fsi_reg_read(fsi, DOFF_ST);
>  	u32 istatus =3D fsi_reg_read(fsi, DIFF_ST);

[ ... ]

[Severity: High]
This is a pre-existing issue, but is there a potential NULL pointer
dereference in fsi_pointer_update during stream shutdown?

When stopping a DMA stream, fsi_dma_push_start_stop uses
dmaengine_terminate_all, which terminates asynchronously:

sound/soc/renesas/fsi.c:fsi_dma_push_start_stop() {
    ...
    dmaengine_terminate_all(io->chan);
    ...
}

Immediately after, fsi_stream_quit sets io->substream to NULL. If the
DMA callback fsi_dma_complete fires or is still running concurrently
after io->substream is cleared, it will call fsi_pointer_update which
dereferences the pointer without checking:

sound/soc/renesas/fsi.c:fsi_pointer_update() {
    struct snd_pcm_substream *substream =3D io->substream;
    struct snd_pcm_runtime *runtime =3D substream->runtime;
    ...
}

Could this cause a kernel panic if the callback executes after cleanup?


[Severity: High]
This is a pre-existing issue, but does fsi_remove create a use-after-free
race condition by releasing DMA channels before ALSA unregistration?

In fsi_probe, the ALSA component is registered via devres using
devm_snd_soc_register_component, meaning it unregisters automatically
after fsi_remove completes. However, fsi_remove manually destroys
the stream resources:

sound/soc/renesas/fsi.c:fsi_remove() {
    ...
    fsi_stream_remove(&master->fsia);
    fsi_stream_remove(&master->fsib);
    ...
}

Since the ALSA device is still accessible to userspace while the DMA
channels are being freed, an application could trigger audio playback.
If playback is started concurrently, it calls fsi_dma_transfer which
dereferences the freed channel:

sound/soc/renesas/fsi.c:fsi_dma_transfer() {
    ...
    desc =3D dmaengine_prep_dma_cyclic(io->chan, ...);
    ...
    dma_async_issue_pending(io->chan);
}

Could this lead to accessing a freed DMA channel pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605121955.1056=
61-1-phucduc.bui@gmail.com?part=3D5
