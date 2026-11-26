Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685566;
	b=pDUN0QuNpVQcs/aIVilVEgU3sB7KvKfjpBs6WZRbsusNOTErteeuEJK/Kt/shcbHtYiO
	 TbIccmi1hKoxKdzWHzQ+add8oY/88qgfV0M213+PqxhQQjXd9bf95h35YJpSOkBUbta50
	 c9XbpOwJCVOoHcV96pD6hMh8uFav5rRDBLHGv0NnjzqWuuzP2Zy1AC6VfyDrdfpl1+xti
	 n9AcWW1PkkGtboA+PLcqz7+7RJ3ZqTpwsBLb508DUM6IBMnxQJF+FEltDy9JMph1+u4Vr
	 6VndoOofDnvXerLdTUZ/oL4kB2vgJDqZprCutgGaUVwmRi9Un3EHkNeJUjW0mBfAsCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685566;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YJ39x8lAt8ZTmbqJbIQTqGRvVeWCSi4YBiCTj9hQGWs=;
	b=IQN69qfHwffR1/gRrSQEtM3ADeSKrtNCRmhUTBy0C/NyceY8LFgfVY6HTGOPV0/hTgJh
	 rPKKrZAqxZfs5ZCg/j8vXIiNRfOod2JOlOF0WOd/M2DeJSNz9EBplEkyHLedL7We3rkds
	 EbPysKhoWezPqs0wtGQqorwF+KJ7yjo/rWrIG3sGfUTF3hu7iDzQGf0ZrZB0slGw59ukA
	 fxI/eHaF1lp2Cx9dmLStZtsZjI4JpPHBKIa5SjAgrPytxNUC+0o474B8OBHZSo/C5waFm
	 m5wsPbuohO54dGM+z4fTQ6NzoHzjQ90HmFZV/XcO6dH3jCa3NwIcKHG/aUn1HTHabeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ldw5W+T5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAA9606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ldw5W+T5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22F41F000C6;
	Thu, 26 Nov 2026 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685565;
	bh=YJ39x8lAt8ZTmbqJbIQTqGRvVeWCSi4YBiCTj9hQGWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ldw5W+T5gCxzXKWPd8oithRdxOw41IiUI624JekvM3IdC8U2WAjdw1chSL82m0+pE
	 qo6g+Bjpg3n4fPvxM99GMjoNQUOu61zdnjbmwthAdwE+0/SMW2qk1q5TiVNG+ju0Fd
	 56K6FGamVm3g+RVEhdeJUAOKPPaPix2M7DAD7t/+4DsEl6fDJV1oHZ9k9Kx04KlBUd
	 3T71hi58q/oII+Sxh5DypzNVj57mjCDq+0Yyds67S/yogbc3XelxUOka7wOaokcMNI
	 UQAEsKHKnc5GUrW8xJgcwzpgaBTZW64/F3obIuo9zuOpZZfsFnEYVfrQJZ+N4mwQwn
	 /1ij1fVdVawNg==
Message-ID: <sashiko-outbox-235140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] gtrace: rvtrace: Add copyto_auxbuf callback for
 pre-ratified encoder and funnel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leo Yu-Chi Liang" <leo.liang@sifive.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-send-preratified-trace-v1-10-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
 <20261126-send-preratified-trace-v1-10-1e686fd75be7@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:32:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] gtrace: rvtrace: type confusion and NULL deref in
  rvtrace_ramsink_cleanup()
- [Medium] gtrace: rvtrace: missing rvtrace_comp_poll_empty() in
  rvtrace_encoder_stop()
--

commit 50f4d76e6d06a1e94d9b5cf4a9095834e649bfc1
Author: Eric Lin <eric.lin@sifive.com>

gtrace: rvtrace: Add copyto_auxbuf callback for pre-ratified encoder and fu=
nnel

This commit adds rvtrace_v0_ramsink_copyto_auxbuf() to copy trace data
from pre-ratified encoders and funnels acting as sinks into the perf AUX
buffer, and updates gtrace_path_copyto_auxbuf() to invoke copyto_auxbuf()
only on the path's sink component.

> diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtraci=
ng/gtrace/rvtrace-encoder.c
> index 8d2f7ac5e0fe4..a854c4695351c 100644
> --- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
> +++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
> @@ -164,6 +164,15 @@ static int rvtrace_encoder_probe(struct gtrace_compo=
nent *comp)
>  	return 0;
>  }
> =20
> +static size_t rvtrace_encoder_copyto_auxbuf(struct gtrace_component *com=
p,
> +					    struct gtrace_perf_auxbuf *buf,
> +					    u64 *format)
> +{
> +	struct rvtrace_encoder_priv *priv =3D dev_get_drvdata(&comp->dev);
> +
> +	return rvtrace_v0_ramsink_copyto_auxbuf(comp, priv->sink, buf, format);
> +}

[Severity: Medium]
Can rvtrace_encoder_copyto_auxbuf() read the hardware write pointer and
copy the DMA buffer before pending trace writes have drained when a
pre-ratified encoder acts as a sink?

Unlike rvtrace_funnel_stop() and rvtrace_ramsink_stop(),
rvtrace_encoder_stop() does not call rvtrace_comp_poll_empty(comp) after
gtrace_disable_component(comp):

drivers/hwtracing/gtrace/rvtrace-encoder.c:rvtrace_encoder_stop() {
    ...
	err =3D gtrace_disable_component(comp);
	if (err)
		dev_err(&comp->dev, "failed to disable encoder.\n");

	return ret ?: err;
}

When gtrace_event_stop() calls gtrace_path_stop() followed immediately by
gtrace_path_copyto_auxbuf(), copying before
RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT asserts can truncate the trace data in
the perf AUX buffer.

[ ... ]

> diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtraci=
ng/gtrace/rvtrace-ramsink.c
> index f183dcd71c7c0..cc0a5785bda40 100644
> --- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c

[ ... ]

> @@ -448,6 +455,28 @@ void rvtrace_v0_ramsink_release(struct gtrace_compon=
ent *comp,
>  	of_reserved_mem_device_release(comp->pdata->dev);
>  }
>  EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_release);
> +
> +/**
> + * rvtrace_v0_ramsink_copyto_auxbuf() - Copy trace data from the sink em=
bedded
> + * in a pre-ratified trace encoder/funnel into the perf AUX buffer.
> + * @comp:   Pre-ratified trace encoder/funnel component.
> + * @priv:   Sink private data returned by rvtrace_v0_ramsink_setup().
> + * @buf:    Perf AUX buffer.
> + * @format: Trace format of the copied data.
> + *
> + * Return: Number of bytes copied, 0 if the component doesn't act as a s=
ink.
> + */
> +size_t rvtrace_v0_ramsink_copyto_auxbuf(struct gtrace_component *comp,
> +					struct rvtrace_ramsink_priv *priv,
> +					struct gtrace_perf_auxbuf *buf,
> +					u64 *format)
> +{
> +	if (!priv)
> +		return 0;
> +
> +	return __rvtrace_ramsink_copyto_auxbuf(comp, priv, buf, format);
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_v0_ramsink_copyto_auxbuf);

[Severity: High]
While rvtrace_v0_ramsink_copyto_auxbuf() passes priv explicitly to
__rvtrace_ramsink_copyto_auxbuf(), doesn't rvtrace_v0_ramsink_release()
right above still drop its priv argument and read dev_get_drvdata() via
rvtrace_ramsink_cleanup()?

drivers/hwtracing/gtrace/rvtrace-ramsink.c:rvtrace_ramsink_cleanup() {
	struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev);

	dma_free_coherent(comp->pdata->dev, priv->alloc_size, priv->alloc_va, priv=
->alloc_start);
}

For a pre-ratified encoder or funnel, comp->dev driver data holds struct
rvtrace_encoder_priv or struct rvtrace_funnel_priv rather than struct
rvtrace_ramsink_priv (and is still NULL if gtrace_enable_component()
fails in rvtrace_funnel_probe()).  Calling rvtrace_v0_ramsink_release()
on probe failure or driver unbind either dereferences NULL or reads past
the end of the encoder/funnel private struct and passes garbage to
dma_free_coherent(), while leaking the sink's coherent DMA buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-send-prera=
tified-trace-v1-0-1e686fd75be7@sifive.com?part=3D10
