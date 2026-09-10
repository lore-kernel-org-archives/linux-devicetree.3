Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE638B147
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053607; cv=none; b=IVSk+2XY/6sU0GzfED6GOhXHcTr0/BsIpj25Fb6nj9+dzBNzY009mm5LISI4Ff0SxVb5sO38mdjffALZKLhxA1HXNIRb0IbKJJQYj9e+MQlMaEgcoK6GGd4Wm681rI73E8Tp1FglJE3i3XbM12gojR2jVl58pP34ruLEkri6I5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053607; c=relaxed/simple;
	bh=GNn4e0tlEZgeYPRyjaeC6n+B1+sMZheOFslqcUTqcWA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iOnQhoQzXN9QT1xR9F6LCpjOE4sJycG7abBelCM7W+RM60Xu0NrNfM7mIO5HII6qBGSjR/YXoqxpL4/TF//FGrPhmozXRCmK1/QKREjMjETFhCjWb6vlYavNN0TbMtGhE/MPJG9EaJOB9QBBXlQCp0AGIRC815rK5WmBToSEJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fH2gQt0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fH2gQt0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C2C1F000FF;
	Thu, 10 Sep 2026 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789053600;
	bh=M5t9RRAHUh+gxjAU+J05oR3RdcrY/CPvHdI+Q+UxHuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fH2gQt0BzMhxM/yQf/OXxNDzNPPclWp5prCBVTbvZsOWJ4MD0eQp9iO2URCiB6BKO
	 UmkqERD4JS3MDKR8gzkNAdm0SnyifIBpEiwABvuNitwXl1eXZcamCrfyz0fY737oM8
	 S6PTpQ210TYrNUapu39oWOS1nBW7cS7+qR8Jo++nr7E09IQLKm9RflN1ozhHjqKJYO
	 jCavQWin4ZGqHMSDAw4Z1n1gu0iiXVumtvIMXu3o7olhVSmyn29oFsNzN8HMNTJsc9
	 Gy8/47QSAoAXnmFxDFO/gL+VT3PCgJNw0HiK7np8poeBIIdlIjuncZvXqs5pBlaV9H
	 USOghwmWvMDig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sc8280xp: Extend hw_params for QAIF
 backends
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 15:19:59 +0000
Message-Id: <20260910151959.B5C2C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Undeclared identifiers AIF_MI2S_RX_0 ... AIF_MI2S_TX_12 and AI=
F_TDM_RX_0 ... AIF_TDM_TX_12 cause a build failure.
- [High] Widening the link filter unintentionally assigns backend operation=
s to all DPCM frontend links, risking functional breakage.
--

commit d0e12dda100ab67acf7bccf1f2859efd75647281
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: ASoC: qcom: sc8280xp: Extend hw_params for QAIF backends

This commit prepares the sc8280xp machine driver for Shikra EVK variants
that use Audio-IF (QAIF) based backends. It adds support for overriding
default DAI formats and expands hw_params and SoundWire DAI matching
to accommodate QAIF MI2S/TDM and VA codec DMA paths.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c

[ ... ]

> @@ -260,9 +268,16 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_sub=
stream *substream,
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>  	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> -		ret =3D snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -		if (ret && ret !=3D -ENOTSUPP)
> -			return ret;
> +	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:

[Severity: Critical]
Are AIF_MI2S_RX_0 and AIF_MI2S_TX_12 declared in this tree?

A search across the kernel source indicates these identifiers might be
missing, perhaps from a pending dependency patch for DT bindings. This
causes an undeclared identifier error in sc8280xp_snd_hw_params(), which
will break the build.

[ ... ]

> @@ -296,6 +311,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_subs=
tream *substream,
>  		}
>  		break;
>  	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  		return sc8280xp_tdm_hw_params(substream, params);
>  	default:
>  		break;

[Severity: Critical]
Similarly, are AIF_TDM_RX_0 and AIF_TDM_TX_12 defined?

This also appears to cause an undeclared identifier compilation error here.

[ ... ]

> @@ -382,7 +398,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *=
card)
>  	int i;
> =20
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm =3D=3D 1) {
> +		if (link->no_pcm =3D=3D 1 || link->num_codecs > 0) {
>  			link->init =3D sc8280xp_snd_init;
>  			link->be_hw_params_fixup =3D sc8280xp_be_hw_params_fixup;
>  			link->ops =3D &sc8280xp_be_ops;

[Severity: High]
Could this widened condition inadvertently match DPCM frontend links?

In qcom_snd_parse_of(), DPCM frontend links are initialized with a dummy
codec, which sets link->num_codecs =3D 1. This means the filter will evalua=
te
to true for all DPCM frontends, incorrectly assigning backend operations
like sc8280xp_be_ops to them in sc8280xp_add_be_ops().

If a frontend DAI ID in the DT happens to overlap with a backend DAI ID,
it could trigger backend hw_params logic on the frontend.

The backend logic unconditionally calls snd_soc_dai_set_sysclk() without
checking for -ENOTSUPP errors. Since frontend DAIs do not support sysclk
configuration, this will propagate -ENOTSUPP up the stack, causing frontend
hw_params to fail and breaking the audio path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-shikra-mac=
hine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com?part=3D2
