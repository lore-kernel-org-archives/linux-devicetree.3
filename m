Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCE397B02
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136854; cv=none; b=e/g70m85MQQJurkLjASy0p/RFF3pxEpkqYNLawJihNH4IIAAfmp5bXSQa94fKmUGvalQeGiJSPP0CO+OSFrlKP9ZKyTmQbFmhFrtJqdC+tjl0SwseYp7UNGMcBvrSYLzxgG9QyMU/cMM7DQlsfacIs5ll6O049DDEj5MHnOpwhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136854; c=relaxed/simple;
	bh=d50UurfbUFhlSjGJ7fHRpspk+E1qBRZ/x4LkRK+1wVc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DIXPkSpaGf4HcmrrqoxU/V39sV/107lJpJ2o0TQGkay9AcXTWubrSqF+SqVwTKJhMofTqCqHElEBtvfUBO55tctHt1wxoovrUn+mbX6PfRgWoRwAV+HNFSV0Xz2E0UbFmieln9N341ZwbMUmAAZMrKBAOs3jX3Yb+M+i5p3g7NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/RyRtoV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/RyRtoV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6491F000C4;
	Fri, 16 Oct 2026 07:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792136852;
	bh=yl7+hzJ3TD4TcyIfp8JWSTvd68mZUFZOVzrjubcRW+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e/RyRtoV07O6WVQ9LolitzAC5TMiFotE8mB/Hz0zgvLJKzNjsewJML8FB4yiemeI+
	 pgFIqfZpngzCmcrQeqQqcOA2T7KtOte8xebvfbtYdxZ3ZihvzNDpiMatVJdE5P6pQ+
	 kxne/nQBMFjHPhhgW/NmNd+65s91W92vLlK4qd3tc1ET1gOwZKOBjzJSLF7PYpEFnX
	 6pu6hs0x1oA/rAH1gIttZqO00uWDwJmE+Ceth833svmhEJ42qTuKpa7Jg29umAnwEM
	 ddVh6IAvPy+Ex0qZMUOrlO9hS4e1uq/q8wvavAy8zaCQpjwlL35zb6XqLoxV1rbsNS
	 xpg8zQwO0HUbQ==
Message-ID: <sashiko-outbox-173961@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] ASoC: qcom: sm8250: add Senary MI2S RX support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016073157.611956-3-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:47:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] sound: missing audio format configuration for secondary codec DAIs
- [Medium] sound: unhandled return values from DAI hardware configuration f=
unctions
--

commit a955f60b4e954bf749d62fe6837b52a492472249
Author: Val Packett <val@packett.cool>
ASoC: qcom: sm8250: add Senary MI2S RX support

This patch adds support for the SENARY_MI2S_RX DAI to allow sending audio
data to speaker amplifiers on some devices.

> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 76dc3a3f4a312..2d49b04cb1f69 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -112,6 +112,14 @@ static int sm8250_snd_startup(struct snd_pcm_substre=
am *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case SENARY_MI2S_RX:
> +		codec_dai_fmt |=3D SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);

[Severity: Medium]
Can these hardware configuration functions fail silently?

The newly added code calls snd_soc_dai_set_sysclk() and snd_soc_dai_set_fmt=
()
for both the CPU and codec DAIs, but it does not check or propagate their
return values.

If these operations return an error like -EINVAL or -ENOTSUPP, the
initialization sequence will silently continue, potentially leaving the
hardware in a misconfigured state and causing difficult-to-debug audio
failures later.

> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);

[Severity: High]
Does this code miss configuring the audio format for secondary codec DAIs?

In sm8250_snd_startup(), codec_dai is retrieved earlier in the function
using:

	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);

This only fetches the first codec on the runtime link. Since the
SENARY_MI2S_RX link is intended for speaker amplifiers, there may be
multiple speaker codecs (such as left and right channels) on this link.

Because the driver applies the I2S format only to this single codec_dai, any
additional amplifiers will not receive the required format configuration.
Could this result in silent playback on one channel? Would it be better to
iterate over all codec DAIs using for_each_rtd_codec_dais() instead?

> +		break;
>  	case LPI_MI2S_RX_0:
>  		codec_dai_fmt |=3D SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>  		snd_soc_dai_set_sysclk(cpu_dai,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016073157.6119=
56-1-val@packett.cool?part=3D2
