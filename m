Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAEF357D11
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881007; cv=none; b=JnV0uziI1WOXlTwGWWlgb1+6gya3eKHMrYJsIXG6FtDvpefl883Z8jkgo43e6tleFrgvGhthfc98pOWQzD73AFmdQbjuWwkOU3C9hLO/UsfxBhr+3BT3di6TWaPcim+sJX+Fbq2kQF5fJG7s8WHNvrxLM7FqWcJF0/vN6BNt71Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881007; c=relaxed/simple;
	bh=kSgm9KIEbkQN0XTXpjt0IHCTjWMf9OOaCW1XaVV2zBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUTxmKP/KMQH67RMUVGKT18yHCFcuJXyWXKDfd+h6DOiubBvVPPNf08yUoRV2JDDfmbmVAnrP2Yl2+COvPfu4i0BhJH3wNWlTZZEscyTwFPu7wRtSTstfPU0HLXPrSMRVsbrH0eAL2QM0iNgt+ORTmk7xNm1g/QsrCwvGq9VCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvBMKePN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvBMKePN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D771F000FF;
	Sun, 20 Sep 2026 05:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789880997;
	bh=h3yE8YgcmgoBQqOOwazFUr2xsb02MErydZ801WlmKZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvBMKePN0r/+O+igpp6H/c2907YGR6yPUELrCMJBSs/ybYVZgpWq7FlOUgXiz4MPX
	 4RuyH3ZxUwJBv31eOhhqb3sgZMLTYC9i1EpDeo0vkJNwvkucvpGkoQhhan9QJLMqSk
	 JDbZc4mItAZMbfz1Wms9UW+lwzZoZauZrYxtaIlj6Y2tnpwQsPbmaiYXOcTPcicVwJ
	 7xL0J+OAUqwPszJe7mtJjqxLHtLC7ntDO/LpwAwdz7phFx4sIMOjoXxPqZEpSoGLVN
	 Muk15UpqdwxI93E0OZQ2AM/YT2TwcL65SNykN9G6Te3qJDC8wIrDQk4vMoW2PyknSV
	 rHH2p842/acsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/28] ALSA: Support nonatomic dmaengine PCMs
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:09:56 +0000
Message-Id: <20260920050957.24D771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] alsa: missing workqueue cancellation on stream stop in dmaengine P=
CM
- [Medium] alsa: workqueue coalescing drops DMA completions for nonatomic P=
CMs
--

commit 377967383b868c91dc9fcc127ab2f8b8e50a24e6
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ALSA: Support nonatomic dmaengine PCMs

Add support for nonatomic dmaengine PCMs.

> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index e59b561b849d2..839ff2711f5e1 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
[ ... ]
> @@ -147,6 +149,24 @@ static void dmaengine_pcm_dma_complete(void *arg)
>  	snd_pcm_period_elapsed(substream);
>  }
> =20
> +static void dmaengine_pcm_dma_complete_nonatomic(struct work_struct *wq)
> +{
> +	struct dmaengine_pcm_runtime_data *prtd =3D container_of(wq,
> +							       struct dmaengine_pcm_runtime_data,
> +							       complete_wq);
> +	struct snd_pcm_substream *substream =3D prtd->substream;
> +
> +	dmaengine_pcm_dma_complete(substream);
> +}
> +
> +static void dmaengine_pcm_dma_complete_nonatomic_callback(void *arg)
> +{
> +	struct snd_pcm_substream *substream =3D arg;
> +	struct dmaengine_pcm_runtime_data *prtd =3D substream_to_prtd(substream=
);
> +
> +	schedule_work(&prtd->complete_wq);

[Severity: Medium]
Will this workqueue coalescing cause dropped DMA completions?

If multiple DMA period interrupts fire in quick succession before the system
workqueue thread can run, schedule_work() will coalesce the requests so the
work item only runs once.

dmaengine_pcm_dma_complete() blindly increments prtd->pos by exactly one
period:

sound/core/pcm_dmaengine.c:dmaengine_pcm_dma_complete() {
	new_pos =3D prtd->pos + snd_pcm_lib_period_bytes(substream);
	if (new_pos >=3D snd_pcm_lib_buffer_bytes(substream))
		new_pos =3D 0;
	prtd->pos =3D new_pos;
}

Could this cause prtd->pos to permanently lag behind the actual hardware
position if events are coalesced?

> +}
> +
>  static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *su=
bstream)
>  {
>  	struct dmaengine_pcm_runtime_data *prtd =3D substream_to_prtd(substream=
);
> @@ -169,7 +189,11 @@ static int dmaengine_pcm_prepare_and_submit(struct s=
nd_pcm_substream *substream)
>  	if (!desc)
>  		return -ENOMEM;
> =20
> -	desc->callback =3D dmaengine_pcm_dma_complete;
> +	if (substream->pcm->nonatomic)
> +		desc->callback =3D dmaengine_pcm_dma_complete_nonatomic_callback;
> +	else
> +		desc->callback =3D dmaengine_pcm_dma_complete;
> +

[Severity: High]
Is a workqueue cancellation missing when the stream stops?

If a DMA completion interrupt fires just before SNDRV_PCM_TRIGGER_STOP,
it will schedule complete_wq.

snd_dmaengine_pcm_sync_stop() waits for DMA callbacks via
dmaengine_synchronize(), but doesn't cancel the work item:

sound/core/pcm_dmaengine.c:snd_dmaengine_pcm_sync_stop() {
	status =3D dmaengine_tx_status(prtd->dma_chan, prtd->cookie, &state);
	if (status !=3D DMA_PAUSED)
		dmaengine_synchronize(prtd->dma_chan);

	return 0;
}

Could this leaked work execute after the stream is prepared or restarted,
erroneously advancing prtd->pos and permanently corrupting the position
state for the new stream cycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D7
