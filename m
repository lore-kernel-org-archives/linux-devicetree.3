Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC742EB0F
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214787; cv=none; b=i96ltpWu/D3XOVf3vtc5PJCuG5u+GtnAm51rVyAmFocPnoqeaZGKBF1v6S51PJBnQXTSoXe5sCHKRkbO2taBFlvPPmFtwgSifrMXUs8bEyL8RxdjEWem1bgSKZxQ/4Da3kBzNTQL9Kz2XNzj7Ycre+3hIJKNJnRbVuZgisBb5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214787; c=relaxed/simple;
	bh=ihca2val2tcZzxAIfLLlHlaY+CtH4nHqMuqAJ3nMXIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MSEGZz946TuhciHARg61mSXwUucSAHpzbmAq7UFXh+eSIokXtTJU+soAWrbw6JFNAzlhLvNRv+o30iHG1D5sO78Xo4sGuU5y4+Ho3cqWVRdGYcoIVLNtMbpt1+68gt+60jOJFArGrGx4G5mc4qMhSZ2xwJwwo9JXGi0PtzC5fgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wrn0aG7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wrn0aG7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C691F000E9;
	Sat,  8 Aug 2026 18:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214785;
	bh=vwGc3fgXpHdSuojTFzrlcYBsy98aYa52DlCvzNoILyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wrn0aG7NGKU2UnGL1vZ072HWwHcdLaC2ycfTlQRdqJTGzKVTphPJFx/CcRmZUu570
	 iHfDV8Mwvs+9WHXLHD1pajrwekjdTKrAkKJvYKxvvwv/a6gPxom7vrcUIlrLshAM8O
	 Wkg3Ujs98O1zdykJhTzLboIxxDCo8x7XfiD/UkO6JUkDH3SIliKiGFtVe8IlYX4n46
	 U0dbymv8TCvzEv2GstRweighYs4+UH6VwKoeZ6LlIJcTCSN6P+D6DemfLapVtEm5fE
	 G0acAJVuJ9ZVIjGHpklzqsfX4KADx9MB51at4z0OZSaBXuGKW87Am5lHz6yJGcLD1I
	 lIy6ksYwO2ZTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: qcom: qdsp6: Zero-initialize AudioReach
 module config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260808181948.2489187-4-prasad.kumpatla@oss.qualcomm.com>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 18:46:24 +0000
Message-Id: <20260808184625.43C691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Memory leak of audio_buffer array when q6apm_dai_prepare fails.
- [High] Concurrent Use-After-Free in gpr_do_rx_callback() due to lack of s=
ynchronization with port teardown.
--

--- Patch [3]: [PATCH v1 3/5] ASoC: qcom: qdsp6: Zero-initialize AudioReach=
 module config ---
commit f7d8f4b6351377745201f54e092ff89f2f6f845e
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
   =20
This commit updates q6apm_dai_prepare() and q6apm_dai_compr_set_params() to
zero-initialize the AudioReach module config structure. This ensures that
uninitialized stack data doesn't override topology defaults sent to the DSP.

Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatl=
a@oss.qualcomm.com

> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index bf1f872a09f45..033197bdd8705 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -216,7 +216,7 @@ static int q6apm_dai_prepare(struct snd_soc_component=
 *component,
>  {
>  	struct snd_pcm_runtime *runtime =3D substream->runtime;
>  	struct q6apm_dai_rtd *prtd =3D runtime->private_data;
> -	struct audioreach_module_config cfg;
> +	struct audioreach_module_config cfg =3D {};

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the changes
in q6apm_dai_prepare(), I noticed a potential memory leak on the error path.

If q6apm_alloc_fragments() succeeds, but a subsequent command like
q6apm_graph_media_format_pcm() fails:

sound/soc/qcom/qdsp6/q6apm-dai.c:q6apm_dai_prepare() {
    ...
    ret =3D q6apm_alloc_fragments(...);
    if (ret < 0) {
        ...
    }

    ret =3D q6apm_graph_media_format_pcm(prtd->graph, &cfg);
    if (ret < 0) {
        dev_err(dev, "%s: CMD Format block failed\n", __func__);
        return ret;
    }
    ...
    prtd->state =3D Q6APM_STREAM_RUNNING;
}

The function will return without setting prtd->state to Q6APM_STREAM_RUNNIN=
G.
Later, when the stream is closed, q6apm_dai_close() skips freeing the
fragments because prtd->state was never set:

sound/soc/qcom/qdsp6/q6apm-dai.c:q6apm_dai_close() {
    ...
    if (prtd->state) {
        q6apm_graph_stop(prtd->graph);
        q6apm_free_fragments(prtd->graph, substream->stream);
    }

    q6apm_graph_close(prtd->graph);
}

Does this leave the allocated audio buffer arrays permanently leaked?

[Severity: High]
This is another pre-existing issue I noticed related to closing the stream.
Can an unprivileged local user trigger a use-after-free by repeatedly
opening and closing a stream while the DSP generates events?

When userspace closes the stream, q6apm_graph_close() eventually invokes
gpr_free_port(), which frees the port immediately:

drivers/soc/qcom/apr.c:gpr_free_port() {
    spin_lock_irqsave(&gpr->svcs_lock, flags);
    idr_remove(&gpr->svcs_idr, port->id);
    spin_unlock_irqrestore(&gpr->svcs_lock, flags);

    kfree(port);
}

However, gpr_do_rx_callback() processes DSP IPC messages in a workqueue,
dropping the lock before dereferencing the callback:

drivers/soc/qcom/apr.c:gpr_do_rx_callback() {
    ...
    spin_lock_irqsave(&gpr->svcs_lock, flags);
    svc =3D idr_find(&gpr->svcs_idr, hdr->dest_port);
    spin_unlock_irqrestore(&gpr->svcs_lock, flags);

    if (!svc) { ... }

    if (svc->callback)
        svc->callback(&resp, svc->priv, 0);
}

If the workqueue is executing concurrently, could it dereference the
already-freed port memory to invoke the callback since the workqueue
isn't flushed prior to freeing the port?

>  	struct device *dev =3D component->dev;
>  	struct q6apm_dai_data *pdata;
>  	int ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808181948.2489=
187-1-prasad.kumpatla@oss.qualcomm.com?part=3D3
