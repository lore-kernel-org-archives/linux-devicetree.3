Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B254B1C1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182242; cv=none; b=gSCRardTjD5Ohav3J/mQQOffmxNTHYtfFbzq9ZT1f4WM66nuvmFE0+ZMU8IxxfWhOcA5GhtTte/bGpOUsH/c6HeFqhdbUx2rbxcSSYPpFeshA/iFmCjU4I1D/ORuceClqzbOHrJra8YJ8xDGN9Aw+p7hNChA3gL1sfVjGJqjYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182242; c=relaxed/simple;
	bh=RmFqLC3nmaBhMAHLakvNfJ2U7i0hCmhzS58MpZ0qot8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GvXpTE2R+n3+QAIUyPtkLoPrZ2halVHkfrMtCDYqFyZGfyOBb9PA485C6GPjuZshO6j19mCrR+JYVSp+koBf2dZ7YGplC0MQ42W8aopkOMBigFyqDXxb8XpciGbxD7lQAKdlgLl9gXFjTX/MnUr7WVNcJC7V42qQSRxKWnw/AiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVYHLR7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVYHLR7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3F31F000FF;
	Wed, 23 Sep 2026 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790182240;
	bh=d1xkXGRB+YFVuGs4MxIfOPH01ha9C2/3hEab50Rswxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dVYHLR7IFyw4+GkAM2KaplHERJv9wMFZ+Bbw9sGT3rEAog20//vov1JS7pyNc6k7v
	 /5QkxnDpepvBVADhRBQLj1EL0V4C3iAISmUUwa7zndBiyZinV0cnGE9DQtLtixogGi
	 ffeQpyR/cBb6jIo4p6SveJ6DbKlX/ooxNwnu5IjXnhIFa/rmMuWd4zaEPFuCaVcQfO
	 yoMi7Ol3QrROvqge5IkelFxgy54Pm8I7JZIZegvV2EiztbPxybVPiL1EqHQpaIqkPK
	 JZgN4dkKkQn/eBOsG4YgdULFB4Ml6PwwCZiVElkg1rp7thmd0ETNc26gplDVqUm3NF
	 IizAkG50sD3Gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-vmid-v4-v6-4-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
 <20260923-vmid-v4-v6-4-3d61a0319b1c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 16:50:40 +0000
Message-Id: <20260923165040.7F3F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ALSA: q6apm-dai: Uncapped 8MB allocation for compressed streams ex=
hausts carveout
- [Medium] ALSA: q6apm-dai: Missing buffer size hardware constraint for cap=
ture streams
--

commit 0f7913cfca3d367699e852961892b2259896b6d2
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

This commit adds SCM buffer assignment for mDSP platforms where audio buffe=
rs
must be explicitly assigned to specific VMIDs for the DSP to access them.
It implements support for both control-path and data-path memory carveouts
assigned at probe time.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index 033197bdd8705..b0b10ba51c99d 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
[ ... ]
> @@ -409,8 +518,11 @@ static int q6apm_dai_open(struct snd_soc_component *=
component,
>  	}
> =20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		size_t buf_max =3D pdata->has_reserved_mem ? pdata->reserved_buf_size :
> +							   BUFFER_BYTES_MAX;
> +
>  		ret =3D snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFE=
R_BYTES,
> -						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
> +						   BUFFER_BYTES_MIN, buf_max);

[Severity: Medium]
What happens when a user opens a capture stream on a DAI using the restrict=
ed
memory pool (has_reserved_mem is true)?

Since the dynamic buf_max constraint is applied exclusively to playback
streams, will capture streams be left unguarded, potentially advertising
larger buffer capabilities than physically allocated in the carveout pool a=
nd
causing allocation failures during ALSA hw_params negotiation?

>  		if (ret < 0) {
>  			dev_err(dev, "constraint for buffer bytes min max ret =3D %d\n", ret);
>  			goto err;
[ ... ]
> @@ -683,6 +830,17 @@ static int q6apm_dai_compr_open(struct snd_soc_compo=
nent *component,
>  	if (ret)
>  		return ret;
> =20
> +	if (pdata->use_scm_assign && !pdata->has_reserved_mem) {
> +		ret =3D q6apm_dai_scm_assign(pdata, prtd->dma_buffer.addr,
> +					   ALIGN(size, PAGE_SIZE));

[Severity: High]
Does this code risk exhausting the carveout pool when opening a compressed
stream?

In q6apm_dai_compr_open(), just before this snippet, the buffer size is
statically set to 8MB (COMPR_PLAYBACK_MAX_FRAGMENT_SIZE *
COMPR_PLAYBACK_MAX_NUM_FRAGMENTS) and allocated via snd_dma_alloc_pages()
using the device DMA context.

Since the device is bound to a small restricted memory carveout pool via
of_reserved_mem_device_init_by_idx() when has_reserved_mem is true, wouldn't
this unbounded allocation instantly fail or exhaust the pool?

Should the allocation size be capped by reserved_buf_size, similar to the
implementation for standard PCM streams?

> +		if (ret) {
> +			dev_err(dev, "SCM assign compr buffer failed: %d\n",
> +				ret);
> +			snd_dma_free_pages(&prtd->dma_buffer);
> +			return ret;
> +		}
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-vmid-v4-v6=
-0-3d61a0319b1c@oss.qualcomm.com?part=3D4
